selectedObject = -1;

function hideObjectDetails()
  display.objectDetails.enabled = false
  selectedObject = -1
end

function displayObjectDetails()

  local m = input.getmouse()

  local minY = 9

  if (m.Left and m.X >= 0 and m.Y >= 0) then
    selectedObject = -1;
    for j,obj in ipairs(objects) do
      if (selectedObject < 0 and obj.isAlive()) then
        if (m.X >= obj.getRelativeX() - obj.getXHitbox() and m.X <= obj.getRelativeX() + obj.getXHitbox()) then
          if (m.Y > minY and m.Y >= obj.getRelativeY() - obj.topHitbox() and m.Y <= obj.getRelativeY() + obj.bottomHitbox()) then
            display.objectDetails.enabled = true
            selectedObject = j
          end
        end
      end
    end
  end

  if (selectedObject >= 0) then
    local obj = objects[selectedObject]
    if (obj.isAlive()) then
      draw.text(0, 35, 'Object ' .. selectedObject - 2)
      draw.text(0, 45, 'Position ' .. obj.getX() .. ', ' .. obj.getY())
      draw.text(0, 55, 'Status ' .. obj.getStatus())
      draw.text(0, 65, 'HP ' .. obj.getHp())
      draw.text(0, 75, 'Hitbox ' .. (obj.getXHitbox() * 2) .. 'x' .. (obj.topHitbox() + obj.bottomHitbox()))
      draw.box(obj.getRelativeX() - obj.getXHitbox(), obj.getRelativeY() - obj.topHitbox(), obj.getXHitbox() * 2, obj.topHitbox() + obj.bottomHitbox(), draw.color.green)
      draw.text(obj.getRelativeX() - 4, obj.getRelativeY() - obj.topHitbox() - 6, selectedObject - 2)
      draw.pixel(obj.getRelativeX(), obj.getRelativeY(), draw.color.green)
    else
      hideObjectDetails()
    end
  end
end