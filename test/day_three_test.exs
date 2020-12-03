defmodule Aoc.DayThreeTest do
  use ExUnit.Case

  test "part one (fake)" do
    input = Path.absname("./test/fake_inputs/day_three.txt")
    result = Aoc.DayThree.part_one(input)
    assert result == 7
  end

  test "part one" do
    input = Path.absname("./lib/inputs/day_three.txt")
    result = Aoc.DayThree.part_one(input)
    assert result == 244
  end

end
