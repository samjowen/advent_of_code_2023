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

  def parse_file(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n", trim: true)
  end

  def parse_list_to_first_last_numbers(input_list) do
    input_list |> Enum.map(&find_first_and_last_number/1)
  end

  # End module
end
