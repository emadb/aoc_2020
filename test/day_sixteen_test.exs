defmodule Aoc.DaySixteenTest do
  use ExUnit.Case
  @fake_input "./test/fake_inputs/day_sixteen.txt"
  @real_input "./lib/inputs/day_sixteen.txt"

  test "part one (fake)" do
    input = Path.absname(@fake_input)
    result = Aoc.DaySixteen.part_one(input)

    assert result == 71
  end

  test "part one" do
    input = Path.absname(@real_input)
    result = Aoc.DaySixteen.part_one(input)

    assert result == 27911
  end


end
