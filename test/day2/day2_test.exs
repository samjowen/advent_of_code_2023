defmodule Day2Test do
  @moduledoc """
  This module contains tests for the Day1 module.
  """

  use ExUnit.Case
  doctest AdventOfCode2023

  test "it finds the game number from the game strings" do
    game_string =
      "Game 1: 7 red, 14 blue; 2 blue, 3 red, 3 green; 4 green, 12 blue, 15 red; 3 green, 12 blue, 3 red; 11 red, 2 green"

    large_game_string = "Game 999: 8 red"
    assert Day2.parse_game_number(game_string) == "1"
    assert Day2.parse_game_number(large_game_string) == "999"
  end

  test "it parses the sets from a game string" do
    game_string =
      "Game 1: 7 red, 14 blue; 2 blue, 3 red, 3 green; 4 green, 12 blue, 15 red; 3 green, 12 blue, 3 red; 11 red, 2 green"

    assert Day2.parse_game_sets(game_string) == [
             "7 red, 14 blue",
             "2 blue, 3 red, 3 green",
             "4 green, 12 blue, 15 red",
             "3 green, 12 blue, 3 red",
             "11 red, 2 green"
           ]
  end

  test "it parses a game set to produce a map of red, green and blue amounts" do
    set_string = "7 red, 14 blue, 8 green"

    assert Day2.parse_game_set_amounts(set_string) == %{
             :red => 7,
             :green => 8,
             :blue => 14
           }
  end

  test "it extracts integer from a string" do
    assert Day2.extract_integer("21 meow 21") == 2121
  end

  test "it adds the values of a map together" do
    map = %{
      :red => 7,
      :green => 8,
      :blue => 14
    }

    assert Day2.sum_map(map) == 29
  end

  test "it tests if a game set string has exactly the cube limit" do
    cube_limit = 29

    # 29 cubes
    twenty_nine_cube_set_str = "7 red, 14 blue, 8 green"

    assert Day2.validate_set(twenty_nine_cube_set_str, cube_limit) == true
  end

  test "it tests if a game set string has less than the cube limit" do
    cube_limit = 29

    # 28 cubes
    twenty_eight_cube_set_str = "7 red, 14 blue, 7 green"

    assert Day2.validate_set(twenty_eight_cube_set_str, cube_limit) == true
  end

  test "it tests if a game set string has more than the cube limit" do
    cube_limit = 29

    # 30 cubes
    thirty_cube_set_str = "7 red, 15 blue, 8 green"

    assert Day2.validate_set(thirty_cube_set_str, cube_limit) == false
  end

  test "it tests if a game set string with cubes in different order is valid" do
    cube_limit = 29

    # 29 cubes, different order
    different_order_set_str = "14 blue, 7 red, 8 green"

    assert Day2.validate_set(different_order_set_str, cube_limit) == true
  end

  test "it tests if a game set string missing a color is valid" do
    cube_limit = 29

    # 21 cubes, missing green
    missing_color_set_str = "7 red, 14 blue"

    assert Day2.validate_set(missing_color_set_str, cube_limit) == true
  end

  test "it tests if a game set string missing a color and exceeding the limit is invalid" do
    cube_limit = 29

    # 30 cubes, missing green
    missing_color_exceeding_limit_set_str = "15 red, 15 blue"

    assert Day2.validate_set(missing_color_exceeding_limit_set_str, cube_limit) == false
  end

  test "it can validate an invalid game set by the number of cubes and their colurs" do
    thirty_cube_set_str = "7 red, 15 blue, 8 green"

    max_cubes = %{
      :red => 6,
      :blue => 14,
      :green => 7
    }

    assert Day2.validate_set_by_colour_and_amount(thirty_cube_set_str, max_cubes) == false
  end

  test "it can validate an invalid game set by the number of cubes and their colours" do
    game_set_string = "12 red, 12 blue, 15 green"

    cube_map = %{
      :red => 7,
      :green => 13,
      :blue => 14
    }

    assert Day2.validate_set_by_colour_and_amount(game_set_string, cube_map) == false
  end

  test "it can validate an invalid game set with missing cube colour in set string" do
    thirty_cube_set_str = "7 red, 15 blue"

    max_cubes = %{
      :red => 6,
      :blue => 14,
      :green => 7
    }

    assert Day2.validate_set_by_colour_and_amount(thirty_cube_set_str, max_cubes) == false
  end

  test "it can validate a valid game set with missing cube colour in set string" do
    thirty_cube_set_str = "5 red, 13 blue"

    max_cubes = %{
      :red => 6,
      :blue => 14,
      :green => 7
    }

    assert Day2.validate_set_by_colour_and_amount(thirty_cube_set_str, max_cubes) == true
  end

  test "returns the maximum number of cubes for a specified color" do
    game_1_sets = [
      %{red: 4, green: 0, blue: 3},
      %{red: 1, green: 2, blue: 6},
      %{red: 0, green: 2, blue: 0}
    ]

    assert Day2.get_max_cubes(game_1_sets, :blue) == 6
    assert Day2.get_max_cubes(game_1_sets, :red) == 4
    assert Day2.get_max_cubes(game_1_sets, :green) == 2
  end

  test "returns the power of a set of cubes" do
    # The power of a set of cubes is equal to the numbers of red, green, and blue cubes multiplied together.
    game_1_string = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"
    assert Day2.get_power_of_set(game_1_string) == 48
  end
end
