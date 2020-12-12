defmodule Aoc.DayThirteenTest do
  use ExUnit.Case
  @fake_input "./test/fake_inputs/day_thirteen.txt"
  @real_input "./lib/inputs/day_thirteen.txt"

  test "part one (fake)" do
    input = Path.absname(@fake_input)
    result = Aoc.DayThirteen.part_one(input)

    assert result == 295
  end

  test "part one " do
    input = Path.absname(@real_input)
    result = Aoc.DayThirteen.part_one(input)

    assert result == 2935
  end

end
