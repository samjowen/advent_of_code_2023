defmodule Day2SolvesTest do
  @moduledoc """
  This module contains tests for the Day2 module.
  """

  use ExUnit.Case
  doctest AdventOfCode2023

  test "solves the day 2 part 1 puzzle correctly" do
    max_cube_map = %{
      :red => 12,
      :green => 13,
      :blue => 14
    }

    assert AdventOfCode2023.day2_solve_part_1(
             "./test/day2/mocks/part-2-test-case.txt",
             max_cube_map
           ) == 8
  end
end
