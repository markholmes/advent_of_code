defmodule Day01 do
  def run do
    File.read!("inputs/01.txt")
    |> String.split("", trim: true)
    |> Enum.reduce(%{floor: 0, step: 0}, &parse/2)
  end

  def parse(_, %{floor: -1, step: step}) do
    %{floor: -1, step: step}
  end

  def parse(instruction, %{floor: floor, step: step}) do
    case instruction do
      "(" -> %{floor: floor + 1, step: step + 1}
      ")" -> %{floor: floor - 1, step: step + 1}
    end
  end
end
