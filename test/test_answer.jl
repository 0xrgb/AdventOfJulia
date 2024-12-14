if isdefined(@__MODULE__, :LanguageServer)
    include("../util/filepath.jl")
else
    include(joinpath(@__DIR__, "..", "util", "filepath.jl"))
end

const ANSWER::Dict{Int,Vector{Tuple{Int,Int}}} = Dict(
    2024 => [
        (1834060, 21607792),            # Day 1
        (486, 540),                     # Day 2
        (171183089, 63866497),          # Day 3
        (2336, 1831),                   # Day 4
        (5588, 5331),                   # Day 5
        (4559, 1604),                   # Day 6
        (538191549061, 34612812972206), # Day 7
        (392, 1235),                    # Day 8
        (6359213660505, 6381624803796), # Day 9
        (548, 1252),                    # Day 10
        (233875, 277444936413293),      # Day 11
    ],
)

"""Perform a test using default input data for given `year` and `day`. Return `true` if test success."""
function dotest(year::Integer, day::Integer; verbose::Bool=true)
    expect = ANSWER[year][day]
    input = read(inputdata_filepath(year, day), String)
    solutionpath = solution_filepath(year, day)
    got = @eval Module() begin
        include(f) = Base.include(@__MODULE__, f)
        Base.include(@__MODULE__, $solutionpath)
        result1 = Base.invokelatest(part1, $input)
        result2 = Base.invokelatest(part2, $input)
        (result1, result2)
    end

    success = (expect == got)
    if verbose
        if success
            println("[+] $year Day $day: ok")
        else
            println("[-] $year Day $day: expect $expect, got $got")
        end
    end
    success
end

function (@main)(args)
    fail = false
    for (year, answers) in pairs(ANSWER)
        for day in eachindex(answers)
            if !dotest(year, day)
                fail = true
            end
        end
    end

    if fail
        println("[-] test fail")
        exit(1)
    else
        println("[+] test success")
        exit()
    end
end
