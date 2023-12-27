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
end
