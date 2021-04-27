require 'global-require'

local displayHud = function ()
    displayOptions()

    displayJoypad()
    displayFirebrandHp()
    displayEnemyHp()
    
    if (display.hitboxes.enabled) then
      displayObjectHitboxes()
    end
end

if (emu.frameadvance) then
  while true do
    draw.clear()
    displayHud()
    emu.frameadvance()
  end
else
  -- mesen-s
  emu.addEventCallback(displayHud, emu.eventType.endFrame);
end