function part1(input::String)
    us = Vector{Int}()
    vs = Vector{Int}()
    for line in split(rstrip(input), '\n')
        u, v = map(split(line)) do x
            parse(Int, x)
        end
        push!(us, u)
        push!(vs, v)
    end
    sort!(us)
    sort!(vs)
    sum(abs.(us .- vs))
end

function part2(input::String)
    us = Dict{Int,Int}()
    vs = Dict{Int,Int}()
    for line in split(rstrip(input), '\n')
        u, v = map(split(line)) do x
            parse(Int, x)
        end
        us[u] = get!(us, u, 0) + 1
        vs[v] = get!(vs, v, 0) + 1
    end
    result = 0
    for item in us
        result += item.first * item.second * get!(vs, item.first, 0)
    end
    result
end
