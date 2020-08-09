# Authors: Clemens Brunner
# License: BSD (3-clause)

# module XDF

using Logging


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
                 "float64"=>Float64,
                 "string"=>String)


"""
    read_xdf(filename::AbstractString)

Read XDF file.
"""
function read_xdf(filename::AbstractString)
    counter = Dict(zip(keys(CHUNK_TYPE), zeros(Int, 6)))  # count chunks per type
    streams = Dict()
    open(filename) do io
        String(read(io, 4)) == "XDF:" || error("invalid magic bytes sequence")
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
                id = read(io, Int32)  # TODO: should this be UInt32?
                len -= sizeof(Int32)
                @debug "    StreamID: $id"
            end

            if tag == 1  # FileHeader
                xml = String(read(io, len))
                @debug "    $xml"
            elseif tag == 2  # StreamHeader
                xml = String(read(io, len))
                @debug "    $xml"
                streams[id] = Dict("channel_count"=>findtag(xml, "channel_count", Int),
                                   "nominal_srate"=>findtag(xml, "nominal_srate", Float32),
                                   "channel_format"=>findtag(xml, "channel_format"),
                                   "name"=>findtag(xml, "name"),
                                   "type"=>findtag(xml, "type"),
                                   "timeseries"=>[],  # TODO: type == channel_format?
                                   "timestamps"=>[])  # TODO: type == Float64?
            elseif tag == 3  # Samples
                mark(io)
                nchans = streams[id]["channel_count"]
                dtype = DATA_TYPE[streams[id]["channel_format"]]
                nsamples = read_varlen_int(io)
                @debug "    nchans: $nchans, nsamples: $nsamples, dtype: $dtype"
                samples = Array{dtype}(undef, nsamples, nchans)
                if dtype == String  # TODO: string samples
                    reset(io)
                    skip(io, len)
                    continue
                end
                for sample in 1:nsamples
                    @debug "    ---- Sample $sample/$nsamples"
                    if read(io, UInt8) == 8  # optional timestamp available
                        timestamp = read(io, Float64)
                        @debug "         Timestamp $timestamp"
                    end
                    for ch in 1:nchans
                        samples[sample, ch] = read(io, dtype)
                        @debug "        $(samples[sample, ch])"
                    end
                end
                reset(io)
                skip(io, len)
            elseif tag == 6  # StreamFooter
                xml = String(read(io, len))
                @debug "    $xml"
            else
                skip(io, len)  # TODO: read chunk-specific contents
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
    if !isnothing(m)
        content = m.captures[1]
        if type == String
            return content
        else
            return parse(type, content)
        end
    end
end


# ENV["JULIA_DEBUG"] = "Main"
read_xdf("/Users/clemens/Downloads/testfiles/XDF/minimal.xdf")

# end
