defmodule Aoc.DayFour do

  def part_one(file_path) do
    get_input_list(file_path)
    |> Enum.map(&build_password_struct/1)
    |> Enum.count(&valid?/1)
  end

  def part_two(file_path) do
    get_input_list(file_path)
    |> Enum.map(&build_password_struct/1)
    |> Enum.filter(&valid?/1)
    |> Enum.count(&valid_content?/1)
  end


  defp valid_content?(%{"byr" => byr, "iyr" => iyr, "eyr" => eyr, "hgt" => hgt, "hcl" => hcl, "ecl" => ecl, "pid" => pid}) do
    byr_valid?(String.to_integer(byr)) &&
    iyr_valid?(String.to_integer(iyr)) &&
    eyr_valid?(String.to_integer(eyr)) &&
    hgt_valid?(hgt) &&
    hcl_valid?(hcl) &&
    ecl_valid?(ecl) &&
    pid_valid?(pid)
  end

  defp valid_content?(_), do: false

  defp byr_valid?(y) when y in 1920..2020, do: true
  defp byr_valid?(_), do: false

  defp iyr_valid?(y) when y in 2010..2020, do: true
  defp iyr_valid?(_), do: false

  defp eyr_valid?(y) when y in 2020..2030, do: true
  defp eyr_valid?(_), do: false

  defp hgt_valid?(<<hgt :: binary-size(3)>> <> "cm"), do: String.to_integer(hgt) in 150..193
  defp hgt_valid?(<<hgt :: binary-size(2)>> <> "in"), do: String.to_integer(hgt) in 59..76
  defp hgt_valid?(_), do: false

  defp hcl_valid?(hcl), do: Regex.match?(~r/^#[abcdef0-9]{6}$/, hcl)

  defp ecl_valid?(ecl), do: Enum.member?(["amb", "blu", "brn", "gry", "grn", "hzl", "oth"], ecl)

  defp pid_valid?(pid), do: Regex.match?(~r/^[0-9]{9}$/, pid)

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
