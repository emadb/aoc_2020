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

  test "part two (fake)" do
    # input = Path.absname("./test/fake_inputs/day_sixteen_p2.txt")
    input = Path.absname(@real_input)
    result = Aoc.DaySixteen.part_two(input)

    assert result == 737176602479
  end


end
