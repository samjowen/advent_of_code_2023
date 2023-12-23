defmodule Day1SolvesTest do
  @moduledoc """
  This module contains tests for the Day1 module.
  """

  use ExUnit.Case
  doctest Day1Solves


  test "solves the day 1 part II puzzle correctly" do
    assert AdventOfCode2023.day1_solve_part_2("./mocks/day1/part2-test-case.txt") == 281
  end
