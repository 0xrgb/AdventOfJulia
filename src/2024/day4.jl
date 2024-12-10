function search1(s, i::Int, j::Int)
    result = 0
    for dx in -1:1
        for dy in -1:1
            if dx == 0 && dy == 0
                continue
            end
            found = true
            for (k, ch) in enumerate("MAS")
                ii = i + dx * k
                jj = j + dy * k
                if checkbounds(Bool, s, ii) && isvalid(s[ii], jj) && s[ii][jj] == ch
                    continue
                end
                found = false
                break
            end
            if found
                result += 1
            end
        end
    end
    result
end

function search2(s, i::Int, j::Int)
    try
        s = Int(s[i-1][j-1]) << 24 | Int(s[i-1][j+1]) << 16 | Int(s[i+1][j+1]) << 8 | Int(s[i+1][j-1])
        if s == 1296913235 || s == 1297306445 || s == 1397968205 || s == 1397574995
            return 1
        end
    catch e
        if !isa(e, BoundsError)
            rethrow()
        end
    end
    return 0
end

function part1(input::String)
    s = split(rstrip(input), '\n')
    result = 0
    for (i, line) in enumerate(s)
        for (j, ch) in pairs(line)
            if ch != 'X'
                continue
            end
            result += search1(s, i, j)
        end
    end
    result
end

function part2(input::String)
    s = split(rstrip(input), '\n')
    result = 0
    for (i, line) in enumerate(s)
        for (j, ch) in pairs(line)
            if ch != 'A'
                continue
            end
            result += search2(s, i, j)
        end
    end
    result
end
