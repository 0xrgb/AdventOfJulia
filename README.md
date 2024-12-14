# Advent of Code with Juila

Welcome to my solutions for Advent of Code challenges!

I'm using Advent of Code problems as a way to learn and get more familiar with Julia.

I prioritize quick implementation: this repository contains a lot of QUICK & DIRTY solutions.
Feel free to suggest improvements if you spot any better approaches!

## Usage

You need Julia 1.11 or above.

```bash
$ julia --project cli/download.jl 2024 1
[+] download inputt data to '.../data/2024/day1.txt'
[+] create a solution template to '.../src/2024/day1.jl'
$ vim 2024/src/day1.jl  # solve problem
...
$ juila --project cli/run.jl 2024 1 part1
1834060
$ julia --project test/test_answer.jl 2024
[+] 2024 Day 1: ok
[+] test success
$ julia --project bench/benchmark.jl 2024 1
[=] 2024 Day 1 (part1): 234.600 μs, 648.77 KiB
[=] 2024 Day 1 (part2): 280.600 μs, 762.70 KiB
```

## Status

- Solved: :star:
- Solved, but not a good solution (>1s): :poop:
- Unsolved: :x:

### 2024 (20/50)

| Day | Code | Type | Part 1 | Part 2 |
|----:|:----:|------|:------:|:------:|
| [1](https://adventofcode.com/2024/day/1) | [day1.jl](src/2024/day1.jl) | adhoc | :star: | :star: |
| [2](https://adventofcode.com/2024/day/2) | [day2.jl](src/2024/day2.jl) | adhoc | :star: | :star: |
| [3](https://adventofcode.com/2024/day/3) | [day3.jl](src/2024/day3.jl) | parsing | :star: | :star: |
| [4](https://adventofcode.com/2024/day/4) | [day4.jl](src/2024/day4.jl) | string | :star: | :star: |
| [5](https://adventofcode.com/2024/day/5) | [day5.jl](src/2024/day5.jl) | greedy | :star: | :star: |
| [6](https://adventofcode.com/2024/day/6) | [day6.jl](src/2024/day6.jl) | greedy | :star: | :star: |
| [7](https://adventofcode.com/2024/day/7) | [day7.jl](src/2024/day7.jl) | DP | :star: | :star: |
| [8](https://adventofcode.com/2024/day/8) | [day8.jl](src/2024/day8.jl) | math | :star: | :star: |
| [9](https://adventofcode.com/2024/day/9) | [day9.jl](src/2024/day9.jl) | adhoc | :star: | :star: |
| [10](https://adventofcode.com/2024/day/10) | [day10.jl](src/2024/day10.jl) | search, DP | :star: | :star: |
| [11](https://adventofcode.com/2024/day/11) | :x: | ? | :x: | :x: |
| [12](https://adventofcode.com/2024/day/12) | :x: | ? | :x: | :x: |
| [13](https://adventofcode.com/2024/day/13) | :x: | ? | :x: | :x: |
| [14](https://adventofcode.com/2024/day/14) | :x: | ? | :x: | :x: |

## See also

- [goggle/AdventOfCode2023.jl](https://github.com/goggle/AdventOfCode2023.jl):
  Well-organized project with proper modules, tests and benchmarks.
  If you are familiar with C++, Java or Rust, this is a good starting point.
- [GunnarFarneback/AdventOfCode.jl](https://github.com/GunnarFarneback/AdventOfCode.jl):
  If you are a Python developer, `aoc.jl` is a good starting point.
