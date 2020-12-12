defmodule Aoc.DayElevenTest do
  use ExUnit.Case
  @fake_input "./test/fake_inputs/day_eleven.txt"
  @real_input "./lib/inputs/day_eleven.txt"

  test "part one (fake)" do
    input = Path.absname(@fake_input)
    result = Aoc.DayEleven.part_one(input)

    assert result == 37
  end

  test "part one" do
    input = Path.absname(@real_input)
    result = Aoc.DayEleven.part_one(input)

    assert result == 2126
  end

  test "part two (fake)" do
    input = Path.absname(@fake_input)
    result = Aoc.DayEleven.part_two(input)

    assert result == 26
  end

  test "part two" do
    input = Path.absname(@real_input)
    result = Aoc.DayEleven.part_two(input)

    assert result == 1914
  end
end
