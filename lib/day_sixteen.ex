defmodule Aoc.DaySixteen do

  def part_one(file_path) do
    [instructions, _, nearby] = get_input_list(file_path)
    ranges = parse_instructions(instructions)
    tickets = parse_nearby(nearby)
    find_invalid(tickets, ranges) |> Enum.sum()
  end

  def part_two(file_path) do
    [instructions, my, nearby] = get_input_list(file_path)
    ranges = parse_instructions_with_description(instructions)
    tickets = parse_nearby(nearby)
    valid_tickets = drop_invalid(tickets, parse_instructions(instructions))


    candidates = decode_tickets(valid_tickets, ranges)

    result = find_descriptions(candidates, [])

    valid_desc = result
    |> Enum.map(fn {i, _, desc} -> {i, desc} end)
    |> Enum.filter(fn {_, desc} ->
      case Enum.find(desc, fn d -> d != [] && String.contains?(d, "departure") end) do
        nil -> false
        _ -> true
      end
    end)

    [_, my_ticket] = String.split(my, "\n")

    my_ticket_numbers = Enum.map(String.split(my_ticket, ","), &String.to_integer/1)

    result_indicies = Enum.map(valid_desc, fn {i, _} -> i end)

    Enum.reduce(result_indicies, 1, fn i, acc ->
      acc * Enum.at(my_ticket_numbers, i)
    end)

  end

  defp find_descriptions([], result), do: result


  defp find_descriptions(candidates, result) do

    find_1_match = candidates
      |> Enum.filter(fn {_, _, cols} -> Enum.count(cols) == 1 end)

    rest = Enum.map(candidates, fn {i, t, cols} ->
             new_cols = remove_matched(cols, find_1_match)
             {i, t, new_cols}
          end)
        |> Enum.reject(fn {_, _, r} -> r == [] end)


    find_descriptions(rest, result ++ find_1_match)
  end



  defp remove_matched(t, cols) do
    Enum.reduce(cols, [], fn {_, _, labels}, acc ->
       acc ++ (t -- labels)
    end)
  end

  defp decode_tickets(tickets, ranges) do
    tickets
    |> transpose()
    |> Enum.with_index()
    |> Enum.map(fn {tcell, index} ->
      {index, tcell, find_match_ranges(tcell, ranges)}
    end)

  end

  defp find_match_ranges(tcell, ranges) do
    ranges
    |> Enum.reduce([], fn [d, r1, r2], acc ->
      case find_if_match(tcell, r1, r2) do
        true -> [d | acc]
        false -> acc
      end
    end)
  end

  defp find_if_match(tcell, r1, r2) do
    [r11, r12] = r1
    [r21, r22] = r2
    res = Enum.reduce(tcell, true, fn tc, acc ->
      acc && ((tc >= r11 && tc <= r12) || (tc >= r21 && tc <= r22))
    end)

    res
  end


  defp drop_invalid(tickets, ranges) do
    tickets
    |> Enum.reduce([], fn ticket, acc ->
      case all_in_range(ticket, ranges) do
        true -> acc ++ [ticket]
        false -> acc
      end
    end)
  end

  defp all_in_range(ticket, ranges) do
    Enum.reduce(ticket, true, fn x, acc ->
      case is_in_range(x, ranges) do
        true -> acc
        false -> false
      end
    end)
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
      [_, first, second] = Regex.run(~r/^[\w\s]*\:\s(?<f>\d*-\d*)\sor\s(?<s>\d*-\d*)$/, line)
      [parse_range(first), parse_range(second) | acc]
    end)
  end

  defp parse_instructions_with_description(text) do
    String.split(text, "\n")
    |> Enum.reduce([], fn line, acc ->
      [_, desc, r1, r2] = Regex.run(~r/^(?<row>[\w\s]*)\:\s(?<f>\d*-\d*)\sor\s(?<s>\d*-\d*)$/, line)
      [[desc, parse_range(r1), parse_range(r2)] | acc]
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

  def transpose([]), do: []
  def transpose([[]|_]), do: []
  def transpose(a), do: [Enum.map(a, &hd/1) | transpose(Enum.map(a, &tl/1))]
end
