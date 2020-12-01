defmodule OneTest do
  use ExUnit.Case
  doctest One

  test "[1, 1, 2, 2] sums to 3" do
    assert One.crunch([1, 1, 2, 2]) == 3
  end

  test "[1, 1, 1, 1] sums to 0" do
    assert One.crunch([1, 1, 1, 1]) == 0
  end

  test "[1, 2, 3, 4] sums to 0" do
    assert One.crunch([1, 2, 3, 4]) == 0
  end

  test "[9, 1, 2, 1, 2, 1, 2, 9] sums to 9" do
    assert One.crunch([9, 1, 2, 1, 2, 1, 2, 9]) == 9
  end
end


