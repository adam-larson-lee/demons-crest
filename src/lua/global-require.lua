local emulator = {
  mesens = false,
  snes9xrr = false,
  bizhawk = false
}

if (not gui) then --mesen-s
  emulator.mesens = true
  require 'adapter.mesen-s.draw'
  require 'adapter.mesen-s.input'
  require 'adapter.mesen-s.mem'
  require 'adapter.mesen-s.mouse'
elseif (gui.box) then --snex9x-rr
  emulator.snes9xrr = true
  require 'adapter.snes9x-rr.noop.clear'
  require 'adapter.snes9x-rr.gui.color'
  require 'adapter.snes9x-rr.gui.draw-box'
  require 'adapter.snes9x-rr.gui.draw-text'
  require 'adapter.snes9x-rr.memory.read'
else --bizhawk'
  emulator.bizhawk = true
  require 'adapter.bizhawk.draw'
  require 'adapter.bizhawk.input'
  require 'adapter.bizhawk.mem'
  require 'adapter.bizhawk.mouse'
end

require 'util.bitflag'
require 'util.viewport'

require 'decorator.draw-decorator'

require 'object.objects'
require 'object.firebrand'

require 'items.items'

require 'display.joypad-display'
require 'display.firebrand-hp-display'
require 'display.enemy-hp-display'
require 'display.object-details-display'
require 'display.object-hitbox-display'
require 'display.item-completion-display'
require 'display.display-options'

if (emulator.mesens) then
  display.joypad.enabled = false
  display.objectDetails.enabled = false
end