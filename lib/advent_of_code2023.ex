defmodule AdventOfCode2023 do
  @moduledoc """
  Documentation for `AdventOfCode2023`.
  """

  # Day 1
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

  # Day 2
  def day2_solve_part2(input_file_path) do
    # games_list = Day1.parse_file(input_file_path)
    # accumulator = %{}

    # Enum.reduce(games_list, accumulator, fn game, accumulator ->
    #   game_number = Day2.parse_game_number(game)
    #   game_sets = Day2.parse_game_sets(game)
    #   set_validity_list = Enum.map(game_sets, &Day2.validate_set(&1, 13))

    #   Map.put(accumulator, game_number, game_set_amounts_sum)
    # end)
  end
end
