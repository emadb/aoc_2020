defmodule Aoc.DaySix do
  @all "abcdefghkjilmnopqrstuxywz"
  def part_one(file_path) do

    res = file_path
    |> get_input_list()
    |> Enum.reduce(0, fn g, acc ->
      acc + (g |> String.replace("\n", "") |> String.graphemes() |> Enum.uniq() |> Enum.count())
    end)

    res
  end

  def part_two(file_path) do
    res = file_path
    |> get_input_list()
    |> Enum.reduce(0, fn g, acc ->

      case Enum.map(String.split(g, "\n"),fn s -> MapSet.new(String.graphemes(s)) end) do
        [f | rest] ->
          result = Enum.reduce(rest, f, fn c, acc ->
            MapSet.intersection(acc, c)
          end)
          acc + Enum.count(result)

        m -> acc + Enum.count(m)

      end
    end)

    res

  end

  defp get_input_list(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n\n")

  end

end
