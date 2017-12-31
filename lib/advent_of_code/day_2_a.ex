defmodule AdventOfCode.Day2A do
  
  def solve do
    "day_2_a_input.txt"
    |> Path.expand(__DIR__)
    |> File.stream!
    |> Stream.map(&String.split/1)
    |> Enum.reduce(0, &checksum/2)
  end

  defp checksum(line, acc) do
    line
    |> Enum.map(&String.to_integer/1)
    |> Enum.min_max
    |> add_difference(acc)
  end

  defp add_difference({min, max}, acc),
    do: acc + max - min
end