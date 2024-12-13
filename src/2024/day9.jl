function part1(input::String)
    s = Vector{UInt8}(rstrip(input))
    result = 0

    offset = 0
    first = 1
    last = length(s)
    while first <= last
        c = Int(s[first]) - 48
        if first % 2 == 1
            filenumber = first ÷ 2
            # filenumber * (offset + ... + offset+c-1)
            # = filenumber * (offset * c + c(c-1)÷2)
            result += filenumber * (offset * c + c * (c - 1) ÷ 2)
            offset += c
            first += 1
        else
            filenumber = last ÷ 2
            c = min(c, Int(s[last]) - 48)
            result += filenumber * (offset * c + c * (c - 1) ÷ 2)
            s[first] -= c
            s[last] -= c
            if s[first] == 48
                first += 1
            end
            if s[last] == 48
                last -= 2
            end
            offset += c
        end
    end
    result
end

function part2(input::String)
    s = Vector{UInt8}(rstrip(input))
    offsets = zeros(Int, length(s))

    offset = 0
    for i in 1:length(s)
        offsets[i] = offset
        offset += s[i] - 48
    end

    result = 0
    for i in length(s):-2:1
        c = s[i] - 48
        for j in 2:2:i-1
            l = s[j] - 48
            if c <= l
                offsets[i] = offsets[j]
                offsets[j] += c
                s[j] -= c
                break
            end
        end
        result += (i ÷ 2) * (offsets[i] * c + c * (c - 1) ÷ 2)
    end
    result
end
