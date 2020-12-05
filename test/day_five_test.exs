defmodule Aoc.DayFiveTest do
  use ExUnit.Case
  @fake_input "./test/fake_inputs/day_five.txt"
  @real_input "./lib/inputs/day_five.txt"

  test "part one: get row" do
    assert Aoc.DayFive.get_row("BFFFBBF") == 70
    assert Aoc.DayFive.get_row("FFFBBBF") == 14
    assert Aoc.DayFive.get_row("BBFFBBF") == 102
  end

  test "part one: get column" do
    assert Aoc.DayFive.get_column("RRR") == 7
    assert Aoc.DayFive.get_column("RLL") == 4
  end

  test "part one (fake)" do
    input = Path.absname(@fake_input)
    result = Aoc.DayFive.part_one(input)

    assert result == 820
  end

  test "part one" do
    input = Path.absname(@real_input)
    result = Aoc.DayFive.part_one(input)

    assert result == 871
  end

  test "part two" do
    input = Path.absname(@real_input)
    result = Aoc.DayFive.part_two(input)

    assert result == 640
  end

end
