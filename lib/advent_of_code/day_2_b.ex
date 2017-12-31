defmodule AdventOfCode.Day2B do
  
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
    |> Enum.sort
    |> find_divisibles
    |> Kernel.+(acc)
  end

  defp find_divisibles([divisor | rest]) do
    case Enum.find(rest, fn x -> rem(x, divisor) == 0 end) do
      nil -> find_divisibles(rest)
      dividend -> div(dividend, divisor)
    end
  end
  defp find_divisibles([]) do
    0
  end
end