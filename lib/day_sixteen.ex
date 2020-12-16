defmodule Aoc.DaySixteen do
  @re ~r/^[\w\s]*\:\s(?<f>\d*-\d*)\sor\s(?<s>\d*-\d*)$/

  def part_one(file_path) do
    [instructions, _, nearby] = get_input_list(file_path)

    ranges = parse_instructions(instructions)

    tickets = parse_nearby(nearby)

    invalids = find_invalid(tickets, ranges)
    # IO.inspect invalids
    Enum.sum(invalids)

  end


  defp find_invalid(tickets, ranges) do
    tickets
    |> Enum.flat_map(fn x -> x end)
    |> Enum.reduce([], fn x, acc ->
      case is_in_range(x, ranges) do
        true -> acc
        false -> [x | acc]
      end
    end)
  end

  defp is_in_range(ticket, ranges) do
    Enum.reduce_while(ranges, false, fn [a, b], acc ->
      if ticket >= a && ticket <= b do
        {:halt, true }
      else
        {:cont, acc}
      end
    end)
  end

  defp parse_nearby("nearby tickets:\n" <> ticket_lines) do
    tickets = String.split(ticket_lines, "\n")
    Enum.map(tickets, fn t ->
      String.split(t, ",")  |> Enum.map(&String.to_integer/1)
    end)
  end

  defp parse_instructions(text) do
    String.split(text, "\n")
    |> Enum.reduce([], fn line, acc ->
      [_, first, second] = Regex.run(@re, line)
      [parse_range(first), parse_range(second) | acc]
    end)
  end

  defp parse_range(range) do
    String.split(range, "-") |> Enum.map(&String.to_integer/1)
  end

  defp get_input_list(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n\n")
  end


end
