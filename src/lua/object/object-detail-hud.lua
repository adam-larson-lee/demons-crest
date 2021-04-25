dofile('../util/read.lua')
dofile('../object/objects.lua')

selectedObject = -1;

local function objectDetailHud()

  local mouse = input.getmouse()

  if (mouse.Left and mouse.X >= 0 and mouse.Y >= 0) then
    selectedObject = -1;
    for j,obj in ipairs(objects) do
      if (selectedObject < 0 and obj.isAlive()) then
        if (mouse.X >= obj.getX() - obj.getXHitbox() and mouse.X <= obj.getX() + obj.getXHitbox()) then
          if (mouse.Y >= obj.getY() - obj.topHitbox() and mouse.Y <= obj.getY() + obj.bottomHitbox()) then
            selectedObject = j
          end
        end
      end
    end
  end

  if (selectedObject >= 0) then
    local obj = objects[selectedObject]
    if (obj.isAlive()) then
      gui.drawText(0, 35, 'Object ' .. selectedObject - 1, 'White', nil, 8, 'Lucida Console')
      gui.drawText(0, 45, obj.getX() .. ', ' .. obj.getY(), 'White', nil, 8, 'Lucida Console')
      gui.drawText(0, 55, 'Status ' .. obj.getStatus(), 'White', nil, 8, 'Lucida Console')
      gui.drawText(0, 65, 'HP ' .. obj.getHp(), 'White', nil, 8, 'Lucida Console')
      gui.drawBox(obj.getX() - obj.getXHitbox(), obj.getY() - obj.topHitbox(), obj.getX() + obj.getXHitbox(), obj.getY() + obj.bottomHitbox(), 'White')
      gui.drawPixel(obj.getX(), obj.getY(), 'Red')
    else
      selectedObject = -1
      gui.clearGraphics()
    end
  end
end

while true do
  objectDetailHud()
  emu.frameadvance()
end
