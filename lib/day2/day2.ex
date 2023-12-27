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
end
