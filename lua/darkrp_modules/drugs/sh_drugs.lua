-- [yue]: darkrp_modules\drugs\sh_drugs.yue
local Submit_Drug -- 1
do -- 1
	local _class_0 -- 1
	local _parent_0 = SOUND -- 1
	local _base_0 = { -- 1
		sound = (function() -- 2
			local _accum_0 = { } -- 2
			local _len_0 = 1 -- 2
			for i = 1, 4 do -- 2
				_accum_0[_len_0] = "npc/barnacle/barnacle_pull" .. tostring(i) .. ".wav" -- 2
				_len_0 = _len_0 + 1 -- 2
			end -- 2
			return _accum_0 -- 2
		end)() -- 1
	} -- 1
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 2
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 1
			_base_0[_key_0] = _val_0 -- 1
		end -- 1
	end -- 2
	if _base_0.__index == nil then -- 1
		_base_0.__index = _base_0 -- 1
	end -- 2
	setmetatable(_base_0, _parent_0.__base) -- 1
	_class_0 = setmetatable({ -- 1
		__init = function(self, ...) -- 1
			return _class_0.__parent.__init(self, ...) -- 1
		end, -- 1
		__base = _base_0, -- 1
		__name = "Submit_Drug", -- 1
		__parent = _parent_0 -- 1
	}, { -- 1
		__index = function(cls, name) -- 1
			local val = rawget(_base_0, name) -- 1
			if val == nil then -- 1
				local parent = rawget(cls, "__parent") -- 1
				if parent then -- 1
					return parent[name] -- 1
				end -- 1
			else -- 1
				return val -- 1
			end -- 1
		end, -- 1
		__call = function(cls, ...) -- 1
			local _self_0 = setmetatable({ }, _base_0) -- 1
			cls.__init(_self_0, ...) -- 1
			return _self_0 -- 1
		end -- 1
	}) -- 1
	_base_0.__class = _class_0 -- 1
	if _parent_0.__inherited then -- 1
		_parent_0.__inherited(_parent_0, _class_0) -- 1
	end -- 1
	Submit_Drug = _class_0 -- 1
