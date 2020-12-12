defmodule Aoc.DayTwelveTest do
  use ExUnit.Case
  @fake_input "./test/fake_inputs/day_twelve.txt"
  @real_input "./lib/inputs/day_twelve.txt"

  test "part one (fake)" do
    input = Path.absname(@fake_input)
    result = Aoc.DayTwelve.part_one(input)

    assert result == 25
  end

  test "part one" do
    input = Path.absname(@real_input)
    result = Aoc.DayTwelve.part_one(input)

    assert result == 521
  end

  test "part two (fake)" do
    input = Path.absname(@fake_input)
    result = Aoc.DayTwelve.part_two(input)

    assert result == 286
  end



end
