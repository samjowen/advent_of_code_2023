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

    reversed_replacement_map = %{
      "orez" => "0",
      "eno" => "1",
      "owt" => "2",
      "eerht" => "3",
      "ruof" => "4",
      "evif" => "5",
      "xis" => "6",
      "neves" => "7",
      "thgie" => "8",
      "enin" => "9"
    }

    string_list = Day1.parse_file(input_file_path)

    reversed_string_list =
      Enum.map(string_list, &String.reverse/1)

    IO.inspect(reversed_string_list)

    replaced_number_list =
      Enum.map(string_list, &Day1.replace_substrings(&1, replacement_map))

    replaced_number_list_reversed =
      Enum.map(reversed_string_list, &Day1.replace_substrings(&1, reversed_replacement_map))

    IO.inspect(replaced_number_list_reversed)

    first_numbers =
      Enum.map(replaced_number_list, &Day1.find_first_number/1)

    last_numbers =
      Enum.map(replaced_number_list_reversed, &Day1.find_first_number/1)

    number = Enum.zip(first_numbers, last_numbers)

    IO.inspect(number)

    number_list = Enum.map(replaced_number_list, &Day1.combine_first_and_last_number/1)
    IO.inspect(number_list)
    Enum.sum(number_list)
  end
end