end -- 2
local Drug -- 4
do -- 4
	local _class_0 -- 4
	local _parent_0 = ITEM -- 4
	local _base_0 = { -- 4
		SetupDataTables = function(self) -- 5
			return _class_0.__parent.__base.SetupDataTables(self) -- 6
		end, -- 8
		PrintName = "Drug", -- 9
		Model = Model("models/props_junk/garbage_plasticbottle002a.mdl"), -- 10
		Category = "EvilRP: Drugs", -- 11
		Spawnable = true, -- 12
		Interesting = true, -- 13
		CanSell = true, -- 15
		Sound = Sound("ghostbong/ghostbong_hit.mp3"), -- 16
		SubmitSound = "Submit_Drug", -- 18
		Hunger = 0, -- 19
		Thirst = 0, -- 20
		Despair = 0, -- 21
		HealthAdd = 0, -- 22
		CookTime = 0, -- 23
		DrugTime = 0, -- 25
		Consume = function(self, ply) -- 25
			if CLIENT then -- 26
				return -- 26
			end -- 26
			ply.Drugs = ply.Drugs or { } -- 27
			local drugName = self.PrintName or tostring(self) -- 28
			local onEnd = self.End -- 29
			local onThink = self.ConsumeThink -- 30
			ply.Drugs[drugName] = { -- 33
				["end"] = CurTime() + self.DrugTime, -- 33
				onEnd = onEnd, -- 34
				onThink = onThink -- 35
			} -- 32
			local amt -- 38
			if self.Hunger then -- 39
				amt = self.Hunger -- 40
				if isfunction(amt) then -- 41
					amt = amt() -- 41
				end -- 41
				ply:AddHunger(amt) -- 42
			end -- 39
			if self.Thirst then -- 43
				amt = self.Thirst -- 44
				if isfunction(amt) then -- 45
					amt = amt() -- 45
				end -- 45
				ply:AddThirst(amt) -- 46
			end -- 43
			if self.Despair then -- 47
				amt = self.Despair -- 48
				if isfunction(amt) then -- 49
					amt = amt() -- 49
				end -- 49
				ply:AddDespair(amt) -- 50
			end -- 47
			if self.HealthAdd then -- 51
				amt = self.HealthAdd -- 52
				if isfunction(amt) then -- 53
					amt = amt() -- 53
				end -- 53
				if amt > 0 then -- 54
					ply:SetHealth(math.min(ply:Health() + amt, ply:GetMaxHealth())) -- 55
				elseif amt < 0 then -- 56
					ply:TakeDamage(-amt) -- 57
				end -- 54
			end -- 51
			if not self.PersistAfterEat then -- 60
				return self:Trash() -- 60
			end -- 60
		end, -- 62
		OnUseFinish = function(self, ply) -- 62
			_class_0.__parent.__base.OnUseFinish(self, ply) -- 63
			return self:Consume(ply) -- 64
		end, -- 66
		ConsumeThink = function(self, ply) end, -- 67
		End = function(self, ply) end -- 4
	} -- 4
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 67
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 4
			_base_0[_key_0] = _val_0 -- 4
		end -- 4
	end -- 67
	if _base_0.__index == nil then -- 4
		_base_0.__index = _base_0 -- 4
	end -- 67
	setmetatable(_base_0, _parent_0.__base) -- 4
	_class_0 = setmetatable({ -- 4
		__init = function(self, ...) -- 4
			return _class_0.__parent.__init(self, ...) -- 4
		end, -- 4
		__base = _base_0, -- 4
		__name = "Drug", -- 4
		__parent = _parent_0 -- 4
	}, { -- 4
		__index = function(cls, name) -- 4
			local val = rawget(_base_0, name) -- 4
			if val == nil then -- 4
				local parent = rawget(cls, "__parent") -- 4
				if parent then -- 4
					return parent[name] -- 4
				end -- 4
			else -- 4
				return val -- 4
			end -- 4
		end, -- 4
		__call = function(cls, ...) -- 4
			local _self_0 = setmetatable({ }, _base_0) -- 4
			cls.__init(_self_0, ...) -- 4
			return _self_0 -- 4
		end -- 4
	}) -- 4
	_base_0.__class = _class_0 -- 4
	if _parent_0.__inherited then -- 4
		_parent_0.__inherited(_parent_0, _class_0) -- 4
	end -- 4
	Drug = _class_0 -- 4
