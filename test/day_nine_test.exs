defmodule Aoc.DayNineTest do
  use ExUnit.Case
  @fake_input "./test/fake_inputs/day_nine.txt"
  @real_input "./lib/inputs/day_nine.txt"

  test "part one (fake)" do
    input = Path.absname(@fake_input)
    result = Aoc.DayNine.part_one(5, input)

    assert result == 127
  end

  test "part one" do
    input = Path.absname(@real_input)
    result = Aoc.DayNine.part_one(25, input)
    assert result == 41682220
  end
end
