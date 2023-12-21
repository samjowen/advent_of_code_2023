defmodule Day1 do
  @moduledoc """
  Documentation for `AdventOfCode2023`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> AdventOfCode2023.hello()
      :world

  """
  def find_first_and_last_number(string) do
    numbers =
      string
      |> String.replace(~r/[^0-9]/, "")
      |> String.split("", trim: true)
      |> Enum.map(&String.to_integer/1)

    {List.first(numbers), List.last(numbers)}
  end
end
