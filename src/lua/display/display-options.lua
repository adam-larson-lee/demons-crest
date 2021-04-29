display = {
  joypad = {
    enabled = true
  },
  hitboxes = {
    enabled = false
  },
  objectDetails = {
    enabled = false
  }
}

local debounce = 0;

function displayOptions()

  if (debounce > 0) then
    debounce = debounce - 1
  end

  if (display.hitboxes.enabled) then
    draw.box(108, 1, 8, 8, draw.color.green)
  else
    draw.box(108, 1, 8, 8, draw.color.white)
  end

  if (display.objectDetails.enabled) then
    draw.box(120, 1, 8, 8, draw.color.green)
    draw.line(122, 5, 124, 7, draw.color.green)
    draw.line(124, 7, 126, 3, draw.color.green)
  else
    draw.box(120, 1, 8, 8, draw.color.white)
    draw.line(122, 5, 124, 7, draw.color.white)
    draw.line(124, 7, 126, 3, draw.color.white)
  end

  if (debounce == 0) then
    if (mouse.clicked(108, 1, 116, 8)) then
    display.hitboxes.enabled = not display.hitboxes.enabled
    debounce = 10
    elseif (mouse.clicked(120, 1, 128, 8)) then
      if (display.objectDetails.enabled) then
        hideObjectDetails()
      end
    end
  end
end