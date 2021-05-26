local item = function (address, bytes, whichBit)
  return {
    address = address,
    bit = whichBit,
    give = function ()
      if (whichBit > 0) then
        mem.writeWram(mem.writeWram(address, bytes, bit.bor(mem.wram(address, bytes), whichBit)))
      end
    end,
    isObtained = function ()
      if (whichBit >= 0) then
        return bit.check(mem.wram(address, bytes), whichBit)
      else
        return false
      end
    end
  }
end

items = {
  powers = {
    fire = item(0x001E51, 1, -1),
    buster = item(0x001E51, 1, 0),
    tornado = item(0x001E51, 1, 1),
    claw = item(0x001E51, 1, 2),
    demonFire = item(0x001E51, 1, 3)
  },
  crests = {
    earth = item(0x001E51, 1, 4),
    air = item(0x001E51, 1, 5),
    water = item(0x001E51, 1, 6),
    time = item(0x001E51, 1, 7),
    infinity = item(0x001E52, 1, 0),
  },
  vellum = {
    one = item(0x001E52, 1, 1),
    two = item(0x001E52, 1, 2),
    three = item(0x001E52, 1, 3),
    four = item(0x001E52, 1, 4),
    five = item(0x001E52, 1, 5),
  },
  urns = {
    one = item(0x001E52, 1, 6),
    two = item(0x001E52, 1, 7),
    three = item(0x001E53, 1, 0),
    four = item(0x001E53, 1, 1),
    five = item(0x001E53, 1, 2),
  },
  talismans = {
    crown = item(0x001E52, 1, 3),
    skull = item(0x001E52, 1, 4),
    armor = item(0x001E53, 1, 5),
    fang = item(0x001E53, 1, 6),
    hand = item(0x001E53, 1, 7),
  },
  health = { -- TODO: replace with boss/location names
    one = item(0x001E54, 1, 0),
    two = item(0x001E54, 1, 1),
    three = item(0x001E54, 1, 2),
    four = item(0x001E54, 1, 3),
    five = item(0x001E54, 1, 4),
    six = item(0x001E54, 1, 5),
    seven = item(0x001E54, 1, 6),
    eight = item(0x001E54, 1, 7),
    nine = item(0x001E55, 1, 0),
    ten = item(0x001E55, 1, 1),
    eleven = item(0x001E55, 1, 2),
    twelve = item(0x001E55, 1, 3),
    thirteen = item(0x001E55, 1, 4),
    fourteen = item(0x001E55, 1, 5),
    fifteen = item(0x001E55, 1, 6),
    sixteen = item(0x001E55, 1, 7),
  },
}

getItemCompletion = function ()
  local obtainedItemCount = 0

  for tk, tv in pairs(items) do
    for ik, iv in pairs(tv) do
      obtainedItemCount = obtainedItemCount + (iv.isObtained() and 1 or 0)
    end
  end

  return math.floor((obtainedItemCount / 40) * 100)
end