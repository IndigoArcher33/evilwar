local next_reload_sound = 0
local gmacs = false
local reload_jumpscare
reload_jumpscare = function()
	if gmacs then
		return
	end
	if CLIENT then
		local lp = LocalPlayer()
		if CurTime() > next_reload_sound then
			lp:EmitSound("npc/combine_gunship/ping_patrol.wav", 75, math.random(80, 90), 0.2)
			util.ScreenShake(lp:GetPos(), 25, 5, 3, 5000)
			next_reload_sound = CurTime() + 5
		end
	end
	return
end
return hook.Add("OnReloaded", "evilrp_reload_jumpscare", reload_jumpscare)
