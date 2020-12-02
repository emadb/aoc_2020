defmodule Aoc.DayTwo do

  def part_one(file_path) do
    file_path
    |> get_input_list()
    |> Enum.map(&parse_line/1)
    |> Enum.map(fn p ->
      count = p["pwd"] |> String.graphemes |> Enum.frequencies
      Map.put(p, "count", count[p["char"]])
    end)
    |> Enum.map(fn p ->
      if (p["count"] >= p["min"]) && (p["count"] <= p["max"]), do: 1, else: 0
    end)
    |> Enum.reduce(0, fn x, acc -> x + acc end)
  end

  def part_two(file_path) do
    file_path
    |> get_input_list()
    |> Enum.map(&parse_line/1)
    |> Enum.map(fn p ->
      letters = String.graphemes(p["pwd"])
      min = count_if(Enum.at(letters, p["min"]-1), p["char"])
      max = count_if(Enum.at(letters, p["max"]-1), p["char"])
      min + max
    end)
    |> Enum.count(fn x -> x == 1 end)
  end

  defp count_if(a, b) when a == b, do: 1
  defp count_if(_, _), do: 0

  defp parse_line(line) do
    re = ~r/(?<min>\d*)-(?<max>\d*)\s(?<char>\w):\s(?<pwd>\w*)/
    Regex.named_captures(re, line)
    |> Map.update!("min", &parse_int/1)
    |> Map.update!("max", &parse_int/1)
  end

  defp get_input_list(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n")
  end

  def parse_int(s) do
    {v, _} = Integer.parse(s)
    v
  end


end
