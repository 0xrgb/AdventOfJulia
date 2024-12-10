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
