defmodule Day1Test do
  @moduledoc """
  This module contains tests for the Day1 module.
  """

  use ExUnit.Case
  doctest Day1

  test "finds first and last number from array" do
    assert Day1.find_first_and_last_number("1abc2") == {1, 2}
  end

  test "opens file and writes each line to a list of strings" do
    assert Day1.parse_file("./lib/day1/mocks/lines_of_text.txt", :string) == [
             "first line of the file",
             "second line of the file",
             "third line of the file"
           ]
  end
end
