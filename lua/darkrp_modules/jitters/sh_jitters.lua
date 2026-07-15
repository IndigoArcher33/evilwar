-- [yue]: darkrp_modules\jitters\sh_jitters.yue
local hp_threshold = 30 -- 1
local intensity_max = 5 -- 2
local disabled = false -- 3
local fear_of_death -- 5
fear_of_death = function() -- 5
	if not (lp and IsValid(lp)) then -- 6
		return -- 6
	end -- 6
	if disabled then -- 7
		return -- 7
	end -- 7
	local hp_curr = lp:Health() -- 8
	if hp_curr <= hp_threshold then -- 9
		local intensity = (hp_threshold - hp_curr) / hp_threshold * intensity_max -- 10
		local p = math.random(-intensity, intensity) -- 11
		local y = math.random(-intensity, intensity) -- 12
		local ang = Angle(p, y, 0) -- 14
		return lp:SetEyeAngles(lp:EyeAngles() + ang) -- 15
	end -- 9
end -- 5
return hook.Add("Think", "evilrp_fear_of_death", fear_of_death) -- 16
