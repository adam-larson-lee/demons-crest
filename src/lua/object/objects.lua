require 'viewport.viewport'

local function object(address)
  return {
    isAlive = function ()
      return read(address, 1) > 0
    end,
    getHp = function ()
      return read(address + 0x36, 1)
    end,
    getX = function ()
      return read(address + 0x31, 2) - viewport.getX()
    end,
    getY = function ()
      return read(address + 0x34, 2) - viewport.getY()
    end,
    getStatus = function ()
      return read(address, 1)
    end
  }
end

objects = {}

table.insert(objects, object(0x001000))

for i = 0,19 do
  table.insert(objects, object(0x001300 + (0x50 * i)))
end