end -- 67
local Rotmelange -- 70
do -- 70
	local _class_0 -- 70
	local _parent_0 = Drug -- 70
	local _base_0 = { -- 70
		PrintName = "Rot Melange", -- 72
		Model = Model("models/props_c17/TrapPropeller_Lever.mdl"), -- 73
		Hunger = 20, -- 74
		Thirst = 10, -- 75
		HealthAdd = 20, -- 76
		Despair = -30, -- 77
		RotTime = 240, -- 78
		Description = "A cigar packed with a mysterious substance from the wasteland.\nIt will reveal your deepest worries, if you're strong enough.", -- 79
		Sound = Sound("ghostbong/ghostbong_hit.mp3"), -- 80
		DrugTime = 180, -- 82
		UseText = { -- 83
			"takes a fat rip of melange.", -- 83
			"smokes a mysterious cigar.", -- 84
			"lights up a red cigar.", -- 85
			"smokes enough melange to trigger a smoke alarm.", -- 86
			"smokes it to the butt.", -- 87
			"takes a strong hit of melange.", -- 88
			"leaves a disgusting cloud of red smoke." -- 89
		}, -- 92
		NotifyText = { -- 93
			"The future...", -- 93
			"The past...", -- 94
			"The present...", -- 95
			"Everything...", -- 96
			"Memories...", -- 97
			"A sweet lie..." -- 98
		}, -- 101
		ConsumeThink = function(self, ply, drug) -- 101
			drug.nextTime = drug.nextTime or 0 -- 102
			if CurTime() >= drug.nextTime then -- 103
				drug.nextTime = CurTime() + 30 + math.random(1, 30) -- 104
				net.Start("evilrp_jumpscare") -- 105
				net.Send(ply) -- 106
				ply:AddStemCells(1) -- 107
				return ply:Notify("<c=0,200,0> " .. tostring(table.Random(self.NotifyText))) -- 108
			end -- 103
		end, -- 110
		Consume = function(self, ply) -- 110
			_class_0.__parent.__base.Consume(self, ply) -- 111
			if CLIENT then -- 112
				return -- 112
			end -- 112
			if (ply:Team() ~= TEAM_EMPEROR) and (ply:Team() ~= TEAM_STALKER) then -- 113
				ply:Notify("<c=200,0,0> WHAT THE FUCK IS THIS? HOLY SHI~") -- 114
				ply:AddDespair(100) -- 115
				net.Start("evilrp_jumpscare") -- 116
				net.Send(ply) -- 117
				return -- 118
			end -- 113
			ply:AddStemCells(2) -- 120
			return ply:Notify("<c=0,200,0> Embrace the prescient path.") -- 121
		end, -- 123
		End = function(self, ply) -- 123
			_class_0.__parent.__base.End(self, ply) -- 124
			if CLIENT then -- 125
				return -- 125
			end -- 125
			return ply:Notify("<c=200,0,0> Your addiction to melange slowly fades.") -- 126
		end -- 70
	} -- 70
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 126
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 70
			_base_0[_key_0] = _val_0 -- 70
		end -- 70
	end -- 126
	if _base_0.__index == nil then -- 70
		_base_0.__index = _base_0 -- 70
	end -- 126
	setmetatable(_base_0, _parent_0.__base) -- 70
	_class_0 = setmetatable({ -- 70
		__init = function(self, ...) -- 70
			return _class_0.__parent.__init(self, ...) -- 70
		end, -- 70
		__base = _base_0, -- 70
		__name = "Rotmelange", -- 70
		__parent = _parent_0 -- 70
	}, { -- 70
		__index = function(cls, name) -- 70
			local val = rawget(_base_0, name) -- 70
			if val == nil then -- 70
				local parent = rawget(cls, "__parent") -- 70
				if parent then -- 70
					return parent[name] -- 70
				end -- 70
			else -- 70
				return val -- 70
			end -- 70
		end, -- 70
		__call = function(cls, ...) -- 70
			local _self_0 = setmetatable({ }, _base_0) -- 70
			cls.__init(_self_0, ...) -- 70
			return _self_0 -- 70
		end -- 70
	}) -- 70
	_base_0.__class = _class_0 -- 70
	if _parent_0.__inherited then -- 70
		_parent_0.__inherited(_parent_0, _class_0) -- 70
	end -- 70
	Rotmelange = _class_0 -- 70
end -- 126
local drug_think -- 129
drug_think = function() -- 129
	if CLIENT then -- 130
		return -- 130
	end -- 130
	local _list_0 = player.GetAll() -- 131
	for _index_0 = 1, #_list_0 do -- 131
		local ply = _list_0[_index_0] -- 131
		local _continue_0 = false -- 132
		repeat -- 132
			if not ply:Alive() then -- 132
				ply.Drugs = { } -- 133
				return -- 134
			end -- 132
			if not ply.Drugs then -- 135
				_continue_0 = true -- 135
				break -- 135
			end -- 135
			for key, drug in pairs(ply.Drugs) do -- 136
				if CurTime() > drug["end"] then -- 137
					drug.onEnd(nil, ply) -- 138
					ply.Drugs[key] = nil -- 139
				else -- 141
					drug.onThink(nil, ply, drug) -- 141
				end -- 137
			end -- 141
			_continue_0 = true -- 132
		until true -- 141
		if not _continue_0 then -- 141
			break -- 141
		end -- 141
	end -- 141
end -- 129
return hook.Add("Think", "evilrp_drug_think", drug_think) -- 143
