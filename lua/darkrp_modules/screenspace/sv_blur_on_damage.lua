util.AddNetworkString("evilrp_blur_on_damage")
local blur_on_damage
blur_on_damage = function(victim, attacker, health_remaining, damage)
	if victim:IsPlayer() and victim:Alive() then
		net.Start("evilrp_blur_on_damage")
		return net.Send(victim)
	end
end
return hook.Add("PlayerHurt", "evilrp_blur_on_damage", blur_on_damage)
