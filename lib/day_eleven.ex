defmodule Aoc.DayEleven do
  def part_one(file_path) do
    lines = get_input_list(file_path)

    matrix = lines
    |> Enum.map(fn l -> String.graphemes(l) end)
    |> Matrix.from_list()

    rows = Enum.count(matrix)
    columns = Enum.count(matrix[0])

    matrix
    |> process_matrix(rows, columns, 0)
    |> count_busy_seats()
  end

  def part_two(file_path) do
    lines = get_input_list(file_path)

    matrix = lines
    |> Enum.map(fn l -> String.graphemes(l) end)
    |> Matrix.from_list()

    rows = Enum.count(matrix)
    columns = Enum.count(matrix[0])

    matrix
    |> process_matrix_2(rows, columns, 0)
    |> count_busy_seats()
  end

  defp process_matrix_2(matrix, rows, columns, n) do

    res = for r <- 0..rows-1, c <- 0..columns-1 do
      occ_seats = count_occupied_seats_extended(matrix, r, c)

      new_state = cond do
        matrix[r][c] == "L" && occ_seats == 0 -> "#"
        matrix[r][c] == "#" && occ_seats >= 5 -> "L"
        true -> matrix[r][c]
      end
      {r, c, new_state}
    end

    new_matrix = build_matrix(res)

    if (new_matrix == matrix) do
      new_matrix
    else
      process_matrix_2(new_matrix, rows, columns, n + 1)
    end
  end

  defp count_occupied_seats_extended(matrix, row, column) do
    dirs = [
      {0,1}, {0,-1}, {1,0}, {-1,0},
      {1,1}, {1,-1},{-1,1},{-1,-1}
    ]
    Enum.map(dirs, fn dir -> find_seat(matrix, {row, column}, dir) end)
    |> Enum.filter(fn s -> s == "#" end)
    |> Enum.count
  end

  defp find_seat(matrix, {row, col}, {row_d, col_d}) do
    if matrix[row + row_d][col + col_d] == "." do
      find_seat(matrix, {row + row_d, col + col_d}, {row_d, col_d})
    else
      matrix[row + row_d][col + col_d]
    end
  end

  defp process_matrix(matrix, rows, columns, n) do

    res = for r <- 0..rows-1, c <- 0..columns-1 do
      occ_seats = count_occupied_seats(matrix, r, c, rows, columns)

      new_state = cond do
        matrix[r][c] == "L" && occ_seats == 0 -> "#"
        matrix[r][c] == "#" && occ_seats >= 4 -> "L"
        true -> matrix[r][c]
      end
      {r, c, new_state}
    end

    new_matrix = build_matrix(res)

    if (new_matrix == matrix) do
      new_matrix
    else
      process_matrix(new_matrix, rows, columns, n + 1)
    end
  end

  defp build_matrix(list) do
    Enum.reduce(list, %{}, fn {r, c, v}, acc ->
      new_acc = if is_nil(acc[r]), do: put_in(acc, [r], %{}), else: acc
      put_in(new_acc, [r, c], v)
    end)
  end

  defp count_busy_seats(matrix) do
    rows = Enum.count(matrix)
    columns = Enum.count(matrix[0])

    seats = for r <- 0..rows-1, c <- 0..columns-1 do
      case matrix[r][c] do
        "#" -> 1
        _ -> 0
      end
    end

    seats
    |> Enum.reduce(0, fn x, acc -> x + acc end)
  end

  defp count_occupied_seats(matrix, r, c, w, h) do

    l_r = max(0, r-1)
    h_r = min(w, r+1)
    l_c = max(0, c-1)
    h_c = min(h, c+1)

    seats = for i <- l_r..h_r, j <- l_c..h_c do
      case matrix[i][j] do
        "#" -> if i == r && j == c, do: 0, else: 1
        _ -> 0
      end
    end
    seats
    |> Enum.reduce(0, fn x, acc -> x + acc end)

  end

  defp get_input_list(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n")
  end
end
