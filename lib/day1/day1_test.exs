defmodule Day1Test do
  use ExUnit.Case
  doctest Day1

  test "finds first and last number from array" do
    assert Day1.find_first_and_last_number("1abc2") == {1, 2}
  end
end
