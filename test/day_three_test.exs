defmodule Aoc.DayThreeTest do
  use ExUnit.Case
  @fake_input "./test/fake_inputs/day_three.txt"
  @real_input "./lib/inputs/day_three.txt"

  test "part one (fake)" do
    input = Path.absname(@fake_input)
    result = Aoc.DayThree.part_one(input)
    assert result == 7
  end

  test "part one" do
    input = Path.absname(@real_input)
    result = Aoc.DayThree.part_one(input)
    assert result == 244
  end

  test "part two (fake)" do
    input = Path.absname(@fake_input)
    result = Aoc.DayThree.part_two(input)
    assert result == 336
  end

  test "part two" do
    input = Path.absname(@real_input)
    result = Aoc.DayThree.part_two(input)
    assert result == 9406609920
  end
end
