hud = true;

require('joypad-display')
require('object-hp')

while true do
  joypadDisplay()
  objectHp()
  emu.frameadvance()
end