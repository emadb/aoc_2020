defmodule Aoc.DayEight do

  def part_one(file_path) do

    file_path
    |> get_input_list()
    |> Enum.map(&parse_line/1)
    |> execute(0, 0)
  end

  defp execute(program, acc, sp) do
    case Enum.at(program, sp) do
      {:nop, _, false} -> program |> mark_done(sp) |> execute(acc, sp + 1)
      {:acc, value, false} -> program |> mark_done(sp) |> execute(acc + value, sp + 1)
      {:jmp, value, false} -> program |> mark_done(sp) |> execute(acc, sp + value)
      {_, _, true} -> acc
    end
  end

  defp mark_done(program, sp) do
    {first, [op | rest]} = Enum.split(program, sp)
    {cmd, value, false} = op
    first  ++ [{cmd, value, true} | rest]
  end


  defp parse_line(line) do
    re = ~r/^(?<cmd>\w{3})\s(?<value>[+-]\d*)$/
    case Regex.run(re, line) do
      [_, "nop", value] -> {:nop, String.to_integer(value), false}
      [_, "acc", value] -> {:acc, String.to_integer(value), false}
      [_, "jmp", value] -> {:jmp, String.to_integer(value), false}
    end
  end

  defp get_input_list(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n")

  end
end
