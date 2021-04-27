display = {
  hitboxes = {
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
  if (debounce == 0 and mouse.clicked(108, 0, 116, 8)) then
    display.hitboxes.enabled = not display.hitboxes.enabled
    debounce = 10
  end
end