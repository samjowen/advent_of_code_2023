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
    string_list = Day1.parse_file(input_file_path)

    replaced_number_list =
      Enum.map(string_list, &Day1.convert_substrings_to_integer_strings/1)

    number_list = Enum.map(replaced_number_list, &Day1.combine_first_and_last_number/1)
    IO.inspect(number_list)
    Enum.sum(number_list)
  end
end
