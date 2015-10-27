ExUnit.start

defmodule TestMaps do
  use ExUnit.Case

  def sample do
    %{name: 'Jade', course: 'Data Mining'}
  end

  test "Map.get" do
    assert Map.get(sample, :name) == 'Jade'
    assert Map.get(sample, :na) == nil
  end

  test "[]" do
    assert sample[:name] == 'Jade'
    assert sample[:na] == nil
  end

  test "." do
    assert sample.name == 'Jade'
    assert_raise KeyError, fn ->
      sample.na
    end
  end

  test "Map.fetch" do
    {:ok, val} = Map.fetch(sample, :name)
    assert val == 'Jade'

    :error = Map.fetch(sample, :na)
  end

  test "Map.put" do
    # Update if key already exists
    assert Map.put(sample, :name, 'Jade Nagaraja') == %{name: 'Jade Nagaraja', course: 'Data Mining'}
    #Insert new pair if key does not exist
    assert Map.put(sample, :university, 'UoG') == %{name: 'Jade', course: 'Data Mining', university: 'UoG'}
  end

  test "Update Map using pattern matching" do
    assert %{sample | name: 'Jade Nagaraja'} == %{name: 'Jade Nagaraja', course: 'Data Mining'}

    assert_raise KeyError, fn ->
      %{sample | na: 'does not exist'}
    end
  end

  test "Map.values" do
    assert Enum.sort(Map.values(sample)) == ['Data Mining', 'Jade']
  end

end
