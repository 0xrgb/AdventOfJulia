include("../parser.jl")

function checkantena(s::Matrix{UInt8})
    d = Dict{UInt8,Vector{CartesianIndex{2}}}()
    for idx in CartesianIndices(s)
        ch = s[idx]
        if !('a' <= Char(ch) <= 'z' || 'A' <= Char(ch) <= 'Z' || '0' <= Char(ch) <= '9')
            continue
        end
        v = get!(d, ch, Vector{CartesianIndex{2}}())
        push!(v, idx)
        d[ch] = v
    end
    d
end

function part1(input::String)
    s = parse2d(input)
    d = checkantena(s)
    r = Set{CartesianIndex{2}}()
    for item in d
        for i in 1:length(item.second)
            for j in i+1:length(item.second)
                v = 2 * item.second[i] - item.second[j]
                if checkbounds(Bool, s, v)
                    push!(r, v)
                end
                v = 2 * item.second[j] - item.second[i]
                if checkbounds(Bool, s, v)
                    push!(r, v)
                end
            end
        end
    end
    length(r)
end

function part2(input::String)
    s = parse2d(input)
    d = checkantena(s)
    r = Set{CartesianIndex{2}}()
    for item in d
        for i in item.second
            for j in item.second
                if i == j
                    continue
                end
                u = i
                v = i - j
                while checkbounds(Bool, s, u)
                    push!(r, u)
                    u += v
                end
            end
        end
    end
    length(r)
end
