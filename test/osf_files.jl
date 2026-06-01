# Auto-generated from pyxdf reference oracle on OSF Biosignal Test Data Repository
# (https://osf.io/uc7wn/files/osfstorage). See test/runtests.jl for invocation.

const RUN_LARGE = get(ENV, "XDF_OSF_LARGE", "") in ("1", "true")

@testset "OSF Biosignal Test Data Repository" begin
@testset "CGX_AIM_2.01_01.xdf" begin
    file = Downloads.download("https://osf.io/download/6489e574bee36d020f0e602b/")
    streams = read_xdf(file)
    @test length(streams) == 2
    @test sort(collect(keys(streams))) == [1, 2]
    s = streams[1]
    @test s["name"] == "AIM Phys. Mon._R2_Mark"
    @test s["type"] == "Markers"
    @test s["nchannels"] == 1
    @test s["srate"] == 0.0
    @test s["dtype"] == String
    @test size(s["data"]) == (10, 1)
    @test s["data"][1, :] == ["<Marker><Type>Comment</Type><Description>42</Description><Channel>-1</Channel><Block>4858</Block><Position>2</Position></Marker>"]
    @test s["data"][end, :] == ["<Marker><Type>Comment</Type><Description>42</Description><Channel>-1</Channel><Block>5136</Block><Position>2</Position></Marker>"]
    s = streams[2]
    @test s["name"] == "AIM Phys. Mon._R2_EEG"
    @test s["type"] == "EEG"
    @test s["nchannels"] == 12
    @test s["srate"] == 500.0
    @test s["dtype"] == Float32
    @test size(s["data"]) == (5535, 12)
    @test s["data"][1, :] ≈ [-21238.70703125, -11766.0517578125, -3102.87451171875, -8149.71875, -2583.12353515625, 1020.9013671875, 16385.0, 127.0, 511.0, 430619.34375, 19.749984741210938, 4601.0]
    @test s["data"][end, :] ≈ [-16890.71484375, -15534.208984375, 17478.177734375, 29521.177734375, -8466.724609375, 1025.4970703125, 16382.0, 127.0, 511.0, 430575.1875, 19.687484741210938, 5707.0]
end

@testset "CGX_Quick32_Units_01.xdf" begin
    file = Downloads.download("https://osf.io/download/6489e574bee36d02440e5a28/")
    streams = read_xdf(file)
    @test length(streams) == 3
    @test sort(collect(keys(streams))) == [1, 2, 3]
    s = streams[2]
    @test s["name"] == "Quick-32r_R2_Mark"
    @test s["type"] == "Markers"
    @test s["nchannels"] == 1
    @test s["srate"] == 0.0
    @test s["dtype"] == String
    @test size(s["data"]) == (0, 1)
    s = streams[1]
    @test s["name"] == "Quick-32r_R2_EEG"
    @test s["type"] == "EEG"
    @test s["nchannels"] == 36
    @test s["srate"] == 500.0
    @test s["dtype"] == Float32
    @test size(s["data"]) == (13589, 36)
    @test s["data"][1, :] ≈ [-25593.83203125, 752062.25, -25807.771484375, -25653.8046875, 558022.0625, 689463.3125, 807220.8125, -25490.76171875, 833332.375, 833332.375, 752497.25, 403146.625, 744998.8125, 712329.5, 833332.375, 397176.625, -25418.966796875, 422280.75, 695692.375, 706737.3125, 604019.3125, -25693.548828125, 833332.375, -23882.24609375, -25725.98046875, -25757.892578125, 833332.375, 833332.375, 833332.375, -4187.20263671875, 372660.03125, 312303.4375, 216.2388458251953, -983.5379638671875, 69.75447082519531, 59978.0]
    @test s["data"][end, :] ≈ [-25756.859375, 746650.5625, -25972.12109375, -25817.03515625, 569249.0625, 687356.6875, 800012.25, -25653.568359375, 833332.375, 833332.375, 746383.3125, 133321.4375, 745137.5, 718628.0625, 833332.375, 683742.375, -25579.478515625, 424870.28125, 697371.25, 701039.3125, 629551.125, -25834.869140625, 833332.375, -20843.337890625, -25887.9140625, -25921.177734375, 833332.375, 833332.375, 833332.375, 3248.46728515625, 563715.3125, 513988.78125, 223.21429443359375, -976.5625610351562, 167.4107208251953, 73593.0]
    s = streams[3]
    @test s["name"] == "Quick-32r_R2_Imp"
    @test s["type"] == "Impedances"
    @test s["nchannels"] == 30
    @test s["srate"] == 0.0
    @test s["dtype"] == Float32
    @test size(s["data"]) == (27, 30)
    @test s["data"][1, :] ≈ [11092.734375, -1.0, 11089.666015625, 11093.642578125, -1.0, -1.0, -1.0, 11093.93359375, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, 11084.841796875, -1.0, -1.0, -1.0, -1.0, 11094.26171875, -1.0, 5717.2158203125, 11088.6005859375, 11093.896484375, -1.0, -1.0, -1.0, 20061.69140625]
    @test s["data"][end, :] ≈ [11338.6396484375, -1.0, 11335.5029296875, 11339.2841796875, -1.0, -1.0, -1.0, 11339.4267578125, -1.0, -1.0, -1.0, 47090.5859375, -1.0, -1.0, -1.0, -1.0, 11330.2724609375, -1.0, -1.0, -1.0, -1.0, 11340.25390625, -1.0, 7634.84228515625, 11335.9736328125, 11339.8623046875, -1.0, -1.0, -1.0, 23115.259765625]
end

@testset "EPrime_09.xdf" begin
    if RUN_LARGE
        file = Downloads.download("https://osf.io/download/6489e621a3109101f7d117aa/")
        streams = read_xdf(file)
        @test length(streams) == 2
        @test sort(collect(keys(streams))) == [1, 2]
        s = streams[1]
        @test s["name"] == "LiveAmpSN-054907-0271"
        @test s["type"] == "EEG"
        @test s["nchannels"] == 38
        @test s["srate"] == 500.0
        @test s["dtype"] == Float32
        @test size(s["data"]) == (261511, 38)
        @test s["data"][1, :] ≈ [341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 801.4440307617188, 12.0, -34.0, 1160.0, -1.0, -1.0]
        @test s["data"][end, :] ≈ [341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 341333.3125, 1082.53955078125, 16.0, -33.0, 1159.0, -1.0, -1.0]
        s = streams[2]
        @test s["name"] == "E-Prime"
        @test s["type"] == "Markers"
        @test s["nchannels"] == 1
        @test s["srate"] == 0.0
        @test s["dtype"] == String
        @test size(s["data"]) == (1000, 1)
        @test s["data"][1, :] == ["1"]
        @test s["data"][end, :] == ["0"]
    else
        @info "Skipped (set XDF_OSF_LARGE=1 to enable)"
    end
end

@testset "TimingTest_noLSL.xdf" begin
    file = Downloads.download("https://osf.io/download/6489e5caa3109101f7d11791/")
    streams = read_xdf(file)
    @test length(streams) == 1
    @test sort(collect(keys(streams))) == [1]
    s = streams[1]
    @test s["name"] == "LiveAmpSN-054907-0271"
    @test s["type"] == "EEG"
    @test s["nchannels"] == 3
    @test s["srate"] == 1000.0
    @test s["dtype"] == Float32
    @test size(s["data"]) == (372002, 3)
    @test s["data"][1, :] ≈ [142.69351196289062, -1.0, -1.0]
    @test s["data"][end, :] ≈ [105725.171875, -1.0, -1.0]
end

@testset "brainamp.xdf" begin
    if RUN_LARGE
        file = Downloads.download("https://osf.io/download/6h7vb/")
        streams = read_xdf(file)
        @test length(streams) == 2
        @test sort(collect(keys(streams))) == [1, 2]
        s = streams[2]
        @test s["name"] == "BrainVision RDA Markers"
        @test s["type"] == "Markers"
        @test s["nchannels"] == 1
        @test s["srate"] == 0.0
        @test s["dtype"] == String
        @test size(s["data"]) == (0, 1)
        s = streams[1]
        @test s["name"] == "BrainVision RDA"
        @test s["type"] == "EEG"
        @test s["nchannels"] == 16
        @test s["srate"] == 5000.0
        @test s["dtype"] == Float32
        @test size(s["data"]) == (815200, 16)
        @test s["data"][1, :] ≈ [51.70000076293945, 68.5, 39.5, 76.9000015258789, 60.29999923706055, 45.099998474121094, 63.400001525878906, 53.400001525878906, 2570241.75, 2746.800048828125, 1983.800048828125, 2594.199951171875, 2136.39990234375, 4425.39990234375, 610.4000244140625, 3967.60009765625]
        @test s["data"][end, :] ≈ [45.20000076293945, 62.0, 33.099998474121094, 69.9000015258789, 53.29999923706055, 39.79999923706055, 56.099998474121094, 46.0, 2449993.0, 3052.0, 1983.800048828125, 2594.199951171875, 1983.800048828125, 4272.7998046875, 305.20001220703125, 3967.60009765625]
    else
        @info "Skipped (set XDF_OSF_LARGE=1 to enable)"
    end
end

