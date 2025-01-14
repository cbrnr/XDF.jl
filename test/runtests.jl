using XDF, Downloads, Test, SHA

@testset "Minimal XDF file" begin
    url = "https://github.com/xdf-modules/example-files/blob/master/minimal.xdf?raw=true"
    streams = read_xdf(Downloads.download(url))

    @test 0 in keys(streams)
    @test streams[0]["name"] == "SendDataC"
    @test streams[0]["type"] == "EEG"
    @test streams[0]["nchannels"] == 3
    @test streams[0]["srate"] == 10.0
    @test streams[0]["dtype"] == Int16
    @test startswith(streams[0]["header"], "<?xml version=\"1.0\"?>")
    @test endswith(streams[0]["header"], "</uid></info>")
    @test startswith(streams[0]["footer"], "<?xml version=\"1.0\"?>")
    @test endswith(streams[0]["footer"], "</clock_offsets></info>")
    @test streams[0]["data"] == [
        192 255 238
        12 22 32
        13 23 33
        14 24 34
        15 25 35
        12 22 32
        13 23 33
        14 24 34
        15 25 35
    ]

    @test 46202862 in keys(streams)
    @test streams[46202862]["name"] == "SendDataString"
    @test streams[46202862]["type"] == "StringMarker"
    @test streams[46202862]["nchannels"] == 1
    @test streams[46202862]["srate"] == 10.0
    @test streams[46202862]["dtype"] == String
    @test startswith(streams[46202862]["header"], "<?xml version=\"1.0\"?>")
    @test endswith(streams[46202862]["header"], "</uid></info>")
    @test startswith(streams[46202862]["footer"], "<?xml version=\"1.0\"?>")
    @test endswith(streams[46202862]["footer"], "</clock_offsets></info>")
    @test size(streams[46202862]["data"]) == (9, 1)
    @test startswith(streams[46202862]["data"][1, 1], "<?xml version")
    @test endswith(streams[46202862]["data"][1, 1], "</info>")
    @test streams[46202862]["data"][2:end, 1] ==
        ["Hello", "World", "from", "LSL", "Hello", "World", "from", "LSL"]
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
    @test startswith(streams[1]["header"], "<?xml version=\"1.0\"?>")
    @test endswith(streams[1]["header"], "<desc />\n</info>\n")
    @test startswith(streams[1]["footer"], "<?xml version=\"1.0\"?>")
    @test endswith(streams[1]["footer"], "</clock_offsets></info>")
    @test size(streams[1]["data"]) == (175, 1)

    @test 2 in keys(streams)
    @test streams[2]["nchannels"] == 8
    @test streams[2]["name"] == "BioSemi"
    @test streams[2]["dtype"] == Float32
    @test streams[2]["srate"] == 100.0
    @test streams[2]["type"] == "EEG"
    @test startswith(streams[2]["header"], "<?xml version=\"1.0\"?>")
    @test endswith(streams[2]["header"], "<desc />\n</info>\n")
    @test startswith(streams[2]["footer"], "<?xml version=\"1.0\"?>")
    @test endswith(streams[2]["footer"], "</clock_offsets></info>")
    @test size(streams[2]["data"]) == (27815, 8)
end

@testset "strings" begin
    file = "./test/testdata/test_chunk3.xdf"
    @testset "strings.sha256" begin
        open(file) do f
            @test bytes2hex(sha256(f)) ==
                "c730991efa078906117aa2accdca5f0ea11c54f43c3884770eba21e5a72edb82"
        end
    end
    @testset "strings.read_xdf" begin
        using XDF: XDF
        streams = XDF.read_xdf(file)
    end
    @testset "strings.markers" begin
        using XDF: XDF
        streams = XDF.read_xdf(file)
        s1 = streams[3735928559]
        @test s1["type"] == "Marker"
        @test s1["nchannels"] == 2
        @test s1["srate"] == 1000.0
        @test s1["dtype"] == String
        @test size(s1["data"]) == (1, 2)
        @test s1["data"] == ["Marker 0A" "Marker 0B"]
        s2 = streams[46202862]
        @test s2["type"] == "EEG"
        @test s2["nchannels"] == 64
        @test s2["srate"] == 1000.0
        @test s2["dtype"] == Float64
        @test size(s2["data"]) == (1, 64)
        @test sum(s2["data"]) == 0.0
        # sgs = [XDF.dejitter(streams[k])["segments"] for k in keys(streams)]
        # @test sgs[1] == [(1, 1)]
        # @test sgs[2] == [(1, 1)]
    end
end
