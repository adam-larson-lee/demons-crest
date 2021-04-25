local address = 0x1000

firebrand = {
  getX = function ()
    return wram(address + 0x31, 2) - viewport.getX()
  end,
  getY = function ()
    return wram(address + 0x34, 2) - viewport.getY()
  end,
  getHp = function ()
    return wram(address + 0x62, 1)
  end
}