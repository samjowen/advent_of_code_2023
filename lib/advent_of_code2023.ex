defmodule AdventOfCode2023 do
  @moduledoc """
  Documentation for `AdventOfCode2023`.
  """

  @spec day1_solve_part_1() :: number()
  def day1_solve_part_1() do
    string_list = Day1.parse_file("lib/day1/data/input.txt")
    replaced_number_list = Enum.map(string_list, &Day1.find_first_and_last_number/1)

    number_list = Enum.map(string_list, &Day1.combine_first_and_last_number/1)

    Enum.sum(number_list)
  end

  def day1_solve_part_2() do
    string_list = Day1.parse_file("lib/day1/data/input.txt")
    replaced_number_list = Enum.map(string_list, &Day1.convert_word_to_integer_string/1)
    number_list = Enum.map(replaced_number_list, &Day1.combine_first_and_last_number/1)
    Enum.sum(number_list)
  end
end
