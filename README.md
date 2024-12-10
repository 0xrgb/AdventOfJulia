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
- Solved but not a good solution (>1s): :poop:
- Unsolved: :x:

### 2024 (10/50)

| Day | Type | Part 1 | Part 2 |
|----:|------|:------:|:------:|
| [1](https://adventofcode.com/2024/day/1) | adhoc | :star: | :star: |
| [2](https://adventofcode.com/2024/day/2) | adhoc | :star: | :star: |
| [3](https://adventofcode.com/2024/day/3) | parsing | :star: | :star: |
| [4](https://adventofcode.com/2024/day/4) | string | :star: | :star: |
| [5](https://adventofcode.com/2024/day/5) | greedy | :star: | :star: |
| [6](https://adventofcode.com/2024/day/6) | greedy | :star: | :poop: |
| [7](https://adventofcode.com/2024/day/7) | DP | :star: | :star: |
| [8](https://adventofcode.com/2024/day/8) | ? | :x: | :x: |
| [9](https://adventofcode.com/2024/day/9) | ? | :x: | :x: |
| [10](https://adventofcode.com/2024/day/10) | ? | :x: | :x: |

## Reference

- [goggle/AdventOfCode2023.jl](https://github.com/goggle/AdventOfCode2023.jl): Nice project structure with proper module, tests and benchmarks.
