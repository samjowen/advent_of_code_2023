defmodule Day2 do
  @moduledoc """
  Documentation for `AdventOfCode2023`.
  """

  def parse_game_number(game_string) do
    String.split(game_string, " ", trim: true)
    |> Enum.take(2)
    |> List.last()
    |> String.replace(":", "")
  end

  def parse_game_sets(game_string) do
    Regex.replace(~r/\bGame (\d+):\s/, game_string, "")
    |> String.split(";")
    |> Enum.map(&String.trim/1)
  end
end
