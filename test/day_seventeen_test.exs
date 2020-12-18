defmodule Aoc.DaySeventeenTest do
  use ExUnit.Case
  @fake_input "./test/fake_inputs/day_seventeen.txt"
  @real_input "./lib/inputs/day_seventeen.txt"

  test "part one (fake)" do
    input = Path.absname(@fake_input)
    result = Aoc.DaySeventeen.part_one(input)

    assert result == 112
  end

  test "part one" do
    input = Path.absname(@real_input)
    result = Aoc.DaySeventeen.part_one(input)

    assert result == 298
  end

  test "part two (fake)" do
    input = Path.absname(@fake_input)
    result = Aoc.DaySeventeenP2.part_two(input)

    assert result == 848
  end

  @tag timeout: :infinity
  test "part two" do
    input = Path.absname(@real_input)
    result = Aoc.DaySeventeenP2.part_two(input)

    assert result == 848
  end

end
