function displayIframes()
    for _, object in ipairs(objects) do
      local iframes = object.getIframes()
      if (object.isAlive() and iframes > 0) then
        draw.box(
          object.getRelativeX(),
          object.getRelativeY(),
          6 * math.ceil(math.log10(iframes)) + 1,
          8,
          draw.color.black,
          draw.color.black
        )
        draw.text(
          object.getRelativeX() + 1,
          object.getRelativeY() + 1,
          iframes,
          draw.color.red
        )
      end
    end
end

-- HIPPO iFrames 001DD7