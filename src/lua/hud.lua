require 'global-require'

while true do
  clearGui()

  displayJoypad()
  displayFirebrandHp()
  displayEnemyHp()
  -- displayObjectHitboxes()

  emu.frameadvance()
end