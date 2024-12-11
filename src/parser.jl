"""A struct for parsing inputs.

Example:
```julia
parser = InputParser("123_456", 1)
n = readint!(parser)  # 123
```

NOTE:
- `consumeXXX!()`: consume if exists, return true if success to consume.
- `readXXX!()`: read and return, throw an error if not exists.
"""
mutable struct InputParser
    s::String
    offset::Int
end

@noinline function _parser_error(parser::InputParser, message::AbstractString)
    error("$message: $parser")
end

"""Check `parser` reached to the end of the string."""
isend(parser::InputParser) = (parser.offset > ncodeunits(parser.s))

"""Return `true` if success to consume `prefix` from `parser`."""
function consume!(parser::InputParser, prefix::Union{String,SubString{String}})
    if startswith(SubString(parser.s, parser.offset), prefix)
        parser.offset += ncodeunits(prefix)
        true
    else
        false
    end
end

"""Read and consume ascii digits from `parser`, then return it. Throw error when fails."""
function readint!(parser::InputParser; type=Int)
    if isend(parser) || !isdigit(parser.s[parser.offset])
        _parser_error(parser, "expect a digit")
    end

    start = parser.offset
    while !isend(parser) && isdigit(parser.s[parser.offset])
        parser.offset = nextind(parser.s, parser.offset)
    end
    parse(type, SubString(parser.s, start, prevind(parser.s, parser.offset)))
end

"""Parse `input` as 2D grid, return it as `Matrix{UInt8}`."""
function parse2d(input::Union{String,SubString{String}})
    input2 = split(rstrip(input), '\n')
    s = Matrix{UInt8}(undef, length(input2), ncodeunits(input2[1]))
    for (i, line) in pairs(input2)
        s[i, :] = codeunits(line)
    end
    s
end
