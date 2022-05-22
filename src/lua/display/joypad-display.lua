function displayJoypad()

  local xCoord = 0;
  local yCoord = 1;

  local function button(name, display, drawMethod)
    return {
      name = name,
      display = display == nil and name or display,
      isPressed = function (self)
        return input.isPressed(self.name)
      end,
      draw = function (self, x, y)
        if (self:isPressed()) then
          if (not drawMethod) then
            draw.text(x, y, self.display)
          else
            drawMethod(x, y)
          end
        end        
      end
    }
  end

  local function directionalButton(name)

    local function drawLeftButton(x, y)
      draw.leftArrow(x, y)
    end

    local function drawRightButton(x, y)
      draw.rightArrow(x, y)
    end

    local function drawUpButton(x, y)
      draw.upArrow(x, y)
    end

    local function drawDownButton(x, y)
      draw.downArrow(x, y);
    end

    local drawMethods = {
      ['Left'] = drawLeftButton,
      ['Right'] = drawRightButton,
      ['Up'] = drawUpButton,
      ['Down'] = drawDownButton
    }

    return button(name, nil, drawMethods[name])
  end

  directionalButton('Left'):draw(xCoord + 0, yCoord)
  directionalButton('Up'):draw(xCoord + 9, yCoord)
  directionalButton('Right'):draw(xCoord + 18, yCoord)
  directionalButton('Down'):draw(xCoord + 27, yCoord)

  local function shoulderButton(name)
    return button(name, nil)
  end

  shoulderButton('L'):draw(xCoord + 36, yCoord)
  shoulderButton('R'):draw(xCoord + 45, yCoord)

  local function actionButton(name)
    return button(name, nil)
  end

  actionButton('Y'):draw(xCoord + 54, yCoord)
  actionButton('X'):draw(xCoord + 63, yCoord)
  actionButton('A'):draw(xCoord + 72, yCoord)
  actionButton('B'):draw(xCoord + 81, yCoord)

  local function selectOrStartButton(name, display)
    return button(name, display)
  end

  selectOrStartButton('Select', 'E'):draw(xCoord + 90, yCoord)
  selectOrStartButton('Start', 'T'):draw(xCoord + 99, yCoord)

end
