defmodule Day1SolvesTest do
  @moduledoc """
  This module contains tests for the Day1 module.
  """

  use ExUnit.Case
  doctest AdventOfCode2023

  test "solves the day 1 part I puzzle correctly" do
    assert AdventOfCode2023.day1_solve_part_1("./test/day1/mocks/part1-test-case.txt") == 142
  end

  test "solves the day 1 part II puzzle correctly" do
    assert AdventOfsCode2023.day1_solve_part_2("./test/day1/mocks/part1-test-case.txt") == 281
  end
end
