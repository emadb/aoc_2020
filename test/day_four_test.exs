defmodule Aoc.DayFourTest do
  use ExUnit.Case
  @fake_input "./test/fake_inputs/day_four.txt"
  @real_input "./lib/inputs/day_four.txt"

  test "part one (fake)" do
    input = Path.absname(@fake_input)
    result = Aoc.DayFour.part_one(input)

    assert result == 2
  end

  test "part one" do
    input = Path.absname(@real_input)
    result = Aoc.DayFour.part_one(input)

    assert result == 237
  end

  test "part two (fake)(valid)" do
    input = Path.absname("./test/fake_inputs/day_four_p2_valid.txt")
    result = Aoc.DayFour.part_two(input)

    assert result == 4
  end

  test "part two (fake)(not valid)" do
    input = Path.absname("./test/fake_inputs/day_four_p2_not_valid.txt")
    result = Aoc.DayFour.part_two(input)

    assert result == 0
  end

  test "part two" do
    input = Path.absname(@real_input)
    result = Aoc.DayFour.part_two(input)

    assert result == 172
  end

end
