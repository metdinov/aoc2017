defmodule AdventOfCode.Day1A do
  
  def solve do
    "day_1_a_input.txt"
    |> Path.expand(__DIR__)
    |> File.open(fn file -> sum(IO.read(file, :line)) end)
  end

  def sum(number = <<first::utf8, _::binary>>),
    do: _sum(number <> <<first>>, 0)

  defp _sum("", acc),
    do: acc
  defp _sum(<<num::utf8, num::utf8, rest::binary>>, acc),
    do: _sum(<<num>> <> rest, acc + num - ?0)
  defp _sum(<<_::utf8, rest::binary>>, acc),
    do: _sum(rest, acc)
end