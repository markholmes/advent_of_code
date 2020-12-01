defmodule One do
  @moduledoc """
  Documentation for One.
  """

  @doc """
  Crunch

  The captcha requires you to review a sequence of digits (your puzzle input) and find the sum of all digits that match the next digit in the list. The list is circular, so the digit after the last digit is the first digit in the list.

  ## Examples

      # 1122 produces a sum of 3 (1 + 2) because the first digit (1) matches the second digit and the third digit (2) matches the fourth digit.
      iex> One.crunch([1, 1, 2, 2])
      3

      # 1111 produces 4 because each digit (all 1) matches the next.
      iex> One.crunch([1, 1, 1, 1])
      4

      # 1234 produces 0 because no digit matches the next.
      iex> One.crunch([1, 2, 3, 4])
      0

      # 91212129 produces 9 because the only digit that matches the next one is the last digit, 9.
      iex> One.crunch([9, 1, 2, 1, 2, 1, 2, 9])
      9

  """
  def crunch(numbers) do
    numbers
    |> Enum.each(fn x -> One.okay_cool(x) end)
  end

  def okay_cool(element) do
    IO.puts element
  end
end
