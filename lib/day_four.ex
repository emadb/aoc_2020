defmodule Aoc.DayFour do

  def part_one(file_path) do
    get_input_list(file_path)
    |> Enum.map(&build_password_struct/1)
    |> Enum.count(&valid?/1)
  end

  defp valid?(%{"byr" => _, "iyr" => _, "eyr" => _, "hgt" => _, "hcl" => _, "ecl" => _, "pid" => _, "cid" => _}), do: true
  defp valid?(%{"byr" => _, "iyr" => _, "eyr" => _, "hgt" => _, "hcl" => _, "ecl" => _, "pid" => _}), do: true
  defp valid?(_), do: false

  defp build_password_struct(line) do
    line
    |> String.split(["\n", " "])
    |> Enum.reduce(%{}, fn p, acc ->
      [k, v] = String.split(p, ":")
      Map.put(acc, k, v)
    end)

  end

  defp get_input_list(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n\n")

  end

end
