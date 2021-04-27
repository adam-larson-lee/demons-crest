local address = 0x1000

firebrand = {
  getX = function ()
    return mem.wram(address + 0x31, 2)
  end,
  getY = function ()
    return mem.wram(address + 0x34, 2)
  end,
  getRelativeX = function ()
    return mem.wram(address + 0x31, 2) - viewport.getX()
  end,
  getRelativeY = function ()
    return mem.wram(address + 0x34, 2) - viewport.getY()
  end,
  getHp = function ()
    return mem.wram(address + 0x62, 1)
  end
}