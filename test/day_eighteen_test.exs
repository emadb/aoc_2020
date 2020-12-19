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

  test "part one calc 3" do
    result = Aoc.DayEighteen.calc("2 * 3 + (4 * 5)")
    assert result == 26
  end

  test "part one calc 4" do
    result = Aoc.DayEighteen.calc("5 + (8 * 3 + 9 + 3 * 4 * 3)")
    assert result == 437
  end

  test "part one calc 5" do
    result = Aoc.DayEighteen.calc("5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))")
    assert result == 12240
  end

  test "part one calc 6" do
    result = Aoc.DayEighteen.calc("((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2")
    assert result == 13632
  end

  test "part one (fake)" do
    input = Path.absname(@fake_input)
    result = Aoc.DayEighteen.part_one(input)

    assert result == 51
  end

  test "part one" do
    input = Path.absname(@real_input)
    result = Aoc.DayEighteen.part_one(input)

    assert result == 51
  end
end
