defmodule ZlistTest do
  use ExUnit.Case, async: true
  import Zlist

  setup_all do
    {:ok, zlist: from_list([1, 2, 4, 6, 8, 15]) |> move_focus(3)}
  end

  test "empty Zlist generated from empty list" do
    assert from_list([]) === %Zlist{}
  end

  test "empty list generated from empty Zlist" do
    assert to_list(%Zlist{}) === []
  end

  test "Zlist with one element has empty prev" do
    zlist = from_list [1]
    assert zlist.prev === []
  end

  test "Zlist with one element has empty next" do
    zlist = from_list [1]
    assert zlist.next === []
  end

  test "to_list reverses from_list" do
    assert to_list(from_list([1,2,3,5,6])) === [1,2,3,5,6]
  end

  test "set_value changes the value of the focus" do
    assert value(set_value(%Zlist{}, 5)) === 5
  end

  test "moving focus 0 steps returns the same Zlist", %{zlist: zlist} do
    assert move_focus(zlist, 0) === zlist
  end

  test "moving focus 1 step changes focus to hd(zlist.next)", %{zlist: zlist} do
    new_zlist = move_focus(zlist, 1)
    assert value(new_zlist) === hd(zlist.next)
  end

  test "moving focus length(zlist.next) steps returns Zlist with empty next", %{zlist: zlist} do
    new_zlist = move_focus(zlist, length(zlist.next))
    assert new_zlist.next === []
  end

  test "moving focus -1 step changes focus to hd(zlist.prev)", %{zlist: zlist} do
    new_zlist = move_focus(zlist, -1)
    assert value(new_zlist) === hd(zlist.prev)
  end

  test "moving focus -length(zlist.prev) steps returns Zlist with empty prev", %{zlist: zlist} do
    new_zlist = move_focus(zlist, -length(zlist.prev))
    assert new_zlist.prev === []
  end
end