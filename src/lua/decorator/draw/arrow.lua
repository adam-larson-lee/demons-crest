draw.leftArrow = function(x, y, color)
  draw.line(x + 6, y + 2, x + 3, y + 2, color)
  draw.line(x + 3, y + 2, x + 3, y, color)
  draw.line(x + 3, y, x, y + 3, color)
  draw.line(x, y + 3, x + 3, y + 6, color)
  draw.line(x + 3, y + 6, x + 3, y + 4, color)
  draw.line(x + 3, y + 4, x + 6, y + 4, color)
  draw.line(x + 6, y + 4, x + 6, y + 2, color)
end

draw.rightArrow = function(x, y, color)
  draw.line(x, y + 2, x + 3, y + 2, color)
  draw.line(x + 3, y + 2, x + 3, y, color)
  draw.line(x + 3, y, x + 6, y + 3, color)
  draw.line(x + 6, y + 3, x + 3, y + 6, color)
  draw.line(x + 3, y + 6, x + 3, y + 4, color)
  draw.line(x + 3, y + 4, x, y + 4, color)
  draw.line(x, y + 4, x, y + 2, color)
end

draw.upArrow = function(x, y, color)
  draw.line(x + 2, y + 6, x + 2, y + 3, color)
  draw.line(x + 2, y + 3, x, y + 3, color)
  draw.line(x, y + 3, x + 3, y, color)
  draw.line(x + 3, y, x + 6, y + 3, color)
  draw.line(x + 6, y + 3, x + 4, y + 3, color)
  draw.line(x + 4, y + 3, x + 4, y + 6, color)
  draw.line(x + 4, y + 6, x + 2, y + 6, color)
end

draw.downArrow = function(x, y, color)
  draw.line(x + 4, y, x + 4, y + 3, color);
  draw.line(x + 4, y + 3, x + 6, y + 3, color);
  draw.line(x + 6, y + 3, x + 3, y + 6, color);
  draw.line(x + 3, y + 6, x, y + 3, color);
  draw.line(x, y + 3, x + 2, y + 3, color);
  draw.line(x + 2, y + 3, x + 2, y, color);
  draw.line(x + 2, y, x + 4, y, color);
end;
