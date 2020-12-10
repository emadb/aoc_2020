defmodule Aoc.DayTenTest do
  use ExUnit.Case
  @fake_input "./test/fake_inputs/day_ten.txt"
  @real_input "./lib/inputs/day_ten.txt"

  test "part one (fake)" do
    input = Path.absname(@fake_input)
    result = Aoc.DayTen.part_one(input)

    assert result == 35
  end

  test "part one 2 (fake)" do
    input = Path.absname("./test/fake_inputs/day_ten2.txt")
    result = Aoc.DayTen.part_one(input)

    assert result == 220
  end

  test "part one" do
    input = Path.absname(@real_input)
    result = Aoc.DayTen.part_one(input)

    assert result == 2590
  end
end
