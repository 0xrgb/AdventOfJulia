const MUL_RE1 = r"mul\((\d+),(\d+)\)"
const MUL_RE2 = r"(do\(\)|don't\(\)|mul\((\d+),(\d+)\))"

function part1(input::String)
    result = 0
    for m in eachmatch(MUL_RE1, input)
        u = parse(Int, m[1])
        v = parse(Int, m[2])
        result += u * v
    end
    result
end

function part2(input::String)
    result = 0
    multipler = 1
    for m in eachmatch(MUL_RE2, input)
        if m.match[3] == '('  # do()
            multipler = 1
        elseif m.match[3] == 'n'  # don't()
            multipler = 0
        else
            u = parse(Int, m[2])
            v = parse(Int, m[3])
            result += u * v * multipler
        end
    end
    result
end
