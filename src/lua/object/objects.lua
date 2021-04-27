local function object(address)
  return {
    isAlive = function ()
      return mem.wram(address, 1) > 0
    end,
    getHp = function ()
      local hp = mem.wram(address + 0x36, 1)
      if (hp >= 0x80) then
        hp = hp - 0x80
      end
      return hp
    end,
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
    getStatus = function ()
      return mem.wram(address, 1)
    end,
    rightHitbox = function ()
      if (mem.wram(address + 0x09, 1) == 1 or mem.wram(address + 0x39, 1) == 1) then
        return rom(mem.wram(address + 0x28, 2), 2)
      end
      return rom(mem.wram(address + 0x28, 2) + 0x02, 2)
    end,
    leftHitbox = function ()
      if (mem.wram(address + 0x09, 1) == 1 or mem.wram(address + 0x39, 1) == 1) then
        return mem.rom(mem.wram(address + 0x28, 2) + 0x02, 2)
      end
      return mem.rom(mem.wram(address + 0x28, 2), 2)
    end,
    getXHitbox = function ()
      return mem.rom(mem.wram(address + 0x28, 2), 2)
    end,
    topHitbox = function ()
      return mem.rom(mem.wram(address + 0x2A, 2), 2)
    end,
    bottomHitbox = function ()
      return mem.rom(mem.wram(address + 0x2A, 2) + 0x02, 2)
    end
  }
end

objects = {}

table.insert(objects, object(0x001000))

for i = 0,30 do
  table.insert(objects, object(0x001080 + (0x50 * i)))
end