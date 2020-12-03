defmodule Aoc.DayThree do

  def part_one(file_path) do
    lines = get_input_list(file_path)

    matrix = lines
    |> Enum.map(fn l -> String.graphemes(l) end)
    |> Matrix.from_list()

    max_r = Enum.count(lines)
    max_c = String.length(Enum.at(lines, 0))

    do_count(matrix, 0, 0, 0, max_r, max_c, 1, 3)
  end

  def part_two(file_path) do
    lines = get_input_list(file_path)

    matrix = lines
    |> Enum.map(fn l -> String.graphemes(l) end)
    |> Matrix.from_list()

    max_r = Enum.count(lines)
    max_c = String.length(Enum.at(lines, 0))

    c1 = do_count(matrix, 0, 0, 0, max_r, max_c, 1, 1)
    c2 = do_count(matrix, 0, 0, 0, max_r, max_c, 1, 3)
    c3 = do_count(matrix, 0, 0, 0, max_r, max_c, 1, 5)
    c4 = do_count(matrix, 0, 0, 0, max_r, max_c, 1, 7)
    c5 = do_count(matrix, 0, 0, 0, max_r, max_c, 2, 1)

    c1 * c2 * c3 * c4 * c5
  end

  defp do_count(mat, r, c, sum, max_r, max_c, dr, dc) when r < max_r do
    case mat[r][c] do
      "." -> do_count(mat, r + dr, rem(c + dc, max_c), sum, max_r, max_c, dr, dc)
      "#" -> do_count(mat, r + dr, rem(c + dc, max_c), sum + 1, max_r, max_c, dr, dc)
    end
  end

  defp do_count(_mat, _r, _c, sum, _max_r, _max_c, _, _) do
    sum
  end


  defp get_input_list(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n")
  end

end


defmodule Matrix do
  def from_list(list) when is_list(list) do
    do_from_list(list)
  end

  defp do_from_list(list, map \\ %{}, index \\ 0)
  defp do_from_list([], map, _index), do: map
  defp do_from_list([h|t], map, index) do
    map = Map.put(map, index, do_from_list(h))
    do_from_list(t, map, index + 1)
  end
  defp do_from_list(other, _, _), do: other
end
