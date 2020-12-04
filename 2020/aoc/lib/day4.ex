defmodule Day4 do
  def one do
    File.read!("inputs/four.txt")
    |> String.split("\n\n")
    |> Enum.map(&parse/1)
    |> Enum.count(&valid_keys?/1)
  end

  def two do
    File.read!("inputs/four.txt")
    |> String.split("\n\n")
    |> Enum.map(&parse/1)
    |> Enum.reject(fn x -> !(valid_keys?(x)) end)
    |> Enum.count(&valid_values?/1)
  end

  def parse(input) do
    input
    |> String.split(~r/\s+/, trim: true)
    |> Enum.map(&(String.split(&1, ":")))
    |> Enum.map(fn [k, v] -> {String.to_atom(k), v} end)
    |> Map.new()
  end

  def valid_keys?(data) do
    Enum.all?([:byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid], fn key -> Map.has_key?(data, key) end)
  end

  def valid_values?(data) do
    Enum.all?(data, fn {key, value} -> valid_value?(key, value) end)
  end


  def valid_value?(:hgt, value) do
    case Regex.scan(~r/(\d+)(\w+)/, value, capture: :all_but_first) do
      [[val, "cm"]] ->
        String.to_integer(val) in 150..193
      [[val, "in"]] ->
        String.to_integer(val) in 59..76
      _ ->
        false
    end
  end

  def valid_value?(:byr, value), do: String.to_integer(value) in 1920..2002
  def valid_value?(:iyr, value), do: String.to_integer(value) in 2010..2020
  def valid_value?(:eyr, value), do: String.to_integer(value) in 2020..2030
  def valid_value?(:hcl, value), do: Regex.match?(~r/#[0-9a-f]{6}/, value)
  def valid_value?(:ecl, value), do: value in ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
  def valid_value?(:pid, value), do: Regex.match?(~r/^(\d){9}$/, value)
  def valid_value?(_, _), do: true
end
