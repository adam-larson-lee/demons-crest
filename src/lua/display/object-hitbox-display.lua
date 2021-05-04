function displayObjectHitboxes()

  --the comments are just observations, i still have no idea what these flags mean
  local statusColors = {
    [16] = 'White', --firerband
    [18] = 'Blue', --jars and items from jars... and items from enemies sometimes? and arma 1 projectiles? and firebrand projectile collision?
    [22] = 'Red', --enemies... most of the time?
    [86] = 'Yellow', --hippogriff before you headbutt?
    [146] = 'Purple', --items from enemies... sometimes?
    [150] = 'Green', --spawn points, enemies... sometimes?
    [210] = 'Black', --dying enemies?
  }

  for j,obj in ipairs(objects) do
    if (obj.isAlive()) then
      if (j ~= selectedObject) then

        draw.box(obj.getRelativeX() - obj.getXHitbox(), obj.getRelativeY() - obj.topHitbox(), obj.getXHitbox() * 2, obj.topHitbox() + obj.bottomHitbox(), obj.getHp() > 0 and draw.color.red or draw.color.gray)
        draw.box(obj.getRelativeX() - obj.getXHitbox(), obj.getRelativeY() - obj.topTouchbox(), obj.getXHitbox() * 2, obj.topTouchbox() + obj.bottomTouchbox(), obj.getHp() > 0 and draw.color.white or draw.color.gray)

        if (obj.getContactDamage() > 0) then
          -- hitbox
          --draw.box(obj.getRelativeX() - obj.getXHitbox(), obj.getRelativeY() - obj.topHitbox(), obj.getXHitbox() * 2, obj.topHitbox() + obj.bottomHitbox(), obj.getHp() > 0 and draw.color.red or draw.color.gray)
          draw.text(obj.getRelativeX() - 4, obj.getRelativeY() - obj.topHitbox() - 6, j - 2)
          draw.pixel(obj.getRelativeX(), obj.getRelativeY(), draw.color.white)
        else
          -- touchbox
          --draw.box(obj.getRelativeX() - obj.getXHitbox(), obj.getRelativeY() - obj.topTouchbox(), obj.getXHitbox() * 2, obj.topTouchbox() + obj.bottomTouchbox(), obj.getHp() > 0 and draw.color.white or draw.color.gray)
          draw.text(obj.getRelativeX() - 4, obj.getRelativeY() - obj.topTouchbox() - 6, j - 2)
          draw.pixel(obj.getRelativeX(), obj.getRelativeY(), draw.color.white)
        end
      end
    end
  end
end