defmodule Play do
  def sum([]), do: 0
  def sum([ head | tail ]), do: head + sum(tail)

  def map( [], _func), do: []
  def map([ head | tail], func) do
    [ func.(head) | map(tail, func) ]
  end

  def add(a, b) do
    cond do
      a == b ->
        a
      a > b ->
        a - b
      a < b ->
        b - a
    end
  end


end

IO.inspect [1, 2 , 3, 4, 5] |> Play.map &(&1*&1)

IO.inspect Play.add(12 , 5)
