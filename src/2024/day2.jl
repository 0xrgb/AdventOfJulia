function checklevel(us::Vector{Int})
    usd = diff(us)
    min, max = minimum(usd), maximum(usd)
    if 1 <= min && max <= 3 || -3 <= min && max <= -1
        1
    else
        0
    end
end

function part1(input::String)
    result = 0
    for line in split(rstrip(input), '\n')
        us = map(split(line)) do x
            parse(Int, x)
        end
        result += checklevel(us)
    end
    result
end

function part2(input::String)
    result = 0
    for line in split(rstrip(input), '\n')
        us = map(split(line)) do x
            parse(Int, x)
        end
        for i in 1:length(us)
            us2 = copy(us)
            popat!(us2, i)
            if checklevel(us2) != 0
                result += 1
                break
            end
        end
    end
    result
end
