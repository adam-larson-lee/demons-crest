viewport = {
  getX = function ()
    return mem.wram(0x0000C0, 2)
  end,
  getY = function ()
    return mem.wram(0x0000C4, 2)
  end
}