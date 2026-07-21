-- [yue]: darkrp_modules\water\sv_water.yue
local meta = FindMetaTable("Player") -- 1
for k, v in pairs({ -- 4
	CheckWater = function(self, distance) -- 4
		local start = self:GetShootPos() -- 5
		local tr = util.TraceLine({ -- 7
			start = start, -- 7
			endpos = start + (self:GetAimVector() * distance), -- 8
			mask = bit.bor(MASK_WATER, MASK_SOLID), -- 9
			filter = self -- 10
		}) -- 6
		if not tr.Hit then -- 12
			return false -- 12
		end -- 12
		if not (tr.MatType == MAT_SLOSH) then -- 13
			return false -- 13
		end -- 13
		return true -- 14
	end -- 4
}) do -- 15
	meta[k] = v -- 3
end -- 3
local gulp = Sound("npc/barnacle/barnacle_gulp2.wav") -- 17
local drink_water -- 19
drink_water = function(ply, key) -- 19
	if IN_USE == key then -- 21
		if ply:CheckWater(80) then -- 22
			ply:DoAnimationEvent(ACT_GMOD_GESTURE_ITEM_GIVE) -- 23
			ply:AddThirst(-5) -- 24
			ply:AddDespair(10) -- 25
			ply:TakeDamage(5) -- 26
			return ply:EmitSound(gulp) -- 27
		end -- 22
	end -- 27
end -- 19
return hook.Add("KeyPress", "evilrp_drink_water", drink_water) -- 29
