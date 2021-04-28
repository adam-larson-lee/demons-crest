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

mem = {
  wram = function(address, bytes)
    return read('WRAM', address, bytes);
  end,
  rom = function(address, bytes)
    return read('CARTROM', address, bytes);
  end
}