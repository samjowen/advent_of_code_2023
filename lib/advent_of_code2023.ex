defmodule AdventOfCode2023 do
  @moduledoc """
  Documentation for `AdventOfCode2023`.
  """

  @spec day1_solve_part_1(
          binary()
          | maybe_improper_list(
              binary() | maybe_improper_list(any(), binary() | []) | char(),
              binary() | []
            )
        ) :: number()
  def day1_solve_part_1(input_file_path) do
    string_list = Day1.parse_file(input_file_path)
    number_list = Enum.map(string_list, &Day1.combine_first_and_last_number/1)
    Enum.sum(number_list)
  end

  def day1_solve_part_2(input_file_path) do
    # Variables that we need:
    replacement_map = %{
      "zero" => "0",
      "one" => "1",
      "two" => "2",
      "three" => "3",
      "four" => "4",
      "five" => "5",
      "six" => "6",
      "seven" => "7",
      "eight" => "8",
      "nine" => "9"
    }

    string_list = Day1.parse_file(input_file_path)

    replaced_number_list =
      Enum.map(string_list, &Day1.replace_substrings(&1, replacement_map))

    number_list = Enum.map(replaced_number_list, &Day1.combine_first_and_last_number/1)

    Enum.sum(number_list)
  end
end
