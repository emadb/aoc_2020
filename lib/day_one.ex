defmodule Aoc.DayOne do

  def part_one(file_path) do
    input = get_input_list(file_path)
    couples = for a <- input, b <- input do
      {a, _} = Integer.parse(a)
      {b, _} = Integer.parse(b)
      {a, b}
    end
    {a, b} = Enum.find(couples, fn {a, b} -> a + b == 2020 end)
    a * b
  end

  def part_two(file_path) do
    input = get_input_list(file_path)
    couples = for a <- input, b <- input, c <- input do
      {a, _} = Integer.parse(a)
      {b, _} = Integer.parse(b)
      {c, _} = Integer.parse(c)
      {a, b, c}
    end
    {a, b, c} = Enum.find(couples, fn {a, b, c} -> a + b + c == 2020 end)
    a * b * c
  end

  def get_input_list(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n")
  end


end
