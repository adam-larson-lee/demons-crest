require 'global-require'

local displayHud = function ()
  -- header
  draw.box(0, 0, 260, 8, draw.color.black, draw.color.black);
  -- footer
  draw.box(0, 215, 260, 8, draw.color.black, draw.color.black);

  displayMenu()

  if (display.joypad.enabled) then
    displayJoypad()
  end

  displayFirebrandHp()
  displayEnemyHp()
  displayItemCompletion()
  displayZam()

  if (display.hitboxes.enabled) then
    displayObjectHitboxes()
  end

  displayObjectDetails()

  if (display.iframes.enabled) then
    displayIframes()
  end

  if (display.levelDetails.enabled) then
    displaySkullGame()
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