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
  def day2_solve_part_1(input_file_path, max_cube_map) do
    games_list = Day1.parse_file(input_file_path)
    accumulator = %{}

    games_list_with_validity =
      Enum.reduce(games_list, accumulator, fn game, accumulator ->
        # For each game...
        game_number = Day2.parse_game_number(game)
        game_sets = Day2.parse_game_sets(game)

        set_validity_list =
          Enum.map(game_sets, fn set ->
            Day2.validate_set_by_colour_and_amount(set, max_cube_map)
          end)

        all_sets_valid = Enum.all?(set_validity_list)
        Map.put(accumulator, game_number, all_sets_valid)
      end)

    valid_ids_strs =
      Map.filter(games_list_with_validity, fn {_key, value} ->
        value == true
      end)

    valid_id_ints =
      Map.keys(valid_ids_strs)
      |> Enum.reduce([], fn x, acc ->
        id_integer = String.to_integer(x)
        [id_integer | acc]
      end)

    Enum.sum(valid_id_ints)
  end
end
