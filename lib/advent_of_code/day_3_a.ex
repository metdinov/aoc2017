defmodule AdventOfCode.Day3A do
  
  def solve do
    # My puzzle input
    input = 347991
    calculate_steps(input)
  end

  def calculate_steps(square) do
    corner_root = find_corner_root(square)
    max_step = div(corner_root, 2)
    manhattan_distance(square, max_step, corner_root*corner_root - max_step)
  end

  defp find_corner_root(square) do
    square
    |> :math.sqrt
    |> :math.ceil     
    |> round
    |> (&(&1 + rem(&1 + 1, 2))).() # Adds 1 if number is even
  end

  defp manhattan_distance(square, max_step, check_point) when square >= check_point - max_step,
    do: abs(check_point - square) + max_step
  defp manhattan_distance(square, max_step, check_point),
    do: manhattan_distance(square, max_step, check_point - 2 * max_step)
end