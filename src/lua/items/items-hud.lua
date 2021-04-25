local i = 0;
local showDashboard = false;
local debounce = false;

require 'items'

function itemDashboard()

  local function giveItem(item)
    memory.writebyte(item.address, bit.bor(memory.readbyte(item.address), item.bit))
  end

  if (input.getmouse()['Right']) then
    if (not debounce) then
      i = i + 1;
      if (i >= 5) then
        showDashboard = not showDashboard;
        debounce = true;
      end
    end
  else
    i = 0;
    debounce = false;
  end

  if (showDashboard) then
    gui.drawBox(20, 20, 230, 100, 'Black', 'Black')
    gui.drawBox(30, 30, 220, 90, 'White', 'White')

    gui.drawText(35, 50, 'Power', 'Black')
    gui.drawBox(35, 50, 75, 65, 'Purple')

    gui.drawText(100, 50, 'Scroll', 'Black')
    gui.drawText(175, 50, 'Phial', 'Black')

    if (input.getmouse()['X'] > 35 and input.getmouse()['X'] < 75 and input.getmouse()['Y'] > 50 and input.getmouse()['Y'] < 65) then
      if (input.getmouse()['Left']) then
        print('click')
        giveItem(items.powers.buster)
      end
    end
  else
    gui.clearGraphics()
  end

end

while true do
  itemDashboard()
  emu.frameadvance()
end
