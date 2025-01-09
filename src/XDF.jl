# Authors: Clemens Brunner
# License: BSD (3-clause)

module XDF

export read_xdf

using Logging: @info, @debug


CHUNK_TYPE = Dict(1=>"FileHeader",
                  2=>"StreamHeader",
                  3=>"Samples",
                  4=>"ClockOffset",
                  5=>"Boundary",
                  6=>"StreamFooter")

DATA_TYPE = Dict("int8"=>Int8,
                 "int16"=>Int16,
                 "int32"=>Int32,
                 "int64"=>Int64,
                 "float32"=>Float32,
                 "double64"=>Float64,
                 "string"=>String)


"""
    read_xdf(filename::AbstractString, sync::Bool=true)

Read XDF file and optionally sync streams (default true).
"""
function read_xdf(filename::AbstractString, sync::Bool=true)
    streams = Dict{Int, Any}()
    counter = Dict(zip(keys(CHUNK_TYPE), zeros(Int, length(CHUNK_TYPE))))  # count chunks

    open(filename) do io
        String(read(io, 4)) == "XDF:" || error("invalid magic bytes sequence")

        # first pass, determine array size for each stream
        while !eof(io)
            len = read_varlen_int(io)
            tag = read(io, UInt16)
            counter[tag] += 1
            @debug "Chunk $(sum(values(counter))): $(CHUNK_TYPE[tag]) ($tag), $len bytes"
            len -= sizeof(UInt16)

            if tag in (2, 3, 4, 6)  # read stream ID
                id = Int(read(io, UInt32))  # convert because Julia displays UInt32 as hex
                len -= sizeof(UInt32)
                @debug "    StreamID: $id"
            end

            if tag == 1  # FileHeader
                xml = String(read(io, len))
                @debug "    $xml"
            elseif tag == 2  # StreamHeader
                xml = String(read(io, len))
                @debug "    $xml"
                streams[id] = Dict(
                    "name" => findtag(xml, "name"),
                    "type" => findtag(xml, "type"),
                    "nchannels" => findtag(xml, "channel_count", Int),
                    "srate" => findtag(xml, "nominal_srate", Float32),
                    "dtype" => DATA_TYPE[findtag(xml, "channel_format")],
                )
                streams[id]["data"] = 0
                streams[id]["time"] = Array{Float64}(undef, 0)
                streams[id]["clock"] = Float64[]
                streams[id]["offset"] = Float64[]
                streams[id]["header"] = xml
            elseif tag == 3  # Samples
                mark(io)
                nchannels = streams[id]["nchannels"]
                dtype = streams[id]["dtype"]
                nsamples = read_varlen_int(io)
                @debug "    nchans: $nchannels, nsamples: $nsamples, dtype: $dtype"
                streams[id]["data"] += nsamples
                reset(io)
                skip(io, len)
            elseif tag == 4  # ClockOffset
                push!(streams[id]["clock"], read(io, Float64))
                push!(streams[id]["offset"], read(io, Float64))
            elseif tag == 6  # StreamFooter
                xml = String(read(io, len))
                @debug "    $xml"
                streams[id]["footer"] = xml
            else  # unknown chunk type
                skip(io, len)
            end
        end

        # second pass, read actual data for each stream into pre-allocated arrays
        index = Dict()
        for (id, stream) in streams
            dtype = stream["dtype"]
            nsamples = stream["data"]
            nchannels = stream["nchannels"]
            stream["data"] = Array{dtype}(undef, nsamples, nchannels)
            stream["time"] = Array{Float64}(undef, nsamples)
            index[id] = 1  # current sample index
        end
        seek(io, 4)  # go back to start of file (but skip the magic bytes)
        while !eof(io)
            len = read_varlen_int(io)
            tag = read(io, UInt16)
            len -= sizeof(UInt16)

            if tag != 3
                skip(io, len)
            else
                id = Int(read(io, UInt32))
                len -= sizeof(UInt32)
                mark(io)
                nchannels = streams[id]["nchannels"]
                dtype = streams[id]["dtype"]
                nsamples = read_varlen_int(io)
                for i in 1:nsamples
                    if read(io, UInt8) == 8  # optional timestamp available
                        streams[id]["time"][index[id]] = read(io, Float64)
                    else
                        delta = 1 / streams[id]["srate"]
                        previous = index[id] == 1 ? 0 : streams[id]["time"][index[id] - 1]
                        streams[id]["time"][index[id]] = previous + delta
                    end
                    if streams[id]["dtype"] === String
                        for j in 1:nchannels
                            streams[id]["data"][index[id], j] = String(read(io, read_varlen_int(io)))
                        end
                    else
                        streams[id]["data"][index[id], :] = reinterpret(dtype, read(io, sizeof(dtype) * nchannels))
                    end
                    index[id] += 1
                end
            end
        end
    end

    total = sum(values(counter))  # total number of chunks
    width = length(string(total))
    width_chunk = maximum([length(v) for v in values(CHUNK_TYPE)])
    msg = "File $filename contains $total chunks:\n"
    for (key, value) in sort(collect(counter))
        msg *= "- $(rpad(CHUNK_TYPE[key], width_chunk)) $(lpad(value, width))\n"
    end
    @info msg

    if sync
        for (id, stream) in streams
            offsets = hcat(stream["clock"], stream["offset"])
            stream["time"] = sync_clock(stream["time"], offsets)
        end
    end

    return streams
end


"Read variable-length integer."
function read_varlen_int(io::IO)
    nbytes = read(io, Int8)
    if nbytes == 1
        read(io, UInt8)
    elseif nbytes == 4
        read(io, UInt32)
    elseif nbytes == 8
        read(io, UInt64)
    end
end


"Find XML tag and return its content (optionally converted to specified type)."
function findtag(xml::AbstractString, tag::AbstractString, type=String::DataType)
    m = match(Regex("<$tag>(.*)</$tag>"), xml)
    content = isnothing(m) ? nothing : m[1]
    return isnothing(content) || type == String ? content : parse(type, content)
end


"Synchronize clock values by their given offsets."
function sync_clock(time::Array{Float64,1}, offsets::Array{Float64,2})
    x = hcat(ones(size(offsets, 1), 1), offsets[:, 1])
    y = offsets[:, 2]
    coefs = x \ y
    return time .+ (coefs[1] .+ coefs[2] .* time)
end

end