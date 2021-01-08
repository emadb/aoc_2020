defmodule Aoc.DayTwentyoneTest do
  use ExUnit.Case
  @fake_input "./test/fake_inputs/day_twentyone.txt"
  @real_input "./lib/inputs/day_twentyone.txt"

  test "part one (fake)" do
    input = Path.absname(@fake_input)
    result = Aoc.DayTwentyone.part_one(input)

    assert result == 5
  end

  test "part one" do
    input = Path.absname(@real_input)
    result = Aoc.DayTwentyone.part_one(input)

    assert result == 2627
  end

  test "part two (fake)" do
    input = Path.absname(@fake_input)
    result = Aoc.DayTwentyone.part_two(input)
    assert result == "mxmxvkd,sqjhc,fvjkl"
  end


end
