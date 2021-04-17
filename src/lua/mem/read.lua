function read(address, bytes)

  local value = 0;

  for byte = 0, bytes - 1 do
    value = value + bit.lshift(memory.readbyte(address + byte), 8 * byte)
  end

  return value
end