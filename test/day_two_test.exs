defmodule Aoc.DayTwoTest do
  use ExUnit.Case

  test "part one (fake)" do
    input = Path.absname("./test/fake_inputs/day_two.txt")
    result = Aoc.DayTwo.part_one(input)

    assert result == 2
  end

  test "part one" do
    input = Path.absname("./lib/inputs/day_two.txt")
    result = Aoc.DayTwo.part_one(input)

    assert result == 556
  end

  test "part two (fake)" do
    input = Path.absname("./test/fake_inputs/day_two.txt")
    result = Aoc.DayTwo.part_two(input)

    assert result == 1
  end

  test "part two" do
    input = Path.absname("./lib/inputs/day_two.txt")
    result = Aoc.DayTwo.part_two(input)

    assert result == 605
  end
end
