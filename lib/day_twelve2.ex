defmodule Aoc.DayTwelve2 do

  def part_two(file_path) do
    cmds = file_path
    |> get_input_list()
    |> Enum.map(&parse_command/1)

    {{sx, sy}, _} = execute_commands(cmds, {0,0}, {10,1})
    abs(sx) + abs(sy)
  end

  defp execute_command({"N", value}, ship, {x, y}), do: {ship, {x, y + value}}
  defp execute_command({"S", value}, ship, {x, y}), do: {ship, {x, y - value}}
  defp execute_command({"E", value}, ship, {x, y}), do: {ship, {x + value, y}}
  defp execute_command({"W", value}, ship, {x, y}), do: {ship, {x - value, y}}

  defp execute_command({"L", 90}, ship, {x, y}), do: {ship, {-y, x}}
  defp execute_command({"L", 180}, ship, {x, y}), do: {ship, {-x, -y}}
  defp execute_command({"L", 270}, ship, {x, y}), do: {ship, {y, -x}}

  defp execute_command({"R", 90}, ship, {x, y}), do: {ship, {y, -x}}
  defp execute_command({"R", 180}, ship, {x, y}), do: {ship, {-x, -y}}
  defp execute_command({"R", 270}, ship, {x, y}), do: {ship, {-y, x}}

  defp execute_command({"F", value}, {x, y}, {wx, wy} = wp), do: {{x + (wx * value), y + (wy * value)}, wp}


  defp execute_commands([cmd | rest], ship, wp) do
    {new_ship, new_wp} = execute_command(cmd, ship, wp)
    execute_commands(rest, new_ship, new_wp)
  end

  defp execute_commands([], ship, wp) do
    {ship, wp}
  end

  defp parse_command(cmd) do
    [_, cmd, value] = Regex.run(~r/^(?<cmd>[NSEWLRF])(?<value>\d*)$/, cmd)
    {cmd, String.to_integer(value)}
  end

  defp get_input_list(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n")

  end
end
