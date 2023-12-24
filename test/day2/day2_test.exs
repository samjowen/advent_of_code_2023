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
end
