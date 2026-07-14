local hp_threshold = 30
local intensity_max = 5
local disabled = false
local fear_of_death
fear_of_death = function()
	if not (lp and IsValid(lp)) then
		return
	end
	if disabled then
		return
	end
	local hp_curr = lp:Health()
	if hp_curr <= hp_threshold then
		local intensity = (hp_threshold - hp_curr) / hp_threshold * intensity_max
		local p = math.random(-intensity, intensity)
		local y = math.random(-intensity, intensity)
		local ang = Angle(p, y, 0)
		return lp:SetEyeAngles(lp:EyeAngles() + ang)
	end
end
return hook.Add("Think", "evilrp_fear_of_death", fear_of_death)
