defmodule Aoc.DayOne do

  def part_one(file_path) do
    input = get_input_list(file_path)
    List.first(for a <- input, b <- input, is_2020(a, b), do: a * b)
  end

  def part_two(file_path) do
    input = get_input_list(file_path)
    List.first(for a <- input, b <- input, c <- input, is_2020(a, b, c), do: a * b * c)
  end

  def get_input_list(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n")
    |> Enum.map(fn i ->
      {n, _} = Integer.parse(i)
      n
    end)

  end

  defp is_2020(a, b, c \\ 0), do: a + b + c == 2020

end
