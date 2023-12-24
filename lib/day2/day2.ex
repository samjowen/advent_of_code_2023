defmodule Day2 do
  @moduledoc """
  Documentation for `AdventOfCode2023`.
  """

  def parse_game_number(game_string) do
    String.split(game_string, " ", trim: true)
    |> Enum.take(2)
    |> List.last() |> String.replace(":", "")
  end
end
