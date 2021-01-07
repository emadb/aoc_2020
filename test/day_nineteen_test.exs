defmodule Aoc.DayNineteenTest do
  use ExUnit.Case
  @fake_input "./test/fake_inputs/day_nineteen.txt"
  @real_input "./lib/inputs/day_nineteen.txt"

  test "part one (fake)" do
    input = Path.absname(@fake_input)
    result = Aoc.DayNineteen.part_one(input)

    assert result == 2
  end


  test "part one" do
    input = Path.absname(@real_input)
    result = Aoc.DayNineteen.part_one(input)

    assert result == 210
  end

  test "part two (fake)" do
    input = Path.absname(@fake_input)
    result = Aoc.DayNineteen.part_two(input)

    assert result == 2
  end


  test "part two" do
    input = Path.absname(@real_input)
    result = Aoc.DayNineteen.part_two(input)

    assert result == 422
  end


end
