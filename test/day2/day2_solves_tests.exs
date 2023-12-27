defmodule Day2SolvesTest do
  @moduledoc """
  This module contains tests for the Day2 module.
  """

  use ExUnit.Case
  doctest AdventOfCode2023

  test "solves the day 2 part II puzzle correctly" do
    assert AdventOfCode2023.day2_solve_part_2("./test/day2/mocks/part2-test-case.txt") == 8
  end
end
