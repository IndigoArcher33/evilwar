-- [yue]: darkrp_modules\tips\sh_tips.yue
if CLIENT then -- 2
	CreateClientConVar("lfr_hints", 1, true, true, "Toggle whether hints display each time you become a ghost.") -- 3
end -- 2
local meta = FindMetaTable("Player") -- 5
meta.TakeAHint = function(self) -- 7
	return self:SendChat("GENERIC", "<f=Spleen_Chat><c=128,128,128> You are a ghost, an unfortunate soul in this forsaken world. You can teleport to certain areas with the R key, areas that you can find a body you can possess.") -- 8
end -- 7
meta.TakeAHintStalker = function(self) -- 10
	return self:SendChat("GENERIC", "<f=Spleen_Chat><c=0,200,200> You are a stalker, a unpatriotic wastelander. Maybe, you could possibly barter with the EMPEROR with whatever you can find out with the wastes, and in the mines. Unlike everyone else, you are talented. Talented at not caring about what trash you'll dig through today.") -- 11
end -- 10
meta.TakeAHintBonehead = function(self) -- 13
	return self:SendChat("GENERIC", "<f=Spleen_Chat><c=255,255,255> ARRRRGHH, MUST KILL THEM ALL AND TAKE THEIR SKIN!!!") -- 14
end -- 13
meta.TakeAHintPrivate = function(self) -- 16
	return self:SendChat("GENERIC", "<f=Spleen_Chat><c=0,200,0> You are a patriotic Lymphoman resident conscripted to serve as both a laborer and combatant. You are mainly responsible about the productivity and labor of this glorious city and can operate factories unlike anyone else.") -- 17
end -- 16
meta.TakeAHintConscript = function(self) -- 19
	return self:SendChat("GENERIC", "<f=Spleen_Chat><c=0,0,200> You have been conscripted by the emperor himself to serve as a policing unit in Lymphoma. You're responsible for keeping order in the city and risking your life for the Emperor. This role holds responsibility.<c=0,0,0> You must not purposely cause the deaths of your comrades. If you cannot take this responsibility, kill yourself.") -- 20
end -- 19
meta.TakeAHintSanitar = function(self) -- 22
	return self:SendChat("GENERIC", "<f=Spleen_Chat><c=0,0,200> You are apart of the dragoons, the EMPEROR'S finest and superb soldiers. The Privates, Conscripts, and Sanitaters are your subordinates, Whilst the EMPEROR and the Quartermaster are your superiors. <c=0,0,0>Keep order within the city, but If you cannot take this responsibility, kill yourself.") -- 23
end -- 22
meta.TakeAHintDealer = function(self) -- 25
	return self:SendChat("GENERIC", "<f=Spleen_Chat><c=255,255,0> You are the Quartermaster. Thanks to your kapitalist mindset, your able to get better deals from the autodealers. You can use /meister to let everyone hear your voice.<c=0,0,0> But, if you cannot take the responsibility of being a quartermaster, kill yourself.") -- 26
end -- 25
meta.TakeAHintEmperor = function(self) -- 28
	return self:SendChat("GENERIC", "<f=Spleen_Chat><c=200,0,0> You are the EMPEROR, the wise leader of the Lymphomians. You must keep order within your city, and keep your men in line. Perhaps think about conscripting a few privates to keep the city safe.") -- 29
end -- 28
hook.Add("PlayerSpawn", "evilrp_hints", function(ply) -- 32
	if not (ply:GetInfoNum("lfr_hints", 1) == 1) then -- 33
		return -- 33
	end -- 33
	return timer.Simple(3, function() -- 34
		if not (ply and IsValid(ply)) then -- 35
			return -- 35
		end -- 35
		if not ply:Alive() then -- 36
			return -- 36
		end -- 36
		if not ply.got_first_hint then -- 37
			ply.got_first_hint = true -- 38
			ply:SendChat("GENERIC", "<f=Spleen_Chat><c=128,128,128> You are a ghost, an unfortunate soul in this forsaken world. You can teleport to certain areas with the R key, areas that you can find a body you can possess.") -- 39
			return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,100,100>[ <c=0,200,200>You can press F1 to receive info on your current fate in life, at any time. <c=0,100,100>]") -- 40
		end -- 37
	end) -- 40
end) -- 32
return hook.Add("ShowHelp", "evilrp_hints", function(ply) -- 42
	if not SERVER then -- 43
		return -- 43
	end -- 43
	if not ply:Alive() then -- 44
		return -- 44
	end -- 44
	if ply:Team() == TEAM_GHOST then -- 45
		ply:TakeAHint() -- 46
		return -- 47
	end -- 45
	if ply:Team() == TEAM_STALKER then -- 48
		ply:TakeAHintStalker() -- 49
		return -- 50
	end -- 48
	if ply:Team() == TEAM_BONEHEAD then -- 51
		ply:TakeAHintBonehead() -- 52
		return -- 53
	end -- 51
	if ply:Team() == TEAM_PRIVATE then -- 54
		ply:TakeAHintPrivate() -- 55
		return -- 56
	end -- 54
	if ply:Team() == TEAM_CONSCRIPT then -- 57
		ply:TakeAHintConscript() -- 58
		return -- 59
	end -- 57
	if ply:Team() == TEAM_SANITAR then -- 60
		ply:TakeAHintSanitar() -- 61
		return -- 62
	end -- 60
	if ply:Team() == TEAM_DEALER then -- 63
		ply:TakeAHintDealer() -- 64
		return -- 65
	end -- 63
	if ply:Team() == TEAM_KORPSMAN then -- 66
		ply:TakeAHintKorpsman() -- 67
		return -- 68
	end -- 66
	if ply:Team() == TEAM_EMPEROR then -- 69
		ply:TakeAHintEmperor() -- 70
		return -- 71
	end -- 69
end) -- 71
