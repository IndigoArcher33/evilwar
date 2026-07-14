hook.Add("PlayerSpray", "evilrp_disable_sprays", function()
	return true
end)
hook.Add("CanPlayerSuicide", "evilrp_suicide_prevention_hotline", function()
	return false
end)
hook.Add("PlayerSwitchFlashlight", "evilrp_no_flashlight", function()
	return false
end)
hook.Add("PlayerSetHandsModel", "evilrp_corpse_fingers", function(ply, ent)
	do
		local jobt = RPExtraTeams[ply:Team()]
		local fallback_mdl = "models/weapons/c_arms_citizen.mdl"
		local fallback_skin = 2
		local c_arms = (jobt and jobt.arms_model or fallback_mdl) or fallback_mdl
		local skin = (jobt and jobt.arms_skin or fallback_skin) or fallback_skin
		local bg = 0
		ent:SetModel(c_arms)
		ent:SetSkin(skin)
		timer.Simple(1, function()
			if string.find(ply:GetModel(), "models/liver_failure") then
				local _exp_0 = ply:GetBodygroup(9)
				if 1 == _exp_0 or 2 == _exp_0 then
					return ent:SetBodygroup(1, 1)
				else
					return ent:SetBodygroup(1, 0)
				end
			end
		end)
	end
	return true
end)
if SERVER then
	local extinguish_things
	extinguish_things = function()
		local _list_0 = ents.FindByClass("portal*")
		for _index_0 = 1, #_list_0 do
			local portal = _list_0[_index_0]
			if portal:IsOnFire() then
				portal:Extinguish()
			end
		end
		local _list_1 = player.GetAll()
		for _index_0 = 1, #_list_1 do
			local ply = _list_1[_index_0]
			if ply:WaterLevel() > 0 and ply:IsOnFire() then
				ply:Extinguish()
			end
		end
		return
	end
	hook.Add("Think", "evilrp_extinguish_things", extinguish_things)
end
GAMEMODE.GetHandTrace = function(self, ply, len)
	if len == nil then
		len = 50
	end
	local start = ply:EyePos()
	local trace = {
		start = start,
		endpos = start + ply:GetAimVector() * len,
		filter = ply
	}
	return util.TraceLine(trace)
end
if CLIENT then
	hook.Add("ChatText", "evilrp_chat_suppress", function()
		return true
	end)
end
if SERVER then
	local player_connect
	player_connect = function(name, ip)
		local _list_0 = player.GetAdmins()
		for _index_0 = 1, #_list_0 do
			local a = _list_0[_index_0]
			a:SendChat("NOTICE", tostring(name) .. " has connected.")
		end
	end
	hook.Add("PlayerConnect", "evilrp_connection", player_connect)
	local player_disconnected
	player_disconnected = function(ply)
		local _list_0 = player.GetAdmins()
		for _index_0 = 1, #_list_0 do
			local a = _list_0[_index_0]
			a:SendChat("NOTICE", tostring(ply:SteamName()) .. " has disconnected.")
		end
	end
	hook.Add("PlayerDisconnected", "evilrp_connection", player_disconnected)
end
util.Blood = function(pos, amount, dir, force, noprediction)
	local ed = EffectData()
	ed:SetOrigin(pos)
	ed:SetMagnitude(amount)
	ed:SetNormal(dir)
	ed:SetScale(math.max(128, force))
	return util.Effect("Bloodstream", ed, nil, noprediction)
end
hook.Add("StartCommand", "evilrp_bot_testers", function(bot, cmd)
	if not (bot:IsBot() and bot:Alive()) then
		return
	end
	cmd:ClearMovement()
	cmd:ClearButtons()
	return
end)
if SERVER then
	netstream.Hook("DropWeapon", function(ply)
		local wep = ply:GetActiveWeapon()
		if not wep:IsValid() or wep:GetModel() == "" then
			ply:Notify("<c=200,0,0>" .. tostring(DarkRP.getPhrase("cannot_drop_weapon")))
			return
		end
		local can_drop = hook.Call("canDropWeapon", GAMEMODE, ply, wep)
		if not can_drop then
			ply:Notify("<c=200,0,0>" .. tostring(DarkRP.getPhrase("cannot_drop_weapon")))
			return
		end
		ply:DoAnimationEvent(ACT_GMOD_GESTURE_ITEM_DROP)
		if IsValid(ply) and IsValid(wep) and ply:Alive() and wep:GetModel() ~= "" and not IsValid(ply:GetObserverTarget()) then
			return ply:dropDRPWeapon(wep)
		end
	end)
end
return hook.Add("CanProperty", "evilrp_dev_supremacy", function(ply, property, ent)
	if ply:IsSuperAdmin() then
		return true
	end
end)
