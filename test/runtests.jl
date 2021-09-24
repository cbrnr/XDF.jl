using XDF
using Test

@testset "Minimal XDF file" begin
    url = "https://github.com/xdf-modules/example-files/blob/master/minimal.xdf?raw=true"

    streams = read_xdf(download(url))
    @test 0 in keys(streams)
    @test streams[0]["nchannels"] == 3
    @test streams[0]["name"] == "SendDataC"
    @test streams[0]["dtype"] == Int16
    @test streams[0]["srate"] == 10.0
    @test streams[0]["type"] == "EEG"
    @test size(streams[0]["data"]) == (9, 3)

    @test 46202862 in keys(streams)
    @test streams[46202862]["nchannels"] == 1
    @test streams[46202862]["name"] == "SendDataString"
    @test streams[46202862]["dtype"] == String
    @test streams[46202862]["srate"] == 10.0
    @test streams[46202862]["type"] == "StringMarker"
    @test size(streams[46202862]["data"]) == (9, 1)
end

@testset "XDF file with clock resets" begin
    url = "https://github.com/xdf-modules/example-files/blob/master/data_with_clock_resets.xdf?raw=true"

    streams = read_xdf(download(url))
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
