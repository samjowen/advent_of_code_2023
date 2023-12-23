defmodule AdventOfCode2023 do
  @moduledoc """
  Documentation for `AdventOfCode2023`.
  """

  def day1_solve_part_1(input_file_path) do
    Day1.parse_file(input_file_path)
    |> Enum.map(&Day1.combine_first_and_last_number/1)
    |> Enum.sum()
  end

  def day1_solve_part_2(input_file_path) do
    Day1.parse_file(input_file_path)
    |> Enum.map(&Day1.convert_substrings_to_integer_strings/1)
    |> Enum.map(&Day1.combine_first_and_last_number/1)
    |> Enum.sum()
  end
end
