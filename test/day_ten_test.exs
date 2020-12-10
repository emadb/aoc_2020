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

  test "part two (fake)" do
    input = Path.absname(@fake_input)
    result = Aoc.DayTen.part_two(input)

    assert result == 8
  end

  test "part two 2 (fake)" do
    input = Path.absname("./test/fake_inputs/day_ten2.txt")
    result = Aoc.DayTen.part_two(input)

    assert result == 19208
  end

  @tag timeout: :infinity
  test "part two" do
    input = Path.absname(@real_input)
    result = Aoc.DayTen.part_two(input)

    assert result == 226775649501184

  end
end
