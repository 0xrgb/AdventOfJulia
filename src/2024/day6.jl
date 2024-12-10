function find_startpos(s)
    for (i, line) in pairs(s)
        for (j, ch) in pairs(line)
            if ch == '^' || ch == 'v' || ch == '<' || ch == '>'
                return i, j
            end
        end
    end
    error("cannot find start position")
end

function simulate(s, i::Int, j::Int)
    ch = s[i][j]
    dxy = if ch == '^'
        (-1, 0)
    elseif ch == 'v'
        (1, 0)
    elseif ch == '<'
        (0, -1)
    else
        (0, +1)
    end

    maxwalk = 4 * length(s) * ncodeunits(s[1])
    check = Set{Tuple{Int,Int}}()
    push!(check, (i, j))
    for _ in 1:maxwalk
        ii, jj = (i, j) .+ dxy
        if !(checkbounds(Bool, s, ii) && isvalid(s[ii], jj))
            return length(check)
        end
        ch = s[ii][jj]
        if ch == '#'
            dxy = (dxy[2], -dxy[1])
            continue
        end
        i, j = ii, jj
        push!(check, (i, j))
    end
    -1
end

function part1(input::String)
    s = split(rstrip(input), "\n")
    si, sj = find_startpos(s)
    simulate(s, si, sj)
end

function part2(input::String)
    s = split(rstrip(input), "\n")
    si, sj = find_startpos(s)
    result = 0
    for (i, line) in pairs(s)
        for (j, ch) in pairs(line)
            if (i, j) == (si, sj)
                continue
            end
            line2 = line[1:j-1] * "#" * line[j+1:end]
            s[i] = line2
            if simulate(s, si, sj) < 0
                result += 1
            end
            s[i] = line
        end
    end
    result
end
