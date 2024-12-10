if isdefined(@__MODULE__, :LanguageServer)
    include("../util/filepath.jl")
else
    include(joinpath(@__DIR__, "..", "util", "filepath.jl"))
end

function usage()
    println("usage:  juila --project cli/run.jl <year> <day> (part1|part2) [<file>]")
    exit(2)
end

function (@main)(args)
    argc = length(args)
    if !(argc == 3 || argc == 4)
        usage()
    end

    year = parse(Int, args[1])
    day = parse(Int, args[2])
    part = lowercase(args[3])
    input_filepath = (argc == 4 ? args[4] : inputdata_filepath(year, day))
    input = read(input_filepath, String)

    include(solution_filepath(year, day))
    if part == "part1"
        result = invokelatest(part1, input)
    elseif part == "part2"
        result = invokelatest(part2, input)
    else
        usage()
    end
    println(result)

    nothing
end
