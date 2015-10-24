# resource(start_fun, next_fun, after_fun)

fops = Stream.resource(fn -> File.open!("learn/sample.txt") end,

  fn file ->
    case IO.read(file, :line) do
      data when is_binary(data) -> { [data], file }
      _ -> { :halt, file}
    end
  end,

  fn file -> File.close(file) end

)

IO.inspect fops |> Enum.to_list
