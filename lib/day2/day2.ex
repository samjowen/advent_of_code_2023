defmodule Day2 do
  @moduledoc """
  Documentation for `AdventOfCode2023`.
  """

  def parse_game_number(game_string) do
    String.split(game_string, " ", trim: true)
    |> Enum.take(2)
    |> List.last()
    |> String.replace(":", "")
  end

  def parse_game_sets(game_string) do
    Regex.replace(~r/\bGame (\d+):\s/, game_string, "")
    |> String.split(";")
    |> Enum.map(&String.trim/1)
  end

  def parse_game_set_amounts(set_string) do
    initial_cube_map = %{
      :red => 0,
      :green => 0,
      :blue => 0
    }

    cube_list = String.split(set_string, ",")

    Enum.reduce(cube_list, initial_cube_map, fn cube, acc ->
      acc
      |> (fn acc ->
            case String.contains?(cube, "red") do
              true -> Map.put(acc, :red, extract_integer(cube))
              _ -> acc
            end
          end).()
      |> (fn acc ->
            case String.contains?(cube, "green") do
              true -> Map.put(acc, :green, extract_integer(cube))
              _ -> acc
            end
          end).()
      |> (fn acc ->
            case String.contains?(cube, "blue") do
              true -> Map.put(acc, :blue, extract_integer(cube))
              _ -> acc
            end
          end).()
    end)
  end

  def remove_non_digits(str) do
    Regex.replace(~r/\D/, str, "")
  end

  def extract_integer(string) do
    remove_non_digits(string) |> String.to_integer()
  end

  def sum_map(map) do
    Map.values(map) |> Enum.sum()
  end

  def validate_set(game_set_string, cube_limit) do
    cube_map = parse_game_set_amounts(game_set_string)

    case sum_map(cube_map) > cube_limit do
      true -> false
      false -> true
    end
  end

  def validate_set_by_colour_and_amount(game_set_string, cube_map) do
    # cube_map will be in the shape of a %{:red => x, :blue => y...}
    set_cube_map = parse_game_set_amounts(game_set_string)
    IO.inspect(set_cube_map)
    cube_map_keys = Map.keys(cube_map)

    accumulated_list = []
    # Note: this is how we can track the valid/invalid cube numbers in the future,
    # we don't have to for now, but we might need to in the future.
    # validity_list = Enum.reduce(cube_map_keys, accumulated_list, fn cube_colour, accumulated_list ->
    #   [{cube_colour, set_cube_map[cube_colour] > cube_map[cube_colour]} | accumulated_list]
    # end)

    # Thus, for now, I am just going to return a boolean list, if any of them are false, I'm just going to
    # say that the set is invalid.

    validity_list =
      Enum.reduce(cube_map_keys, accumulated_list, fn cube_colour, accumulated_list ->
        IO.inspect(cube_colour)
        [set_cube_map[cube_colour] >= cube_map[cube_colour] | accumulated_list]
      end)

    IO.inspect(validity_list)

    Enum.all?(validity_list)
  end
end
