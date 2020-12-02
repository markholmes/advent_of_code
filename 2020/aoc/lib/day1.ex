defmodule Day1 do
  def parse(file) do
    File.read!(file)
    |> String.split("\n")
    |> Enum.map(&String.to_integer/1)
  end

  def a do
    input = parse("inputs/one.txt")
    hd(for x <- input, y <- input, two_sum?(x, y), do: x * y)
  end

  defp two_sum?(a, b) do
    a + b == 2020
  end

  def b do
    input = parse("inputs/one.txt")
    hd(for x <- input, y <- input, z <- input, three_sum?(x, y, z), do: x * y * z)
  end

  defp three_sum?(a, b, c) do
    a + b + c == 2020
  end
end
