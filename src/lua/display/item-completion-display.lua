function displayItemCompletion()
  local itemCompletion = getItemCompletion()

  if (itemCompletion <= 9) then
    draw.text(218, 1, itemCompletion .. '%')
  else
    draw.text(215, 1, itemCompletion .. '%')
  end
end
