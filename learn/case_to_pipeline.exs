defmodule CaseToPipe do

  @doc """
  This method creates a Stripe customer and handles the response
  using **case**.
  """
  def createstripe(attrs) do
    case Stripe.Customer.create(attrs) do
      {:ok, customer} ->
        "A customer was created with ID #{customer.id}"
      {:error, reason} ->
        "An error accured because #{reason}"
      other ->
        "An unknown error has occured #{other}"
    end
  end

  @doc """
  This methods creates a stripe customer and handles
  response using **pipeline** instead of case
  """
  def createstripe2(attrs) do
    attrs
    |> Stripe.Customer.create
    |> handle_result
  end

  defp handle_result({:ok, customer}) do
    "A customer was created with ID #{customer.id}"
  end

  defp handle_result({:error, reason}) do
    "An error accured because #{reason}"
  end

  defp handle_result(other) do
    "An unknown error has occured #{other}"
  end

end
