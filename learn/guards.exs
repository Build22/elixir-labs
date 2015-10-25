defmodule Mathg do

  def zero?(0) do
    true
  end

  def zero?(0.0) do
    true
  end

  def zero?(x) when is_number(x) do
    false
  end

  def zero?(x) when not is_number(x) do
    { :NaN, false }
  end

end

ExUnit.start

defmodule TestGuards do
  use ExUnit.Case

  test "test when a int 0 and float 0.00 is passed" do
    assert Mathg.zero?(0) == true
    assert Mathg.zero?(0.00) == true
  end

  test "test when a non zero number is passed, both as int and float" do
    assert Mathg.zero?(1) == false
    assert Mathg.zero?(1.1) == false
  end

  test "test when a non number 'a' is passed " do
    assert Mathg.zero?("a") == { :NaN, false }
  end

  test "test when a list case is passed " do
    assert Mathg.zero?([1, 2, 3]) == { :NaN, false }
  end

end
