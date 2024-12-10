"""Return a solution filename for given `year` and `day`."""
solution_filepath(year::Integer, day::Integer) = joinpath(@__DIR__, "..", "src", "$year", "day$day.jl")

"""Return a input data filepath for given `year` and `day`."""
inputdata_filepath(year::Integer, day::Integer) = joinpath(@__DIR__, "..", "data", "$year", "day$day.txt")
