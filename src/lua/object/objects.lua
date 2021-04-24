require 'viewport.viewport'

local function object(address)
  return {
    isAlive = function ()
      return wram(address, 1) > 0
    end,
    getHp = function ()
      hp = wram(address + 0x36, 1)
      if (hp >= 0x80) then
        hp = hp - 0x80
      end
      return hp
    end,
    getX = function ()
      return wram(address + 0x31, 2) - viewport.getX()
    end,
    getY = function ()
      return wram(address + 0x34, 2) - viewport.getY()
    end,
    getStatus = function ()
      return wram(address, 1)
    end,
    rightHitbox = function ()
      if (wram(address + 0x09, 1) == 1 or wram(address + 0x39, 1) == 1) then
        return rom(wram(address + 0x28, 2), 2)
      end
      return rom(wram(address + 0x28, 2) + 0x02, 2)
    end,
    leftHitbox = function ()
      if (wram(address + 0x09, 1) == 1 or wram(address + 0x39, 1) == 1) then
        return rom(wram(address + 0x28, 2) + 0x02, 2)
      end
      return rom(wram(address + 0x28, 2), 2)
    end,
    getXHitbox = function ()
      return rom(wram(address + 0x28, 2), 2)
    end,
    topHitbox = function ()
      return rom(wram(address + 0x2A, 2), 2)
    end,
    bottomHitbox = function ()
      return rom(wram(address + 0x2A, 2) + 0x02, 2)
    end
  }
end

objects = {}

table.insert(objects, object(0x001000))

for i = 0,30 do
  table.insert(objects, object(0x001080 + (0x50 * i)))
end