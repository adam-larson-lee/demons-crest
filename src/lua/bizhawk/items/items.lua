require 'bitflag'

items = {
  powers = {
    fire = bitflag(0x001E51, 0x00),
    buster = bitflag(0x001E51, 0x01),
    tornado = bitflag(0x001E51, 0x02),
    claw = bitflag(0x001E51, 0x04),
    demonFire = bitflag(0x001E51, 0x08)
  },
  crests = {
    earth = bitflag(0x001E51, 0x10),
    air = bitflag(0x001E51, 0x20),
    water = bitflag(0x001E51, 0x40),
    time = bitflag(0x001E51, 0x80),
    infinity = bitflag(0x001E52, 0x01),
  },
  vellum = {
    one = bitflag(0x001E52, 0x02),
    two = bitflag(0x001E52, 0x04),
    three = bitflag(0x001E52, 0x08),
    four = bitflag(0x001E52, 0x10),
    five = bitflag(0x001E52, 0x20),
  },
  urns = {
    one = bitflag(0x001E52, 0x40),
    two = bitflag(0x001E52, 0x80),
    three = bitflag(0x001E53, 0x01),
    four = bitflag(0x001E53, 0x02),
    five = bitflag(0x001E53, 0x04),
  },
  talismans = {
    crown = bitflag(0x001E52, 0x08),
    skull = bitflag(0x001E52, 0x10),
    armor = bitflag(0x001E53, 0x20),
    fang = bitflag(0x001E53, 0x40),
    hand = bitflag(0x001E53, 0x80),
  },
}