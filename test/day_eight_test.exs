defmodule Aoc.DayEightTest do
  use ExUnit.Case
  @fake_input "./test/fake_inputs/day_eight.txt"
  @real_input "./lib/inputs/day_eight.txt"

  test "part one (fake)" do
    input = Path.absname(@fake_input)
    result = Aoc.DayEight.part_one(input)

    assert result == 5
  end

  test "part one" do
    input = Path.absname(@real_input)
    result = Aoc.DayEight.part_one(input)

    assert result == 1614
  end
end
