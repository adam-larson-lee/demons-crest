require 'global-require'

local displayHud = function ()
    displayOptions()

    if (display.joypad.enabled) then
      displayJoypad()
    end
    
    displayFirebrandHp()
    displayEnemyHp()
    
    if (display.hitboxes.enabled) then
      displayObjectHitboxes()
    end

    displayObjectDetails()
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