defmodule Aoc.DaySix do
  def part_one(file_path) do

    file_path
    |> get_input_list()
    |> Enum.reduce(0, fn g, acc -> acc + count_uniq(g) end)
  end

  def part_two(file_path) do
    file_path
    |> get_input_list()
    |> Enum.reduce(0, fn g, acc ->
      case Enum.map(String.split(g, "\n"), fn s -> MapSet.new(String.graphemes(s)) end) do
        [f | rest] -> acc + (rest |> Enum.reduce(f, &MapSet.intersection/2) |> Enum.count())
        m -> acc + Enum.count(m)
      end
    end)
 end

  defp count_uniq(g) do
    g
    |> String.replace("\n", "")
    |> String.graphemes()
    |> Enum.uniq()
    |> Enum.count()
  end

  defp get_input_list(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n\n")

  end

end
