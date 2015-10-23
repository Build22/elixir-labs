defmodule User do
  @moduledoc """
  Define the User Struct and functions to manipulate user names
  """

  import String, only: [split: 1]
  import List, only: [first: 1, last: 1]

  defstruct name: nil, email: nil

  @doc """
  Get the first name of the user

  ## Parameters
  - user - A user struct

  ## Examples

    user = %User{ name: "Jade Nagaraja" }
    User.first_name(user)
    "Jade"
  """
  def first_name(user) do
    user
    |> get_names
    |> first
  end

  @doc """
  Get the last name of the user

  ## Parameters
  - user - A user struct

  ## Examples
    user = %User{ name: "Jade Nagaraja" }
    User.last_name(user)
    "Nagaraja"
  """
  def last_name(user) do
    user
    |> get_names
    |> last
  end

  defp get_names(user) do
    split(user.name)
  end

end
