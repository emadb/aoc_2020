defmodule Aoc.DaySeven do

  def part_one(file_path, color) do
    bags = file_path
    |> get_input_list()
    |> Enum.map(&parse_line/1)

    find_containers(bags, [color], [])
    |> flatten()
    |> Enum.uniq()
    |> Enum.count()
  end

  def part_two(file_path, color) do
    bags = file_path
    |> get_input_list()
    |> Enum.map(&parse_line/1)

    find_contents(bags, color) - 1

  end

  defp find_contents(bags, color) do
    {_, content} = Enum.find(bags, fn {c, _} -> c == color end)

    case content do
      [] -> 1
      _ ->
        Enum.reduce(content, 1, fn ({color, qty}, a) ->
          a + qty * find_contents(bags, color)
        end)
    end
  end

  defp find_containers(bags, colors, list) do
    Enum.map(colors, fn x ->
      containers = do_find_containers(bags, x, [])
      containers ++ find_containers(bags, containers, list)
    end) ++ list
  end

  defp do_find_containers([{color, content} | rest], needed_color, acc) do
    next = case Enum.find(content, fn {c, _} -> c == needed_color end) do
      nil -> acc
      {_, _} -> acc ++ [color]
    end
    do_find_containers(rest, needed_color, next)
  end
  defp do_find_containers([], _, acc), do: acc

  def parse_line(line) do
    [bag, content] = String.split(line, " bags contain ")
    bags = case content do
      "no other bags" -> []
      "no other bags." -> []
      _ -> Enum.map(String.split(content, ", "), fn b ->
        %{"color" => c, "qty" => q} = Regex.named_captures(~r/^(?<qty>[0-9])\s(?<color>\w*\s\w*)/, b)
        {c, String.to_integer(q)}
      end)
    end

    {bag, bags}
  end


  defp get_input_list(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n")
  end

  defp flatten([head | tail]), do: flatten(head) ++ flatten(tail)
  defp flatten([]), do: []
  defp flatten(element), do: [element]
end
