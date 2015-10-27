ExUnit.start

defmodule LearnList do
  use ExUnit.Case

  def sample do
    ["Jade", "Pasta", "Rashanni", "Inna", "Robin"]
  end

  test "sigil" do
    assert sample == ~w(Jade Pasta Rashanni Inna Robin)
  end

  test "head" do
    [head | _] = sample
    assert head == "Jade"
  end

  test "tail" do
    [ _ | tail ] = sample
    assert tail == [ "Pasta", "Rashanni", "Inna", "Robin" ]
  end

  test "last element" do
    assert List.last(sample) == "Robin"
  end

  test "delete element from list" do
    assert List.delete(sample, "Pasta") == ~w(Jade Rashanni Inna Robin)
    # only deletes first occurence of an element when multiple exists
    assert List.delete([1, 2, 2, 3, 4], 2) == [1, 2, 3, 4]
  end

  test "List.fold" do
    list = [1, 2, 3, 4 ,5]
    sum = List.foldr list, 0, &(&1 + &2)
    assert sum == 15
  end

  test "Enum.reduce" do
    list = [1, 2, 3, 4, 5]
    sum = Enum.reduce list, 0, &(&1 + &2)
    assert sum == 15
  end

  test "wrap" do
    assert List.wrap(sample) == sample
    assert List.wrap(nil) == []
    assert List.wrap([]) == []
    assert List.wrap(1) == [1]
  end

  @doc """
  Differences between using Enum.filter_map and List comprehension (for)
  sample = [1, 2, 3]

  Enum.filter_map sample, fn(x) -> rem(x, 2) == 0 end, &(&1 + 2)
  => 4

  for n <- sample, rem(n, 2) == 0, do:  n + 2
  => 4

  """
  test "Enum.filter_map" do
    some = Enum.filter_map sample, &(String.first(&1) >= "J"), &(&1 <> " Nagaraja")
    assert some == ["Jade Nagaraja", "Pasta Nagaraja", "Rashanni Nagaraja", "Robin Nagaraja"]
  end

  test "List Comprehension (for)" do
    some = for n <- sample, String.first(n) >= "J", do: n <> " Nagaraja"
    assert some == ["Jade Nagaraja", "Pasta Nagaraja", "Rashanni Nagaraja", "Robin Nagaraja"]
  end

  # More digging [here](https://github.com/Build22/30-days-of-elixir/blob/master/04-list.exs#L79-L105)
end
