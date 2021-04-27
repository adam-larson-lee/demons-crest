function displayFirebrandHp()
  local firebrandHp = firebrand.getHp()

  if (firebrandHp <= 9) then
    draw.text(156, 1, firebrand.getHp())
  else
    draw.text(153, 1, firebrand.getHp())
  end
end
