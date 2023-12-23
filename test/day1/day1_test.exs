defmodule Day1Test do
  @moduledoc """
  This module contains tests for the Day1 module.
  """

  use ExUnit.Case
  doctest Day1

  test "finds first and last number from array" do
    assert Day1.find_first_and_last_number("1abc2") == {1, 2}
  end

  test "combines first and last number from array" do
    assert Day1.combine_first_and_last_number("1abc2") == 12
  end

  test "opens file and writes each line to a list of strings" do
    assert Day1.parse_file("./test/day1/mocks/lines_of_text.txt") == [
             "first line of the file",
             "second line of the file",
             "third line of the file"
           ]
  end

  test "parses list of strings into first and last number tuples" do
    list = Day1.parse_file("./test/day1/mocks/lines_of_text_w_numbers.txt")

    assert Day1.parse_list_to_first_last_numbers(list) == [
             {1, 3},
             {4, 6},
             {7, 9}
           ]
  end

  test "converts number words into integer strings (0-9)" do
    assert Enum.map_every(
             ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"],
             1,
             fn x -> Day1.convert_word_to_integer_string(x) end
           ) == [
             "0",
             "1",
             "2",
             "3",
             "4",
             "5",
             "6",
             "7",
             "8",
             "9"
           ]
  end

  test "convert word to int string returns same string if not a number word" do
    assert Day1.convert_word_to_integer_string("not a number word") == "not a number word"
  end

  test "convert all number words in a string to integer strings" do
    assert Day1.convert_substrings_to_integer_strings(
             "zero one two three four five six seven eight nine"
           ) ==
             "0 1 2 3 4 5 6 7 8 9"
  end
end
