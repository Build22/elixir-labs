defmodule CowInterrogator do
  @moduledoc """
  This module is used to understand File IO ops in Elixir. Digg in!
  """

  @doc """
  function to get the name of the user
  """
  def get_name do
    String.strip IO.gets("What's your name? ")
  end

  @doc """
  function to get user's opinion on cows
  """
  def get_cow_lover do
    IO.getn("Do you like cows [Y/N]: ", 1)
  end

  @doc """
  function to display a cow to the user
  """
  def cow_art do
    path = Path.expand("files/cow.txt", __DIR__)
    case File.read(path) do
      {:ok, art} ->
        art
      {:error, _} ->
        IO.puts "Error: cow.txt cannot be found."; System.halt(1)
    end
  end

  @doc """
  Perform interrogation
  """
  def interrogate do
    name = get_name
    case String.downcase(get_cow_lover) do
      "y" ->
        IO.puts "Here's a cow for you #{name}: "
        IO.puts cow_art
      "n" ->
        IO.puts "That's a shame!, #{name}."
      _ ->
        IO.puts "You should have entered 'Y' or 'N'. "
    end
  end

end



ExUnit.start

defmodule InputOutputTest do
  use ExUnit.Case
  import String

  test "checks cow_art returns string from files/cow.txt" do
    art = CowInterrogator.cow_art
    assert String.strip(art) |> first == "("
  end
end
