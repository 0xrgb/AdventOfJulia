include("../src/parser.jl")

@testset "parser" begin
    @test begin
        p = InputParser("123 456", 1)
        readint!(p) === 123
    end
    @test begin
        p = InputParser("45789", 1)
        readint!(p; type=UInt32) === UInt32(45789)
    end
    @test begin
        p = InputParser("test1 test2", 1)
        consume!(p, "test1")
    end
    @test begin
        p = InputParser("test1 test2", 1)
        !consume!(p, "test2")
    end
    @test begin
        s = parse2d("123\nabc\nABC\n")
        s == [0x31 0x32 0x33; 0x61 0x62 0x63; 0x41 0x42 0x43]
    end
end
