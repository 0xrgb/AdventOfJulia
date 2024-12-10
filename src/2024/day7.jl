function solve(n::Int, ms; allow_concat::Bool=false)
    s1 = Set{Int}()
    s2 = Set{Int}()
    push!(s1, 0)
    for m in ms
        r = 10^length("$m")
        for s in s1
            if n >= s * m
                push!(s2, s * m)
            end
            if n >= s + m
                push!(s2, s + m)
            end
            if allow_concat && n >= s * r + m
                push!(s2, s * r + m)
            end
        end
        empty!(s1)
        s1, s2 = s2, s1
    end
    return n ∈ s1
end

function part1(input::String)
    result = 0
    for line in split(rstrip(input), '\n')
        left, right = split(line, ": ")
        n = parse(Int, left)
        m = map(split(right, ' ')) do s
            parse(Int, s)
        end
        if solve(n, m)
            result += n
        end
    end
    result
end

function part2(input::String)
    result = 0
    for line in split(rstrip(input), '\n')
        left, right = split(line, ": ")
        n = parse(Int, left)
        m = map(split(right, ' ')) do s
            parse(Int, s)
        end
        if solve(n, m; allow_concat=true)
            result += n
        end
    end
    result
end
