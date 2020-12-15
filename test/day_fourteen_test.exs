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

  test "part two (fake)" do
    input = Path.absname("./test/fake_inputs/day_fourteen_p2.txt")
    result = Aoc.DayFourteen.part_two(input)

    assert result == 208
  end

  test "part two" do
    input = Path.absname(@real_input)
    result = Aoc.DayFourteen.part_two(input)

    assert result == 3705162613854
  end
end
