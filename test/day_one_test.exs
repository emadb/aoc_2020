defmodule Aoc.DayOneTest do
  use ExUnit.Case

  test "part one (fake)" do
    input = Path.absname("./test/fake_inputs/day_one.txt")
    result = Aoc.DayOne.part_one(input)

    assert result == 514579
  end

  test "part one" do
    input = Path.absname("./lib/inputs/day_one.txt")
    result = Aoc.DayOne.part_one(input)
    assert result == 158916
  end

  test "part two (fake)" do
    input = Path.absname("./test/fake_inputs/day_one.txt")
    result = Aoc.DayOne.part_two(input)

    assert result == 241861950
  end

  test "part two" do
    input = Path.absname("./lib/inputs/day_one.txt")
    result = Aoc.DayOne.part_two(input)

    assert result == 165795564
  end
end
