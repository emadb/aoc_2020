defmodule Aoc.DayFive do

  def part_one(file_path) do
    lines = get_input_list(file_path)
    Enum.reduce(lines, 0, fn l, acc ->
      r = l |> String.slice(0..6) |> get_row()
      c = l |> String.slice(7..9) |> get_column()
      max((r * 8) + c, acc)
    end)
  end

  def part_two(file_path) do
    [first | rest] = file_path
      |> get_input_list()
      |> Enum.map(fn l ->
        r = l |> String.slice(0..6) |> get_row()
        c = l |> String.slice(7..9) |> get_column()
        (r * 8) + c
      end)
      |> Enum.sort()


    {prev, next} = Enum.reduce_while(rest, first, fn x, acc ->
      case acc + 1 == x do
        true -> {:cont, x}
        false -> {:halt, {acc, x}}
      end
    end)

    div(next+prev, 2)

  end


  defp get_input_list(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n")
  end

  def get_row(line) do
    chars = String.graphemes(line)
    do_get_row(chars, 0, 127)
  end

  def get_column(line) do
    chars = String.graphemes(line)
    do_get_column(chars, 0, 7)
  end

  defp do_get_row(["F"], l, h), do: div(l + h, 2)
  defp do_get_row(["B"], _l, h), do: h
  defp do_get_row(["F" | t], l, h), do: do_get_row(t, l, div(h+l, 2))
  defp do_get_row(["B" | t], l, h), do: do_get_row(t, div(h+l, 2), h)

  defp do_get_column(["L"], l, h), do: div(l + h, 2)
  defp do_get_column(["R"], _l, h), do: h
  defp do_get_column(["L" | t], l, h), do: do_get_column(t, l, div(h+l, 2))
  defp do_get_column(["R" | t], l, h), do: do_get_column(t, div(h+l, 2), h)


end
