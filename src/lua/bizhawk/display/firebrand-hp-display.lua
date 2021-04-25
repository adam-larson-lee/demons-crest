function displayFirebrandHp()
  local firebrandHp = firebrand.getHp()

  if (firebrandHp <= 9) then
    drawText(156, 0, firebrand.getHp())
  else
    drawText(153, 0, firebrand.getHp())
  end
end
