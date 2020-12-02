defmodule Day2 do
  defp parse(row) do
    [[min, max, letter, password]] =
      Regex.scan(~r/(\d+)-(\d+) (\w+): (\w+)/, row, capture: :all_but_first)

    %{
      min: String.to_integer(min),
      max: String.to_integer(max),
      letter: letter,
      password: String.split(password, "", trim: true)
    }
  end

  def one do
    File.read!("inputs/two.txt")
    |> String.split("\n")
    |> Enum.map(fn x -> parse(x) end)
    |> Enum.filter(&is_password_valid_one?/1)
    |> Enum.count()
  end

  defp is_password_valid_one?(%{min: min, max: max, letter: letter, password: password}) do
    frequency =
      password
      |> Enum.frequencies()

    frequency[letter] >= min && frequency[letter] <= max
  end

  def two do
    File.read!("inputs/two.txt")
    |> String.split("\n")
    |> Enum.map(fn x -> parse(x) end)
    |> Enum.filter(&is_password_valid_two?/1)
    |> Enum.count()
  end

  defp is_password_valid_two?(%{min: min, max: max, letter: letter, password: password}) do
    min_match = Enum.at(password, min - 1) == letter
    max_match = Enum.at(password, max - 1) == letter

    (min_match || max_match) && !(min_match && max_match)
  end
end
