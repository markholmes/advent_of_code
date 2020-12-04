defmodule Day3 do
  def parse(input) do
    File.read!(input)
    |> String.split("\n")
  end

  def one do
    %{trees: trees} =
      parse("inputs/three.txt")
      |> Enum.reduce(%{position: 1, trees: 0}, &find_trees_one/2)

    trees
  end

  defp find_trees_one(input, %{position: starting_position, trees: starting_trees}) do
    row = input |> String.split("", trim: true)
    current_position = Integer.mod(starting_position, Enum.count(row))

    trees =
      if Enum.at(row, current_position - 1) == "#", do: starting_trees + 1, else: starting_trees

    %{position: current_position + 3, trees: trees}
  end

  def two do
    instructions = [
      %{down: 1, right: 1},
      %{down: 1, right: 3},
      %{down: 1, right: 5},
      %{down: 1, right: 7},
      %{down: 2, right: 1}
    ]

    slopes = parse("inputs/three.txt")

    instructions
    |> Enum.map(&(run(&1, slopes)))
    |> Enum.reduce(&(&1 * &2))
  end

  defp run(%{down: down, right: right}, slopes) do
    %{trees: trees} =
      slopes
      |> Enum.take_every(down)
      |> Enum.reduce(%{position: 1, trees: 0, steps: right}, &find_trees_two/2)

    trees
  end

  defp find_trees_two(input, %{position: starting_position, trees: starting_trees, steps: steps}) do
    row = input |> String.split("", trim: true)
    current_position = Integer.mod(starting_position, Enum.count(row))

    trees =
      if Enum.at(row, current_position - 1) == "#", do: starting_trees + 1, else: starting_trees

    %{position: current_position + steps, trees: trees, steps: steps}
  end
end
