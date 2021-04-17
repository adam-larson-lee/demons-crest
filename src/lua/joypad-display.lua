function joypadDisplay()

  local xCoord = 0;
  local yCoord = 189;

  local function button(name, display, pressedColor, drawShape, shapeSize, text)
    return {
      name = name,
      display = display == nil and name or display,
      pressedColor = pressedColor,
      isPressed = function (self)
        return joypad.get(1)[self.name]
      end,
      draw = function (self, x, y)
        drawShape(x, y, shapeSize.w, shapeSize.h, 'Black', self:isPressed() and self.pressedColor or 'White')
        gui.drawText(x + text.x, y + text.y, self.display, self:isPressed() and 'White' or 'black', nil, text.size, 'Lucida Console')
      end
    }
  end

  local function shoulderButton(name)
    return button(name, nil, 'Thistle', gui.drawRectangle, { w=22, h=8 }, { x=8, y=1, size=7 })
  end

  shoulderButton('L'):draw(xCoord, yCoord)
  shoulderButton('R'):draw(xCoord + 57, yCoord)

  local function directionalButton(name, display)
    return button(name, display, 'Gray', gui.drawRectangle, { w=8, h=8 }, { x=0, y=1, size=8 })
  end

  directionalButton('Left', '<'):draw(xCoord + 0, yCoord + 18)
  directionalButton('Up', 'U'):draw(xCoord + 7, yCoord + 10)
  directionalButton('Right', '>'):draw(xCoord + 14, yCoord + 18)
  directionalButton('Down', 'D'):draw(xCoord + 7, yCoord + 26)

  local function selectOrStartButton(name, display)
    return button(name, display, 'Gray', gui.drawRectangle, { w=15, h=8 }, { x=1, y=2, size=6 })
  end

  selectOrStartButton('Select', 'sel'):draw(xCoord + 25, yCoord + 18)
  selectOrStartButton('Start', 'sta'):draw(xCoord + 40, yCoord + 18)

  local function actionButton(name, pressedColor)
    return button(name, nil, pressedColor, gui.drawEllipse, { w=8, h=8 }, { x=1, y=1, size=7 })
  end

  actionButton('Y', 'Thistle'):draw(xCoord + 58, yCoord + 18)
  actionButton('X', 'Thistle'):draw(xCoord + 64, yCoord + 10)
  actionButton('A', 'Purple'):draw(xCoord + 70, yCoord + 18)
  actionButton('B', 'Purple'):draw(xCoord + 64, yCoord + 26)

end

while true do
  joypadDisplay()
  emu.frameadvance()
end
