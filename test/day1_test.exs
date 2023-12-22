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
    assert Day1.parse_file("./test/mocks/lines_of_text.txt") == [
             "first line of the file",
             "second line of the file",
             "third line of the file"
           ]
  end

  test "parses list of strings into first and last number tuples" do
    list = Day1.parse_file("./test/mocks/lines_of_text_w_numbers.txt")

    assert Day1.parse_list_to_first_last_numbers(list) == [
             {1, 3},
             {4, 6},
             {7, 9}
           ]
  end

end
