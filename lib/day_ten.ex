defmodule Aoc.DayTenAgent do
  use Agent
  def start_link() do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end
  def value(key) do
    Agent.get(__MODULE__, &Map.fetch(&1, key))
  end
  def put(key, value) do
    Agent.update(__MODULE__, &Map.put(&1, key, value))
  end
end

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

  def part_two(file_path) do
    Aoc.DayTenAgent.start_link()

    file_path
    |> get_input_list()
    |> Enum.sort()
    |> add_last()
    |> build_combination(0, [])
    |> count_combination()
  end

  defp count_combination(list) do
    last = List.last(list)
    do_count(list, 0, last)
  end

  defp do_count(list, n, limit) do
    if n >= limit do
      1
    else
      do_count_cached(list, n + 1, limit) + do_count_cached(list, n + 2, limit) + do_count_cached(list, n + 3, limit)
    end
  end

  defp do_count_cached(list, n, limit) do
    case Aoc.DayTenAgent.value(n) do
      {:ok, num} ->
        num
      _ ->
        res = if Enum.member?(list, n), do: do_count(list, n, limit), else: 0
        Aoc.DayTenAgent.put(n, res)
        res
      end
  end

  defp build_combination([v1, v2, v3 | rest], value, chain) do
    cond do
      v1 - value <= 3 -> build_combination([v2, v3 | rest], v1, chain ++ [v1])
      v2 - value <= 3 -> build_combination([v3 | rest], v2, chain ++ [v2])
      v3 - value <= 3 -> build_combination(rest, v3, chain ++ [v3])
    end
  end

  defp build_combination([v1, v2], value, chain) do
    cond do
      v1 - value <= 3 -> build_combination([v2], v1, chain ++ [v1])
      v2 - value <= 3 -> build_combination([], v2, chain ++ [v2])
    end
  end

  defp build_combination([v1], _value, chain) do
    build_combination([], v1, chain ++ [v1])
  end

  defp build_combination([], _, chain), do: chain

  defp build_chain([v1, v2, v3 | rest], value, chain) do
    cond do
      v1 - value <= 3 -> build_chain([v2, v3 | rest], v1, chain ++ [v1 - value])
      v2 - value <= 3 -> build_chain([v3 | rest], v2, chain ++ [v2 - value])
      v3 - value <= 3 -> build_chain(rest, v3, chain ++ [v3 - value])
    end
  end

  defp build_chain([v1, v2], value, chain) do
    cond do
      v1 - value <= 3 -> build_chain([v2], v1, chain ++ [v1 - value])
      v2 - value <= 3 -> build_chain([], v2, chain ++ [v2 - value])
    end
  end

  defp build_chain([v1], value, chain) do
    build_chain([], v1, chain ++ [v1 - value])
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
