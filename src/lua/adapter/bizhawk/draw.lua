draw = {
  box = function(x, y, width, height, borderColor, fillColor)
    gui.drawBox(x, y, x + width, y + height, borderColor, fillColor)
  end,
  line = function(x, y, xx, yy, color)
    gui.drawLine(x, y, xx, yy, color)
  end,
  text = function(x, y, text)
    gui.drawText(x, y, text, 'White', nil, 8, 'Lucida Console')
  end
}