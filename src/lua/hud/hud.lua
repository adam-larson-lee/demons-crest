hud = true;

dofile('./joypad/joypad-hud.lua')
dofile('../object/object-hp-hud.lua')

while true do
  joypadHud()
  objectHpHud()
  emu.frameadvance()
end