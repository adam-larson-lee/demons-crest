function displayObjectHitboxes()

  --the comments are just observations, i still have no idea what these flags mean
  local statusColors = {
    [16] = 'White', --firerband
    [18] = 'Blue', --jars and items from jars... and items from enemies sometimes? and arma 1 projectiles? and firebrand projectile collision?
    [22] = 'Red', --enemies... most of the time?
    [86] = 'Yellow', --hippogriff before you headbutt?
    [146] = 'Purple', --items from enemies... sometimes?
    [150] = 'Green', --spawn points, enemies... sometimes?
    [210] = 'Black', --dying enemies?
  }

  for j,obj in ipairs(objects) do
    if (obj.isAlive()) then
      gui.drawBox(obj.getX() - obj.getXHitbox(), obj.getY() - obj.topHitbox(), obj.getX() + obj.getXHitbox(), obj.getY() + obj.bottomHitbox(), 'White')
      gui.drawText(obj.getX() - 4, obj.getY() - obj.topHitbox() - 6, j - 1, 'White', nil, 8, 'Lucida Console')
      gui.drawPixel(obj.getX(), obj.getY(), 'Red')
    end
  end
end