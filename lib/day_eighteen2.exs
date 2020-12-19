defmodule MyOp do
  import Kernel, except: [++: 2]
  def a ++ b, do: a * b
end

defmodule Day18p2 do
  import Kernel, except: [++: 2]
  import MyOp

  def calc() do
    "./lib/inputs/day_eighteen.txt"
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

IO.inspect Day18p2.calc()
