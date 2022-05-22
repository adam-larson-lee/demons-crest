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

  displayZam()
  displayFirebrandPosition()
  displayViewport()

  if (display.hitboxes.enabled) then
    displayObjectHitboxes()
  end

  if (display.iframes.enabled) then
    displayIframes()
  end

  if (display.levelDetails.enabled) then
    displayOverworldCompass();

    displaySkullGame()
  end
end

if (emu.frameadvance) then
  while true do
    draw.clear()
    displayHud()
    displayItemCompletion()
    displayObjectDetails()
    emu.frameadvance()
  end
else
  -- mesen-s
  -- displayItemCompletion() not supported on mesen yet
  -- displayObjectDetails() not supported on mesen yet
  emu.addEventCallback(displayHud, emu.eventType.endFrame);
end