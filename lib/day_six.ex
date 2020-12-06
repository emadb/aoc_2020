defmodule Aoc.DaySix do

  def part_one(file_path) do

    res = file_path
    |> get_input_list()
    |> Enum.reduce(0, fn g, acc ->
      acc + (g |> String.replace("\n", "") |> String.graphemes() |> Enum.uniq() |> Enum.count())
    end)

    res
  end

  def part_two(file_path) do
  end

  defp get_input_list(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n\n")

  end

end
