defmodule Day1 do
  @moduledoc """
  Documentation for `AdventOfCode2023`.
  """

  @spec find_first_and_last_number(String.t()) :: {integer(), integer()}
  @doc """
  Finds the first and last number in a string.

  ## Parameters

  - `input_string`: A string that contains numbers.

  ## Returns

  A tuple where the first element is the first number in the string and the second element is the last number in the string.

  ## Examples

      iex> Day1.find_first_and_last_number("1abc2")
      {1, 2}

  """
  def find_first_and_last_number(input_string) do
    numbers =
      input_string
      |> String.replace(~r/[^0-9]/, "")
      |> String.split("", trim: true)
      |> Enum.map(&String.to_integer/1)

    {List.first(numbers), List.last(numbers)}
  end

  def find_first_number(input_string) do
    numbers =
      input_string
      |> String.replace(~r/[^0-9]/, "")
      |> String.split("", trim: true)
      |> Enum.map(&String.to_integer/1)

    List.first(numbers)
  end

  def find_last_number(string) do
    string
    |> String.reverse()
    |> find_first_number()
  end

  @spec combine_first_and_last_number(binary()) :: integer()
  def combine_first_and_last_number(input_string) do
    numbers =
      input_string
      |> String.replace(~r/[^0-9]/, "")
      |> String.split("", trim: true)

    String.to_integer(List.first(numbers) <> "" <> List.last(numbers))
  end

  @spec parse_file(
          binary()
          | maybe_improper_list(
              binary() | maybe_improper_list(any(), binary() | []) | char(),
              binary() | []
            )
        ) :: [binary()]
  def parse_file(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n", trim: true)
  end

  def parse_list_to_first_last_numbers(input_list) do
    input_list |> Enum.map(&find_first_and_last_number/1)
  end

  def convert_word_to_integer_string(word) do
    case word do
      "zero" -> "zero0zero"
      "one" -> "one1one"
      "two" -> "two2two"
      "three" -> "three3three"
      "four" -> "four4four"
      "five" -> "five5five"
      "six" -> "six6six"
      "seven" -> "seven7seven"
      "eight" -> "eight8eight"
      "nine" -> "nine9nine"
      _ -> word
    end
  end

  def convert_substrings_to_integer_strings(string) do
    replacement_map = %{
      "zero" => "zero0zero",
      "one" => "one1one",
      "two" => "two2two",
      "three" => "three3three",
      "four" => "four4four",
      "five" => "five5five",
      "six" => "six6six",
      "seven" => "seven7seven",
      "eight" => "eight8eight",
      "nine" => "nine9nine"
    }

    sorted_map =
      replacement_map
      |> Enum.to_list()
      |> Enum.sort_by(fn {key, _value} -> -String.length(key) end)

    Enum.reduce(sorted_map, string, fn {key, value}, acc ->
      String.replace(acc, key, value)
    end)
  end

  def replace_substrings(string, replacement_map) do
    regex =
      replacement_map
      |> Enum.map(fn {key, _} -> key end)
      |> Enum.join("|")
      |> Regex.compile!()

    String.replace(string, regex, fn match -> Map.get(replacement_map, match) end)
  end

  # End module
end
