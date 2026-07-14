-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/donations/sh_donations.yue
local meta = FindMetaTable("Player") -- 1
meta.HasDonation = function(self, donation) -- 3
	if self:IsBot() then -- 4
		return false -- 4
	end -- 4
	if self:IsAdmin() then -- 5
		return true -- 5
	end -- 5
	self.donations = self.donations or { } -- 6
	return table.HasValue(self.donations, donation) -- 7
end -- 3
meta.AddDonation = function(self, donation, dont_save) -- 9
	if dont_save == nil then -- 9
		dont_save = false -- 9
	end -- 9
	if not SERVER then -- 10
		return -- 10
	end -- 10
	if not table.HasValue(self.donations, donation) then -- 11
		local _obj_0 = self.donations -- 11
		_obj_0[#_obj_0 + 1] = donation -- 11
	end -- 11
	if not dont_save then -- 12
		return self:SaveDonations() -- 12
	end -- 12
end -- 9
meta.SaveDonations = function(self) -- 14
	if not SERVER then -- 15
		return -- 15
	end -- 15
	local str = "" -- 16
	local _list_0 = self.donations -- 17
	for _index_0 = 1, #_list_0 do -- 17
		local dono = _list_0[_index_0] -- 17
		str = str .. tostring(dono) .. "|" -- 17
	end -- 17
	str = str:sub(1, -2) -- 18
	return sql.Query("UPDATE evilrp_donations SET Donations = '" .. tostring(str) .. "' WHERE SteamID = '" .. tostring(self:SteamID64()) .. "'") -- 19
end -- 14
if SERVER then -- 21
	netstream.Hook("ListMyDonations", function(ply) -- 22
		if #ply.donations <= 0 then -- 23
			ply:SendChat("GENERIC", "<f=Spleen_Chat_Small>You don't appear to have any rewards given for donating.") -- 24
		else -- 26
			ply:SendChat("GENERIC", "<f=Spleen_Chat_Small>It looks like you've got the following:") -- 26
			local i = 0 -- 27
			local _list_0 = ply.donations -- 28
			for _index_0 = 1, #_list_0 do -- 28
				local d = _list_0[_index_0] -- 28
				i = i + 1 -- 29
				ply:SendChat("GENERIC", "<f=Spleen_Chat_Small>* <rgb=" .. tostring(i * 5) .. ",1,30>" .. tostring(d)) -- 30
			end -- 30
		end -- 23
		if ply:IsAdmin() then -- 31
			return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small>(As an 'administrator', you have every donation reward by default.)") -- 32
		end -- 31
	end) -- 22
end -- 21
concommand.Add("donations", (function() -- 34
	return netstream.Send("ListMyDonations") -- 34
end), nil, "List the donation rewards you have, if any.") -- 34
local rainbow_config = { -- 37
	speed = 1 -- 37
} -- 36
if CLIENT then -- 39
	CreateClientConVar("lfr_rainbow_playermodel", 1, true, true, "Toggle whether Rainbow Knighthood is active for your lenses and such, if you have it.") -- 40
	CreateClientConVar("lfr_rainbow_physicsgun", 1, true, true, "Toggle whether Rainbow Knighthood is active for your Telegland, if you have it.") -- 41
	CreateClientConVar("lfr_rainbow_username", 1, true, true, "Toggle whether Rainbow Knighthood is active for your Steam name in OOC chat, if you have it.") -- 42
end -- 39
local rainbow_knighthood_think -- 44
rainbow_knighthood_think = function() -- 44
	local speed = rainbow_config.speed -- 45
	local _list_0 = player.GetAll() -- 46
	for _index_0 = 1, #_list_0 do -- 46
		local ply = _list_0[_index_0] -- 46
		local _continue_0 = false -- 47
		repeat -- 47
			if not ply:HasDonation("rainbow") then -- 47
				_continue_0 = true -- 47
				break -- 47
			end -- 47
			local rgb = HSVToColor((CurTime() * 38) % 360, 1, 1) -- 48
			local r -- 49
			local g -- 50
			local b -- 51
			local enabled_playermodel -- 52
			if SERVER then -- 53
				enabled_playermodel = ply:GetInfoNum("lfr_rainbow_playermodel", 1) == 1 -- 54
				local enabled_playermodel_nw = ply:GetNWBool("lfr_rainbow_playermodel", true) -- 55
				if enabled_playermodel ~= enabled_playermodel_nw then -- 56
					ply:SetNWBool("lfr_rainbow_playermodel", enabled_playermodel) -- 57
				end -- 56
			else -- 59
				enabled_playermodel = ply:GetNWBool("lfr_rainbow_playermodel", true) -- 59
			end -- 53
			local enabled_physicsgun -- 60
			if SERVER then -- 61
				enabled_physicsgun = ply:GetInfoNum("lfr_rainbow_physicsgun", 1) == 1 -- 62
				local enabled_physicsgun_nw = ply:GetNWBool("lfr_rainbow_physicsgun", true) -- 63
				if enabled_physicsgun ~= enabled_physicsgun_nw then -- 64
					ply:SetNWBool("lfr_rainbow_physicsgun", enabled_physicsgun) -- 65
				end -- 64
			else -- 67
				enabled_physicsgun = ply:GetNWBool("lfr_rainbow_physicsgun", true) -- 67
			end -- 61
			if enabled_playermodel then -- 68
				r = rgb.r / 255 -- 69
				g = rgb.g / 255 -- 70
				b = rgb.b / 255 -- 71
				ply:SetPlayerColor(Vector(r, g, b)) -- 72
			end -- 68
			if enabled_physicsgun then -- 73
				r = rgb.r / 255 -- 74
				g = rgb.g / 255 -- 75
				b = rgb.b / 255 -- 76
				ply:SetWeaponColor(Vector(r, g, b)) -- 77
			end -- 73
			_continue_0 = true -- 47
		until true -- 77
		if not _continue_0 then -- 77
			break -- 77
		end -- 77
	end -- 77
end -- 44
return hook.Add("Think", "evilrp_rainbow_donation", rainbow_knighthood_think) -- 78
