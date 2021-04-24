dofile('../util/read.lua')

viewport = {
  getX = function ()
    return wram(0x0000C0, 2)
  end,
  getY = function ()
    return wram(0x0000C4, 2)
  end
}