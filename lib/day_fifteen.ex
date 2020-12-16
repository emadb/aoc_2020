defmodule Aoc.DayFifteen do
  def part_one(input, to \\ 2020) do
    start_list = Enum.reverse(input)
    start_index = Enum.count(input) + 1

    start_index..to
    |> Enum.reduce(start_list, fn _, [last | rest ] = state ->
      case Enum.find_index(rest, &(&1 == last)) do
        nil -> [0 | state]
        ind -> [ind + 1 | state]
      end
    end)
    |> List.first()
  end

  def part_two(input, to \\ 2020) do
    start_index = Enum.count(input) + 1

    [first | rest] = Enum.reverse(input)
    rest = Enum.reverse(rest)

    start_state = rest
    |> Enum.with_index()
    |> Enum.reduce(%{}, fn {v, i}, acc -> Map.put(acc, v, i+1) end)

    {res, _} = start_index..to
    |> Enum.reduce({first, start_state}, fn turn, {last, state} ->
        case Map.get(state, last) do
          nil -> {0, Map.put(state, last, turn - 1)}
          ind -> {turn - 1 - ind, Map.put(state, last, turn - 1)}
        end
    end)
    res
  end
end
