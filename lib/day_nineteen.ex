defmodule Aoc.DayNineteen do

  def part_one(file_path) do

    [rules, input] = File.read!(file_path)
      |> String.split("\n\n")
      |> Enum.map(&String.trim/1)

    rules = parse_rules(rules)
    input = String.split(input, "\n")
    input |> Enum.filter(&check(&1, Map.get(rules, 0), rules)) |> Enum.count()
  end

  def part_two(file_path) do
    [rules, input] = File.read!(file_path)
      |> String.split("\n\n")
      |> Enum.map(&String.trim/1)

    rules = parse_rules(rules)
    input = String.split(input, "\n")

    rules = rules |> Map.put(8, {[42], [42, 8]}) |> Map.put(11, {[42, 31], [42, 11, 31]})

    input |> Enum.filter(&check(&1, Map.get(rules, 0), rules)) |> Enum.count()
  end

  def check("", [], _), do: true
  def check(str, [hd | tl], m) when is_integer(hd), do: check(str, get(m, hd) ++ tl, m)
  def check(<<el, r::binary>>, [<<el>> | tl], m), do: check(r, tl, m)
  def check(str, [{l, r} | tl], m), do: check(str, l ++ tl, m) or check(str, r ++ tl, m)
  def check(_, _, _), do: false

  def get(rules, id) do
    case Map.get(rules, id) do
      s when is_binary(s) -> [s]
      {l, r} -> [{l, r}]
      other -> other
    end
  end

  def parse do

  end

  def parse_rules(rules) do
    rules
    |> String.split("\n")
    |> Enum.map(&String.split(&1, ":"))
    |> Enum.map(fn [k, v] -> {String.to_integer(k), v |> String.trim() |> parse_rule()} end)
    |> Map.new()
  end

  def parse_rule(<<?", c, ?">>), do: <<c>>

  def parse_rule(composite) do
    composite
    |> String.split("|")
    |> Enum.map(fn str ->
      str |> String.trim() |> String.split(" ") |> Enum.map(&String.to_integer/1)
    end)
    |> case do
      [rule] -> rule
      [left, right] -> {left, right}
    end
  end
end
