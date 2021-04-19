require 'object.objects'
require 'draw.draw-box'

function objectHp()
  for i,obj in ipairs(objects) do
    if (obj.isAlive() and obj.getHp() > 0) then
      for hp = 0, obj.getHp() - 1 do
        drawBox(obj.getX() + hp * 4, obj.getY(), 4, 4, 'Black', 'Green')
      end
    end
  end
end

if (not hud) then
  while true do
    objectHp()
    emu.frameadvance()
  end
end