# Authors: Clemens Brunner
# License: BSD (3-clause)

module XDF

export read_xdf

using Logging: @info, @debug

CHUNK_TYPE = Dict(
    1 => "FileHeader",
    2 => "StreamHeader",
    3 => "Samples",
    4 => "ClockOffset",
    5 => "Boundary",
    6 => "StreamFooter",
)

DATA_TYPE = Dict(
    "int8" => Int8,
    "int16" => Int16,
    "int32" => Int32,
    "int64" => Int64,
    "float32" => Float32,
    "double64" => Float64,
    "string" => String,
)

"""
Read XDF file and optionally sync streams (default true).
"""
function read_xdf(filename::AbstractString; sync::Bool=true, debug::Bool=false)
    streams = Dict{Int, Dict}()
    counter = Dict(zip(keys(CHUNK_TYPE), zeros(Int, length(CHUNK_TYPE))))

    open(filename) do io
        String(read(io, 4)) == "XDF:" || error("invalid magic bytes sequence")

        # First pass: gather stream metadata and sample counts
        while !eof(io)
            len = Int(read_varlen_int(io))
            tag = read(io, UInt16)
            counter[tag] += 1
            len -= sizeof(UInt16)

            id = nothing
            if tag in (2,3,4,6)
                id = Int(read(io, UInt32))
                len -= sizeof(UInt32)
            end

            if tag == 1  # FileHeader
                xml = String(read(io, len))
				if debug
                	@debug debug && @debug "FileHeader: $xml"
				end
            elseif tag == 2  # StreamHeader
                xml = String(read(io, len))
                stream_info = Dict(
                    "name" => findtag(xml, "name"),
                    "type" => findtag(xml, "type"),
                    "nchannels" => findtag(xml, "channel_count", Int),
                    "srate" => findtag(xml, "nominal_srate", Float32),
                    "dtype" => DATA_TYPE[findtag(xml, "channel_format")],
                )
                stream_info["data"] = 0
                stream_info["time"] = Float64[]
                stream_info["clock"] = Float64[]
                stream_info["offset"] = Float64[]
                stream_info["header"] = xml
                streams[id] = stream_info
            elseif tag == 3  # Samples
                mark(io)
                nsamples = Int(read_varlen_int(io))
                streams[id]["data"] += nsamples
                reset(io)
                skip(io, len)
            elseif tag == 4  # ClockOffset
                push!(streams[id]["clock"], read(io, Float64))
                push!(streams[id]["offset"], read(io, Float64))
            elseif tag == 6  # StreamFooter
                streams[id]["footer"] = String(read(io, len))
            else
                skip(io, len)
            end
        end

        # Pre-allocate data arrays
        index = Dict{Int, Int}()
        for (id, stream) in streams
            T = stream["dtype"]
            nsamples = stream["data"]
            nchannels = stream["nchannels"]
            if T === String
                stream["data"] = Array{String}(undef, nsamples, nchannels)
            elseif T <: Number
                stream["data"] = Array{T}(undef, nsamples, nchannels)
            else
                error("Unsupported dtype $T for stream $id")
            end
            stream["time"] = Array{Float64}(undef, nsamples)
            index[id] = 1
        end

        # Second pass: read sample data
        seek(io, 4)
        while !eof(io)
            len = Int(read_varlen_int(io))
            tag = read(io, UInt16)
            len -= sizeof(UInt16)

            if tag != 3
                skip(io, len)
                continue
            end

            id = Int(read(io, UInt32))
            len -= sizeof(UInt32)
            nsamples_block = Int(read_varlen_int(io))
            nchannels = streams[id]["nchannels"]
            dtype = streams[id]["dtype"]
            curr_idx = index[id]

            for i in 1:nsamples_block
                if read(io, UInt8) == 8
                    streams[id]["time"][curr_idx] = read(io, Float64)
                else
                    delta = 1 / streams[id]["srate"]
                    prev = curr_idx == 1 ? 0.0 : streams[id]["time"][curr_idx - 1]
                    streams[id]["time"][curr_idx] = prev + delta
                end

                if dtype === String
                    for ch in 1:nchannels
                        nbytes = Int(read_varlen_int(io))
                        streams[id]["data"][curr_idx, ch] = String(read(io, nbytes))
                    end
                else
                    buf = read(io, sizeof(dtype) * nchannels)
                    streams[id]["data"][curr_idx, :] = reinterpret(dtype, buf)
                end

                curr_idx += 1
            end
            index[id] = curr_idx
        end

        if debug
            total = sum(values(counter))
            width = length(string(total))
            width_chunk = maximum(length.(values(CHUNK_TYPE)))
            msg = "File $filename contains $total chunks:\n"
            for (key, value) in sort(collect(counter))
                msg *= "- $(rpad(CHUNK_TYPE[key], width_chunk)) $(lpad(value, width))\n"
            end
            @info msg
        end

        if sync
            for (id, stream) in streams
                offsets = hcat(stream["clock"], stream["offset"])
                stream["time"] = sync_clock(stream["time"], offsets)
            end
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