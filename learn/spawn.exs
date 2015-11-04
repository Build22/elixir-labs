spawn_link fn -> raise "Shit happened!" end

receive do
  :hello -> "let's wait until the process fails :("
end
