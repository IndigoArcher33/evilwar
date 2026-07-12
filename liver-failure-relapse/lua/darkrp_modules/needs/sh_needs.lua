-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/needs/sh_needs.yue
if CLIENT then -- 1
	net.Receive("evilrp_heart_attack", function() -- 2
		GAMEMODE:Jumpscare() -- 3
		return lp:Notify("<col=255,0,0>MY HEART STOPPED") -- 4
	end) -- 2
	net.Receive("evilrp_starvation", function() -- 5
		GAMEMODE:Frighten() -- 6
		return lp:Notify("<col=255,0,0>THE HUNGER IS TOO MUCH") -- 7
	end) -- 5
	net.Receive("evilrp_dehydration", function() -- 8
		GAMEMODE:Frighten() -- 9
		return lp:Notify("<col=255,0,0>SO DRY... TOO DRY. UH OH") -- 10
	end) -- 8
else -- 12
	util.AddNetworkString("evilrp_heart_attack") -- 12
	util.AddNetworkString("evilrp_dehydration") -- 13
	util.AddNetworkString("evilrp_starvation") -- 14
end -- 1
local meta = FindMetaTable("Player") -- 16
for k, v in pairs({ -- 19
	AddHunger = function(self, amt) -- 19
		local jt = self:getJobTable() -- 20
		if jt.no_needs then -- 21
			return -- 21
		end -- 21
		local h = self:GetHunger() -- 22
		h = math.Clamp(h + amt, 0, 100) -- 23
		self:SetHunger(h) -- 24
		if h >= 100 and not self.death_by_neglect then -- 25
			self.death_by_neglect = true -- 26
			net.Start("evilrp_starvation") -- 27
			net.Send(self) -- 28
			return timer.Simple(3, function() -- 29
				self:Kill() -- 30
				return self:SetHunger(60) -- 31
			end) -- 31
		else -- 33
			local max = self:GetMaxHealth() -- 33
			local hp_add = 2 -- 34
			if self:Team() == TEAM_KORPSMAN then -- 35
				hp_add = hp_add * 2 -- 35
			end -- 35
			return self:SetHealth(math.min(max, self:Health() + hp_add)) -- 36
		end -- 25
	end, -- 19
	SetHunger = function(self, amt) -- 37
		if SERVER then -- 38
			sql.Query("UPDATE evilrp_needs SET Hunger = '" .. tostring(amt) .. "' WHERE SteamID = '" .. tostring(self:SteamID64()) .. "'") -- 39
			return self:SetNWFloat("evilrp_needs_hunger", amt) -- 40
		end -- 38
	end, -- 37
	GetHunger = function(self) -- 41
		if SERVER then -- 42
			return tonumber(sql.Query("SELECT Hunger FROM evilrp_needs WHERE SteamID = '" .. tostring(self:SteamID64()) .. "'")[1].Hunger) -- 43
		else -- 45
			return self:GetNWFloat("evilrp_needs_hunger", 0) -- 45
		end -- 42
	end, -- 41
	AddThirst = function(self, amt) -- 47
		local jt = self:getJobTable() -- 48
		if jt.no_needs then -- 49
			return -- 49
		end -- 49
		local t = self:GetThirst() -- 50
		t = math.Clamp(t + amt, 0, 100) -- 51
		self:SetThirst(t) -- 52
		if t >= 100 and not self.death_by_neglect then -- 53
			net.Start("evilrp_dehydration") -- 54
			net.Send(self) -- 55
			self.death_by_neglect = true -- 56
			return timer.Simple(3, function() -- 57
				self.death_by_neglect = true -- 58
				self:Kill() -- 59
				return self:SetThirst(60) -- 60
			end) -- 60
		else -- 62
			local max = self:GetMaxHealth() -- 62
			local hp_add = 2 -- 63
			if self:Team() == TEAM_KORPSMAN then -- 64
				hp_add = hp_add * 2 -- 64
			end -- 64
			return self:SetHealth(math.min(max, self:Health() + hp_add)) -- 65
		end -- 53
	end, -- 47
	SetThirst = function(self, amt) -- 66
		if SERVER then -- 67
			sql.Query("UPDATE evilrp_needs SET Thirst = '" .. tostring(amt) .. "' WHERE SteamID = '" .. tostring(self:SteamID64()) .. "'") -- 68
			return self:SetNWFloat("evilrp_needs_thirst", amt) -- 69
		end -- 67
	end, -- 66
	GetThirst = function(self) -- 70
		if SERVER then -- 71
			return tonumber(sql.Query("SELECT Thirst FROM evilrp_needs WHERE SteamID = '" .. tostring(self:SteamID64()) .. "'")[1].Thirst) -- 72
		else -- 74
			return self:GetNWFloat("evilrp_needs_thirst", 0) -- 74
		end -- 71
	end, -- 70
	AddDespair = function(self, amt) -- 76
		local jt = self:getJobTable() -- 77
		if jt.no_needs then -- 78
			return -- 78
		end -- 78
		local d = self:GetDespair() -- 79
		d = math.Clamp(d + amt, 0, 100) -- 80
		self:SetDespair(d) -- 81
		if d >= 100 and not self.death_by_neglect then -- 82
			net.Start("evilrp_heart_attack") -- 83
			net.Send(self) -- 84
			self.death_by_neglect = true -- 85
			return timer.Simple(3, function() -- 86
				self:Kill() -- 87
				return self:SetDespair(60) -- 88
			end) -- 88
		end -- 82
	end, -- 76
	SetDespair = function(self, amt) -- 89
		if SERVER then -- 90
			sql.Query("UPDATE evilrp_needs SET Despair = '" .. tostring(amt) .. "' WHERE SteamID = '" .. tostring(self:SteamID64()) .. "'") -- 91
			return self:SetNWFloat("evilrp_needs_despair", amt) -- 92
		end -- 90
	end, -- 89
	GetDespair = function(self) -- 93
		if self:Team() == TEAM_GHOST then -- 94
			return 0 -- 94
		end -- 94
		if SERVER then -- 95
			return tonumber(sql.Query("SELECT Despair FROM evilrp_needs WHERE SteamID = '" .. tostring(self:SteamID64()) .. "'")[1].Despair) -- 96
		else -- 98
			return self:GetNWFloat("evilrp_needs_despair", 0) -- 98
		end -- 95
	end -- 93
}) do -- 99
	meta[k] = v -- 17
