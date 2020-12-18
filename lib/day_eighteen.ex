defmodule Aoc.DayEighteen do

  def part_one(file_path) do

  end


  def calc(expression) do
    [first | rest ] = prepare(expression)
    {res, _} = Enum.reduce(rest, {first, nil}, fn x, {prev, op} ->
      case x do
        "+" -> {prev, &sum/2}
        "*" -> {prev, &mul/2}
        _   -> {op.(prev, x), nil}
      end
    end)
    res
  end

  defp sum(a, b), do: a + b
  defp mul(a, b), do: a * b

  defp prepare(expression) do
    expression
    |> String.split(" ")
    |> Enum.map(
      fn "+" -> "+"
         "*" -> "*"
          x -> String.to_integer(x)
    end)
  end

  defp get_input_list(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n")

  end
end
