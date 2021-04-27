local function read(type, address, bytes)
  local methods = {
    [1] = emu.read,
    [2] = emu.readWord
  }

  if (methods[bytes]) then
    return methods[bytes](address, type, false)
  end
  return 0
end

function wram(address, bytes)
  return read(emu.memType['workRam'], address, bytes);
end

function rom(address, bytes)
  return read(emu.memType['prgRom'], address, bytes);
end