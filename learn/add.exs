defmodule Mathex do
  def add(a, b \\ 0) do
    a + b
  end
end

IO.inspect Mathex.add(5)

IO.puts "hello world!" |> String.upcase
