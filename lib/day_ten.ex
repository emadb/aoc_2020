defmodule Aoc.DayTen do

  def part_one(file_path) do
    [one, three] = file_path
    |> get_input_list()
    |> Enum.sort()
    |> add_last()
    |> build_chain(0, [])
    |> Enum.reduce([0,0], fn
      1, [one, three] -> [one + 1, three]
      3, [one, three] -> [one, three + 1]
    end)
    one * three
  end

  defp build_chain([v1, v2, v3 | rest], value, chain) do
    cond do
      v1 - value <= 3 -> build_chain([v2, v3 | rest], v1, chain ++ [v1 - value])
      v2 - value <= 3 -> build_chain([v3 | rest], v2, chain ++ [v2 - value])
      v3 - value <= 3 -> build_chain(rest, v3, chain ++ [v3 - value])
    end
  end

  defp build_chain([v1, v2], value, chain) do
    cond do
      v1 - value <= 3 -> build_chain([v2 ], v1, chain ++ [v1 - value])
      v2 - value <= 3 -> build_chain([], v2, chain ++ [v2 - value])
    end
  end

  defp build_chain([v1], value, chain) do
    cond do
      v1 - value <= 3 -> build_chain([], v1, chain ++ [v1 - value])
    end
  end

  defp build_chain([], _, chain), do: chain


  defp add_last(list) do
    list ++ [List.last(list) + 3]
  end

  defp get_input_list(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n")
    |> Enum.map(&String.to_integer/1)
  end


end
