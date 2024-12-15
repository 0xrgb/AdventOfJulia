using Downloads

include(joinpath(@__DIR__, "filepath.jl"))

const SOLUTION_TEMPLATE = """
function part1(input::String)
    error("not implemented yet")
end

function part2(input::String)
    error("not implemented yet")
end
"""

function usage()
    println("usage:  juila --project cli/download.jl <year> <day>")
    exit(2)
end

function (@main)(args)
    if length(args) != 2
        usage()
    end

    year = parse(Int, args[1])
    day = parse(Int, args[2])
    session = get!(ENV, "AOC_SESSION", nothing)
    if isnothing(session)
        println("[!] you need 'AOC_SESSION' to download input data")
        exit(1)
    end

    path = inputdata_filepath(year, day)
    mkpath(dirname(path))
    Downloads.download(
        "https://adventofcode.com/$year/day/$day/input",
        path;
        headers=[
            "Accept" => "*/*;q=0.8",
            "Referer" => "https://adventofcode.com/$year/day/$day",
            "Cookie" => "session=$session;",
        ],
        timeout=5,
    )
    println("[+] download input data to '$path'")

    path = solution_filepath(year, day)
    if isfile(path)
        println("[*] '$path' exist, skip to create a solution template")
    else
        mkpath(dirname(path))
        open(path, "w") do io
            print(io, SOLUTION_TEMPLATE)
        end
        println("[+] create a solution template to '$path'")
    end

    nothing
end
