defmodule Aoc.DayThirteen do

  def part_one(file_path) do
    {timestamp, buses} = get_input_list(file_path)

    {id, ts} = buses
    |> Enum.map(fn b -> get_next(b, timestamp) end)
    |> Enum.sort(fn {_, v1}, {_, v2} -> v1 < v2 end )
    |> List.first()

    (ts - timestamp) * id
  end

  def part_two(file_path) do
    file_path
    |> get_buses()
    |> Enum.reduce(fn {bus, offset}, {an, ao} ->
      n = find_t({bus, reminder(bus, offset)}, {an, ao})
      {an * bus, n * an + ao}
    end)
    |> elem(1)
  end

  def reminder(bus, offset), do: rem(bus * offset - offset, bus)

  def find_t(cur, acc) do
    Enum.find(Stream.iterate(1, fn x -> x + 1 end), fn x -> match?(x, cur, acc) end)
  end

  def match?(x, {bus, reminder}, {an, ao}), do: rem(an * x + ao, bus) == reminder

  defp get_buses(file_path) do
    list = file_path
    |> File.read!()
    |> String.split("\n")

    Enum.at(list, 1)
    |> String.split(",")
    |> Enum.with_index()
    |> Enum.reject(fn {id, _} -> id == "x" end)
    |> Enum.map(fn {id, index} -> {String.to_integer(id), index} end)

  end

  defp get_next(bus, timestamp) do
    do_get_next(bus, timestamp, 0, 1)
  end

  # defp do_get_next(bus, timestamp, value, _) when timestamp >= value, do: bus
  defp do_get_next(bus, timestamp, value, n) do
    if timestamp > value do
      do_get_next(bus, timestamp, bus * (n + 1), n + 1)
    else
      {bus, value}
    end
  end


  defp get_input_list(file_path) do
    list = file_path
    |> File.read!()
    |> String.split("\n")

    # TODO: don't know why the fake file adds a new line and I cannot pattern match on it
    timestamp = Enum.at(list, 0)
    buses = Enum.at(list, 1)

    available_buses = buses
    |> String.split(",")
    |> Enum.reject(fn b -> b =="x" end)
    |> Enum.map(&String.to_integer/1)

    {String.to_integer(timestamp), available_buses}
  end
end
