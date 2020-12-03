defmodule Aoc.DayThree do

  def part_one(file_path) do
    lines = get_input_list(file_path)

    matrix = lines
    |> Enum.map(fn l -> String.graphemes(l) end)
    |> Matrix.from_list()

    max_r = Enum.count(lines)
    max_c = String.length(Enum.at(lines, 0))


    counter(matrix, matrix[0][0], 0, 0, 0, max_r, max_c)

    # for r <- 0..max_r do
    #   case matrix[r][0] do
    #     "." -> 0
    #     "#" -> 1
    #   end
    # end

  end

  defp counter(mat, ".", r, c, sum, max_r, max_c) when r < max_r do
    counter(mat, mat[r + 1][rem(c + 3, max_c)], r + 1, c + 3, sum, max_r, max_c)
  end

  defp counter(mat, "#", r, c, sum, max_r, max_c) when r < max_r do
    counter(mat, mat[r + 1][rem(c + 3, max_c)], r + 1, c + 3, sum + 1, max_r, max_c)
  end

  defp counter(_mat, _s, _r, _c, sum, _max_r, _max_c) do
    sum
  end

  def part_two(file_path) do

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
