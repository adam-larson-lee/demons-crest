draw = {
  color = {
    white = 'White',
    gray = 'Gray',
    black = 'Black',
    green = 'Green',
    red = 'Red',
    yellow = 'Yellow'
  },
  box = function(x, y, width, height, borderColor, fillColor)
    gui.drawBox(x, y, x + width, y + height, borderColor, fillColor)
  end,
  line = function(x, y, xx, yy, color)
    gui.drawLine(x, y, xx, yy, color)
  end,
  pixel = function(x, y, color)
    gui.drawPixel(x, y, color)
  end,
  text = function(x, y, text, color)
    gui.drawText(x, y, text, color or 'White', nil, 8, 'Lucida Console')
  end,
  clear = function()
  end
}