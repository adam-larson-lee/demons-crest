require 'global-require'

while true do
  gui.clearGraphics()

  displayJoypad()
  displayFirebrandHp()
  displayEnemyHp()
  -- displayObjectHitboxes()

  emu.frameadvance()
end