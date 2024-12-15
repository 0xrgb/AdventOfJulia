include("../parser.jl")

function part1(input::String)
    roomstr, movestr = split(rstrip(input), "\n\n")
    room = parse2d(roomstr)
    boxes = Set{CartesianIndex{2}}()
    walls = Set{CartesianIndex{2}}()
    robot = CartesianIndex{2}(0, 0)
    for idx in CartesianIndices(room)
        c = Char(room[idx])
        if c == '#'
            push!(walls, idx)
        elseif c == '@'
            robot = idx
        elseif c == 'O'
            push!(boxes, idx)
        end
    end
    for move in movestr
        dxy = CartesianIndex{2}(if move == '<'
            (0, -1)
        elseif move == '>'
            (0, +1)
        elseif move == '^'
            (-1, 0)
        elseif move == 'v'
            (1, 0)
        else
            continue
        end)
        newrobot = robot + dxy
        while true
            if newrobot ∈ walls
                break
            end
            if newrobot ∈ boxes
                newrobot = newrobot + dxy
                continue
            end
            newrobot = newrobot - dxy
            while newrobot != robot
                pop!(boxes, newrobot)
                push!(boxes, newrobot + dxy)
                newrobot = newrobot - dxy
            end
            robot = robot + dxy
            break
        end
    end
    sum(b[1] * 100 + b[2] - 101 for b in boxes)
end

function printstatus(sz, walls, boxes, robot)
    m = Matrix{UInt8}(undef, sz)
    fill!(m, UInt8('.'))
    for w in walls
        m[w] = UInt8('#')
    end
    for b in boxes
        m[b] = UInt8('[')
        m[b+CartesianIndex(0, 1)] = UInt8(']')
    end
    m[robot] = UInt8('@')
    for i in 1:size(m)[1]
        println(String(m[i, :]))
    end
end

function part2(input::String)
    roomstr, movestr = split(rstrip(input), "\n\n")
    room = parse2d(roomstr)
    boxes = Set{CartesianIndex{2}}()
    walls = Set{CartesianIndex{2}}()
    robot = CartesianIndex{2}(0, 0)
    for idx in CartesianIndices(room)
        c = Char(room[idx])
        if c == '#'
            push!(walls, CartesianIndex(idx[1], idx[2] * 2 - 1))
            push!(walls, CartesianIndex(idx[1], idx[2] * 2))
        elseif c == '@'
            robot = CartesianIndex(idx[1], idx[2] * 2 - 1)
        elseif c == 'O'
            push!(boxes, CartesianIndex(idx[1], idx[2] * 2 - 1))
        end
    end
    for move in movestr
        dxy = CartesianIndex{2}(if move == '<'
            (0, -1)
        elseif move == '>'
            (0, +1)
        elseif move == '^'
            (-1, 0)
        elseif move == 'v'
            (1, 0)
        else
            continue
        end)
        pushed = Set{CartesianIndex{2}}()
        check = Vector{CartesianIndex{2}}()
        push!(check, robot + dxy)
        fail = false
        while !isempty(check)
            pos = pop!(check)
            if pos ∈ walls
                fail = true
                break
            end
            if pos ∈ boxes
                if pos ∉ pushed
                    push!(pushed, pos)
                    push!(check, pos + dxy)
                    push!(check, pos + dxy + CartesianIndex(0, +1))
                end
            elseif pos + CartesianIndex(0, -1) ∈ boxes
                pos = pos + CartesianIndex(0, -1)
                if pos ∉ pushed
                    push!(pushed, pos)
                    push!(check, pos + dxy)
                    push!(check, pos + dxy + CartesianIndex(0, +1))
                end
            end
        end
        if !fail
            for pos in pushed
                pop!(boxes, pos)
            end
            for pos in pushed
                push!(boxes, pos + dxy)
            end
            robot = robot + dxy
        end
    end
    sum(b[1] * 100 + b[2] - 101 for b in boxes)
end
