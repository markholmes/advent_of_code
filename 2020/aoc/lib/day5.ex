defmodule Day5 do
  def one do
    File.read!("inputs/five.txt")
    |> String.split("\n")
    |> Enum.map(&parse/1)
    |> Enum.max()
  end

  def parse(input) do
    [[r, s]] = Regex.scan(~r/([F|B]{7})([R|L]{3})/, input, capture: :all_but_first)

    row = r
    |> String.replace("F", "0")
    |> String.replace("B", "1")
    |> String.to_integer(2)

    seat = s
    |> String.replace("L", "0")
    |> String.replace("R", "1")
    |> String.to_integer(2)

    row * 8 + seat
  end

  def two do
    [[x, _]] = File.read!("inputs/five.txt")
    |> String.split("\n")
    |> Enum.map(&parse/1)
    |> Enum.sort()
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.filter(fn [x, y] -> y - x == 2 end)

    x + 1
  end
end
