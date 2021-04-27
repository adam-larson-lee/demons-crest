function displayFirebrandHp()
  local firebrandHp = firebrand.getHp()

  if (firebrandHp <= 9) then
    draw.text(156, 0, firebrand.getHp())
  else
    draw.text(153, 0, firebrand.getHp())
  end
end
