-- [yue]: darkrp_modules\misc\sh_hooks.yue
hook.Add("PlayerSpray", "evilrp_disable_sprays", function() -- 1
	return true -- 1
end) -- 1
hook.Add("CanPlayerSuicide", "evilrp_suicide_prevention_hotline", function() -- 3
	return false -- 3
end) -- 3
hook.Add("PlayerSwitchFlashlight", "evilrp_no_flashlight", function() -- 5
	return false -- 5
end) -- 5
hook.Add("PlayerSetHandsModel", "evilrp_corpse_fingers", function(ply, ent) -- 7
	do -- 8
		local jobt = RPExtraTeams[ply:Team()] -- 9
		local fallback_mdl = "models/weapons/c_arms_citizen.mdl" -- 10
		local fallback_skin = 2 -- 11
		local c_arms = (jobt and jobt.arms_model or fallback_mdl) or fallback_mdl -- 12
		local skin = (jobt and jobt.arms_skin or fallback_skin) or fallback_skin -- 13
		local bg = 0 -- 14
		ent:SetModel(c_arms) -- 15
		ent:SetSkin(skin) -- 16
		timer.Simple(1, function() -- 17
			if string.find(ply:GetModel(), "models/liver_failure") then -- 18
				local _exp_0 = ply:GetBodygroup(9) -- 19
				if 1 == _exp_0 or 2 == _exp_0 then -- 20
					return ent:SetBodygroup(1, 1) -- 21
				else -- 23
					return ent:SetBodygroup(1, 0) -- 23
				end -- 23
			end -- 18
		end) -- 17
	end -- 8
	return true -- 24
end) -- 7
if SERVER then -- 26
	local extinguish_things -- 31
	extinguish_things = function() -- 31
		local _list_0 = ents.FindByClass("portal*") -- 32
		for _index_0 = 1, #_list_0 do -- 32
			local portal = _list_0[_index_0] -- 32
			if portal:IsOnFire() then -- 33
				portal:Extinguish() -- 33
			end -- 33
		end -- 33
		local _list_1 = player.GetAll() -- 34
		for _index_0 = 1, #_list_1 do -- 34
			local ply = _list_1[_index_0] -- 34
			if ply:WaterLevel() > 0 and ply:IsOnFire() then -- 35
				ply:Extinguish() -- 35
			end -- 35
		end -- 35
		return -- 36
	end -- 31
	hook.Add("Think", "evilrp_extinguish_things", extinguish_things) -- 37
end -- 26
GAMEMODE.GetHandTrace = function(self, ply, len) -- 39
	if len == nil then -- 39
		len = 50 -- 39
	end -- 39
	local start = ply:EyePos() -- 40
	local trace = { -- 42
		start = start, -- 42
		endpos = start + ply:GetAimVector() * len, -- 43
		filter = ply -- 44
	} -- 41
	return util.TraceLine(trace) -- 46
end -- 39
if CLIENT then -- 48
	hook.Add("ChatText", "evilrp_chat_suppress", function() -- 49
		return true -- 49
	end) -- 49
end -- 48
if SERVER then -- 50
	local player_connect -- 51
	player_connect = function(name, ip) -- 51
		local _list_0 = player.GetAdmins() -- 52
		for _index_0 = 1, #_list_0 do -- 52
			local a = _list_0[_index_0] -- 52
			a:SendChat("NOTICE", tostring(name) .. " has connected.") -- 53
		end -- 53
	end -- 51
	hook.Add("PlayerConnect", "evilrp_connection", player_connect) -- 54
	local player_disconnected -- 55
	player_disconnected = function(ply) -- 55
		local _list_0 = player.GetAdmins() -- 56
		for _index_0 = 1, #_list_0 do -- 56
			local a = _list_0[_index_0] -- 56
			a:SendChat("NOTICE", tostring(ply:SteamName()) .. " has disconnected.") -- 57
		end -- 57
	end -- 55
	hook.Add("PlayerDisconnected", "evilrp_connection", player_disconnected) -- 58
end -- 50
util.Blood = function(pos, amount, dir, force, noprediction) -- 60
	local ed = EffectData() -- 61
	ed:SetOrigin(pos) -- 63
	ed:SetMagnitude(amount) -- 64
	ed:SetNormal(dir) -- 65
	ed:SetScale(math.max(128, force)) -- 66
	return util.Effect("Bloodstream", ed, nil, noprediction) -- 67
end -- 60
hook.Add("StartCommand", "evilrp_bot_testers", function(bot, cmd) -- 70
	if not (bot:IsBot() and bot:Alive()) then -- 71
		return -- 71
	end -- 71
	cmd:ClearMovement() -- 73
	cmd:ClearButtons() -- 74
	return -- 75
end) -- 70
if SERVER then -- 78
	netstream.Hook("DropWeapon", function(ply) -- 79
		local wep = ply:GetActiveWeapon() -- 80
		if not wep:IsValid() or wep:GetModel() == "" then -- 81
			ply:Notify("<c=200,0,0>" .. tostring(DarkRP.getPhrase("cannot_drop_weapon"))) -- 82
			return -- 83
		end -- 81
		local can_drop = hook.Call("canDropWeapon", GAMEMODE, ply, wep) -- 84
		if not can_drop then -- 85
			ply:Notify("<c=200,0,0>" .. tostring(DarkRP.getPhrase("cannot_drop_weapon"))) -- 86
			return -- 87
		end -- 85
		ply:DoAnimationEvent(ACT_GMOD_GESTURE_ITEM_DROP) -- 88
		if IsValid(ply) and IsValid(wep) and ply:Alive() and wep:GetModel() ~= "" and not IsValid(ply:GetObserverTarget()) then -- 89
			return ply:dropDRPWeapon(wep) -- 90
		end -- 89
	end) -- 79
end -- 78
return hook.Add("CanProperty", "evilrp_dev_supremacy", function(ply, property, ent) -- 93
	if ply:IsSuperAdmin() then -- 94
		return true -- 94
	end -- 94
end) -- 94
