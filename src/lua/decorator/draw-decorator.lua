-- This method is far to slow to use during regular play right now.

draw.boxes = function (box1, box2, overlapColor)

  local getLine = function (x1, y1, x2, y2, color)
    return { x1 = x1, y1 = y1, x2 = x2, y2 = y2, color = color}
  end

  local leftLine = function (box)
    return getLine(box.x, box.y, box.x, box.y + box.h, box.color)
  end

  local topLine = function (box)
    return getLine(box.x, box.y, box.x + box.w, box.y, box.color)
  end

  local rightLine = function (box)
    return getLine(box.x + box.w, box.y, box.x + box.w, box.y + box.h, box.color)
  end

  local bottomLine = function (box)
    return getLine(box.x, box.y + box.h, box.x + box.w, box.y + box.h, box.color)
  end

  local drawLine = function (line)
    draw.line(line.x1, line.y1, line.x2, line.y2, line.color)
  end

  local drawVerticalLines = function(line1, line2, overlapColor)
    -- we know that for both lines x1 == x2
    if (line1.x1 == line2.x1) then
      local x = line1.x1

      for y = math.min(line1.y1, line2.y1), math.max(line1.y2, line2.y2) do
        local yInLine1 = y >= line1.y1 and y <= line1.y2
        local yInLine2 = y >= line2.y1 and y <= line2.y2

        if (yInLine1 and yInLine2) then
          draw.pixel(x, y, overlapColor)
        elseif (yInLine1) then
          draw.pixel(x, y, line1.color)
        elseif (yInLine2) then
          draw.pixel(x, y, line2.color)
        end

      end
    else
      drawLine(line1)
      drawLine(line2)
    end
  end

  local drawHorizontalLines = function(line1, line2, overlapColor)
    -- we know that for both lines y1 == y2
    if (line1.y1 == line2.y1) then
      local y = line1.y1

      for x = math.min(line1.x1, line2.x1), math.max(line1.x2, line2.x2) do
        local xInLine1 = x >= line1.x1 and x <= line1.x2
        local xInLine2 = x >= line2.x1 and x <= line2.x2

        if (xInLine1 and xInLine2) then
          draw.pixel(x, y, overlapColor)
        elseif (xInLine1) then
          draw.pixel(x, y, line1.color)
        elseif (xInLine2) then
          draw.pixel(x, y, line2.color)
        end

      end
    else
      drawLine(line1)
      drawLine(line2)
    end
  end

  local rightLine1 = rightLine(box1)
  local rightLine2 = rightLine(box2)

  local bottomLine1 = bottomLine(box1)
  local bottomLine2 = bottomLine(box2)

  drawVerticalLines(leftLine(box1), leftLine(box2), overlapColor)
  drawVerticalLines(rightLine(box1), rightLine(box2), overlapColor)
  drawHorizontalLines(topLine(box1), topLine(box2), overlapColor)
  drawHorizontalLines(bottomLine(box1), bottomLine(box2), overlapColor)

end