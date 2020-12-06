defmodule Aoc.DaySixTest do
  use ExUnit.Case
  @fake_input "./test/fake_inputs/day_six.txt"
  @real_input "./lib/inputs/day_six.txt"

  test "part one (fake)" do
    input = Path.absname(@fake_input)
    result = Aoc.DaySix.part_one(input)

    assert result == 11
  end

  test "part one" do
    input = Path.absname(@real_input)
    result = Aoc.DaySix.part_one(input)

    assert result == 11
  end
end
