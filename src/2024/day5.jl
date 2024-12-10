include("../parser.jl")

function readrules!(p::InputParser)
    rules = Set{Tuple{Int,Int}}()
    while true
        u = readint!(p)
        consume!(p, "|")
        v = readint!(p)
        push!(rules, (u, v))
        consume!(p, "\n")
        if consume!(p, "\n")
            break
        end
    end
    rules
end

function readline!(p::InputParser)
    us = Vector{Int}()
    while true
        u = readint!(p)
        push!(us, u)
        if !consume!(p, ",")
            consume!(p, "\n")
            break
        end
    end
    us
end

function checkrules(rules::Set{Tuple{Int,Int}}, us::Vector{Int})
    for (i, x) in pairs(us)
        for y in us[i+1:end]
            if (y, x) ∈ rules
                return false
            end
        end
    end
    true
end

function ensurerules!(rules::Set{Tuple{Int,Int}}, us::Vector{Int})
    found = false
    while true
        changed = false
        for i in eachindex(us)
            for j in i+1:length(us)
                x, y = us[i], us[j]
                if (y, x) ∈ rules
                    found = changed = true
                    us[i], us[j] = us[j], us[i]
                end
            end
        end
        if !changed
            break
        end
    end
    found
end

function part1(input::String)
    p = InputParser(input, 1)
    rules = readrules!(p)
    result = 0
    while !isend(p)
        us = readline!(p)
        if checkrules(rules, us)
            result += us[length(us)÷2+1]
        end
    end
    result
end

function part2(input::String)
    p = InputParser(input, 1)
    rules = readrules!(p)
    result = 0
    while !isend(p)
        us = readline!(p)
        if ensurerules!(rules, us)
            result += us[length(us)÷2+1]
        end
    end
    result
end
