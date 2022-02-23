using XDF, Downloads, Test

@testset "Minimal XDF file" begin
    url = "https://github.com/xdf-modules/example-files/blob/master/minimal.xdf?raw=true"

    streams = read_xdf(Downloads.download(url))
    # Test data stream
    # header
    @test 0 in keys(streams)
    @test streams[0]["name"] == "SendDataC"
    @test streams[0]["type"] == "EEG"
    @test streams[0]["nchannels"] == 3
    @test streams[0]["srate"] == 10.0
    @test streams[0]["dtype"] == Int16
    @test isnothing(streams[0]["source_id"])
    @test isnothing(streams[0]["version"])
    @test streams[0]["created_at"] == "50942.723319709003"
    @test streams[0]["uid"] == "xdfwriter_11_int"
    @test isnothing(streams[0]["session_id"])
    @test isnothing(streams[0]["hostname"])
    # data
    @test size(streams[0]["data"]) == (9, 3)
    data = [192 255 238;
            12  22  32;
            13  23  33;
            14  24  34;
            15  25  35;
            12  22  32;
            13  23  33;
            14  24  34;
            15  25  35;]
    @test streams[0]["data"] == data
    # footer
    @test streams[0]["first_timestamp"] == 5.1f0
    @test streams[0]["last_timestamp"] == 5.9f0
    @test streams[0]["sample_count"] == 9
    @test isnothing(streams[0]["measured_srate"]) 

    # Test marker stream
    # header
    @test 46202862 in keys(streams)
    @test streams[46202862]["name"] == "SendDataString"
    @test streams[46202862]["type"] == "StringMarker"
    @test streams[46202862]["nchannels"] == 1
    @test streams[46202862]["srate"] == 10.0
    @test streams[46202862]["dtype"] == String
    @test isnothing(streams[46202862]["source_id"])
    @test isnothing(streams[46202862]["version"])
    @test streams[46202862]["created_at"] == "50942.723319709003"
    @test streams[46202862]["uid"] == "xdfwriter_11_int"
    @test isnothing(streams[46202862]["session_id"])
    @test isnothing(streams[46202862]["hostname"])
    # data
    @test size(streams[46202862]["data"]) == (9, 1)
    @test startswith(streams[46202862]["data"][1, 1], "<?xml version")
    @test endswith(streams[46202862]["data"][1, 1], "</info>")
    @test streams[46202862]["data"][2:end, 1] == ["Hello", "World", "from", "LSL", "Hello",
                                                "World", "from", "LSL"]
    # footer
    @test streams[46202862]["first_timestamp"] == 5.1f0
    @test streams[46202862]["last_timestamp"] == 5.9f0
    @test streams[46202862]["sample_count"] == 9
    @test isnothing(streams[46202862]["measured_srate"]) 
end

@testset "XDF file with clock resets" begin
    url = "https://github.com/xdf-modules/example-files/blob/master/data_with_clock_resets.xdf?raw=true"

    streams = read_xdf(Downloads.download(url))
    @test 1 in keys(streams)
    @test streams[1]["nchannels"] == 1
    @test streams[1]["name"] == "MyMarkerStream"
    @test streams[1]["dtype"] == String
    @test streams[1]["srate"] == 0.0
    @test streams[1]["type"] == "Markers"
    @test size(streams[1]["data"]) == (175, 1)

    @test 2 in keys(streams)
    @test streams[2]["nchannels"] == 8
    @test streams[2]["name"] == "BioSemi"
    @test streams[2]["dtype"] == Float32
    @test streams[2]["srate"] == 100.0
    @test streams[2]["type"] == "EEG"
    @test size(streams[2]["data"]) == (27815, 8)
end
