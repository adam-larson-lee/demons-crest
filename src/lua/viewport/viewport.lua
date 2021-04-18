require 'mem.read'

viewport = {
  getX = function ()
    return read(0x0000C0, 2)
  end,
  getY = function ()
    return read(0x0000C4, 2)
  end
}