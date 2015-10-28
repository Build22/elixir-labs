ExUnit.start

defmodule User do
  defstruct email: nil, password: nil

end

defimpl String.Chars, for: User do
  def to_string(%User{email: email}) do
    email
  end
end

defmodule RecordTest do
  use ExUnit.Case

  require Record
  Record.defrecordp :person, first_name: nil, last_name: nil, age: nil

  test "test defrecordp" do
    p = person(first_name: "Nagaraja", last_name: "Jade", age: 25)
    assert p == {:person, "Nagaraja", "Jade", 25}
  end

  def sample do
    %User{email: "jade@example.com", password: "woot"}
  end

  test "test defstruct" do
    assert sample == %{__struct__: User, email: "jade@example.com", password: "woot"}
  end

  test "struct property" do
    assert sample.email == "jade@example.com"
  end

  test "struct update" do
    u = sample
    u2 = %User{ u | email: "nagaraja@example.com" }
    assert u2 == %User{email: "nagaraja@example.com", password: "woot"}
    assert u = %User{ email: "jade@example.com", password: "woot" } # Immutability baby!
  end

  test "test protocol" do
    assert to_string(sample) == "jade@example.com"
  end

end
