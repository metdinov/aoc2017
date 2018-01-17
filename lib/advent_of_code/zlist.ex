defmodule Zlist do
  @moduledoc """
  Zipper list implementation based on 
  [this blog post](https://ferd.ca/yet-another-article-on-zippers.html)

  More info on Zippers:
  https://en.wikipedia.org/wiki/Zipper_(data_structure)
  http://learnyouahaskell.com/zippers
  http://scienceblogs.com/goodmath/2010/01/13/zippers-making-functional-upda/
  """

  @type t :: %Zlist{focus: any, prev: list, next: list}
  defstruct focus: nil, prev: [], next: []

  @spec from_list(list) :: Zlist.t
  def from_list([head | rest]),
    do: %Zlist{focus: head, prev: [], next: rest}
  def from_list([]),
    do: %Zlist{}

  @spec to_list(Zlist.t) :: list
  def to_list(%Zlist{focus: nil, prev: [], next: []}),
    do: []
  def to_list(%Zlist{focus: focus, prev: prev, next: next}),
    do: Enum.reverse(prev) ++ [focus | next]

  @spec value(Zlist.t) :: any
  def value(%Zlist{focus: focus}) do
    focus
  end

  @spec set_value(Zlist.t, any) :: Zlist.t
  def set_value(zlist, v) do
    %{zlist | focus: v}
  end

  @spec move_focus(Zlist.t, integer) :: Zlist.t
  def move_focus(%Zlist{focus: focus, prev: prev, next: [head | rest]}, n) when n > 0 do
    move_focus(%Zlist{focus: head, prev: [focus | prev], next: rest}, n - 1)
  end
  def move_focus(%Zlist{focus: focus, prev: [head | rest], next: next}, n) when n < 0 do
    move_focus(%Zlist{focus: head, prev: rest, next: [focus | next]}, n + 1)
  end
  def move_focus(zlist, _n) do
    zlist
  end

  @spec count_previous(Zlist.t) :: non_neg_integer
  def count_previous(%Zlist{prev: prev}),
    do: Enum.count prev
  
  @spec count_remaining(Zlist.t) :: non_neg_integer
  def count_remaining(%Zlist{next: next}),
    do: Enum.count next
end