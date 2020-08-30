defmodule DarkDevTest do
  @moduledoc """
  Test for `DarkDev`.
  """

  use ExUnit.Case, async: true
  doctest DarkDev

  test "greets the world" do
    assert DarkDev.hello() == :world
  end
end
