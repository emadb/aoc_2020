defmodule Aoc.DayEighteenTest do
  use ExUnit.Case
  @fake_input "./test/fake_inputs/day_eighteen.txt"
  @real_input "./lib/inputs/day_eighteen.txt"

  test "part one calc 1" do
    result = Aoc.DayEighteen.calc("1 + 2 * 3 + 4 * 5 + 6")
    assert result == 71
  end

  test "part one calc 2" do
    result = Aoc.DayEighteen.calc("1 + (2 * 3) + (4 * (5 + 6))")
    assert result == 51
  end

  test "part one (fake)" do
    input = Path.absname(@fake_input)
    result = Aoc.DayEighteen.calc("1 + 2 * 3 + 4 * 5 + 6")

    assert result == 71
  end
end
