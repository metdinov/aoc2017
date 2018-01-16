defmodule AdventOfCode.Day5A do
  
  def solve do
    "day_5_a_input.txt"
    |> Path.expand(__DIR__)
    |> File.stream!
    |> Stream.map(&String.trim_trailing/1)
    |> Enum.map(&String.to_integer/1)
    |> count_steps
  end

  defp count_steps(offsets, pos \\ 0, steps \\ 0)
  defp count_steps(offsets, pos, steps) when pos >= 0 and pos < length(offsets) do
    count_steps(List.replace_at(offsets, pos, Enum.at(offsets, pos) + 1),
                pos + Enum.at(offsets, pos),
                steps + 1)
  end
  defp count_steps(_offsets, _pos, steps) do
    steps
  end
end