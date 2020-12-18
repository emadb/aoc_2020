defmodule  Aoc.DaySeventeen do
  def part_one(file_path) do
    cells = get_initial_cells(file_path)

    final_state = cells
    |> get_next_generation()
    |> Enum.uniq()
    |> get_next_generation()
    |> Enum.uniq()
    |> get_next_generation()
    |> Enum.uniq()
    |> get_next_generation()
    |> Enum.uniq()
    |> get_next_generation()
    |> Enum.uniq()
    |> get_next_generation()
    |> Enum.uniq()

    Enum.count(final_state)

  end

  defp get_next_generation(live_cells) do
    alive = Enum.reduce(live_cells, [], fn {x, y, z}, acc ->
      neighbords = get_neighbords({x, y, z})
      case count_active(live_cells, neighbords) do
        2 -> [{x, y, z}] ++ acc
        3 -> [{x, y, z}] ++ acc
        _ -> acc
      end
    end)
    newborns = Enum.reduce(live_cells, [], fn {x, y, z}, acc ->
      neighbords = get_neighbords({x, y, z})
      acc ++ get_newborns(neighbords -- live_cells, live_cells)
    end)

    alive ++ newborns
  end

  defp get_newborns(dead_cells, live_neighbords) do
    Enum.reduce(dead_cells, [], fn {x, y, z}, acc ->
      neighbords_coord = get_neighbords({x, y, z})
      case count_active(live_neighbords, neighbords_coord) do
        3 -> [{x, y, z}] ++ acc
        _ -> acc
      end
    end)
  end

  defp count_active(cells, neighbords) do
    Enum.reduce(neighbords, 0, fn n, acc ->
      if Enum.member?(cells, n) do
        acc + 1
      else
        acc
      end
    end)
  end

  def get_neighbords({x, y, z}) do
    for xx <- x-1..x+1, yy <- y-1..y+1, zz <- z-1..z+1, {x, y, z} != {xx, yy, zz} do
      {xx, yy, zz}
    end
  end


  defp get_initial_cells(file_path) do
    file_path
    |> get_input_list()
    |> Enum.with_index()
    |> Enum.flat_map(fn {x, i} ->
        String.graphemes(x)
        |> Enum.with_index()
        |> Enum.map(fn {y, j} -> {j, i, 0, y} end)
      end)
    |> Enum.reject(fn {_, _, _, v} -> v == "." end)
    |> Enum.map(fn {x, y, z, _} -> {x, y, z} end)
  end

  defp get_input_list(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n")
  end
end
