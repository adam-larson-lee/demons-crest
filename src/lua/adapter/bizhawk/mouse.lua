mouse = {
  clicked = function(x, y, xx, yy)
    local m = input.getmouse()
    return m.Left and m.X >= x and m.X <= xx and m.Y >= y and m.Y <= yy
  end
}
