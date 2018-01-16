defmodule AdventOfCode.Day4A do
  
  def solve do
    "day_4_a_input.txt"
    |> Path.expand(__DIR__)
    |> File.stream!
    |> Stream.map(&String.split/1)
    |> Enum.count(&valid?/1)
  end

  defp valid?(passphrase), 
    do: length(passphrase) == length(Enum.uniq(passphrase))
end