defmodule Aoc.DayTwentyTwoTest do
  use ExUnit.Case
  @fake_input "./test/fake_inputs/day_twentytwo.txt"
  @real_input "./lib/inputs/day_twentytwo.txt"

  test "part one (fake)" do
    input = Path.absname(@fake_input)
    result = Aoc.DayTwentytwo.part_one(input)

    assert result == 306
  end

  test "part one" do
    input = Path.absname(@real_input)
    result = Aoc.DayTwentytwo.part_one(input)

    assert result == 306
  end

end
