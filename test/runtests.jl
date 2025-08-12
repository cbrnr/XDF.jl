using XDF, Downloads, Test

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
    url = "https://github.com/xdf-modules/example-files/blob/master/clock_resets.xdf?raw=true"

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
