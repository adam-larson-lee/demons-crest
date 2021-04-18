require 'mem.read'
require 'object.objects'

local function hitboxes()

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
      gui.drawBox(obj.getX() - 5, obj.getY() - 4, obj.getX() + 5, obj.getY() + 4, statusColors[obj.getStatus()], 'White')
      gui.drawText(obj.getX() - 6, obj.getY() - 2, j - 1, 'Black', nil, 8, 'Lucida Console')
    end
  end
end

while true do
  hitboxes()
  emu.frameadvance()
end
