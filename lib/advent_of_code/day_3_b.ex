defmodule AdventOfCode.Day3B do
  
  def solve do
    input = 347991 # My puzzle input
    Stream.unfold({{0, 0}, %{{0, 0} => 1}}, &build_spiral/1)
    |> Enum.find(fn elem -> elem >= input end)
  end

  def build_spiral({pos, spiral}) do
    value = Enum.sum(neighbors(pos, spiral))
    {value, {next_pos(pos), Map.put(spiral, pos, value)}}
  end

  defp neighbors({x, y}, spiral) do
    for x_shift <- -1..1,
        y_shift <- -1..1,
        do: Map.get(spiral, {x + x_shift, y + y_shift}, 0)
  end

  defp next_pos({x, y}) when x > -y and x > y, do: {x, y + 1}
  defp next_pos({x, y}) when y > -x, do: {x - 1, y}
  defp next_pos({x, y}) when x < y, do: {x, y - 1}
  defp next_pos({x, y}) when -y >= x, do: {x + 1, y}
end