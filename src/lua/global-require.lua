if (not gui) then --mesen-s
  require 'adapter.mesen-s.emu.clear'
  require 'adapter.mesen-s.emu.color'
  require 'adapter.mesen-s.emu.draw-box'
  require 'adapter.mesen-s.emu.draw-line'
  require 'adapter.mesen-s.emu.draw-text'
  require 'adapter.mesen-s.emu.input'
  require 'adapter.mesen-s.emu.read'
elseif (gui.box) then --snex9x-rr
  require 'adapter.snes9x-rr.noop.clear'
  require 'adapter.snes9x-rr.gui.color'
  require 'adapter.snes9x-rr.gui.draw-box'
  require 'adapter.snes9x-rr.gui.draw-text'
  require 'adapter.snes9x-rr.memory.read'
else --bizhawk'
  require 'adapter.bizhawk.gui.clear'
  require 'adapter.bizhawk.gui.color'
  require 'adapter.bizhawk.draw'
  require 'adapter.bizhawk.joypad.input'
  require 'adapter.bizhawk.memory.read'
end

require 'util.bitflag'
require 'util.viewport'

require 'object.objects'
require 'object.firebrand'

require 'display.joypad-display'
require 'display.firebrand-hp-display'
require 'display.enemy-hp-display'
require 'display.object-hitbox-display'