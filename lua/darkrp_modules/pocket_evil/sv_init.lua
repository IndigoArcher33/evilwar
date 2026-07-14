util.AddNetworkString("EvilRP_Pocket")
util.AddNetworkString("EvilRP_PocketMenu")
util.AddNetworkString("EvilRP_spawnPocket")
local send_pocket_items
send_pocket_items = function(ply)
	net.Start("EvilRP_Pocket")
	net.WriteTable(ply:GetPocketItems())
	return net.Send(ply)
end
hook.Add("OnPlayerChangedTeam", "evilrp_send_pocket", send_pocket_items)
local meta = FindMetaTable("Player")
for k, v in pairs({
	GetPocketItems = function(self)
		self.darkRPPocket = self.darkRPPocket or { }
		local res = { }
		for k, v in pairs(self.darkRPPocket) do
			local r = {
				model = v.Model,
				class = v.Class
			}
			if v.DT then
				r.wepcls = v.DT.WeaponClass
			end
			res[k] = r
		end
		return res
	end
}) do
	meta[k] = v
end
net.Receive("EvilRP_spawnPocket", function(len, ply)
	local item = net.ReadFloat()
	local use = net.ReadBool()
	if not (ply.darkRPPocket and ply.darkRPPocket[item]) then
		return
	end
	if not ply:Alive() then
		return
	end
	local can_pickup, message = hook.Call("canDropPocketItem", nil, ply, item, ply.darkRPPocket[item])
	if can_pickup == false then
		if message then
			DarkRP.notify(ply, 1, 4, message)
		end
		send_pocket_items(ply)
		return
	end
	local dropped = ply:dropPocketItem(item)
	if use then
		return timer.Simple(0.1, function()
			dropped.inventory_use = true
			dropped:Use(ply)
			if dropped:GetNWBool("usefail") then
				dropped:SetNWBool("usefail", false)
				return ply:addPocketItem(dropped)
			end
		end)
	else
		return dropped:SetNWEntity("evilrp_submitter", ply)
	end
end)
local drop_pocket_item
drop_pocket_item = function(ply)
	if not (IsValid(ply) and ply:Alive()) then
		return
	end
	if ply:Team() == TEAM_GHOST then
		return
	end
	local max_k = 0
	for k in pairs(ply:GetPocketItems()) do
		if k < max_k then
			goto _continue_0
		end
		max_k = k
		::_continue_0::
	end
	if max_k > 0 then
		local item = ply:dropPocketItem(max_k)
		return timer.Simple(0.0666, function()
			if item and IsValid(item) and item:GetClass():find("trash/*") then
				return ply:PickupObject(item)
			end
		end)
	end
end
return hook.Add("ShowHelp", "evilrp_drop_pocket_item", drop_pocket_item)
