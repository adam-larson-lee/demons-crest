draw = {
  color = {
    white = 0xFFFFFF,
    black = 0x000000,
    green = 0x00FF00,
    red = 0xFF0000
  },
  box = function(x, y, width, height, borderColor, fillColor)
    emu.drawRectangle(x, y, width, height, borderColor, fillColor)
  end,
  line = function(x, y, xx, yy, color)
    emu.drawLine(x, y, xx, yy, color)
  end,
  pixel = function(x, y, color)
    emu.drawPixel(x, y, color)
  end,
  text = function(x, y, text)
    emu.drawString(x, y, text, 0xFFFFFF)
  end,
  clear = function()
    emu.clearScreen()
  end
}