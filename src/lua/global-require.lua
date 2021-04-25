if (gui.box) then --snex9x-rr
  require 'adapter.snes9x-rr.gui.clear'
  require 'adapter.snes9x-rr.gui.draw-box'
  require 'adapter.snes9x-rr.gui.draw-text'
  require 'adapter.snes9x-rr.memory.read'
else --bizhawk
  require 'adapter.bizhawk.gui.clear'
  require 'adapter.bizhawk.gui.draw-box'
  require 'adapter.bizhawk.gui.draw-text'
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