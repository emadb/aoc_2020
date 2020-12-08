defmodule Aoc.DaySevenTest do
  use ExUnit.Case
  @fake_input "./test/fake_inputs/day_seven.txt"
  @real_input "./lib/inputs/day_seven.txt"


  test "parse line 1" do
    line = Aoc.DaySeven.parse_line("light red bags contain 1 bright white bag, 2 muted yellow bags.")
    assert line == {"light red", [{"bright white", 1}, {"muted yellow", 2}]}
  end

  test "parse line 2" do
    line = Aoc.DaySeven.parse_line("bright white bags contain 1 shiny gold bag.")
    assert line == {"bright white", [{"shiny gold", 1}]}
  end

  test "parse line 3" do
    line = Aoc.DaySeven.parse_line("faded blue bags contain no other bags")
    assert line == {"faded blue", []}
  end

  test "part one (fake)" do
    input = Path.absname(@fake_input)
    result = Aoc.DaySeven.part_one(input, "shiny gold")

    assert result == 4
  end

  test "part one" do
    input = Path.absname(@real_input)
    result = Aoc.DaySeven.part_one(input, "shiny gold")

    assert result == 226
  end

  test "part two (fake)" do
    input = Path.absname(@fake_input)
    result = Aoc.DaySeven.part_two(input, "shiny gold")

    assert result == 32
  end

  test "part two 2(fake)" do
    input = Path.absname("./test/fake_inputs/day_seven_p2.txt")
    result = Aoc.DaySeven.part_two(input, "shiny gold")

    assert result == 126
  end

  test "part two" do
    input = Path.absname(@real_input)
    result = Aoc.DaySeven.part_two(input, "shiny gold")

    assert result == 9569
  end

end
