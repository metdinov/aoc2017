defmodule AdventOfCode.Day1B do
  
  def solve do
    "day_1_b_input.txt"
    |> Path.expand(__DIR__)
    |> File.open(fn file -> sum(IO.read(file, :line)) end)
  end

  def sum(number) do
    cutoff = div(String.length(number), 2)
    _sum(String.slice(number, 0..cutoff-1), String.slice(number, cutoff..-1))    
  end

  defp _sum(str1, str2, acc \\ 0)
  defp _sum("", "", acc),
    do: acc
  defp _sum(<<num::utf8, rest1::binary>>, <<num::utf8, rest2::binary>>, acc),
    do: _sum(rest1, rest2, acc + (num - ?0) * 2)
  defp _sum(<<_::utf8, rest1::binary>>, <<_::utf8, rest2::binary>>, acc),
    do: _sum(rest1, rest2, acc)
end