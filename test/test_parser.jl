using Test

if isdefined(@__MODULE__, :LanguageServer)
    include("../src/parser.jl")
else
    include(joinpath(@__DIR__, "..", "src", "parser.jl"))
end

@testset "parser test" begin
    @testset "readint" begin
        @test begin
            p = InputParser("123 456", 1)
            readint!(p) === 123
        end
        @test begin
            p = InputParser("45789", 1)
            readint!(p; type=UInt32) === UInt32(45789)
        end
    end
    @testset "consume" begin
        @test begin
            p = InputParser("test1 test2", 1)
            consume!(p, "test1")
        end
        @test begin
            p = InputParser("test1 test2", 1)
            !consume!(p, "test2")
        end
    end
end

@testset "test parse2d" begin
    @test begin
        s = parse2d("123\n가\nABC\n")
        s == [0x31 0x32 0x33; 0xea 0xb0 0x80; 0x41 0x42 0x43]
    end
end
