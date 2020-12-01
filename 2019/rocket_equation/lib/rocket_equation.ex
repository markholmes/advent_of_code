defmodule RocketEquation do
  @moduledoc """
  Documentation for RocketEquation.
  """

  @doc """
  Hello world.

  ## Examples

      iex> RocketEquation.hello()
      :world

  """

  def hello do
    :world
  end

  def read(file) do
    case File.read(file) do
      {:ok, body} ->
        body
      {:err, reason} ->
        reason
      end
  end

  # take its mass, divide by three, round down, and subtract 2.

  def calculateFuelRequired(x) do
    Decimal.round(x / 3) - 2
  end

  def init do
    modules = read("lib/test.in")
    result = Enum.map(modules, calculateFuelRequired())
    IO.puts result
  end

end
