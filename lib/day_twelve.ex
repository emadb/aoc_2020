defmodule Aoc.DayTwelve do

  @directions [0, 90, 180, 270]

  def part_one(file_path) do
    cmds = file_path
    |> get_input_list()
    |> Enum.map(&parse_command/1)

    {x, y, _} = execute_commands(cmds, {0,0, 90})
    IO.inspect {x, y}, label: "XY"
    abs(x) + abs(y)
  end

  defp execute_command({"N", value}, {x, y, d}), do: {x, y + value, d}
  defp execute_command({"S", value}, {x, y, d}), do: {x, y - value, d}
  defp execute_command({"E", value}, {x, y, d}), do: {x + value, y, d}
  defp execute_command({"W", value}, {x, y, d}), do: {x - value, y, d}

  defp execute_command({"L", value}, {x, y, d}) do
    rotation = rem(div(d-value, 90), 4)
    {x, y, Enum.at(@directions, rotation) }
  end

  defp execute_command({"R", value}, {x, y, d}) do
    rotation = rem(div(d+value, 90), 4)
    {x, y, Enum.at(@directions, rotation) }
  end

  defp execute_command({"F", value}, {x, y, 0}), do: execute_command({"N", value}, {x, y, 0})
  defp execute_command({"F", value}, {x, y, 90}), do: execute_command({"E", value}, {x, y, 90})
  defp execute_command({"F", value}, {x, y, 180}), do: execute_command({"S", value}, {x, y, 180})
  defp execute_command({"F", value}, {x, y, 270}), do: execute_command({"W", value}, {x, y, 270})

  defp execute_command({"B", value}, {x, y, 0}), do: execute_command({"S", value}, {x, y, 0})
  defp execute_command({"B", value}, {x, y, 90}), do: execute_command({"W", value}, {x, y, 90})
  defp execute_command({"B", value}, {x, y, 180}), do: execute_command({"N", value}, {x, y, 180})
  defp execute_command({"B", value}, {x, y, 270}), do: execute_command({"E", value}, {x, y, 270})


  defp execute_commands([cmd | rest], state) do
    new_state = execute_command(cmd, state)
    execute_commands(rest, new_state)
  end

  defp execute_commands([], state) do
    state
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
