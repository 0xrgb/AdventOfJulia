function blink!(n::Int128, m::Int, save::Dict{Tuple{Int128,Int},Int})
    if m == 0
        return 1
    elseif n == 0
        return blink!(Int128(1), m - 1, save)
    end
    s = get!(save, (n, m), -1)
    if s > 0
        return s
    end
    l = "$n"
    if length(l) % 2 == 0
        return save[(n, m)] = (
            blink!(parse(Int128, l[begin:length(l)÷2]), m - 1, save)
            +
            blink!(parse(Int128, l[length(l)÷2+1:end]; base=10), m - 1, save)
        )
    else
        n2 = n * 2024
        if n != n2 ÷ 2024
            error("overflow")
        end
        return save[(n, m)] = blink!(n2, m - 1, save)
    end
end

function part1(input::String)
    s = parse.(Int128, split(rstrip(input), ' '))
    save = Dict{Tuple{Int128,Int},Int}()
    sum(map(s) do v
        blink!(v, 25, save)
    end)
end

function part2(input::String)
    s = parse.(Int128, split(rstrip(input), ' '))
    save = Dict{Tuple{Int128,Int},Int}()
    sum(map(s) do v
        blink!(v, 75, save)
    end)
end
