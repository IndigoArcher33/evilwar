-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/screenspace/sv_blur_on_damage.yue
util.AddNetworkString("evilrp_blur_on_damage") -- 4
local blur_on_damage -- 8
blur_on_damage = function(victim, attacker, health_remaining, damage) -- 8
	if victim:IsPlayer() and victim:Alive() then -- 9
		net.Start("evilrp_blur_on_damage") -- 10
		return net.Send(victim) -- 11
	end -- 9
end -- 8
return hook.Add("PlayerHurt", "evilrp_blur_on_damage", blur_on_damage) -- 12
