local meta = FindMetaTable("Player")
meta.HasDonation = function(self, donation)
	if self:IsBot() then
		return false
	end
	if self:IsAdmin() then
		return true
	end
	self.donations = self.donations or { }
	return table.HasValue(self.donations, donation)
end
meta.AddDonation = function(self, donation, dont_save)
	if dont_save == nil then
		dont_save = false
	end
	if not SERVER then
		return
	end
	if not table.HasValue(self.donations, donation) then
		do
			local _obj_0 = self.donations
			_obj_0[#_obj_0 + 1] = donation
		end
	end
	if not dont_save then
		return self:SaveDonations()
	end
end
meta.SaveDonations = function(self)
	if not SERVER then
		return
	end
	local str = ""
	local _list_0 = self.donations
	for _index_0 = 1, #_list_0 do
		local dono = _list_0[_index_0]
		str = str .. tostring(dono) .. "|"
	end
	str = str:sub(1, -2)
	return sql.Query("UPDATE evilrp_donations SET Donations = '" .. tostring(str) .. "' WHERE SteamID = '" .. tostring(self:SteamID64()) .. "'")
end
if SERVER then
	netstream.Hook("ListMyDonations", function(ply)
		if #ply.donations <= 0 then
			ply:SendChat("GENERIC", "<f=Spleen_Chat_Small>You don't appear to have any rewards given for donating.")
		else
			ply:SendChat("GENERIC", "<f=Spleen_Chat_Small>It looks like you've got the following:")
			local i = 0
			local _list_0 = ply.donations
			for _index_0 = 1, #_list_0 do
				local d = _list_0[_index_0]
				i = i + 1
				ply:SendChat("GENERIC", "<f=Spleen_Chat_Small>* <rgb=" .. tostring(i * 5) .. ",1,30>" .. tostring(d))
			end
		end
		if ply:IsAdmin() then
			return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small>(As an 'administrator', you have every donation reward by default.)")
		end
	end)
end
concommand.Add("donations", (function()
	return netstream.Send("ListMyDonations")
end), nil, "List the donation rewards you have, if any.")
local rainbow_config = {
	speed = 1
}
if CLIENT then
	CreateClientConVar("lfr_rainbow_playermodel", 1, true, true, "Toggle whether Rainbow Knighthood is active for your lenses and such, if you have it.")
	CreateClientConVar("lfr_rainbow_physicsgun", 1, true, true, "Toggle whether Rainbow Knighthood is active for your Telegland, if you have it.")
	CreateClientConVar("lfr_rainbow_username", 1, true, true, "Toggle whether Rainbow Knighthood is active for your Steam name in OOC chat, if you have it.")
end
local rainbow_knighthood_think
rainbow_knighthood_think = function()
	local speed = rainbow_config.speed
	local _list_0 = player.GetAll()
	for _index_0 = 1, #_list_0 do
		local ply = _list_0[_index_0]
		if not ply:HasDonation("rainbow") then
			goto _continue_0
		end
		local rgb = HSVToColor((CurTime() * 38) % 360, 1, 1)
		local r
		local g
		local b
		local enabled_playermodel
		if SERVER then
			enabled_playermodel = ply:GetInfoNum("lfr_rainbow_playermodel", 1) == 1
			local enabled_playermodel_nw = ply:GetNWBool("lfr_rainbow_playermodel", true)
			if enabled_playermodel ~= enabled_playermodel_nw then
				ply:SetNWBool("lfr_rainbow_playermodel", enabled_playermodel)
			end
		else
			enabled_playermodel = ply:GetNWBool("lfr_rainbow_playermodel", true)
		end
		local enabled_physicsgun
		if SERVER then
			enabled_physicsgun = ply:GetInfoNum("lfr_rainbow_physicsgun", 1) == 1
			local enabled_physicsgun_nw = ply:GetNWBool("lfr_rainbow_physicsgun", true)
			if enabled_physicsgun ~= enabled_physicsgun_nw then
				ply:SetNWBool("lfr_rainbow_physicsgun", enabled_physicsgun)
			end
		else
			enabled_physicsgun = ply:GetNWBool("lfr_rainbow_physicsgun", true)
		end
		if enabled_playermodel then
			r = rgb.r / 255
			g = rgb.g / 255
			b = rgb.b / 255
			ply:SetPlayerColor(Vector(r, g, b))
		end
		if enabled_physicsgun then
			r = rgb.r / 255
			g = rgb.g / 255
			b = rgb.b / 255
			ply:SetWeaponColor(Vector(r, g, b))
		end
		::_continue_0::
	end
end
return hook.Add("Think", "evilrp_rainbow_donation", rainbow_knighthood_think)
