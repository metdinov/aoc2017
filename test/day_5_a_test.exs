defmodule AdventOfCode.Day5ATest do
  use ExUnit.Case

  test "offsets = [0, 3, 0, 1, -3] takes 5 steps to reach exit" do
    offsets = Zlist.from_list [0, 3, 0, 1, -3]
    assert AdventOfCode.Day5A.count_steps(offsets) == 5
  end

  test "offsets = [10, 3, 0, 1, -3] takes 1 step to reach exit" do
    offsets = Zlist.from_list [10, 3, 0, 1, -3]
    assert AdventOfCode.Day5A.count_steps(offsets) == 1
  end
end