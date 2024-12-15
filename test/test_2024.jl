@testset "2024" begin
    # Day 1
    @test begin
        input = """
3   4
4   3
2   5
1   3
3   9
3   3
"""
        run(2024, 1, input) == (11, 31)
    end
    @test begin
        run(2024, 1, getinput(2024, 1)) == (1834060, 21607792)
    end

    # Day 2
    @test begin
        input = """
7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9
"""
        run(2024, 2, input) == (2, 4)
    end
    @test begin
        run(2024, 2, getinput(2024, 2)) == (486, 540)
    end

    # Day 3
    @test begin
        input = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))\n"
        run(2024, 3, input) == (161, 48)
    end
    @test begin
        run(2024, 3, getinput(2024, 3)) == (171183089, 63866497)
    end

    # Day 4
    @test begin
        input = """
MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
MSAMASMSMX
XMASAMXAMM
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX
"""
        run(2024, 4, input) == (18, 9)
    end
    @test begin
        run(2024, 4, getinput(2024, 4)) == (2336, 1831)
    end

    # Day 5
    @test begin
        input = """
47|53
97|13
97|61
97|47
75|29
61|13
75|53
29|13
97|29
53|29
61|53
97|53
61|29
47|13
75|47
97|75
47|61
75|61
47|29
75|13
53|13

75,47,61,53,29
97,61,53,29,13
75,29,13
75,97,47,61,53
61,13,29
97,13,75,29,47
"""
        run(2024, 5, input) == (143, 123)
    end
    @test begin
        run(2024, 5, getinput(2024, 5)) == (5588, 5331)
    end

    # Day 6
    @test begin
        input = """
....#.....
.........#
..........
..#.......
.......#..
..........
.#..^.....
........#.
#.........
......#...
"""
        run(2024, 6, input) == (41, 6)
    end
    @test begin
        run(2024, 6, getinput(2024, 6)) == (4559, 1604)
    end

    # Day 7
    @test begin
        input = """
190: 10 19
3267: 81 40 27
83: 17 5
156: 15 6
7290: 6 8 6 15
161011: 16 10 13
192: 17 8 14
21037: 9 7 18 13
292: 11 6 16 20
"""
        run(2024, 7, input) == (3749, 11387)
    end
    @test begin
        run(2024, 7, getinput(2024, 7)) == (538191549061, 34612812972206)
    end

    # Day 8
    @test begin
        input = """
............
........0...
.....0......
.......0....
....0.......
......A.....
............
............
........A...
.........A..
............
............
"""
        run(2024, 8, input) == (14, 34)
    end
    @test begin
        run(2024, 8, getinput(2024, 8)) == (392, 1235)
    end

    # Day 9
    @test begin
        input = "2333133121414131402\n"
        run(2024, 9, input) == (1928, 2858)
    end
    @test begin
        run(2024, 9, getinput(2024, 9)) == (6359213660505, 6381624803796)
    end

    # Day 10
    @test begin
        input = """
89010123
78121874
87430965
96549874
45678903
32019012
01329801
10456732
"""
        run(2024, 10, input) == (36, 81)
    end
    @test begin
        run(2024, 10, getinput(2024, 10)) == (548, 1252)
    end

    # Day 11
    @test begin
        input = "125 17\n"
        run(2024, 11, input) == (55312, 65601038650482)
    end
    @test begin
        run(2024, 11, getinput(2024, 11)) == (233875, 277444936413293)
    end

    # Day 15
    @test begin
        input = """
##########
#..O..O.O#
#......O.#
#.OO..O.O#
#..O@..O.#
#O#..O...#
#O..O..O.#
#.OO.O.OO#
#....O...#
##########

<vv>^<v^>v>^vv^v>v<>v^v<v<^vv<<<^><<><>>v<vvv<>^v^>^<<<><<v<<<v^vv^v>^
vvv<<^>^v^^><<>>><>^<<><^vv^^<>vvv<>><^^v>^>vv<>v<<<<v<^v>^<^^>>>^<v<v
><>vv>v^v^<>><>>>><^^>vv>v<^^^>>v^v^<^^>v^^>v^<^v>v<>>v^v^<v>v^^<^^vv<
<<v<^>>^^^^>>>v^<>vvv^><v<<<>^^^vv^<vvv>^>v<^^^^v<>^>vvvv><>>v^<<^^^^^
^><^><>>><>^^<<^^v>>><^<v>^<vv>>v>>>^v><>^v><<<<v>>v<v<v>vvv>^<><<>^><
^>><>^v<><^vvv<^^<><v<<<<<><^v<<<><<<^^<v<^^^><^>>^<v^><<<^>>^v<v^v<v^
>^>>^v>vv>^<<^v<>><<><<v<<v><>v<^vv<<<>^^v^>^^>>><<^v>>v^v><^^>>^<>vv^
<><^^>^^^<><vvvvv^v<v<<>^v<v>v<<^><<><<><<<^^<<<^<<>><<><^^^>^^<>^>v<>
^^>vv<^v^v<vv>^<><v<^v>^^^>>>^^vvv^>vvv<>>>^<^>>>>>^<<^v>^vvv<>^<><<v>
v^^>>><<^^<>>^v^<v^vv<>v^<<>^<^v^v><^<<<><<^<v><v<>vv>>v><v^<vv<>v^<<^
"""
        run(2024, 15, input) == (10092, 9021)
    end
    @test begin
        run(2024, 15, getinput(2024, 15)) == (1568399, 1575877)
    end
end
