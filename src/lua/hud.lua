require 'global-require'

local displayHud = function ()
    displayJoypad()
    displayFirebrandHp()
    displayEnemyHp()
    -- displayObjectHitboxes()
end

if (emu.frameadvance) then
  while true do
    clearGui()
    displayHud()
    emu.frameadvance()
  end
else
  -- mesen-s
  emu.addEventCallback(displayHud, emu.eventType.endFrame);
end