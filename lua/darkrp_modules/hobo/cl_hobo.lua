-- [yue]: darkrp_modules\hobo\cl_hobo.yue
local tell_the_truth_hook -- 1
tell_the_truth_hook = function(ply, bind, pressed) -- 1
	local wep = LocalPlayer():GetActiveWeapon() -- 2
	if ply == LocalPlayer() and wep:IsValid() and string.find(string.lower(bind), "attack2") and wep:GetClass() == "weapon_bugbait" then -- 3
		return LocalPlayer():ConCommand("tell_the_truth") -- 4
	end -- 3
end -- 1
return hook.Add("PlayerBindPress", "evilrp_tell_the_truth", tell_the_truth_hook) -- 6
