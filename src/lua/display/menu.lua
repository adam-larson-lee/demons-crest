display = {
  joypad = {
    order = 1,
    name = 'Joypad',
    togglable = true,
    enabled = true
  },
  levelDetails = {
    order = 2,
    name = 'Level Info',
    togglable = true,
    enabled = true,
  },
  hitboxes = {
    order = 3,
    name = 'Hitboxes',
    togglable = true,
    enabled = false
  },
  iframes = {
    order = 4,
    name = 'iFrames',
    togglable = true,
    enabled = false
  },
  objectDetails = {
    togglable = false,
    enabled = false
  }
}

local options = {};

for option in pairs(display) do
  if (display[option].togglable) then
    options[display[option].order] = display[option];
    options[display[option].order].debounce = 0;
  end
end

local menuOpen = false;
local debounce = 0;

function displayMenu()

  draw.text(116, 1, "MENU", menuOpen and draw.color.green or draw.color.white);

  if (menuOpen) then

    local menuX = 5
    local menuY = 40
    local menuWidth = 80
    local menuHeight = 100

    local optionsBorder = 5
    local optionSize = 12
    local optionBoxSize = 8

    draw.box(menuX, menuY, menuWidth, menuHeight, draw.color.green, draw.color.black);

    for i, option in ipairs(options) do

      if (option.debounce > 0) then
        option.debounce = option.debounce - 1
      end

      option.isClicked = function ()
        return mouse.clicked(
          menuX + optionsBorder,
          menuY + optionsBorder + ((i - 1) * optionSize),
          menuX + menuWidth - optionsBorder,
          menuY + optionsBorder + ((i - 1) * optionSize) + optionBoxSize
        )
      end

      draw.box(
        menuX + optionsBorder,
        menuY + optionsBorder + ((i - 1) * optionSize),
        optionBoxSize,
        optionBoxSize,
        draw.color.white
      )

      if (option.enabled) then
        -- draw checkmark
        draw.line(
          menuX + optionsBorder + 2,
          menuY + optionsBorder + ((i - 1) * optionSize) + 4,
          menuX + optionsBorder + 4,
          menuY + optionsBorder + ((i - 1) * optionSize) + 6,
          draw.color.green
        )
        draw.line(
          menuX + optionsBorder + 4,
          menuY + optionsBorder + ((i - 1) * optionSize) + 6,
          menuX + optionsBorder + 6,
          menuY + optionsBorder + ((i - 1) * optionSize) + 2,
          draw.color.green
        )
      end

      draw.text(
        menuX + optionsBorder + optionBoxSize + 2,
        menuY + optionsBorder + ((i - 1) * optionSize) + 2,
        option.name
      );
    end
  end

  if (debounce > 0) then
    debounce = debounce - 1
  end

  if (menuOpen) then
    for _, option in ipairs(options) do
      if (option.isClicked()) then
        if (option.debounce == 0) then
          option.enabled = not option.enabled
          option.debounce = 10;
        end
      end
    end
  end

  if (debounce == 0) then
    if (mouse.clicked(108, 1, 130, 8)) then
      menuOpen = not menuOpen
      debounce = 10
    end
  end
end