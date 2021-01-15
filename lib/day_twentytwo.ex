defmodule Aoc.DayTwentytwo do

  def part_one(file_path) do
    [i1, i2] = get_input_list(file_path)
    p1 = get_deck(i1)
    p2 = get_deck(i2)

    play(p1, p2)
    |> Enum.reverse()
    |> Enum.with_index(1)
    |> Enum.reduce(0, fn {v, i}, acc ->
      acc + v * i
    end)

  end

  defp play([], p2), do: p2
  defp play(p1, []), do: p1

  defp play([c1 | t1], [c2 | t2]) when c1 > c2, do: play(t1 ++ [c1, c2], t2)
  defp play([c1 | t1], [c2 | t2]), do: play(t1, t2 ++ [c2, c1])

  defp get_deck(str) do
    [_ | t ] = String.split(str, "\n")
    Enum.map(t, &String.to_integer/1)
  end

  defp get_input_list(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n\n")
  end
end
