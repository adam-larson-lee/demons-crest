input = {
  isPressed = function(buttonName)
    return emu.getInput(0)[string.lower(buttonName)]
  end
}