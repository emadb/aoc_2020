defmodule Aoc.DayFourteenTest do
  use ExUnit.Case
  @fake_input "./test/fake_inputs/day_fourteen.txt"
  @real_input "./lib/inputs/day_fourteen.txt"

  test "part one (fake)" do
    input = Path.absname(@fake_input)
    result = Aoc.DayFourteen.part_one(input)

    assert result == 165
  end

  test "part one" do
    input = Path.absname(@real_input)
    result = Aoc.DayFourteen.part_one(input)

    assert result == 7611244640053

  end
end
