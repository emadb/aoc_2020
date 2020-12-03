defmodule Aoc.DayOneTest do
  use ExUnit.Case
  @fake_input "./test/fake_inputs/day_one.txt"
  @real_input "./lib/inputs/day_one.txt"

  test "part one (fake)" do
    input = Path.absname(@fake_input)
    result = Aoc.DayOne.part_one(input)

    assert result == 514579
  end

  test "part one" do
    input = Path.absname(@real_input)
    result = Aoc.DayOne.part_one(input)
    assert result == 158916
  end

  test "part two (fake)" do
    input = Path.absname(@fake_input)
    result = Aoc.DayOne.part_two(input)

    assert result == 241861950
  end

  test "part two" do
    input = Path.absname(@real_input)
    result = Aoc.DayOne.part_two(input)

    assert result == 165795564
  end
end
