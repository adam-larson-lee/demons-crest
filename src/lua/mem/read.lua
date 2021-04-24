local function read(domain, address, bytes)
  local methods = {
    [1] = memory.read_u8,
    [2] = memory.read_u16_le
  }

  if (methods[bytes]) then
    return methods[bytes](address, domain)
  end
  return 0
end

function wram(address, bytes)
  return read('WRAM', address, bytes);
end

function rom(address, bytes)
  return read('CARTROM', address, bytes);
end