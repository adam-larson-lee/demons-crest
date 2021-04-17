require 'mem.read'

local function hitboxes()

  local viewport = {
    x = read(0x0000C0, 2),
    y = read(0x0000C4, 2),
  }

local function hitbox(aliveAddress, xAddress, yAddress, color)
    return {
      isAlive = function ()
        if (aliveAddress > 0) then
          return read(aliveAddress, 1) > 0
        else
          return true
        end
      end,
      getX = function ()
        return read(xAddress, 2) - viewport.x
      end,
      getY = function ()
        return read(yAddress, 2) - viewport.y
      end,
      color = color,
    }
end

  local hitboxes = {
    hitbox(0, 0x001031, 0x001034, 'White'),
    hitbox(0x001300, 0x001331, 0x001334, 'Green'),
    hitbox(0, 0x001381, 0x001384, 'Yellow'),
    hitbox(0, 0x001421, 0x001424, 'Red'),
    hitbox(0, 0x0014C1, 0x0014C4, 'Purple'),
  }

  for i,box in ipairs(hitboxes) do
    if (box.isAlive()) then
      gui.drawBox(box.getX() - 2, box.getY() - 2, box.getX() + 2, box.getY() + 2, box.color)
    end
  end
end

while true do
  hitboxes()
  emu.frameadvance()
end
