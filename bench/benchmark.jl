using BenchmarkTools

if isdefined(@__MODULE__, :LanguageServer)
    include("../util/filepath.jl")
else
    include(joinpath(@__DIR__, "..", "util", "filepath.jl"))
end

function usage()
    println("usage:  julia --project bench/benchmark.jl <year> <day>")
    exit(2)
end

function (@main)(args)
    if length(args) != 2
        usage()
    end

    year = parse(Int, args[1])
    day = parse(Int, args[2])
    input = read(inputdata_filepath(year, day), String)
    include(solution_filepath(year, day))

    _ = invokelatest(part1, input)  # warm up
    result1 = @benchmark part1($input)
    println("[=] $year Day $day (part1): ",
        BenchmarkTools.prettytime(time(result1)),
        ", ",
        BenchmarkTools.prettymemory(memory(result1))
    )

    _ = invokelatest(part2, input)  # warm up
    result2 = @benchmark part2($input)
    println("[=] $year Day $day (part2): ",
        BenchmarkTools.prettytime(time(result2)),
        ", ",
        BenchmarkTools.prettymemory(memory(result2))
    )

    nothing
end
