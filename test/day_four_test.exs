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

end
