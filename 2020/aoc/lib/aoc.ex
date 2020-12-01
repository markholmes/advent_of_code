defmodule Aoc do
  def parse(file) do
    a =
      File.read!(file)
      |> String.split("\n")

    Enum.map(a, &String.to_integer/1)
  end

  def one_a do
    input = parse("inputs/one.txt")

    equals_2020? = fn a, b -> a + b == 2020 end
    result = for x <- input, y <- input, equals_2020?.(x, y), do: x * y
    hd(result)
  end

  def one_b do
    input = parse("inputs/one.txt")

    equals_2020? = fn a, b, c -> a + b + c == 2020 end
    result = for x <- input, y <- input, z <- input, equals_2020?.(x, y, z), do: x * y * z
    hd(result)
  end
end
