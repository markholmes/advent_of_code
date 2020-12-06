defmodule Day6 do
  def one do
    File.read!("inputs/six.txt")
    |> String.split("\n\n")
    |> Enum.map(&String.replace(&1, "\n", "", global: true))
    |> Enum.map(&String.split(&1, "", trim: true))
    |> Enum.map(&MapSet.new(&1))
    |> Enum.map(&MapSet.size(&1))
    |> Enum.reduce(&(&1 + &2))
  end

  def two do
    File.read!("inputs/six.txt")
    |> String.split("\n\n")
    |> Enum.map(&String.split(&1, "\n", trim: true))
    |> Enum.map(&parse/1)
    |> Enum.map(&MapSet.size/1)
    |> Enum.reduce(&(&1 + &2))
  end

  def parse(input) do
    input
    |> Enum.map(&String.graphemes(&1))
    |> Enum.map(&MapSet.new(&1))
    |> Enum.reduce(&MapSet.intersection/2)
  end
end
