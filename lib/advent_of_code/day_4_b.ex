defmodule AdventOfCode.Day4B do
  
  def solve do
    "day_4_a_input.txt"
    |> Path.expand(__DIR__)
    |> File.stream!
    |> Stream.map(&String.split/1)
    |> Enum.count(&valid?/1)
  end

  defp valid?([]),
    do: true
  defp valid?([word | rest]),
    do: not Enum.any?(rest, &anagram?(&1, word)) and valid?(rest)

  defp anagram?(word1, word2) when byte_size(word1) == byte_size(word2) do
    sorted_word1 = word1 |> String.graphemes |> Enum.sort
    sorted_word2 = word2 |> String.graphemes |> Enum.sort
    sorted_word2 == sorted_word1
  end
  defp anagram?(_word, _pass) do
    false
  end
end