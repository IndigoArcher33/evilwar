if CLIENT then
	net.Receive("evilrp_heart_attack", function()
		GAMEMODE:Jumpscare()
		return lp:Notify("<col=255,0,0>MY HEART STOPPED")
	end)
	net.Receive("evilrp_starvation", function()
		GAMEMODE:Frighten()
		return lp:Notify("<col=255,0,0>THE HUNGER IS TOO MUCH")
	end)
	net.Receive("evilrp_dehydration", function()
		GAMEMODE:Frighten()
		return lp:Notify("<col=255,0,0>SO DRY... TOO DRY. UH OH")
	end)
else
	util.AddNetworkString("evilrp_heart_attack")
	util.AddNetworkString("evilrp_dehydration")
	util.AddNetworkString("evilrp_starvation")
end
local meta = FindMetaTable("Player")
for k, v in pairs({
	AddHunger = function(self, amt)
		local jt = self:getJobTable()
		if jt.no_needs then
			return
		end
		local h = self:GetHunger()
		h = math.Clamp(h + amt, 0, 100)
		self:SetHunger(h)
		if h >= 100 and not self.death_by_neglect then
			self.death_by_neglect = true
			net.Start("evilrp_starvation")
			net.Send(self)
			return timer.Simple(3, function()
				self:Kill()
				return self:SetHunger(60)
			end)
		else
			local max = self:GetMaxHealth()
			local hp_add = 2
			if self:Team() == TEAM_KORPSMAN then
				hp_add = hp_add * 2
			end
			return self:SetHealth(math.min(max, self:Health() + hp_add))
		end
	end,
	SetHunger = function(self, amt)
		if SERVER then
			sql.Query("UPDATE evilrp_needs SET Hunger = '" .. tostring(amt) .. "' WHERE SteamID = '" .. tostring(self:SteamID64()) .. "'")
			return self:SetNWFloat("evilrp_needs_hunger", amt)
		end
	end,
	GetHunger = function(self)
		if SERVER then
			return tonumber(sql.Query("SELECT Hunger FROM evilrp_needs WHERE SteamID = '" .. tostring(self:SteamID64()) .. "'")[1].Hunger)
		else
			return self:GetNWFloat("evilrp_needs_hunger", 0)
		end
	end,
	AddThirst = function(self, amt)
		local jt = self:getJobTable()
		if jt.no_needs then
			return
		end
		local t = self:GetThirst()
		t = math.Clamp(t + amt, 0, 100)
		self:SetThirst(t)
		if t >= 100 and not self.death_by_neglect then
			net.Start("evilrp_dehydration")
			net.Send(self)
			self.death_by_neglect = true
			return timer.Simple(3, function()
				self.death_by_neglect = true
				self:Kill()
				return self:SetThirst(60)
			end)
		else
			local max = self:GetMaxHealth()
			local hp_add = 2
			if self:Team() == TEAM_KORPSMAN then
				hp_add = hp_add * 2
			end
			return self:SetHealth(math.min(max, self:Health() + hp_add))
		end
	end,
	SetThirst = function(self, amt)
		if SERVER then
			sql.Query("UPDATE evilrp_needs SET Thirst = '" .. tostring(amt) .. "' WHERE SteamID = '" .. tostring(self:SteamID64()) .. "'")
			return self:SetNWFloat("evilrp_needs_thirst", amt)
		end
	end,
	GetThirst = function(self)
		if SERVER then
			return tonumber(sql.Query("SELECT Thirst FROM evilrp_needs WHERE SteamID = '" .. tostring(self:SteamID64()) .. "'")[1].Thirst)
		else
			return self:GetNWFloat("evilrp_needs_thirst", 0)
		end
	end,
	AddDespair = function(self, amt)
		local jt = self:getJobTable()
		if jt.no_needs then
			return
		end
		local d = self:GetDespair()
		d = math.Clamp(d + amt, 0, 100)
		self:SetDespair(d)
		if d >= 100 and not self.death_by_neglect then
			net.Start("evilrp_heart_attack")
			net.Send(self)
			self.death_by_neglect = true
			return timer.Simple(3, function()
				self:Kill()
				return self:SetDespair(60)
			end)
		end
	end,
	SetDespair = function(self, amt)
		if SERVER then
			sql.Query("UPDATE evilrp_needs SET Despair = '" .. tostring(amt) .. "' WHERE SteamID = '" .. tostring(self:SteamID64()) .. "'")
			return self:SetNWFloat("evilrp_needs_despair", amt)
		end
	end,
	GetDespair = function(self)
		if self:Team() == TEAM_GHOST then
			return 0
		end
		if SERVER then
			return tonumber(sql.Query("SELECT Despair FROM evilrp_needs WHERE SteamID = '" .. tostring(self:SteamID64()) .. "'")[1].Despair)
		else
			return self:GetNWFloat("evilrp_needs_despair", 0)
		end
	end
}) do
	meta[k] = v
end
local is_moving
is_moving = function(ply)
	return ply:GetVelocity():Length2D() > 5
end
local need_intervals = {
	hunger = 45,
	thirst = 40,
	despair = 75
}
local need_think_hunger
need_think_hunger = function(ply)
	if not ply.needs_ticks.hunger then
		ply.needs_ticks.hunger = CurTime() + need_intervals.hunger
	end
	if CurTime() >= ply.needs_ticks.hunger and ply:Alive() and is_moving(ply) then
		ply:AddHunger(1)
		ply.needs_ticks.hunger = CurTime() + need_intervals.hunger
	end
end
local need_think_thirst
need_think_thirst = function(ply)
	if not ply.needs_ticks.thirst then
		ply.needs_ticks.thirst = CurTime() + need_intervals.thirst
	end
	if CurTime() >= ply.needs_ticks.thirst and ply:Alive() and is_moving(ply) then
		ply:AddThirst(1)
		ply.needs_ticks.thirst = CurTime() + need_intervals.thirst
	end
end
local need_think_despair
need_think_despair = function(ply)
	if not ply.needs_ticks.despair then
		ply.needs_ticks.despair = CurTime() + need_intervals.despair
	end
	if CurTime() >= ply.needs_ticks.despair and ply:Alive() and is_moving(ply) and ply:HasOddity(ODDITY_DEPRESSION) then
		local amt = math.random(1, 3)
		ply:AddDespair(amt)
		ply.needs_ticks.despair = CurTime() + need_intervals.despair
	end
end
return hook.Add("Think", "evilrp_needs", function()
	if SERVER then
		local _list_0 = player.GetAll()
		for _index_0 = 1, #_list_0 do
			local ply = _list_0[_index_0]
			if not ply.needs_ticks then
				ply.needs_ticks = { }
			end
			if ply:Team() == TEAM_GHOST then
				goto _continue_0
			end
			need_think_hunger(ply)
			need_think_thirst(ply)
			need_think_despair(ply)
			::_continue_0::
		end
	end
	return
end)