@testset "chunk3.xdf" begin
    file = Downloads.download("https://osf.io/download/6489e572a31091020cd110fe/")
    streams = read_xdf(file)
    @test length(streams) == 2
    @test sort(collect(keys(streams))) == [46202862, 3735928559]
    s = streams[46202862]
    @test s["name"] == "SendDataC"
    @test s["type"] == "EEG"
    @test s["nchannels"] == 64
    @test s["srate"] == 1000.0
    @test s["dtype"] == Float64
    @test size(s["data"]) == (1, 64)
    @test s["data"][1, :] ≈ [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
    @test s["data"][end, :] ≈ [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
    s = streams[3735928559]
    @test s["name"] == "SendMarker"
    @test s["type"] == "Marker"
    @test s["nchannels"] == 2
    @test s["srate"] == 1000.0
    @test s["dtype"] == String
    @test size(s["data"]) == (1, 2)
    @test s["data"][1, :] == ["Marker 0A", "Marker 0B"]
    @test s["data"][end, :] == ["Marker 0A", "Marker 0B"]
end

@testset "chunk3_longer.xdf" begin
    file = Downloads.download("https://osf.io/download/5ksqy/")
    streams = read_xdf(file)
    @test length(streams) == 2
    @test sort(collect(keys(streams))) == [46202862, 3735928559]
    s = streams[46202862]
    @test s["name"] == "SendDataC"
    @test s["type"] == "EEG"
    @test s["nchannels"] == 64
    @test s["srate"] == 1000.0
    @test s["dtype"] == Float64
    @test size(s["data"]) == (200, 64)
    @test s["data"][1, :] ≈ [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
    @test s["data"][end, :] ≈ [-0.9992068341863537, -0.6928849542336957, 0.9999118601072672, -0.3734647547841147, 0.8136737375071054, -0.711785342369123, 0.9999838108459708, -0.19020466626691288, -0.9999902065507035, -0.45753589377532133, 0.4121184852417566, 0.9226042102393402, 0.9716705111389259, 0.7091157067067836, 0.31154136351337786, -0.0955393633625346, -0.44363974491520286, -0.7055403255703919, -0.878474047956369, -0.9719030694018208, -0.9999982012007936, -0.977530117665097, -0.917899876955461, -0.8323905145579873, -0.7300583608392995, -0.6179240957387991, -0.5012770485883448, -0.3839973099356096, -0.2688515187561037, -0.1577456941432482, -0.051932361792380845, 0.04782440434799511, 0.1411200080598672, 0.22780999862627166, 0.3079344538173615, 0.38166099205233167, 0.44924222743779, 0.5109843119440334, 0.5672239221603884, 0.6183116354418493, 0.6646001114587836, 0.7064358665994588, 0.7441537179455577, 0.7780731968879212, 0.8084964038195901, 0.8357069062189441, 0.8599693820276688, 0.8815297857963782, 0.9006158722698097, 0.9174379552818098, 0.9321898123823213, 0.9450496700896581, 0.9561812230076777, 0.9657346537574998, 0.9738476308781951, 0.9806462694088861, 0.9862460444270932, 0.9907526518785774, 0.9942628139663227, 0.9968650284539189, 0.9986402626957308, 0.9996625941949558, 0.9999998001333682, 0.9997138987055519]
    s = streams[3735928559]
    @test s["name"] == "SendMarker"
    @test s["type"] == "Marker"
    @test s["nchannels"] == 1
    @test s["srate"] == 1000.0
    @test s["dtype"] == String
    @test size(s["data"]) == (200, 1)
    @test s["data"][1, :] == ["Marker 0"]
    @test s["data"][end, :] == ["Marker 99"]
end

@testset "clock_offsets.xdf" begin
    if RUN_LARGE
        file = Downloads.download("https://osf.io/download/6489e59984f52c023bfe5fdd/")
        streams = read_xdf(file)
        @test length(streams) == 3
        @test sort(collect(keys(streams))) == [1, 2, 3]
        s = streams[1]
        @test s["name"] == "BrainVision RDA"
        @test s["type"] == "EEG"
        @test s["nchannels"] == 19
        @test s["srate"] == 1000.0
        @test s["dtype"] == Float32
        @test size(s["data"]) == (551240, 19)
        @test s["data"][1, :] ≈ [-194.10000610351562, -96.0999984741211, -78.9000015258789, -100.19999694824219, -117.5, -125.19999694824219, -149.0, -154.60000610351562, -174.1999969482422, -154.89999389648438, -135.8000030517578, -287.8999938964844, -297.5, -165.39999389648438, -155.8000030517578, -160.60000610351562, -88.80000305175781, -125.30000305175781, -82.5]
        @test s["data"][end, :] ≈ [7.699999809265137, 49.599998474121094, 23.299999237060547, 25.0, 50.900001525878906, 53.099998474121094, 57.79999923706055, 48.0, 82.5, 87.30000305175781, 59.900001525878906, 28.0, 41.400001525878906, 69.80000305175781, 51.099998474121094, 50.20000076293945, 33.0, 21.600000381469727, 71.9000015258789]
        s = streams[2]
        @test s["name"] == "BrainVision RDA Markers"
        @test s["type"] == "Markers"
        @test s["nchannels"] == 1
        @test s["srate"] == 0.0
        @test s["dtype"] == String
        @test size(s["data"]) == (133, 1)
        @test s["data"][1, :] == ["S  1"]
        @test s["data"][end, :] == ["S  2"]
        s = streams[3]
        @test s["name"] == "TestStream"
        @test s["type"] == "EMG"
        @test s["nchannels"] == 1
        @test s["srate"] == 256.0
        @test s["dtype"] == Int32
        @test size(s["data"]) == (138368, 1)
        @test s["data"][1, :] ≈ [1879]
        @test s["data"][end, :] ≈ [2807]
    else
        @info "Skipped (set XDF_OSF_LARGE=1 to enable)"
    end
end

@testset "data_with_clock_resets.xdf" begin
    file = Downloads.download("https://osf.io/download/6489e57984f52c0250fe6309/")
    streams = read_xdf(file)
    @test length(streams) == 2
    @test sort(collect(keys(streams))) == [1, 2]
    s = streams[1]
    @test s["name"] == "MyMarkerStream"
    @test s["type"] == "Markers"
    @test s["nchannels"] == 1
    @test s["srate"] == 0.0
    @test s["dtype"] == String
    @test size(s["data"], 2) == 1  # n_samples differs from pyxdf: pyxdf truncates trailing samples to match footer sample_count; XDF.jl returns them
    s = streams[2]
    @test s["name"] == "BioSemi"
    @test s["type"] == "EEG"
    @test s["nchannels"] == 8
    @test s["srate"] == 100.0
    @test s["dtype"] == Float32
    @test size(s["data"], 2) == 8  # n_samples differs from pyxdf: pyxdf truncates trailing samples to match footer sample_count; XDF.jl returns them
end

@testset "dejitter.xdf" begin
    if RUN_LARGE
        file = Downloads.download("https://osf.io/download/6489e655bee36d020f0e603e/")
        streams = read_xdf(file)
        @test length(streams) == 2
        @test sort(collect(keys(streams))) == [1, 2]
        s = streams[1]
        @test s["name"] == "BrainVision RDA"
        @test s["type"] == "EEG"
        @test s["nchannels"] == 71
        @test s["srate"] == 500.0
        @test s["dtype"] == Float32
        @test size(s["data"]) == (356225, 71)
        @test s["data"][1, :] ≈ [-20732.470703125, -9445.458984375, -19024.951171875, -19103.80859375, -3059.619140625, -16396.923828125, -2655.859375, -10247.0703125, -17904.1015625, -16866.748046875, -12188.671875, -2374.12109375, 5487.744140625, -529.58984375, -6103.076171875, -10542.822265625, -1042.48046875, -3836.376953125, -13931.787109375, -14909.521484375, -1721.826171875, -6476.904296875, 7766.162109375, -3945.361328125, 6625.634765625, -23507.177734375, 6542.919921875, -1101.708984375, -26584.716796875, -8698.583984375, -20674.560546875, -8556.591796875, -18171.533203125, -24359.375, 3572.607421875, -727.685546875, -9637.890625, -3021.044921875, -5976.904296875, -9097.4609375, -16964.306640625, -12473.583984375, -14541.9921875, -2991.162109375, 3929.78515625, -17462.353515625, -4589.501953125, -5891.064453125, -13583.154296875, -2151.611328125, -11302.44140625, -15685.888671875, 11006.93359375, 2819.04296875, -3268.359375, -868.896484375, 3495.1171875, 8474.4140625, 2317.431640625, -22899.267578125, -11442.431640625, -24046.97265625, -9542.578125, 678.0028076171875, 5896.3896484375, 17271.638671875, 2860.724853515625, 517.6663208007812, 30805.169921875, 502237.6875, 7317.3642578125]
        @test s["data"][end, :] ≈ [-18460.3515625, -9613.4765625, -18650.0, -19329.150390625, -2107.03125, -14958.10546875, -3864.404296875, -9712.6953125, -17989.208984375, -19719.921875, -11606.689453125, -3312.158203125, 4843.84765625, -1216.89453125, -6520.99609375, -11598.583984375, -2029.931640625, -15209.375, -14733.349609375, -13659.9609375, -4469.873046875, -6867.28515625, 9723.779296875, -4888.57421875, 8404.931640625, -23309.27734375, 6852.587890625, -1035.400390625, -25604.541015625, -13048.14453125, -19119.091796875, -8773.2421875, -17613.232421875, -22820.3125, 3678.125, -808.984375, -10503.759765625, -4235.546875, -5588.232421875, -6629.833984375, -14183.544921875, -12545.5078125, -14711.9140625, -3893.9453125, 3306.787109375, -16135.25390625, -7838.671875, -5087.841796875, -12263.76953125, -3671.826171875, -10630.6640625, -16020.849609375, 11207.03125, 3940.576171875, -3362.20703125, -633.0078125, 3280.6640625, 8684.814453125, 208.154296875, -22661.279296875, -11781.93359375, -23155.078125, -10033.3984375, 284.91021728515625, 5932.74853515625, 16947.984375, 3194.510986328125, 319.48089599609375, 45000.91015625, 506370.375, 7096.52880859375]
        s = streams[2]
        @test s["name"] == "SegSpeller_Markers"
        @test s["type"] == "Markers"
        @test s["nchannels"] == 1
        @test s["srate"] == 10000.0
        @test s["dtype"] == String
        @test size(s["data"]) == (396, 1)
        @test s["data"][1, :] == ["11005"]
        @test s["data"][end, :] == ["31022"]
    else
        @info "Skipped (set XDF_OSF_LARGE=1 to enable)"
    end
end

@testset "minimal-corrupted.xdf" begin
    file = Downloads.download("https://osf.io/download/6489e5acbee36d023d0e629e/")
    streams = read_xdf(file)
    @test length(streams) == 2
    @test sort(collect(keys(streams))) == [0, 46202862]
    s = streams[0]
    @test s["name"] == "SendDataC"
    @test s["type"] == "EEG"
    @test s["nchannels"] == 3
    @test s["srate"] == 10.0
    @test s["dtype"] == Int16
    @test size(s["data"]) == (9, 3)
    @test s["data"][1, :] ≈ [192, 255, 238]
    @test s["data"][end, :] ≈ [15, 25, 35]
    s = streams[46202862]
    @test s["name"] == "SendDataString"
    @test s["type"] == "StringMarker"
    @test s["nchannels"] == 1
    @test s["srate"] == 10.0
    @test s["dtype"] == String
    @test size(s["data"]) == (9, 1)
    @test s["data"][1, :] == ["<?xml version=\"1.0\"?><info><writer>LabRecorder xdfwriter</writer><first_timestamp>5.1</first_timestamp><last_timestamp>5.9</last_timestamp><sample_count>9</sample_count><clock_offsets><offset><time>50979.76</time><value>-.01</value></offset><offset><time>50979.86</time><value>-.02</value></offset></clock_offsets></info>"]
    @test s["data"][end, :] == ["LSL"]
end

@testset "minimal.xdf" begin
    file = Downloads.download("https://osf.io/download/w6cv9/")
    streams = read_xdf(file)
    @test length(streams) == 2
    @test sort(collect(keys(streams))) == [0, 46202862]
    s = streams[0]
    @test s["name"] == "SendDataC"
    @test s["type"] == "EEG"
    @test s["nchannels"] == 3
    @test s["srate"] == 10.0
    @test s["dtype"] == Int16
    @test size(s["data"]) == (9, 3)
    @test s["data"][1, :] ≈ [192, 255, 238]
    @test s["data"][end, :] ≈ [15, 25, 35]
    s = streams[46202862]
    @test s["name"] == "SendDataString"
    @test s["type"] == "StringMarker"
    @test s["nchannels"] == 1
    @test s["srate"] == 10.0
    @test s["dtype"] == String
    @test size(s["data"]) == (9, 1)
    @test s["data"][1, :] == ["<?xml version=\"1.0\"?><info><writer>LabRecorder xdfwriter</writer><first_timestamp>5.1</first_timestamp><last_timestamp>5.9</last_timestamp><sample_count>9</sample_count><clock_offsets><offset><time>50979.76</time><value>-.01</value></offset><offset><time>50979.86</time><value>-.02</value></offset></clock_offsets></info>"]
    @test s["data"][end, :] == ["LSL"]
end

@testset "sub-01_ses-S001_task-HCT_run-001_eeg.xdf" begin
    file = Downloads.download("https://osf.io/download/p9jz3/")
    streams = read_xdf(file)
    @test length(streams) == 5
    @test sort(collect(keys(streams))) == [1, 2, 3, 4, 5]
    s = streams[3]
    @test s["name"] == "Muse"
    @test s["type"] == "PPG"
    @test s["nchannels"] == 3
    @test s["srate"] == 64.0
    @test s["dtype"] == Float32
    @test size(s["data"]) == (17011, 3)
    @test s["data"][1, :] ≈ [2410.0, 131583.0, 103607.0]
    @test s["data"][end, :] ≈ [46001.0, 128236.0, 104678.0]
    s = streams[1]
    @test s["name"] == "Muse"
    @test s["type"] == "ACC"
    @test s["nchannels"] == 3
    @test s["srate"] == 52.0
    @test s["dtype"] == Float32
    @test size(s["data"]) == (13779, 3)
    @test s["data"][1, :] ≈ [-0.15063486993312836, 0.08575445413589478, 0.9888312816619873]
    @test s["data"][end, :] ≈ [-0.05853275582194328, -0.03100588172674179, 1.0217902660369873]
    s = streams[2]
    @test s["name"] == "Muse"
    @test s["type"] == "GYRO"
    @test s["nchannels"] == 3
    @test s["srate"] == 52.0
    @test s["dtype"] == Float32
    @test size(s["data"]) == (13804, 3)
    @test s["data"][1, :] ≈ [1.8243391513824463, -12.912433624267578, -18.68452262878418]
    @test s["data"][end, :] ≈ [-1.8467695713043213, 3.4393279552459717, 7.245019435882568]
    s = streams[4]
    @test s["name"] == "Muse"
    @test s["type"] == "EEG"
    @test s["nchannels"] == 5
    @test s["srate"] == 256.0
    @test s["dtype"] == Float32
    @test size(s["data"]) == (68161, 5)
    @test s["data"][1, :] ≈ [-109.86328125, 669.43359375, -243.1640625, -46.875, 0.0]
    @test s["data"][end, :] ≈ [-105.46875, 588.8671875, 203.125, -45.41015625, 0.0]
    s = streams[5]
    @test s["name"] == "OpenSignals"
    @test s["type"] == "98:D3:71:FD:72:BF"
    @test s["nchannels"] == 4
    @test s["srate"] == 1000.0
    @test s["dtype"] == Float32
    @test size(s["data"]) == (305088, 4)
    @test s["data"][1, :] ≈ [8.0, 0.6899999976158142, -0.11400000005960464, 8.199999809265137]
    @test s["data"][end, :] ≈ [7.0, -0.9670000076293945, -0.003000000026077032, 9.180000305175781]
end

@testset "sub-13_ses-S001_task-HCT_run-001_eeg.xdf" begin
    file = Downloads.download("https://osf.io/download/6y8ub/")
    streams = read_xdf(file)
    @test length(streams) == 5
    @test sort(collect(keys(streams))) == [1, 2, 3, 4, 5]
    s = streams[1]
    @test s["name"] == "Muse"
    @test s["type"] == "PPG"
    @test s["nchannels"] == 3
    @test s["srate"] == 64.0
    @test s["dtype"] == Float32
    @test size(s["data"]) == (16573, 3)
    @test s["data"][1, :] ≈ [2384.0, 89662.0, 35328.0]
    @test s["data"][end, :] ≈ [2554.0, 89699.0, 35138.0]
    s = streams[3]
    @test s["name"] == "Muse"
    @test s["type"] == "GYRO"
    @test s["nchannels"] == 3
    @test s["srate"] == 52.0
    @test s["dtype"] == Float32
    @test size(s["data"]) == (13426, 3)
    @test s["data"][1, :] ≈ [-0.2317807972431183, 1.271056056022644, -0.037383999675512314]
    @test s["data"][end, :] ≈ [0.575713574886322, -1.0617055892944336, -0.7402032017707825]
    s = streams[5]
    @test s["name"] == "Muse"
    @test s["type"] == "ACC"
    @test s["nchannels"] == 3
    @test s["srate"] == 52.0
    @test s["dtype"] == Float32
    @test size(s["data"]) == (13426, 3)
    @test s["data"][1, :] ≈ [-0.3915407955646515, 0.04083254933357239, 0.9278571009635925]
    @test s["data"][end, :] ≈ [-0.3869021236896515, 0.05657963082194328, 0.9347540736198425]
    s = streams[2]
    @test s["name"] == "Muse"
    @test s["type"] == "EEG"
    @test s["nchannels"] == 5
    @test s["srate"] == 256.0
    @test s["dtype"] == Float32
    @test size(s["data"]) == (66276, 5)
    @test s["data"][1, :] ≈ [787.109375, 999.51171875, -41.015625, 319.3359375, 0.0]
    @test s["data"][end, :] ≈ [323.73046875, 307.12890625, -38.0859375, 29.296875, 0.0]
    s = streams[4]
    @test s["name"] == "OpenSignals"
    @test s["type"] == "98:D3:71:FD:72:BF"
    @test s["nchannels"] == 4
    @test s["srate"] == 1000.0
    @test s["dtype"] == Float32
    @test size(s["data"]) == (276576, 4)
    @test s["data"][1, :] ≈ [4.0, 0.01600000075995922, 0.008999999612569809, 6.739999771118164]
    @test s["data"][end, :] ≈ [3.0, -0.18400000035762787, -0.003000000026077032, 6.739999771118164]
end

@testset "xdf_001.xdf" begin
    if RUN_LARGE
        file = Downloads.download("https://osf.io/download/js8ax/")
        streams = read_xdf(file)
        @test length(streams) == 3
        @test sort(collect(keys(streams))) == [1, 2, 3]
        s = streams[2]
        @test s["name"] == "BrainVision RDA Markers"
        @test s["type"] == "Markers"
        @test s["nchannels"] == 1
        @test s["srate"] == 0.0
        @test s["dtype"] == String
        @test size(s["data"]) == (241, 1)
        @test s["data"][1, :] == ["Sync On"]
        @test s["data"][end, :] == ["Sync On"]
        s = streams[3]
        @test s["name"] == "BrainVision RDA"
        @test s["type"] == "EEG"
        @test s["nchannels"] == 64
        @test s["srate"] == 5000.0
        @test s["dtype"] == Float32
        @test size(s["data"]) == (2410400, 64)
        @test s["data"][1, :] ≈ [-8.5, -1.0, -20.0, -11.0, -23.0, -50.5, -28.0, 5.5, -75.0, 4.0, 32.5, 5.5, 41.5, 19.0, 113.0, -14.0, -10.0, 14.0, -44.0, -34.5, -3.5, -119.5, -5.0, 56.0, -3.5, -12.5, -9.5, -56.0, 4.0, 1.0, -13.0, -38.0, 46.5, -19.5, -94.5, 1.0, 15.5, -4.0, 16.0, 5.0, -42.5, 9.5, 178.5, 2.5, -5.5, -19.5, 39.5, -21.0, -23.5, -17.0, 15.0, -110.0, 13.0, 39.5, 9.5, 82.5, -49.5, 225.5, 393.5, 81.0, -13.0, 1.0, -4.0, -4.0]
        @test s["data"][end, :] ≈ [61.0, 50.5, 29.0, 38.5, 75.5, 16.0, 21.5, 47.0, 87.0, 68.5, 38.5, 56.0, 117.5, 67.5, -23.5, 27.5, 28.0, 61.0, -28.5, -4.0, 22.5, -95.0, -10.0, -27.5, 15.5, 73.5, -13.5, -51.5, 20.0, -15.0, -79.5, -11.0, -56.5, -7.5, -64.5, -7.0, 16.0, -1.5, -186.0, 5.0, -50.0, 12.0, -10.0, 4.5, -19.5, -10.5, 56.5, -53.0, -29.0, -16.0, 19.0, 2.5, -20.5, 42.0, 11.5, -189.0, -41.0, -5018.5, -4951.0, 34.5, -2.5, -1.0, -5.0, -60.0]
        s = streams[1]
        @test s["name"] == "Keyboard"
        @test s["type"] == "Markers"
        @test s["nchannels"] == 1
        @test s["srate"] == 0.0
        @test s["dtype"] == String
        @test size(s["data"]) == (270, 1)
        @test s["data"][1, :] == ["T pressed"]
        @test s["data"][end, :] == ["T released"]
    else
        @info "Skipped (set XDF_OSF_LARGE=1 to enable)"
    end
end

@testset "xdf_002.xdf" begin
    if RUN_LARGE
        file = Downloads.download("https://osf.io/download/ts97y/")
        streams = read_xdf(file)
        @test length(streams) == 3
        @test sort(collect(keys(streams))) == [1, 2, 3]
        s = streams[2]
        @test s["name"] == "Itek_MR_EEG"
        @test s["type"] == "EEG"
        @test s["nchannels"] == 128
        @test s["srate"] == 488.0
        @test s["dtype"] == Float64
        @test size(s["data"]) == (165675, 128)
        @test s["data"][1, :] ≈ [-55117.0, 162977.0, -144203.0, -2611462.0, 447811.0, -4449402.0, -1278210.0, -898870.0, -2583511.0, 4588076.0, 124590.0, -63808.0, -484473.0, -532122.0, -124748.0, 2482611.0, -3358412.0, -466735.0, 657729.0, -186615.0, 542846.0, -59176.0, 129154.0, 163382.0, -602831.0, -148385.0, -1305404.0, -200622.0, -395174.0, 811403.0, 3696682.0, 1972827.0, -886676.0, -257581.0, 555245.0, -509344.0, -304308.0, 2108.0, 2246053.0, 157802.0, 81184.0, 234746.0, -166314.0, -1187908.0, -907899.0, -4352372.0, -133877.0, -194706.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -2162723.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1780135.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1855032.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1412082.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -135148.0, -245527.0, -168485.0, 96048.0, 187079.0, 141836.0, -410007.0, -210424.0]
        @test s["data"][end, :] ≈ [-623303.0, -175677.0, -123909.0, 226633.0, -1895228.0, 3848142.0, 1574177.0, -274157.0, 4383903.0, -2978794.0, -181570.0, -128323.0, -443647.0, 8388607.0, -8388608.0, 8388607.0, 192090.0, 224805.0, -758743.0, 263754.0, 111227.0, -322379.0, -103735.0, -408622.0, -501180.0, 120162.0, 3839781.0, -341226.0, -56274.0, -2948573.0, -216093.0, 2184314.0, -264399.0, 133924.0, 23358.0, -663492.0, -424000.0, -291178.0, -732648.0, 537757.0, 304950.0, -564380.0, -4156946.0, 149661.0, 275754.0, 556607.0, -169619.0, -201355.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -2163277.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1785170.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1858873.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1415832.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -19477.0, -179862.0, -143102.0, 33324.0, 187819.0, 48938.0, -138827.0, -217884.0]
        s = streams[3]
        @test s["name"] == "EyeLink"
        @test s["type"] == "Gaze"
        @test s["nchannels"] == 16
        @test s["srate"] == 1000.0
        @test s["dtype"] == Float32
        @test size(s["data"]) == (339263, 16)
        @test s["data"][1, :] ≈ [0.0, 0.0, 519.2999877929688, 376.20001220703125, 727.0, 60.0, 100.0, 96.5999984741211, 67.69999694824219, 0.0, 743.0, 0.0, 0.0, -32768.0, -32768.0, 37091840.0]
        @test s["data"][end, :] ≈ [0.0, 0.0, -32768.0, -32768.0, -32768.0, -32768.0, -32768.0, 99.0999984741211, 68.80000305175781, 0.0, 0.0, 0.0, 0.0, -32768.0, -32768.0, 37431104.0]
        s = streams[1]
        @test s["name"] == "Keyboard"
        @test s["type"] == "Markers"
        @test s["nchannels"] == 1
        @test s["srate"] == 0.0
        @test s["dtype"] == String
        @test size(s["data"]) == (300, 1)
        @test s["data"][1, :] == ["T pressed"]
        @test s["data"][end, :] == ["T released"]
    else
        @info "Skipped (set XDF_OSF_LARGE=1 to enable)"
    end
end

@testset "xdf_003.xdf" begin
    file = Downloads.download("https://osf.io/download/6489e668a31091020cd111ee/")
    streams = read_xdf(file)
    @test length(streams) == 6
    @test sort(collect(keys(streams))) == [1, 2, 3, 4, 5, 6]
    s = streams[6]
    @test s["name"] == "Joystick - HOTAS WarthogButtons"
    @test s["type"] == "Markers"
    @test s["nchannels"] == 1
    @test s["srate"] == 0.0
    @test s["dtype"] == String
    @test size(s["data"]) == (2, 1)
    @test s["data"][1, :] == ["Button16 pressed"]
    @test s["data"][end, :] == ["Button16 released"]
    s = streams[5]
    @test s["name"] == "NEDE_FlightParams"
    @test s["type"] == "Position"
    @test s["nchannels"] == 8
    @test s["srate"] == 75.0
    @test s["dtype"] == Float64
    @test size(s["data"]) == (4837, 8)
    @test s["data"][1, :] ≈ [-996.6221923828125, 1000.0, 0.0, 946.0, 1054.0, 353.39471435546875, 359.7095947265625, 1.2643176317214966]
    @test s["data"][end, :] ≈ [15000.9375, 969.008544921875, 15000.0, 932.7899780273438, 968.7899780273438, 18.851078033447266, 1.6665936708450317, 5.274921417236328]
    s = streams[1]
    @test s["name"] == "NEDE_StickMvmtPitch"
    @test s["type"] == "StickMvmt"
    @test s["nchannels"] == 1
    @test s["srate"] == 0.0
    @test s["dtype"] == Float64
    @test size(s["data"]) == (4537, 1)
    @test s["data"][1, :] ≈ [0.006333301309496164]
    @test s["data"][end, :] ≈ [0.4995035231113434]
    s = streams[3]
    @test s["name"] == "NEDE_Markers"
    @test s["type"] == "Markers"
    @test s["nchannels"] == 1
    @test s["srate"] == 0.0
    @test s["dtype"] == String
    @test size(s["data"]) == (180, 1)
    @test s["data"][1, :] == ["Run_Start"]
    @test s["data"][end, :] == ["Run_End_Cond_0_Comp_66"]
    s = streams[2]
    @test s["name"] == "iViewNG_HMD"
    @test s["type"] == "Gaze"
    @test s["nchannels"] == 37
    @test s["srate"] == 60.0
    @test s["dtype"] == Float64
    @test size(s["data"]) == (4512, 37)
    @test s["data"][1, :] ≈ [93254422928.0, 959.662, 594.977, 62.0913, 62.0626, 0.00125127, -0.103347, 0.994645, 1.0, 928.436, 599.127, 27.194, 5.62775, 9193880.0, 0.0126522, -0.111623, 0.993667, 9193880.0, 9193840.0, 27.3504, 4.83356, -11.0472, 1.59104, 990.888, 590.826, -34.6743, 3.72149, 1.30932e+212, -0.00802605, -0.0948052, 0.995463, 0.0, 0.0, -34.5028, 3.32687, -15.913, 1.47117]
    @test s["data"][end, :] ≈ [168302303850.0, 815.398, 548.559, 62.3355, 61.5707, 0.190933, -0.0275816, 0.981215, 1.0, 812.392, 558.809, 27.4126, 4.50844, -21.3462, 0.126521, -0.0387852, 0.987911, 22.0918, 70.503, 29.5268, 4.66362, -11.562, 1.60884, 818.405, 538.309, -34.7184, 3.07573, 3.17604e+114, 0.160668, -0.00130151, 0.98377, 3.17604e+114, 3.17604e+114, -31.8058, 3.36234, -16.8127, 1.51797]
    s = streams[4]
    @test s["name"] == "Joystick - HOTAS WarthogAxes"
    @test s["type"] == "Position"
    @test s["nchannels"] == 36
    @test s["srate"] == 60.0
    @test s["dtype"] == Float32
    @test size(s["data"]) == (4692, 36)
    @test s["data"][1, :] ≈ [-0.023000000044703484, 0.009999999776482582, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4294967.5, 4294967.5, 4294967.5, 4294967.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
    @test s["data"][end, :] ≈ [-0.01600000075995922, 0.003000000026077032, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4294967.5, 4294967.5, 4294967.5, 4294967.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
end

@testset "xdf_004.xdf" begin
    if RUN_LARGE
        file = Downloads.download("https://osf.io/download/3bhpw/")
        streams = read_xdf(file)
        @test length(streams) == 3
        @test sort(collect(keys(streams))) == [1, 2, 3]
        s = streams[1]
        @test s["name"] == "Itek_MR_EEG"
        @test s["type"] == "EEG"
        @test s["nchannels"] == 128
        @test s["srate"] == 488.0
        @test s["dtype"] == Float64
        @test size(s["data"]) == (193450, 128)
        @test s["data"][1, :] ≈ [61254.0, 253577.0, 290260.0, 249063.0, 80627.0, 196170.0, 8492.0, -828.0, 289283.0, 482009.0, 128229.0, 468134.0, -117708.0, 350481.0, 616842.0, -160738.0, 193289.0, 284422.0, 86564.0, 317361.0, 447906.0, 64261.0, 355461.0, 524209.0, -151341.0, 16224.0, 24941.0, 246355.0, 179828.0, 417290.0, -555383.0, -20891.0, 264093.0, 271114.0, 160638.0, 72012.0, -225970.0, 32985.0, -123518.0, 57984.0, 387305.0, 244339.0, 113139.0, -66927.0, 39249.0, 128771.0, 107335.0, 264272.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -613598.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -583044.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -587327.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -579361.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 71161.0, -54872.0, 62864.0, 160827.0, 333275.0, 345045.0, -117543.0, -59959.0]
        @test s["data"][end, :] ≈ [97396.0, 112863.0, 319806.0, 222960.0, 241926.0, 59594.0, 212547.0, 7205.0, 183954.0, 468514.0, -128716.0, 281787.0, 5556177.0, 583234.0, 225601.0, 236202.0, 231935.0, 460242.0, 184802.0, 283880.0, 510031.0, 239767.0, 359671.0, 538424.0, -133395.0, 5383.0, -87356.0, 263370.0, 137815.0, 552451.0, -55651.0, 37823.0, 55363.0, 398924.0, 204261.0, 135481.0, 8543.0, 147130.0, -134491.0, 146845.0, 320585.0, 358995.0, 231229.0, -105748.0, -31159.0, 413346.0, 110078.0, 96674.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -677982.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -612430.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -611716.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -605300.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 47117.0, 14473.0, 30211.0, 258941.0, 322365.0, 393435.0, -363308.0, -150770.0]
        s = streams[3]
        @test s["name"] == "PTB-Markers"
        @test s["type"] == "Markers"
        @test s["nchannels"] == 1
        @test s["srate"] == 0.0
        @test s["dtype"] == String
        @test size(s["data"]) == (105, 1)
        @test s["data"][1, :] == ["Standard"]
        @test s["data"][end, :] == ["Standard"]
        s = streams[2]
        @test s["name"] == "Keyboard"
        @test s["type"] == "Markers"
        @test s["nchannels"] == 1
        @test s["srate"] == 0.0
        @test s["dtype"] == String
        @test size(s["data"]) == (58, 1)
        @test s["data"][1, :] == ["T pressed"]
        @test s["data"][end, :] == ["SPACE released"]
    else
        @info "Skipped (set XDF_OSF_LARGE=1 to enable)"
    end
end

@testset "xdf_005.xdf" begin
    if RUN_LARGE
        file = Downloads.download("https://osf.io/download/kczfd/")
        streams = read_xdf(file)
        @test length(streams) == 9
        @test sort(collect(keys(streams))) == [1, 2, 3, 4, 5, 6, 7, 8, 9]
        s = streams[5]
        @test s["name"] == "Joystick - HOTAS WarthogAxes"
        @test s["type"] == "Position"
        @test s["nchannels"] == 36
        @test s["srate"] == 60.0
        @test s["dtype"] == Float32
        @test size(s["data"]) == (6631, 36)
        @test s["data"][1, :] ≈ [-0.017999999225139618, -0.0010000000474974513, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4294967.5, 4294967.5, 4294967.5, 4294967.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        @test s["data"][end, :] ≈ [-0.01600000075995922, -0.004000000189989805, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4294967.5, 4294967.5, 4294967.5, 4294967.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        s = streams[1]
        @test s["name"] == "SNAP-Markers"
        @test s["type"] == "Markers"
        @test s["nchannels"] == 1
        @test s["srate"] == 0.0
        @test s["dtype"] == String
        @test size(s["data"]) == (0, 1)
        s = streams[9]
        @test s["name"] == "NEDE_Markers"
        @test s["type"] == "Markers"
        @test s["nchannels"] == 1
        @test s["srate"] == 0.0
        @test s["dtype"] == String
        @test size(s["data"]) == (253, 1)
        @test s["data"][1, :] == ["Run_Start"]
        @test s["data"][end, :] == ["Run_End_Cond_0_Comp_97"]
        s = streams[2]
        @test s["name"] == "NEDE_FlightParams"
        @test s["type"] == "Position"
        @test s["nchannels"] == 8
        @test s["srate"] == 75.0
        @test s["dtype"] == Float64
        @test size(s["data"]) == (6933, 8)
        @test s["data"][1, :] ≈ [-995.6873168945312, 1000.0, 0.0, 946.0, 1054.0, 355.3487854003906, 357.60430908203125, 1.9696964025497437]
        @test s["data"][end, :] ≈ [22002.671875, 961.836669921875, 22000.0, 945.7999877929688, 981.7999877929688, 2.6977028846740723, 355.51873779296875, 1.8386096954345703]
        s = streams[3]
        @test s["name"] == "BioSemi"
        @test s["type"] == "EEG"
        @test s["nchannels"] == 89
        @test s["srate"] == 2048.0
        @test s["dtype"] == Float32
        @test size(s["data"]) == (216883, 89)
        @test s["data"][1, :] ≈ [-7733249.0, -6318.78125, -16869.25, 6680.59375, 8643.4375, 14418.5, -5728.40625, 1469.875, 11.1875, 15121.21875, 18615.0, 4747.0625, -7877.0, 14083.9375, 10463.90625, 11342.5625, 2741.0, 4562.09375, 14641.34375, 4274.65625, 978.96875, 235.8125, -1555.625, 4409.0, 2739.6875, 750.15625, -454.25, 498.03125, 10216.40625, -7147.5, 5952.6875, -5646.15625, 9252.40625, -10952.4375, -17459.9375, 6577.21875, 13884.96875, 16817.53125, 11266.625, 15261.0625, 3180.25, 6567.1875, -15510.96875, 3819.34375, 5247.1875, 12870.46875, 14723.96875, 20609.46875, 11595.46875, 12858.125, 11717.125, 12997.0625, 11998.96875, 8455.4375, 13480.125, 14220.40625, 19576.75, 1174.3125, 1048.03125, -4378.09375, 13818.625, -850.46875, -5253.03125, -473.71875, -2595.59375, -24896.5, -30210.84375, -259425.75, -259448.90625, -259390.78125, -259446.25, -259438.9375, -259483.875, 906.5625, -897.40625, 98882.25, -131338.65625, -220553.78125, 0.0, 0.0, 0.0, 159.78125, 983.875, 30706.125, -259383.1875, 258868.625, 53122.21875, 0.0, 0.0]
        @test s["data"][end, :] ≈ [-7733249.0, -6408.34375, -16829.625, 6473.0625, 8461.90625, 14277.40625, -5655.4375, 522.65625, -85.1875, 15053.46875, 18499.6875, 4590.03125, -7892.0, 14025.8125, 10262.53125, 11368.34375, 2711.84375, 4664.78125, 14604.90625, 4226.0625, 1125.84375, 155.125, -1510.5625, 4218.1875, 2107.5, 517.15625, -615.3125, 361.21875, 10476.21875, -6693.625, 5768.1875, -5123.6875, 9487.25, -11368.96875, -17685.625, 6264.15625, 13707.28125, 16756.75, 11140.5, 15161.03125, 2999.3125, 6428.5625, -15160.0, 3546.8125, 5054.125, 12684.03125, 14605.28125, 20540.84375, 11499.3125, 12499.90625, 11573.28125, 12864.78125, 12364.09375, 8337.3125, 13357.5, 14131.0, 19098.625, 1160.0625, 916.5, -4280.3125, 13761.84375, -944.0, -5390.375, -715.0625, -2647.65625, -24753.375, -30390.375, -259424.4375, -259446.8125, -259388.75, -259444.5625, -259436.9375, -259482.25, 129.34375, 2565.75, -131329.59375, 97034.96875, -140161.78125, 0.0, 0.0, 0.0, 160.375, 471.90625, 31734.34375, -259380.4375, 258868.8125, 53045.21875, 0.0, 0.0]
        s = streams[4]
        @test s["name"] == "SNAP-EngineEvents"
        @test s["type"] == "Markers"
        @test s["nchannels"] == 1
        @test s["srate"] == 0.0
        @test s["dtype"] == String
        @test size(s["data"]) == (6366, 1)
        @test s["data"][1, :] == ["screen-flip"]
        @test s["data"][end, :] == ["screen-flip"]
        s = streams[6]
        @test s["name"] == "iViewNG_HMD"
        @test s["type"] == "Gaze"
        @test s["nchannels"] == 37
        @test s["srate"] == 60.0
        @test s["dtype"] == Float64
        @test size(s["data"]) == (6376, 37)
        @test s["data"][1, :] ≈ [757101583869.0, 1945.96, 1597.71, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 3666.03, 6461.52, 32.7686, 6.29087, -21.8618, -0.492026, -0.73155, 0.47177, 22.4147, 70.96, 29.0088, -2.99489, -21.0133, 1.92108, 1871.99, 2188.03, -35.3291, 5.95003, -21.84, -0.25046, -0.904642, 0.330679, 22.6031, 71.0048, 0.0, 0.0, 0.0, 0.0]
        @test s["data"][end, :] ≈ [863182265655.0, 2183.11, 1386.22, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 12304.1, 22821.4, 33.0387, 6.22863, -22.8423, -0.570977, -0.68626, 0.450512, 23.386, 71.9405, 28.4858, -2.72473, -22.4823, 1.78138, 2557.01, 9957.33, -34.817, 5.54457, -22.7541, -0.456166, -0.871152, 0.169124, 23.3715, 71.8759, 0.0, 0.0, 0.0, 0.0]
        s = streams[8]
        @test s["name"] == "Joystick - HOTAS WarthogButtons"
        @test s["type"] == "Markers"
        @test s["nchannels"] == 1
        @test s["srate"] == 0.0
        @test s["dtype"] == String
        @test size(s["data"]) == (0, 1)
        s = streams[7]
        @test s["name"] == "NEDE_StickMvmtPitch"
        @test s["type"] == "StickMvmt"
        @test s["nchannels"] == 1
        @test s["srate"] == 0.0
        @test s["dtype"] == Float64
        @test size(s["data"]) == (6633, 1)
        @test s["data"][1, :] ≈ [0.08495759963989258]
        @test s["data"][end, :] ≈ [-0.07976274192333221]
    else
        @info "Skipped (set XDF_OSF_LARGE=1 to enable)"
    end
end

@testset "xdf_006.xdf" begin
    if RUN_LARGE
        file = Downloads.download("https://osf.io/download/6489e71fa310910210d10afc/")
        streams = read_xdf(file)
        @test length(streams) == 7
        @test sort(collect(keys(streams))) == [1, 2, 3, 4, 5, 6, 7]
        s = streams[5]
        @test s["name"] == "Joystick - HOTAS WarthogButtons"
        @test s["type"] == "Markers"
        @test s["nchannels"] == 1
        @test s["srate"] == 0.0
        @test s["dtype"] == String
        @test size(s["data"]) == (2, 1)
        @test s["data"][1, :] == ["Button16 pressed"]
        @test s["data"][end, :] == ["Button16 released"]
        s = streams[6]
        @test s["name"] == "NEDE_FlightParams"
        @test s["type"] == "Position"
        @test s["nchannels"] == 8
        @test s["srate"] == 75.0
        @test s["dtype"] == Float64
        @test size(s["data"]) == (5455, 8)
        @test s["data"][1, :] ≈ [-996.5883178710938, 1000.0, 0.0, 946.0, 1054.0, 355.7268371582031, 1.4367728233337402, 2.5632760524749756]
        @test s["data"][end, :] ≈ [17000.71875, 946.7423095703125, 17000.0, 949.1799926757812, 985.1799926757812, 327.3164978027344, 0.5667601823806763, 6.121665954589844]
        s = streams[2]
        @test s["name"] == "Joystick - HOTAS WarthogAxes"
        @test s["type"] == "Position"
        @test s["nchannels"] == 36
        @test s["srate"] == 60.0
        @test s["dtype"] == Float32
        @test size(s["data"]) == (5285, 36)
        @test s["data"][1, :] ≈ [-0.028999999165534973, 0.00800000037997961, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4294967.5, 4294967.5, 4294967.5, 4294967.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        @test s["data"][end, :] ≈ [-0.02500000037252903, 0.014000000432133675, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4294967.5, 4294967.5, 4294967.5, 4294967.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        s = streams[4]
        @test s["name"] == "iViewNG_HMD"
        @test s["type"] == "Gaze"
        @test s["nchannels"] == 37
        @test s["srate"] == 60.0
        @test s["dtype"] == Float64
        @test size(s["data"]) == (5079, 37)
        @test s["data"][1, :] ≈ [578215530043.0, 919.508, 557.8, 62.222, 61.9865, 0.0398441, -0.0403766, 0.99839, 1.0, 893.97, 560.91, 29.9704, 6.16928, -25.2408, 0.0451559, -0.0451902, 0.997956, 25.7774, 74.3432, 30.4761, 6.5387, -15.1098, 1.21123, 945.045, 554.69, -32.2434, 6.86746, -25.0973, 0.0359177, -0.0349947, 0.998738, 25.6824, 74.216, -31.5069, 7.18919, -15.2286, 1.19673]
        @test s["data"][end, :] ≈ [662746923484.0, 929.323, 552.776, 62.5112, 62.192, 0.0319436, -0.030963, 0.99901, 1.0, 907.39, 553.93, 30.0469, 6.68264, -24.8622, 0.0317733, -0.0332847, 0.998934, 25.4731, 73.9891, 30.5062, 7.03016, -14.8354, 1.63415, 951.256, 551.622, -32.4629, 7.27906, -24.8234, 0.0298296, -0.0299714, 0.999104, 25.4882, 73.9687, -31.6833, 7.57931, -14.9184, 1.60526]
        s = streams[3]
        @test s["name"] == "NEDE_StickMvmtPitch"
        @test s["type"] == "StickMvmt"
        @test s["nchannels"] == 1
        @test s["srate"] == 0.0
        @test s["dtype"] == Float64
        @test size(s["data"]) == (5157, 1)
        @test s["data"][1, :] ≈ [0.10047566890716553]
        @test s["data"][end, :] ≈ [-0.3482538163661957]
        s = streams[7]
        @test s["name"] == "BioSemi"
        @test s["type"] == "EEG"
        @test s["nchannels"] == 89
        @test s["srate"] == 2048.0
        @test s["dtype"] == Float32
        @test size(s["data"]) == (172629, 89)
        @test s["data"][1, :] ≈ [-7733249.0, -12590.21875, -12024.375, -11697.1875, 9172.34375, 4654.09375, 20977.9375, -7357.3125, -3143.75, 4726.40625, 13180.59375, 5039.34375, 16658.46875, 17751.34375, -4638.09375, -4936.875, -661.5625, 8630.4375, 2932.46875, 9091.875, 1516.78125, 13290.15625, 1808.3125, 1477.71875, 1724.5625, 6126.5625, 2754.28125, 6493.28125, 16372.875, 7710.9375, 2505.8125, 14289.5, 4235.375, -10828.34375, -9375.0, -14862.6875, -4122.6875, 6363.0625, 15900.65625, 17340.5625, 1046.21875, 5390.34375, -5069.125, -2078.75, 3129.46875, 38.75, 9634.75, 7287.40625, 4276.21875, 1526.0625, 8373.75, -2327.0625, -2733.125, -4599.28125, -2149.9375, 11365.25, -6453.375, -1850.09375, 9176.03125, 5135.65625, 2545.375, 6688.59375, 6151.875, 7566.71875, 21013.96875, -21199.375, -16280.71875, -259403.21875, -259426.84375, -259367.75, -259423.78125, -259415.875, -259462.625, 3845.5625, -67.9375, 95724.84375, -131327.75, -211866.4375, 0.0, 0.0, 0.0, 164.03125, 203.75, 75539.09375, -259358.59375, 258837.84375, 62499.21875, 0.0, 0.0]
        @test s["data"][end, :] ≈ [-7733249.0, -13495.84375, -12711.8125, -12713.1875, 9272.65625, 3925.09375, 21037.21875, -7290.3125, -2960.03125, 4842.21875, 13214.21875, 5126.5625, 16734.8125, 17414.9375, -4439.53125, -4874.46875, -394.90625, 8658.53125, 3002.46875, 8829.875, 1557.84375, 13286.28125, 1969.6875, 1580.8125, 1922.0625, 6323.25, 2962.5625, 6757.125, 16537.28125, 7365.59375, 2013.65625, 13779.125, 3569.5625, -11426.78125, -10170.625, -14855.125, -5075.375, 4181.3125, 15601.40625, 17365.0, 1033.28125, 5321.375, -5081.75, -2044.5625, 3354.46875, -63.96875, 9705.25, 7047.6875, 3738.15625, 1559.21875, 8310.3125, -2071.9375, -2646.875, -4313.1875, -1988.5625, 11518.84375, -6458.9375, -1805.4375, 9253.96875, 5205.03125, 2655.03125, 6902.71875, 6315.4375, 7709.0625, 21191.03125, -21187.28125, -15995.0625, -259402.78125, -259426.4375, -259367.1875, -259423.40625, -259414.875, -259462.5, -2789.15625, 5544.59375, -131329.875, 99333.15625, -150458.90625, 0.0, 0.0, 0.0, 163.1875, -944.03125, 76301.5625, -259354.84375, 258835.96875, 62469.46875, 0.0, 0.0]
        s = streams[1]
        @test s["name"] == "NEDE_Markers"
        @test s["type"] == "Markers"
        @test s["nchannels"] == 1
        @test s["srate"] == 0.0
        @test s["dtype"] == String
        @test size(s["data"]) == (190, 1)
        @test s["data"][1, :] == ["Run_Start"]
        @test s["data"][end, :] == ["Run_End_Cond_0_Comp_75"]
    else
        @info "Skipped (set XDF_OSF_LARGE=1 to enable)"
    end
end

@testset "xdf_007.xdf" begin
    if RUN_LARGE
        file = Downloads.download("https://osf.io/download/k5b6g/")
        streams = read_xdf(file)
        @test length(streams) == 5
        @test sort(collect(keys(streams))) == [1, 2, 3, 4, 5]
        s = streams[2]
        @test s["name"] == "Itek_MR_EEG"
        @test s["type"] == "EEG"
        @test s["nchannels"] == 128
        @test s["srate"] == 488.0
        @test s["dtype"] == Float64
        @test size(s["data"]) == (179975, 128)
        @test s["data"][1, :] ≈ [-254330.0, -271044.0, -78810.0, 941414.0, -377853.0, 1068246.0, -167193.0, -345326.0, 607300.0, -1239132.0, -165440.0, -97909.0, -449217.0, 901261.0, -771665.0, -671233.0, 691113.0, 146537.0, -202923.0, 57745.0, 222303.0, -216647.0, 117238.0, 179880.0, -566277.0, -182085.0, 276668.0, -157760.0, -81778.0, -668354.0, -223145.0, 1589696.0, -143653.0, -164739.0, 153319.0, -556741.0, -502334.0, -281055.0, -1233863.0, -311520.0, 245693.0, -133532.0, -756286.0, -365030.0, -343642.0, 535731.0, -185564.0, -165909.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -2163004.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1783216.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1857180.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1414749.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -168627.0, -239587.0, -131449.0, -47740.0, 157548.0, 104416.0, -443375.0, -219009.0]
        @test s["data"][end, :] ≈ [-232002.0, -238564.0, -95281.0, -1770827.0, 384879.0, 4354783.0, -766991.0, -229478.0, -948287.0, -4557396.0, -291789.0, 45997.0, -489130.0, 1512607.0, -1413765.0, 2229402.0, -1616588.0, 105906.0, -222661.0, -71491.0, 180850.0, -210672.0, -44984.0, 97308.0, -533982.0, -105036.0, -102970.0, -101867.0, -66361.0, 45447.0, -184786.0, 4469740.0, -17074.0, -89931.0, 206235.0, -651505.0, -505911.0, -390912.0, 539587.0, -331073.0, 322091.0, -266660.0, -209764.0, -418934.0, -206706.0, -415448.0, -209991.0, -187587.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -2162490.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1779186.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1852654.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1410035.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -90580.0, -276101.0, -174265.0, -162153.0, 152655.0, 86429.0, -425053.0, -232182.0]
        s = streams[4]
        @test s["name"] == "EyeLink"
        @test s["type"] == "Gaze"
        @test s["nchannels"] == 16
        @test s["srate"] == 1000.0
        @test s["dtype"] == Float32
        @test size(s["data"]) == (368552, 16)
        @test s["data"][1, :] ≈ [0.0, 0.0, 671.4000244140625, 484.70001220703125, 1102.0, 188.0, 577.0, 96.69999694824219, 67.80000305175781, 0.0, 1095.0, 0.0, 0.0, -32768.0, -32768.0, 37867812.0]
        @test s["data"][end, :] ≈ [0.0, 0.0, 92.19999694824219, 384.20001220703125, 1192.0, 34.0, 71.0, 97.19999694824219, 67.9000015258789, 0.0, 1198.0, 0.0, 0.0, -32768.0, -32768.0, 38236364.0]
        s = streams[1]
        @test s["name"] == "Keyboard"
        @test s["type"] == "Markers"
        @test s["nchannels"] == 1
        @test s["srate"] == 0.0
        @test s["dtype"] == String
        @test size(s["data"]) == (304, 1)
        @test s["data"][1, :] == ["T pressed"]
        @test s["data"][end, :] == ["ESCAPE released"]
        s = streams[3]
        @test s["name"] == "SNAP-Markers"
        @test s["type"] == "Markers"
        @test s["nchannels"] == 1
        @test s["srate"] == 0.0
        @test s["dtype"] == String
        @test size(s["data"]) == (447, 1)
        @test s["data"][1, :] == ["229"]
        @test s["data"][end, :] == ["VP3_End"]
        s = streams[5]
        @test s["name"] == "SNAP-EngineEvents"
        @test s["type"] == "Markers"
        @test s["nchannels"] == 1
        @test s["srate"] == 0.0
        @test s["dtype"] == String
        @test size(s["data"]) == (20447, 1)
        @test s["data"][1, :] == ["screen-flip"]
        @test s["data"][end, :] == ["screen-flip"]
    else
        @info "Skipped (set XDF_OSF_LARGE=1 to enable)"
    end
end

@testset "xdf_008.xdf" begin
    if RUN_LARGE
        file = Downloads.download("https://osf.io/download/6489e71dc86116031e25235d/")
        streams = read_xdf(file)
        @test length(streams) == 13
        @test sort(collect(keys(streams))) == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
        s = streams[10]
        @test s["name"] == "Joystick - HOTAS WarthogButtons"
        @test s["type"] == "Markers"
        @test s["nchannels"] == 1
        @test s["srate"] == 0.0
        @test s["dtype"] == String
        @test size(s["data"]) == (0, 1)
        s = streams[3]
        @test s["name"] == "CL_BCI_Output"
        @test s["type"] == "MentalState"
        @test s["nchannels"] == 1
        @test s["srate"] == 8.0
        @test s["dtype"] == Float32
        @test size(s["data"]) == (665, 1)
        @test s["data"][1, :] ≈ [1.0]
        @test s["data"][end, :] ≈ [1.1622740030288696]
        s = streams[6]
        @test s["name"] == "BioSemi"
        @test s["type"] == "EEG"
        @test s["nchannels"] == 89
        @test s["srate"] == 2048.0
        @test s["dtype"] == Float32
        @test size(s["data"]) == (170284, 89)
        @test s["data"][1, :] ≈ [-3538945.0, -10366.96875, -15783.625, 3990.40625, 6363.78125, 12675.53125, -7412.84375, 2194.59375, -3385.21875, 13424.125, 17216.75, 1018.375, -7131.375, 12545.46875, 7766.09375, 10403.53125, 4014.28125, 2766.25, 13919.9375, 1511.625, -43.75, -4169.65625, -219.3125, 3964.46875, 1305.59375, -4578.46875, -1229.03125, -1990.75, 395.15625, -6507.6875, 3271.0, -5021.375, 8198.0625, -11884.8125, -19785.0625, 6249.1875, 10854.25, 15252.3125, 10359.75, 12251.78125, 1820.96875, 2487.84375, -14015.625, 1500.75, 4518.90625, 9457.40625, 860.03125, 19511.21875, 7844.0625, 9252.1875, 10042.8125, 12891.8125, 10565.875, 6751.03125, 12536.125, 13750.75, 1340.25, -250.75, -400.625, -1562.34375, 12755.5625, -4172.59375, -5288.03125, -5094.53125, -4997.125, -24275.03125, -259433.40625, -259424.53125, -259447.4375, -259389.96875, -259443.96875, -259435.71875, -259483.375, -1575.03125, 7186.21875, -131244.25, 100998.3125, -80480.40625, 0.0, 0.0, 0.0, 161.21875, 1397.65625, 55998.8125, -259382.0, 258871.71875, 48069.21875, 0.0, 0.0]
        @test s["data"][end, :] ≈ [-3538945.0, -10226.0625, -15727.75, 4093.6875, 6469.8125, 12804.03125, -7226.125, 2406.625, -3134.1875, 13631.03125, 17361.6875, 1151.0, -6976.71875, 12762.34375, 7945.6875, 10606.625, 4219.25, 2928.46875, 14103.3125, 1618.03125, 17.03125, -4271.84375, 87.84375, 4135.96875, 1193.59375, -4563.6875, -1017.625, -1988.4375, 1106.46875, -5937.84375, 3435.8125, -3592.59375, 9192.28125, -11141.65625, -19708.4375, 6507.53125, 10987.09375, 15514.96875, 11006.75, 12545.375, 1960.1875, 2573.65625, -13699.4375, 1806.78125, 4687.34375, 9568.4375, 934.59375, 19666.0625, 8573.75, 9355.625, 10199.0, 13201.9375, 10835.875, 8015.84375, 12726.1875, 13918.3125, 1566.375, -124.90625, -296.75, -1323.625, 12930.28125, -3879.1875, -5099.8125, -4866.1875, -4794.96875, -23540.3125, 179161.125, -259424.71875, -259448.53125, -259388.46875, -259444.9375, -259436.625, -259483.75, 1937.625, -15967.09375, 99958.0625, -131338.875, -229625.75, 0.0, 0.0, 0.0, 162.09375, 2996.21875, 55627.46875, -259380.5, 258870.90625, 47928.46875, 0.0, 0.0]
        s = streams[2]
        @test s["name"] == "NEDE_StickMvmtPitch"
        @test s["type"] == "StickMvmt"
        @test s["nchannels"] == 1
        @test s["srate"] == 0.0
        @test s["dtype"] == Float64
        @test size(s["data"]) == (5030, 1)
        @test s["data"][1, :] ≈ [0.0]
        @test s["data"][end, :] ≈ [-0.3577982783317566]
        s = streams[13]
        @test s["name"] == "CL_Markers"
        @test s["type"] == "Markers"
        @test s["nchannels"] == 1
        @test s["srate"] == 0.0
        @test s["dtype"] == String
        @test size(s["data"]) == (55, 1)
        @test s["data"][1, :] == ["Art_HBeat_Audio_Onset"]
        @test s["data"][end, :] == ["Art_HBeat_Audio_Onset"]
        s = streams[12]
        @test s["name"] == "CL_Sham_FB_Raw"
        @test s["type"] == "Sham_FB_Raw"
        @test s["nchannels"] == 2
        @test s["srate"] == 8.0
        @test s["dtype"] == Float32
        @test size(s["data"]) == (666, 2)
        @test s["data"][1, :] ≈ [-1.1192435026168823, 32.465328216552734]
        @test s["data"][end, :] ≈ [0.8640848994255066, 36.118839263916016]
        s = streams[9]
        @test s["name"] == "NEDE_FlightParams"
        @test s["type"] == "Position"
        @test s["nchannels"] == 8
        @test s["srate"] == 75.0
        @test s["dtype"] == Float64
        @test size(s["data"]) == (5327, 8)
        @test s["data"][1, :] ≈ [-994.894287109375, 1000.0, 0.0, 946.0, 1054.0, 351.0808410644531, 356.2087097167969, 2.1057968139648438]
        @test s["data"][end, :] ≈ [17002.28515625, 942.96728515625, 17000.0, 949.1799926757812, 985.1799926757812, 338.8570556640625, 352.1279296875, 3.654956817626953]
        s = streams[8]
        @test s["name"] == "CL_Art_HR"
        @test s["type"] == "Art_HR"
        @test s["nchannels"] == 4
        @test s["srate"] == 4.0
        @test s["dtype"] == Float32
        @test size(s["data"]) == (334, 4)
        @test s["data"][1, :] ≈ [0.5974377989768982, 0.6014633774757385, 6.012811183929443, 0.5]
        @test s["data"][end, :] ≈ [0.1993943750858307, 0.20740042626857758, 8.00302791595459, 0.5]
        s = streams[11]
        @test s["name"] == "iViewNG_HMD"
        @test s["type"] == "Gaze"
        @test s["nchannels"] == 37
        @test s["srate"] == 60.0
        @test s["dtype"] == Float64
        @test size(s["data"]) == (4805, 37)
        @test s["data"][1, :] ≈ [545361572976.0, 993.971, 606.463, 67.7832, 68.3482, -0.0324762, -0.121623, 0.992045, 1.0, 969.14, 595.896, 32.3563, 5.85225, -21.9264, -0.0311098, -0.106094, 0.993862, 22.3976, 70.999, 32.6275, 4.61207, -11.9732, 1.47708, 1018.8, 617.031, -35.4035, 4.97579, -22.3565, -0.0350146, -0.142042, 0.989233, 23.0028, 71.4862, -35.7131, 3.77507, -11.395, 1.55171]
        @test s["data"][end, :] ≈ [628482445706.0, 1922.74, 1550.31, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 2288.36, 3021.91, 32.5277, 6.41799, -22.6415, -0.472893, -0.786738, 0.396612, 23.1947, 71.7422, 0.0, 0.0, 0.0, 0.0, 1464.53, 1775.28, -35.2321, 5.42236, -23.6934, -0.253388, -0.777968, 0.574862, 24.3381, 72.8276, 0.0, 0.0, 0.0, 0.0]
        s = streams[4]
        @test s["name"] == "SNAP-Markers"
        @test s["type"] == "Markers"
        @test s["nchannels"] == 1
        @test s["srate"] == 0.0
        @test s["dtype"] == String
        @test size(s["data"]) == (0, 1)
        s = streams[7]
        @test s["name"] == "Joystick - HOTAS WarthogAxes"
        @test s["type"] == "Position"
        @test s["nchannels"] == 36
        @test s["srate"] == 60.0
        @test s["dtype"] == Float32
        @test size(s["data"]) == (5200, 36)
        @test s["data"][1, :] ≈ [-0.017000000923871994, -0.0010000000474974513, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4294967.5, 4294967.5, 4294967.5, 4294967.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        @test s["data"][end, :] ≈ [-0.01899999938905239, 0.010999999940395355, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4294967.5, 4294967.5, 4294967.5, 4294967.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        s = streams[5]
        @test s["name"] == "SNAP-Markers"
        @test s["type"] == "Markers"
        @test s["nchannels"] == 1
        @test s["srate"] == 0.0
        @test s["dtype"] == String
        @test size(s["data"]) == (0, 1)
        s = streams[1]
        @test s["name"] == "NEDE_Markers"
        @test s["type"] == "Markers"
        @test s["nchannels"] == 1
        @test s["srate"] == 0.0
        @test s["dtype"] == String
        @test size(s["data"]) == (174, 1)
        @test s["data"][1, :] == ["Run_Start"]
        @test s["data"][end, :] == ["Run_End_Cond_2_Comp_75"]
    else
        @info "Skipped (set XDF_OSF_LARGE=1 to enable)"
    end
end

@testset "xdf_009.xdf" begin
    file = Downloads.download("https://osf.io/download/zdsr9/")
    streams = read_xdf(file)
    @test length(streams) == 2
    @test sort(collect(keys(streams))) == [1, 2]
    s = streams[2]
    @test s["name"] == "eegoSports-000055_markersMarkers"
    @test s["type"] == "Markers"
    @test s["nchannels"] == 1
    @test s["srate"] == 0.0
    @test s["dtype"] == String
    @test size(s["data"]) == (0, 1)
    s = streams[1]
    @test s["name"] == "eegoSports 000055"
    @test s["type"] == "EEG"
    @test s["nchannels"] == 88
    @test s["srate"] == 512.0
    @test s["dtype"] == Float32
    @test size(s["data"]) == (21850, 88)
    @test s["data"][1, :] ≈ [0.2534840404987335, -0.7475144267082214, -0.7475500702857971, 0.19797036051750183, 0.19583076238632202, -0.7470446228981018, -0.028390679508447647, -0.7476075887680054, 0.22945967316627502, -0.7469376921653748, 0.1571953147649765, 0.1700977236032486, 0.014245320111513138, -0.3376694321632385, -0.7480093240737915, 0.06452436000108719, 0.10094556212425232, 0.16207535564899445, 0.15694740414619446, 0.21804767847061157, 0.07063248008489609, 0.14307168126106262, -0.7473698258399963, 0.1257966011762619, -0.7471161484718323, 0.12161927670240402, 0.1503605991601944, 0.016851119697093964, -0.7418662905693054, 0.1510196328163147, -0.14367623627185822, -0.3223113715648651, 0.17558184266090393, -0.7476351857185364, 0.11063087731599808, 0.23579052090644836, 0.09681539982557297, -0.7473699450492859, -0.44930604100227356, 0.22159403562545776, -0.7462287545204163, 0.09381119906902313, -0.7463144659996033, -0.7466819882392883, -0.7462369203567505, -0.7302191853523254, -0.745012104511261, 0.11156795918941498, -0.7474100589752197, 0.2114965170621872, -0.7474082112312317, 0.028360920026898384, 0.12315864115953445, 0.0702272430062294, 0.0714121162891388, 0.002332440111786127, 0.1775244027376175, -0.7463598251342773, -0.07779324054718018, 0.11022119969129562, -0.7469862103462219, -0.7468138933181763, -0.7474390864372253, 0.03587495908141136, 0.002458798000589013, 0.015573778189718723, 0.01583571918308735, 0.003131682053208351, 0.007365069817751646, 0.006560171954333782, 0.01024255808442831, 0.028341885656118393, 0.0013886799570173025, 0.014042654074728489, 0.01239709835499525, 0.0029797020833939314, 0.010175508446991444, 0.008681336417794228, 0.007050381973385811, 0.031987618654966354, 0.004082600120455027, 0.014319496229290962, 0.013412682339549065, 0.003708908101543784, 0.0051944381557404995, 0.009135786443948746, 0.0072571937926113605, 0.032727550715208054]
    @test s["data"][end, :] ≈ [0.256855309009552, -0.7475430965423584, -0.7475523352622986, 0.19127687811851501, 0.19592280685901642, -0.7470841407775879, -0.3820030689239502, -0.7476274967193604, 0.2263810783624649, -0.11525675654411316, 0.15162239968776703, 0.16349412500858307, 0.11336544156074524, -0.36336085200309753, -0.7480544447898865, 0.06810587644577026, 0.07832664251327515, 0.1671844869852066, 0.1836225539445877, 0.21427488327026367, 0.06648443639278412, 0.14553731679916382, -0.7474055886268616, 0.13532856106758118, -0.7471745014190674, 0.12753336131572723, 0.14887331426143646, 0.09409572184085846, -0.7471585273742676, 0.1673530787229538, -0.08392632007598877, -0.18322211503982544, 0.1818247139453888, -0.7476745247840881, 0.10195056349039078, 0.21390816569328308, 0.019458960741758347, -0.7474066615104675, -0.7070666551589966, 0.2159542739391327, -0.7462603449821472, 0.09290280193090439, -0.7463327050209045, -0.7467236518859863, -0.7462828755378723, -0.7446220517158508, -0.5605847835540771, 0.11224115639925003, -0.7474399209022522, 0.20910552144050598, -0.7474566102027893, -0.397161602973938, 0.12281796336174011, 0.08135435730218887, 0.07670772075653076, -0.0025807199999690056, 0.1852547973394394, -0.7463753819465637, -0.45769810676574707, 0.10045991837978363, -0.7470226883888245, -0.7468516826629639, -0.747489869594574, 0.054259080439805984, 0.0024289980065077543, 0.015554705634713173, 0.01582171395421028, 0.0031978380866348743, 0.007417816203087568, 0.00661560008302331, 0.010284575633704662, 0.028351422399282455, 0.0014089440228417516, 0.014073645696043968, 0.012417362071573734, 0.0030056280083954334, 0.010249709710478783, 0.008737658150494099, 0.007125477772206068, 0.03198970481753349, 0.004069786053150892, 0.014344826340675354, 0.013381987810134888, 0.003744965884834528, 0.005252846051007509, 0.009186147712171078, 0.007340931799262762, 0.03277284651994705]
end

@testset "xdf_010.xdf" begin
    file = Downloads.download("https://osf.io/download/6489e66bbee36d02440e5c2c/")
    streams = read_xdf(file)
    @test length(streams) == 2
    @test sort(collect(keys(streams))) == [1, 2]
    s = streams[2]
    @test s["name"] == "eegoSports-000055_markersMarkers"
    @test s["type"] == "Markers"
    @test s["nchannels"] == 1
    @test s["srate"] == 0.0
    @test s["dtype"] == String
    @test size(s["data"]) == (0, 1)
    s = streams[1]
    @test s["name"] == "eegoSports 000055"
    @test s["type"] == "EEG"
    @test s["nchannels"] == 88
    @test s["srate"] == 512.0
    @test s["dtype"] == Float32
    @test size(s["data"]) == (10015, 88)
    @test s["data"][1, :] ≈ [0.19690175354480743, -0.7493767142295837, -0.7495102882385254, 0.14077883958816528, 0.14928503334522247, -0.7489450573921204, 0.0003434400132391602, -0.7495232224464417, 0.1733974814414978, -0.284335196018219, 0.1020628809928894, 0.11618687957525253, -0.062167201191186905, -0.1547836810350418, -0.6893510222434998, 0.030771000310778618, 0.05776188150048256, 0.10396427661180496, 0.09080483764410019, 0.16454291343688965, 0.029619120061397552, 0.09724236279726028, -0.7492759227752686, 0.05751432105898857, -0.7489998936653137, 0.07405512034893036, 0.10359936207532883, -0.20467548072338104, -0.4768199920654297, 0.09908051788806915, -0.04076676070690155, -0.06602399796247482, 0.12063875794410706, -0.7495468854904175, 0.06410831958055496, 0.18234096467494965, 0.03487680107355118, -0.7492631077766418, -0.33132311701774597, 0.1673678457736969, -0.7480857372283936, 0.04841291904449463, -0.7482379078865051, -0.7486317753791809, -0.748100996017456, -0.5739962458610535, -0.7488770484924316, 0.06828036159276962, -0.5028098225593567, 0.15617063641548157, -0.7493323087692261, 0.013703759759664536, 0.08437836170196533, 0.02367395907640457, 0.029419679194688797, 0.008510160259902477, 0.12297192215919495, -0.748226523399353, -0.042930718511343, 0.053325358778238297, -0.7488464117050171, -0.7486951351165771, -0.7493593096733093, -0.015999600291252136, 0.0026474320329725742, 0.015814561396837234, 0.01620941236615181, 0.0033006479497998953, 0.007787336129695177, 0.0070333960466086864, 0.010553968138992786, 0.02917509339749813, 0.0014888079604133964, 0.014323965646326542, 0.012657550163567066, 0.0032029040157794952, 0.010658565908670425, 0.008853877894580364, 0.007481886073946953, 0.03267182782292366, 0.004195542074739933, 0.014676500111818314, 0.013769984245300293, 0.0038230419158935547, 0.005540416110306978, 0.009350942447781563, 0.007463410031050444, 0.03339775279164314]
    @test s["data"][end, :] ≈ [0.20320764183998108, -0.7494139075279236, -0.72760009765625, 0.13212671875953674, 0.15146076679229736, -0.7489670515060425, -0.011923080310225487, -0.7495501041412354, 0.1745164841413498, -0.7487780451774597, 0.11188355833292007, 0.1151081994175911, 0.03397523984313011, 0.004473479930311441, -0.7499676942825317, -0.07118327915668488, -0.14575667679309845, 0.111139677464962, 0.09185183793306351, 0.1590811163187027, 0.0464397594332695, 0.09651011973619461, -0.7493059039115906, 0.05612916126847267, -0.748984694480896, 0.07500672340393066, 0.09413699805736542, -0.7497464418411255, -0.31007447838783264, 0.09483720362186432, -0.37458768486976624, -0.004610639996826649, 0.10526411980390549, -0.7495681047439575, 0.0655047595500946, 0.1801527589559555, 0.02054411917924881, -0.7492939233779907, -0.5660348534584045, 0.16893936693668365, -0.7481078505516052, 0.047517478466033936, -0.7482601404190063, -0.7486288547515869, -0.7481222152709961, -0.7486051321029663, -0.7488331198692322, 0.06432251632213593, -0.749274492263794, 0.15619835257530212, -0.7493597865104675, -0.012488160282373428, 0.07254072278738022, 0.04722876101732254, 0.028324320912361145, -0.05524908006191254, 0.10857096314430237, -0.7378088235855103, -0.7491810917854309, 0.07375151664018631, -0.7488812208175659, -0.7486972808837891, -0.749403715133667, -0.010445879772305489, 0.0025395560078322887, 0.015746915712952614, 0.01616232842206955, 0.003359949914738536, 0.007860643789172173, 0.0071287560276687145, 0.01060999184846878, 0.029201317578554153, 0.0014649679651483893, 0.014307278208434582, 0.01264682225883007, 0.0032631000503897667, 0.010776275768876076, 0.008999898098409176, 0.007619860116392374, 0.03260388225317001, 0.004200608003884554, 0.014625243842601776, 0.013774453662335873, 0.00389158190228045, 0.005661701783537865, 0.009439447894692421, 0.007534035947173834, 0.03338106721639633]
end

@testset "xdf_sample.xdf" begin
    file = Downloads.download("https://osf.io/download/6489e66f84f52c0250fe63e1/")
    streams = read_xdf(file)
    @test length(streams) == 4
    @test sort(collect(keys(streams))) == [1, 2, 3, 4]
    s = streams[3]
    @test s["name"] == "MousePosition"
    @test s["type"] == "Position"
    @test s["nchannels"] == 2
    @test s["srate"] == 0.0
    @test s["dtype"] == Float32
    @test size(s["data"]) == (209, 2)
    @test s["data"][1, :] ≈ [592.0, 373.0]
    @test s["data"][end, :] ≈ [198.0, 146.0]
    s = streams[4]
    @test s["name"] == "MouseButtons"
    @test s["type"] == "Markers"
    @test s["nchannels"] == 1
    @test s["srate"] == 0.0
    @test s["dtype"] == String
    @test size(s["data"]) == (10, 1)
    @test s["data"][1, :] == ["MouseButtonLeft pressed"]
    @test s["data"][end, :] == ["MouseButtonLeft released"]
    s = streams[1]
    @test s["name"] == "Keyboard"
    @test s["type"] == "Markers"
    @test s["nchannels"] == 1
    @test s["srate"] == 0.0
    @test s["dtype"] == String
    @test size(s["data"]) == (40, 1)
    @test s["data"][1, :] == ["R pressed"]
    @test s["data"][end, :] == ["G released"]
    s = streams[2]
    @test s["name"] == "AudioCaptureWin"
    @test s["type"] == "Audio"
    @test s["nchannels"] == 2
    @test s["srate"] == 44100.0
    @test s["dtype"] == Float32
    @test size(s["data"]) == (750400, 2)
    @test s["data"][1, :] ≈ [0.0029847503174096346, 0.0027809101156890392]
    @test s["data"][end, :] ≈ [0.00047272376832552254, 0.00014712035772390664]
end

end  # OSF testset
