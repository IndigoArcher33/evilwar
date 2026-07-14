local meta = FindMetaTable("Player")
for k, v in pairs({
	CheckWater = function(self, distance)
		local start = self:GetShootPos()
		local tr = util.TraceLine({
			start = start,
			endpos = start + (self:GetAimVector() * distance),
			mask = bit.bor(MASK_WATER, MASK_SOLID),
			filter = self
		})
		if not tr.Hit then
			return false
		end
		if not (tr.MatType == MAT_SLOSH) then
			return false
		end
		return true
	end
}) do
	meta[k] = v
end
local gulp = Sound("npc/barnacle/barnacle_gulp2.wav")
local drink_water
drink_water = function(ply, key)
	if IN_USE == key then
		if ply:CheckWater(80) then
			ply:DoAnimationEvent(ACT_GMOD_GESTURE_ITEM_GIVE)
			ply:AddThirst(-5)
			return ply:EmitSound(gulp)
		end
	end
end
return hook.Add("KeyPress", "evilrp_drink_water", drink_water)
