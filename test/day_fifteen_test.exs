defmodule Aoc.DayFifteenTest do
  use ExUnit.Case

  test "part one (fake)" do
    result = Aoc.DayFifteen.part_one([0, 3, 6])

    assert result == 436
  end

  test "part one" do
    result = Aoc.DayFifteen.part_one([7, 14, 0, 17, 11, 1, 2], 2020)
    assert result == 206
  end

  test "part two (fake)" do
    result = Aoc.DayFifteen.part_two([0, 3, 6], 30_000_000)
    assert result == 175594
  end

  @tag timeout: :infinity
  test "part two" do
    result = Aoc.DayFifteen.part_two([7, 14, 0, 17, 11, 1, 2], 30_000_000)
    assert result == 955
  end

end
