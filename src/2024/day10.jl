include("../parser.jl")

function searchpath!(s::Matrix{UInt8}, visited::Matrix{Bool}, start::CartesianIndex{2}, c::UInt8)
    if s[start] != c
        return 0
    end
    visited[start] = true
    if c == 0x39
        return 1
    end
    result = 0
    for i in [(-1, 0), (1, 0), (0, -1), (0, 1)]
        x = start + CartesianIndex(i)
        if checkbounds(Bool, s, x) && !visited[x]
            result += searchpath!(s, visited, x, c + 0x01)
        end
    end
    result
end

function searchpath2!(s::Matrix{UInt8}, dp::Matrix{Int}, start::CartesianIndex{2}, c::UInt8)
    if s[start] != c
        return
    end
    if c == 0x39
        dp[start] = 1
        return
    end
    for i in [(-1, 0), (1, 0), (0, -1), (0, 1)]
        x = start + CartesianIndex(i)
        if checkbounds(Bool, s, x)
            if dp[x] == 0
                searchpath2!(s, dp, x, c + 0x01)
            end
            if s[x] == c + 0x01
                dp[start] += dp[x]
            end
        end
    end
end

function part1(input::String)
    s = parse2d(input)
    visited = Matrix{Bool}(undef, size(s))

    result = 0
    for idx in CartesianIndices(s)
        fill!(visited, false)
        result += searchpath!(s, visited, idx, 0x30)
    end
    result
end

function part2(input::String)
    s = parse2d(input)
    dp = zeros(Int, size(s))

    result = 0
    for idx in CartesianIndices(s)
        searchpath2!(s, dp, idx, 0x30)
        if s[idx] == 0x30
            result += dp[idx]
        end
    end
    result
end
