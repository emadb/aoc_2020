defmodule Aoc.DayNine do

  def part_one(preamble, file_path) do

    input = get_input_list(file_path)
    rest = Enum.drop(input, preamble)

    Enum.reduce_while(rest, 0, fn x, acc ->
      list = Enum.slice(input, acc, preamble)

      case find_numbers(list, x) do
        true -> {:cont, acc + 1}
        false -> {:halt, x}
      end
    end)

  end

  defp find_numbers(list, x) do
    sums = for n1 <- list, n2 <- Enum.drop(list, 1), do: n1 + n2
    Enum.member?(sums, x)
  end

  defp get_input_list(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n")
    |> Enum.map(&String.to_integer/1)
  end

end
