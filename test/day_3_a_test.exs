defmodule AdventOfCode.Day3ATest do
  use ExUnit.Case

  test "data from square 1 is carried 0 steps" do
    assert AdventOfCode.Day3A.calculate_steps(1) == 0
  end

  test "data from square 12 is carried 3 steps" do
    assert AdventOfCode.Day3A.calculate_steps(12) == 3
  end

  test "data from square 23 is carried 2 steps" do
    assert AdventOfCode.Day3A.calculate_steps(23) == 2
  end

  test "data from square 1024 is carried 31 steps" do
    assert AdventOfCode.Day3A.calculate_steps(1024) == 31
  end
end