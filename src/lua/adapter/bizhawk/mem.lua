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

local function write(domain, address, bytes, value)
  local methods = {
    [1] = memory.write_u8,
    [2] = memory.write_u16_le
  }

  if (methods[bytes]) then
    return methods[bytes](address, value, domain)
  end
  
  return 0
end

mem = {
  wram = function(address, bytes)
    return read('WRAM', address, bytes);
  end,
  rom = function(address, bytes)
    return read('CARTROM', address, bytes);
  end,
  writeWram = function(address, bytes, value)
    write('WRAM', address, bytes, value)
  end
}
