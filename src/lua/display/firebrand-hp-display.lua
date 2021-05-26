function displayFirebrandHp()
  local firebrandHp = firebrand.getHp()

  if (firebrandHp <= 9) then
    draw.text(156, 1, firebrandHp)
  else
    draw.text(153, 1, firebrandHp)
  end
end
