local memory = {
  skullsCrushed = {
    address = 0x1610,
  },
  candlesRemaining = {
    address = 0x1DD0,
  },
  timeRemaining = {
    address = 0x1DCE,
    bytes = 2,
  },
};

displaySkullGame = function ()
  local skullsCrushed = mem.get(memory.skullsCrushed);
  local candlesRemaining = mem.get(memory.candlesRemaining);
  local timeRemaining = mem.get(memory.timeRemaining);

  if (candlesRemaining > 0 and candlesRemaining < 10) then
    draw.box(185, 50, 56, 8, draw.color.black, draw.color.black);
    draw.text(185, 51, timeRemaining .. ' frames');

    draw.box(185, 60, 22, 8, draw.color.black, draw.color.black);
    draw.text(185, 61, math.ceil(timeRemaining / 60) .. ' s');

    draw.box(184, 145, 25, 8, draw.color.black, draw.color.black);
    draw.text(184, 146, skullsCrushed .. '/25');
  end
end;
