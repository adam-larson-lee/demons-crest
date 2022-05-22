local memory = {
  orientationDegrees = {
    address = 0x1DDA,
    bytes = 2,
  },
};

displayOverworldCompass = function ()

  local orientationDegrees = mem.get(memory.orientationDegrees);

  local degreesXLocation = orientationDegrees < 10 and 125 or orientationDegrees < 100 and 122 or 120;
  draw.text(degreesXLocation, 50, orientationDegrees);

  local getDirection = function(degrees)
    if (degrees >= 0 and degrees < 22) then
      return 'N'
    elseif (degrees >= 22 and degrees < 67) then
      return 'NW'
    elseif (degrees >= 67 and degrees < 112) then
      return 'W'
    elseif (degrees >= 112 and degrees < 157) then
      return 'SW'
    elseif (degrees >= 157 and degrees < 202) then
      return 'S'
    elseif (degrees >= 202 and degrees < 247) then
      return 'SE'
    elseif (degrees >= 247 and degrees < 292) then
      return 'E'
    elseif (degrees >= 292 and degrees < 337) then
      return 'NE'
    elseif (degrees >= 337 and degrees <= 360) then
      return 'N'
    end
  end

  local upDirection = getDirection(orientationDegrees);
  draw.text(upDirection:len() == 1 and 125 or 122, 25, upDirection, draw.color.yellow);
  draw.upArrow(125, 35, draw.color.yellow);

  local upRightDirection = getDirection((orientationDegrees + 675) % 360);
  draw.text(136, 39, upRightDirection);

  local rightDirection = getDirection((orientationDegrees + 630) % 360);
  draw.text(150, 50, rightDirection);
  draw.rightArrow(140, 50);

  local downRightDirection = getDirection((orientationDegrees + 585) % 360);
  draw.text(136, 60, downRightDirection);

  local downDirection = getDirection((orientationDegrees + 540) % 360);
  draw.text(downDirection:len() == 1 and 125 or 122, 75, downDirection);
  draw.downArrow(125, 65);

  local downLeftDirection = getDirection((orientationDegrees + 495) % 360);
  draw.text(downLeftDirection:len() == 1 and 113 or 110, 60, downLeftDirection);

  local leftDirection = getDirection((orientationDegrees + 450) % 360);
  draw.text(leftDirection:len() == 1 and 101 or 96, 50, leftDirection);
  draw.leftArrow(110, 50);

  local upLeftDirection = getDirection((orientationDegrees + 405) % 360);
  draw.text(upLeftDirection:len() == 1 and 113 or 110, 39, upLeftDirection);
end;
