mem.get = function (memory)
  if (not memory.location or memory.location == 'wram') then
    return mem.wram(memory.address, memory.bytes or 1);
  end
end
