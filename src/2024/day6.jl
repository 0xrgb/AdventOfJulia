include("../parser.jl")

function find_startpos(s::Matrix{UInt8})
    for idx in CartesianIndices(s)
        ch = Char(s[idx])
        if ch == '^' || ch == '>' || ch == '<' || ch == '>'
            return idx
        end
    end
    error("cannot find a start position")
end

function simulate!(s::Matrix{UInt8}, check::Matrix{Bool}, idx::CartesianIndex{2})
    ch = Char(s[idx])
    dxy = CartesianIndex{2}(if ch == '^'
        (-1, 0)
    elseif ch == 'v'
        (1, 0)
    elseif ch == '<'
        (0, -1)
    else
        (0, +1)
    end)

    maxwalk = 4 * reduce(*, size(s))
    check[idx] = true
    for _ in 1:maxwalk
        newidx = idx + dxy
        if !checkbounds(Bool, s, newidx)
            return sum(check)
        end
        if s[newidx] == 0x23  # '#'
            dxy = CartesianIndex(dxy[2], -dxy[1])
            continue
        end
        idx = newidx
        check[idx] = true
    end
    -1
end

function part1(input::String)
    s = parse2d(input)
    idx = find_startpos(s)
    check = zeros(Bool, size(s))
    simulate!(s, check, idx)
end

function part2(input::String)
    s = parse2d(input)
    startidx = find_startpos(s)
    check = Matrix{Bool}(undef, size(s))
    result = 0
    for idx in CartesianIndices(s)
        if idx == startidx || s[idx] == 0x23  # '#'
            continue
        end
        ch = s[idx]
        s[idx] = 0x23  # '#'
        fill!(check, false)
        if simulate!(s, check, startidx) < 0
            result += 1
        end
        s[idx] = ch
    end
    result
end
