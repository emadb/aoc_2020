defmodule Aoc.DayFourteen do
  def part_one(file_path) do
    cmds = file_path
    |> get_input_list()

    final_state = execute_commands(cmds, %{mask: "", mem: %{}})

    Enum.reduce(final_state.mem, 0, fn {_k, v} , acc ->
      acc + Integer.undigits(v, 2)
    end)
  end

  def part_two(file_path) do
    cmds = file_path
    |> get_input_list()

    final_state = execute_commands_decoder(cmds, %{mask: "", mem: %{}})

    Enum.reduce(final_state.mem, 0, fn {_k, v} , acc ->
      acc + Integer.undigits(v, 2)
    end)
  end

  defp execute_commands_decoder([cmd | rest], state) do
    new_state = case parse_cmd(cmd) do
      {:mask, value} -> %{state | mask: value}
      {:mem, addr, value} ->
        new_value = get_new_value_decoder(value, state.mask)
        addresses = get_addresses(addr, state.mask)

        Enum.reduce(addresses, state, fn a, state ->
          mem_addr = Integer.undigits(a, 2) |> to_string()
          %{state | mem: Map.put(state.mem, mem_addr, new_value)}
        end)

    end

    execute_commands_decoder(rest, new_state)
  end

  defp execute_commands_decoder([], state) do
    state
  end

  defp get_addresses(addr, mask) do
    addr
    |> String.to_integer()
    |> Integer.digits(2)
    |> fill_to_36()
    |> Enum.with_index()
    |> Enum.map(fn {v, i} ->
      case Enum.at(mask, i) do
        "X" -> "X"
        1 -> 1
        0 -> v
      end
    end)
    |> float_address()
  end

  def float_address(["X" | rest]) do
    rest_float = float_address(rest)
    Enum.flat_map(rest_float, fn x -> [[0 | x], [1 | x]] end)
  end

  def float_address([n | rest]) do
    rest_float = float_address(rest)
    Enum.map(rest_float, fn x -> [n | x] end)
  end
  def float_address([]), do: [[]]

  defp get_new_value_decoder(value, mask) do
    value
    |> Enum.with_index()
    |> Enum.map(fn {v, i} ->
      case Enum.at(mask, i) do
        "X" -> v
        mv -> v
      end
    end)
  end


  defp get_new_value(value, mask) do
    value
    |> Enum.with_index()
    |> Enum.map(fn {v, i} ->
      case Enum.at(mask, i) do
        "X" -> v
        mv -> mv
      end
    end)
  end

  defp execute_commands([cmd | rest], state) do
    new_state = case parse_cmd(cmd) do
      {:mask, value} -> %{state | mask: value}
      {:mem, addr, value} ->
        new_value = get_new_value(value, state.mask)
        %{state | mem: Map.put(state.mem, addr, new_value)}
    end

    execute_commands(rest, new_state)
  end

  defp execute_commands([], state) do
    state
  end

  defp parse_cmd("mask = " <> <<mask :: binary-size(36)>>), do: {:mask, parse_mask(mask)}
  defp parse_cmd(cmd) do
    [_, addr, value] = Regex.run(~r/^mem\[(?<addr>\d*)\]\s=\s(?<value>\d*)?/, cmd)
    binary_value = Integer.digits(String.to_integer(value), 2)
    {:mem, addr, fill_to_36(binary_value)}
  end

  defp fill_to_36(a) when length(a) < 36, do: fill_to_36([0] ++ a)
  defp fill_to_36(a), do: a

  def parse_mask(""), do: []
  def parse_mask(<<"0", rest::binary>>), do: [0 | parse_mask(rest)]
  def parse_mask(<<"1", rest::binary>>), do: [1 | parse_mask(rest)]
  def parse_mask(<<"X", rest::binary>>), do: ["X" | parse_mask(rest)]

  defp get_input_list(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n")
  end

end
