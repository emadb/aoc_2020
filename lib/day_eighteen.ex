defmodule Aoc.DayEighteen do

  def part_one(file_path) do
    file_path
    |> get_input_list()
    |> Enum.reduce(0, fn exp, acc -> acc + calc(exp) end)
  end

  def calc(expression) do
    {res, _} = expression
      |> prepare()
      |> do_calc([], {0, nil})
    res
  end

  defp do_calc(["(" | tail], stack, {res, op}) do
    do_calc(tail, [{res, op} | stack], {0, nil})
  end

  defp do_calc([")" | tail], [{0, nil} | stack], {res, op}) do
    do_calc(tail, stack, {res, op})
  end

  defp do_calc([")" | tail], [{n, op} | stack], {res, _}) do
    do_calc(tail, stack, {op.(res, n), nil})
  end

  defp do_calc(["+" | tail], stack, {n, _}) do
    do_calc(tail, stack, {n, &sum/2})
  end

  defp do_calc(["*" | tail], stack, {n, _}) do
    do_calc(tail, stack, {n, &mul/2})
  end

  defp do_calc([n | tail], stack, {_, nil}) do
    do_calc(tail, stack, {n, nil})
  end

  defp do_calc([n | tail], stack, {res, op}) do
    do_calc(tail, stack, {op.(res, n), nil})
  end

  defp do_calc([], _, res), do: res

  defp sum(a, b), do: a + b
  defp mul(a, b), do: a * b

  defp prepare(expression) do
    "0 + " <> expression
    |> String.replace(")", " )")
    |> String.replace("(", "( ")
    |> String.split(" ")
    |> Enum.map(
      fn "+" -> "+"
         "*" -> "*"
         "(" -> "("
         ")" -> ")"
          x -> String.to_integer(x)
    end)
  end

  defp get_input_list(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n")

  end
end

defmodule MyOp do
  import Kernel, except: [++: 2]
  def a ++ b, do: a * b
end

defmodule Aoc.Day18p2 do
  import Kernel, except: [++: 2]
  import MyOp

  def calc(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n")
    |> Enum.reduce(0, fn exp, acc ->
      {res, _} = exp
      |> String.replace("*", "++")
      |> Code.eval_string([], __ENV__)
      acc + res
    end)
  end
end
