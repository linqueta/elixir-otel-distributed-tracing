defmodule ZipkinRandomTest do
  use ExUnit.Case
  doctest ZipkinRandom

  test "greets the world" do
    assert ZipkinRandom.hello() == :world
  end
end
