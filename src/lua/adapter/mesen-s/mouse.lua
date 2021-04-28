mouse = {
  clicked = function(x, y, xx, yy)
    local m = emu.getMouseState()
    return m.left and m.x >= x and m.x <= xx and m.y >= y and m.y <= yy
  end
}
