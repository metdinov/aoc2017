defmodule AdventOfCode.Day5B do
  
  def solve do
    "day_5_a_input.txt"
    |> Path.expand(__DIR__)
    |> File.stream!
    |> Stream.map(&String.trim_trailing/1)
    |> Enum.map(&String.to_integer/1)
    |> Zlist.from_list
    |> count_steps
  end

  def count_steps(offsets, steps \\ 1)
  def count_steps(offsets = %Zlist{focus: focus, prev: prev, next: next}, steps) 
                  when  (focus >= 0 and focus <= length(next) or
                        (focus < 0 and -focus <= length(prev))) do
    new_offsets = offsets |> Zlist.set_value(shift(focus)) |> Zlist.move_focus(focus)
    count_steps(new_offsets, steps + 1)
  end
  def count_steps(_offsets, steps) do
    steps
  end

  defp shift(focus) when focus >= 3, do: focus - 1
  defp shift(focus), do: focus + 1
end