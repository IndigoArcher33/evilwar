util.AddNetworkString("evilrp_frighten")
util.AddNetworkString("evilrp_jumpscare")
util.AddNetworkString("evilrp_judgement")
local death_jumpscare
death_jumpscare = function(ply, attacker, dmg)
	net.Start("evilrp_judgement")
	net.Send(ply)
	return
end
return hook.Add("DoPlayerDeath", "evilrp_death_jumpscare", death_jumpscare)
