using Test

"""Return a solution filename for given `year` and `day`."""
solution_filepath(year::Integer, day::Integer) = joinpath(@__DIR__, "..", "src", "$year", "day$day.jl")

"""Return a input data filepath for given `year` and `day`."""
inputdata_filepath(year::Integer, day::Integer) = joinpath(@__DIR__, "..", "data", "$year", "day$day.txt")

"""Return input data as `String`."""
getinput(year::Integer, day::Integer) = read(inputdata_filepath(year, day), String)

"""Print usage."""
function usage()
    println("usage:  julia --project test/runtests.jl [all|default|<year>]")
    exit(2)
end

"""Perform a run using given `input`, `year` and `day`, and return `(part1_answer, part2_answer)`."""
function run(year::Integer, day::Integer, input::String)
    solutionpath = solution_filepath(year, day)
    @eval Module() begin
        include(f) = Base.include(@__MODULE__, f)
        Base.include(@__MODULE__, $solutionpath)
        result1 = Base.invokelatest(part1, $input)
        result2 = Base.invokelatest(part2, $input)
        (result1, result2)
    end
end

if length(ARGS) >= 2
    usage()
end

const testname::String = lowercase(if checkbounds(Bool, ARGS, 1)
    ARGS[1]
else
    "default"
end)

if testname == "all" || testname == "default"
    include(joinpath(@__DIR__, "test_parser.jl"))
end
if testname == "all" || testname == "default" || testname == "2024"
    include(joinpath(@__DIR__, "test_2024.jl"))
end
