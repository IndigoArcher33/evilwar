-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/reload/sh_reload.yue
local next_reload_sound = 0 -- 1
local gmacs = true -- 2
local reload_jumpscare -- 3
reload_jumpscare = function() -- 3
	if gmacs then -- 4
		return -- 4
	end -- 4
	if CLIENT then -- 5
		local lp = LocalPlayer() -- 6
		if CurTime() > next_reload_sound then -- 7
			lp:EmitSound("npc/combine_gunship/ping_patrol.wav", 75, math.random(80, 90), 0.2) -- 8
			util.ScreenShake(lp:GetPos(), 25, 5, 3, 5000) -- 9
			next_reload_sound = CurTime() + 5 -- 10
		end -- 7
	end -- 5
	return -- 11
end -- 3
return hook.Add("OnReloaded", "evilrp_reload_jumpscare", reload_jumpscare) -- 12
