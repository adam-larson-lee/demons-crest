function displayEnemyHp()

  local closestObject = -1
  local firebrandLocation = firebrand.getX() + firebrand.getY()
  local closestObjectDistance = 0xFF + 0xFF

  for i,obj in ipairs(objects) do
    if (i > 0 and obj.isAlive() and obj.getHp() > 0) then
      local objDistance = math.abs(obj.getX() + obj.getY() - firebrandLocation)
      if (objDistance < closestObjectDistance) then
        closestObjectDistance = objDistance
        closestObject = i
      end
    end
  end

  if (closestObject >= 0) then
    local closestObjectHp = objects[closestObject].getHp()
    if (closestObjectHp <= 9) then
      draw.text(188, 1, closestObjectHp)
    else
      draw.text(185, 1, closestObjectHp)
    end
  end
end
