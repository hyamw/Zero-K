include "constants.lua"

local base = piece('base')
local drone = piece('drone')

function script.Create()
end

function script.AimFromWeapon(num)
	return drone
end

-- fake weapon, do not fire
function script.AimWeapon(num)
	return false
end

function script.QueryWeapon(num)
	return drone
end

function script.Killed(recentDamage, maxHealth)
    local severity = recentDamage/maxHealth
    if severity < .5 then
		Explode(base, sfxNone)
		return 1
    else
		Explode(base, sfxShatter)
		return 2
	end
end