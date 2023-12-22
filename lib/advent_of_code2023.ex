defmodule AdventOfCode2023 do
  @moduledoc """
  Documentation for `AdventOfCode2023`.
  """

  @spec day1_solve() :: number()
  def day1_solve() do
    string_list = Day1.parse_file("lib/day1/data/input.txt")

    number_list = Day1.parse_list_to_first_last_numbers(string_list)

    summed_tuple_list = Enum.map(number_list, &Tuple.sum/1)

    Enum.sum(summed_tuple_list)
  end
end
