local function read(domain, address, bytes)
  local methods = {
    [1] = memory.readbyte,
    [2] = memory.readdword
  }

  if (methods[bytes]) then
    return methods[bytes](address)
  end
  return 0
end

function wram(address, bytes)
  return read('WRAM', address, bytes);
end

function rom(address, bytes)
  return read('CARTROM', address, bytes);
end