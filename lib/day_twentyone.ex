defmodule Aoc.DayTwentyone do

  @re ~r/^(?<foods>[\w\s]*)\(contains (?<allergens>[\w\s,]*)\)$/

  def part_one(file_path) do
    data = file_path
    |> get_input_list()
    |> Enum.map(&build_struct/1)

    food_with_allergens = data
    |> Enum.map(&candidates/1)
    |> Enum.reduce(&merge/2)
    |> Map.values()
    |> Enum.reduce(&MapSet.union/2)

    data
    |> Enum.flat_map(fn {a, _} -> a end)
    |> Enum.reduce(0, fn x, acc ->
      if x in food_with_allergens do
        acc
      else
        acc + 1
      end
    end)
  end

  def part_two(file_path) do
    file_path
    |> get_input_list()
    |> Enum.map(&build_struct/1)
    |> Enum.map(&candidates/1)
    |> Enum.reduce(&merge/2)
    |> eliminate()
    |> couple()
    |> Enum.sort(fn {a1, _}, {a2, _} -> a1 <= a2 end)
    |> Enum.map(fn {_, f} -> f end)
    |> Enum.uniq()
    |> Enum.join(",")
  end

  def eliminate(map, eliminated \\ MapSet.new()) do
    {lst, eliminated} =
      Enum.map_reduce(map, eliminated, fn {k, options}, eliminated ->
        if MapSet.size(options) == 1 do
          {{k, options}, MapSet.union(eliminated, options)}
        else
          {{k, MapSet.difference(options, eliminated)}, eliminated}
        end
      end)

    if Enum.all?(lst, fn {_, v} -> MapSet.size(v) == 1 end) do
      Map.new(lst)
    else
      eliminate(lst, eliminated)
    end
  end


  defp couple(map) do
    Map.keys(map)
    |> Enum.flat_map(fn k ->
      Enum.map(map[k], fn v -> {k, v} end)
    end)

  end

  defp build_struct(line) do
    %{"foods" => foods, "allergens" => allergens} = Regex.named_captures(@re, line)

    {
      String.split(foods, " ") |> Enum.reject(fn x -> x == "" end),
      String.split(allergens, ",") |> Enum.map(&String.trim/1)
    }
  end

  def candidates({ingredients, allergens}) do
    for allergen <- allergens, into: %{} do
      {allergen, MapSet.new(ingredients)}
    end
  end

  def merge(a1, a2) do
    Map.merge(a1, a2, fn _, x1, x2 -> MapSet.intersection(x1, x2) end)
  end

  defp get_input_list(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n")

  end

end
