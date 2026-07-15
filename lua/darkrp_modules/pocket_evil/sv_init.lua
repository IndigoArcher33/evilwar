-- [yue]: darkrp_modules\pocket_evil\sv_init.yue
util.AddNetworkString("EvilRP_Pocket") -- 1
util.AddNetworkString("EvilRP_PocketMenu") -- 2
util.AddNetworkString("EvilRP_spawnPocket") -- 3
local send_pocket_items -- 5
send_pocket_items = function(ply) -- 5
	net.Start("EvilRP_Pocket") -- 6
	net.WriteTable(ply:GetPocketItems()) -- 7
	return net.Send(ply) -- 8
end -- 5
hook.Add("OnPlayerChangedTeam", "evilrp_send_pocket", send_pocket_items) -- 10
local meta = FindMetaTable("Player") -- 12
for k, v in pairs({ -- 17
	GetPocketItems = function(self) -- 17
		self.darkRPPocket = self.darkRPPocket or { } -- 18
		local res = { } -- 19
		for k, v in pairs(self.darkRPPocket) do -- 20
			local r = { -- 22
				model = v.Model, -- 22
				class = v.Class -- 23
			} -- 21
			if v.DT then -- 25
				r.wepcls = v.DT.WeaponClass -- 25
			end -- 25
			res[k] = r -- 26
		end -- 26
		return res -- 27
	end -- 17
}) do -- 28
	meta[k] = v -- 16
end -- 14
net.Receive("EvilRP_spawnPocket", function(len, ply) -- 30
	local item = net.ReadFloat() -- 31
	local use = net.ReadBool() -- 32
	if not (ply.darkRPPocket and ply.darkRPPocket[item]) then -- 33
		return -- 33
	end -- 33
	if not ply:Alive() then -- 34
		return -- 34
	end -- 34
	local can_pickup, message = hook.Call("canDropPocketItem", nil, ply, item, ply.darkRPPocket[item]) -- 35
	if can_pickup == false then -- 36
		if message then -- 37
			DarkRP.notify(ply, 1, 4, message) -- 37
		end -- 37
		send_pocket_items(ply) -- 38
		return -- 39
	end -- 36
	local dropped = ply:dropPocketItem(item) -- 40
	if use then -- 41
		return timer.Simple(0.1, function() -- 42
			dropped.inventory_use = true -- 43
			dropped:Use(ply) -- 44
			if dropped:GetNWBool("usefail") then -- 45
				dropped:SetNWBool("usefail", false) -- 46
				return ply:addPocketItem(dropped) -- 47
			end -- 45
		end) -- 47
	else -- 49
		return dropped:SetNWEntity("evilrp_submitter", ply) -- 49
	end -- 41
end) -- 30
local drop_pocket_item -- 51
drop_pocket_item = function(ply) -- 51
	if not (IsValid(ply) and ply:Alive()) then -- 52
		return -- 52
	end -- 52
	if ply:Team() == TEAM_GHOST then -- 53
		return -- 53
	end -- 53
	local max_k = 0 -- 54
	for k in pairs(ply:GetPocketItems()) do -- 55
		local _continue_0 = false -- 56
		repeat -- 56
			if k < max_k then -- 56
				_continue_0 = true -- 56
				break -- 56
			end -- 56
			max_k = k -- 57
			_continue_0 = true -- 56
		until true -- 57
		if not _continue_0 then -- 57
			break -- 57
		end -- 57
	end -- 57
	if max_k > 0 then -- 58
		local item = ply:dropPocketItem(max_k) -- 59
		return timer.Simple(0.0666, function() -- 60
			if item and IsValid(item) and item:GetClass():find("trash/*") then -- 60
				return ply:PickupObject(item) -- 60
			end -- 60
		end) -- 60
	end -- 58
end -- 51
return hook.Add("ShowHelp", "evilrp_drop_pocket_item", drop_pocket_item) -- 62
