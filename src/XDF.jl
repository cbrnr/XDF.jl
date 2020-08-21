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
    read_xdf(filename::AbstractString)

Read XDF file.
"""
function read_xdf(filename::AbstractString)
    streams = Dict{Int, Any}()
    counter = Dict(zip(keys(CHUNK_TYPE), zeros(Int, length(CHUNK_TYPE))))  # count chunks

    open(filename) do io
        String(read(io, 4)) == "XDF:" || error("invalid magic bytes sequence")

        # first pass, determine data size for each stream
        while true
            len = try
                len = read_varlen_int(io)
            catch e
                isa(e, EOFError) && break
            end
            tag = read(io, UInt16)
            counter[tag] += 1
            @debug "Chunk $(sum(values(counter))): $(CHUNK_TYPE[tag]) ($tag), $len bytes"
            len -= sizeof(UInt16)

            if tag in (2, 3, 4, 6)  # read stream ID
                id = Int(read(io, UInt32))
                len -= sizeof(UInt32)
                @debug "    StreamID: $id"
            end

            if tag == 1  # FileHeader
                xml = String(read(io, len))
                @debug "    $xml"
            elseif tag == 2  # StreamHeader
                xml = String(read(io, len))
                @debug "    $xml"
                streams[id] = Dict("nchannels"=>findtag(xml, "channel_count", Int),
                                   "srate"=>findtag(xml, "nominal_srate", Float32),
                                   "name"=>findtag(xml, "name"),
                                   "type"=>findtag(xml, "type"))
                streams[id]["dtype"] = DATA_TYPE[findtag(xml, "channel_format")]
                streams[id]["data"] = 0
                streams[id]["time"] = Array{Float64}(undef, 0)
            elseif tag == 3  # Samples
                mark(io)
                nchannels = streams[id]["nchannels"]
                dtype = streams[id]["dtype"]
                nsamples = read_varlen_int(io)
                @debug "    nchans: $nchannels, nsamples: $nsamples, dtype: $dtype"
                streams[id]["data"] += nsamples
                reset(io)
                skip(io, len)
            elseif tag == 6  # StreamFooter
                xml = String(read(io, len))
                @debug "    $xml"
            else  # unknown chunk type
                skip(io, len)
            end
        end

        # second pass, read actual data for each stream in pre-allocated arrays
        current_sample = Dict()
        current_time = Dict()
        for (id, stream) in streams
            dtype = stream["dtype"]
            nsamples = stream["data"]
            nchannels = stream["nchannels"]
            stream["data"] = Array{dtype}(undef, nsamples, nchannels)
            stream["time"] = Array{Float64}(undef, nsamples)
            current_sample[id] = 1
            current_time[id] = 0
        end
        seek(io, 4)  # go back to start of file (but skip the magic bytes)
        while true
            len = try
                len = read_varlen_int(io)
            catch e
                isa(e, EOFError) && break
            end
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
                if streams[id]["dtype"] === String  # TODO: string samples
                    reset(io)
                    skip(io, len)
                    continue
                end
                sample = Array{dtype}(undef, nsamples, nchannels)
                timestamps = Array{Float64}(undef, nsamples)
                for i in 1:nsamples
                    @debug "    ---- Sample $i/$nsamples"
                    if read(io, UInt8) == 8  # optional timestamp available
                        timestamps[i] = read(io, Float64)
                    else
                        timestamps[i] = current_time[id] + 1 / streams[id]["srate"]
                    end
                    current_time[id] = timestamps[i]
                    sample[i, :] = reinterpret(dtype, read(io, sizeof(dtype) * nchannels))
                end
                start = current_sample[id]
                stop = start + size(sample, 1) - 1
                streams[id]["data"][start:stop, :] = sample
                streams[id]["time"][start:stop] = timestamps
                current_sample[id] = stop + 1
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


"Find XML tag and return its content."
function findtag(xml::AbstractString, tag::AbstractString, type=String::DataType)
    m = match(Regex("<$tag>(.*)</$tag>"), xml)
    content = isnothing(m) ? nothing : m[1]
    return isnothing(content) || type == String ? content : parse(type, content)
end

end
