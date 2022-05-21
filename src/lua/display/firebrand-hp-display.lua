function displayFirebrandHp()
  local firebrandHp = firebrand.getHp()

  if (firebrandHp <= 9) then
    draw.text(148, 1, firebrandHp .. ' HP', draw.color.green)
  else
    draw.text(145, 1, firebrandHp .. ' HP', draw.color.green)
  end
end
