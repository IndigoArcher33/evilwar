-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/jumpscares/sv_death.yue
util.AddNetworkString("evilrp_frighten") -- 1
util.AddNetworkString("evilrp_jumpscare") -- 2
util.AddNetworkString("evilrp_judgement") -- 3
local death_jumpscare -- 4
death_jumpscare = function(ply, attacker, dmg) -- 4
	net.Start("evilrp_judgement") -- 5
	net.Send(ply) -- 6
	return -- 7
end -- 4
return hook.Add("DoPlayerDeath", "evilrp_death_jumpscare", death_jumpscare) -- 8
