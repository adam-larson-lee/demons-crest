displayFirebrandPosition = function ()
  local firebrandX = firebrand.getX() .. '';
  local xLocation = 116 - (firebrandX:len() * 3)
  draw.text(xLocation, 216, firebrandX .. ',' ..firebrand.getY());
end