end -- 17
local is_moving -- 101
is_moving = function(ply) -- 101
	return ply:GetVelocity():Length2D() > 5 -- 101
end -- 101
local need_intervals = { -- 104
	hunger = 45, -- 104
	thirst = 40, -- 105
	despair = 75 -- 106
} -- 103
local need_think_hunger -- 108
need_think_hunger = function(ply) -- 108
	if not ply.needs_ticks.hunger then -- 109
		ply.needs_ticks.hunger = CurTime() + need_intervals.hunger -- 109
	end -- 109
	if CurTime() >= ply.needs_ticks.hunger and ply:Alive() and is_moving(ply) then -- 110
		ply:AddHunger(1) -- 111
		ply.needs_ticks.hunger = CurTime() + need_intervals.hunger -- 112
	end -- 110
end -- 108
local need_think_thirst -- 114
need_think_thirst = function(ply) -- 114
	if not ply.needs_ticks.thirst then -- 115
		ply.needs_ticks.thirst = CurTime() + need_intervals.thirst -- 115
	end -- 115
	if CurTime() >= ply.needs_ticks.thirst and ply:Alive() and is_moving(ply) then -- 116
		ply:AddThirst(1) -- 117
		ply.needs_ticks.thirst = CurTime() + need_intervals.thirst -- 118
	end -- 116
end -- 114
local need_think_despair -- 120
need_think_despair = function(ply) -- 120
	if not ply.needs_ticks.despair then -- 121
		ply.needs_ticks.despair = CurTime() + need_intervals.despair -- 121
	end -- 121
	if CurTime() >= ply.needs_ticks.despair and ply:Alive() and is_moving(ply) and ply:HasOddity(ODDITY_DEPRESSION) then -- 122
		local amt = math.random(1, 3) -- 123
		ply:AddDespair(amt) -- 124
		ply.needs_ticks.despair = CurTime() + need_intervals.despair -- 125
	end -- 122
end -- 120
return hook.Add("Think", "evilrp_needs", function() -- 127
	if SERVER then -- 128
		local _list_0 = player.GetAll() -- 129
		for _index_0 = 1, #_list_0 do -- 129
			local ply = _list_0[_index_0] -- 129
			local _continue_0 = false -- 130
			repeat -- 130
				if not ply.needs_ticks then -- 130
					ply.needs_ticks = { } -- 130
				end -- 130
				if ply:Team() == TEAM_GHOST then -- 131
					_continue_0 = true -- 131
					break -- 131
				end -- 131
				need_think_hunger(ply) -- 132
				need_think_thirst(ply) -- 133
				need_think_despair(ply) -- 134
				_continue_0 = true -- 130
			until true -- 134
			if not _continue_0 then -- 134
				break -- 134
			end -- 134
		end -- 134
	end -- 128
	return -- 135
end) -- 135
