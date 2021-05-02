local function object(address)
  return {
    getValue = function (offset, bytes)
      return mem.wram(address + offset, bytes)
    end,
    getBase = function ()
      return address
    end,
    getStatus = function ()
      return mem.wram(address, 1)
    end,
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
      local romAddress = mem.wram(address + 0x28, 2);
      if (romAddress == 0x00) then
        return 2;
      end
      return mem.rom(romAddress, 2)
    end,
    topHitbox = function ()
      local romAddress = mem.wram(address + 0x2A, 2);
      if (romAddress == 0x00) then
        return 2;
      end
      return mem.rom(romAddress, 2)
    end,
    bottomHitbox = function ()
      local baseRomAddress = mem.wram(address + 0x2A, 2);
      if (baseRomAddress == 0x00) then
        return 2;
      end
      return mem.rom(baseRomAddress + 0x02, 2)
    end
  }
end

objects = {}

firebrand = object(0x001000)
firebrand.getHp = function ()
  return mem.wram(0x1000 + 0x62, 1)
end

table.insert(objects, firebrand)

-- there are 40 objects max
for i = 0,39 do
  table.insert(objects, object(0x001080 + (0x50 * i)))
end
