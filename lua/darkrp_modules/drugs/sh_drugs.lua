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
		Interesting = true, -- 14
		Sound = Sound("ghostbong/ghostbong_hit.mp3"), -- 15
		SubmitSound = "Submit_Drug", -- 17
		Hunger = 0, -- 18
		Thirst = 0, -- 19
		Despair = 0, -- 20
		HealthAdd = 0, -- 21
		CookTime = 0, -- 22
		DrugTime = 0, -- 24
		Consume = function(self, ply) -- 24
			if CLIENT then -- 25
				return -- 25
			end -- 25
			ply.Drugs = ply.Drugs or { } -- 26
			local drugName = self.PrintName or tostring(self) -- 27
			local onEnd = self.End -- 28
			local onThink = self.ConsumeThink -- 29
			ply.Drugs[drugName] = { -- 32
				["end"] = CurTime() + self.DrugTime, -- 32
				onEnd = onEnd, -- 33
				onThink = onThink -- 34
			} -- 31
			local amt -- 37
			if self.Hunger then -- 38
				amt = self.Hunger -- 39
				if isfunction(amt) then -- 40
					amt = amt() -- 40
				end -- 40
				ply:AddHunger(amt) -- 41
			end -- 38
			if self.Thirst then -- 42
				amt = self.Thirst -- 43
				if isfunction(amt) then -- 44
					amt = amt() -- 44
				end -- 44
				ply:AddThirst(amt) -- 45
			end -- 42
			if self.Despair then -- 46
				amt = self.Despair -- 47
				if isfunction(amt) then -- 48
					amt = amt() -- 48
				end -- 48
				ply:AddDespair(amt) -- 49
			end -- 46
			if self.HealthAdd then -- 50
				amt = self.HealthAdd -- 51
				if isfunction(amt) then -- 52
					amt = amt() -- 52
				end -- 52
				if amt > 0 then -- 53
					ply:SetHealth(math.min(ply:Health() + amt, ply:GetMaxHealth())) -- 54
				elseif amt < 0 then -- 55
					ply:TakeDamage(-amt) -- 56
				end -- 53
			end -- 50
			if not self.PersistAfterEat then -- 59
				return self:Trash() -- 59
			end -- 59
		end, -- 61
		OnUseFinish = function(self, ply) -- 61
			_class_0.__parent.__base.OnUseFinish(self, ply) -- 62
			return self:Consume(ply) -- 63
		end, -- 65
		ConsumeThink = function(self, ply) end, -- 66
		End = function(self, ply) end -- 4
	} -- 4
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 66
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 4
			_base_0[_key_0] = _val_0 -- 4
		end -- 4
	end -- 66
	if _base_0.__index == nil then -- 4
		_base_0.__index = _base_0 -- 4
	end -- 66
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
end -- 66
local Rotmelange -- 69
do -- 69
	local _class_0 -- 69
	local _parent_0 = Drug -- 69
	local _base_0 = { -- 69
		PrintName = "Rot Melange", -- 71
		Model = Model("models/props_c17/TrapPropeller_Lever.mdl"), -- 72
		Hunger = 20, -- 73
		Thirst = 10, -- 74
		HealthAdd = 20, -- 75
		Despair = -30, -- 76
		RotTime = 240, -- 77
		Description = "A cigar packed with a mysterious substance from the wasteland.\nIt will reveal your deepest worries, if you're strong enough.", -- 78
		Sound = Sound("ghostbong/ghostbong_hit.mp3"), -- 79
		DrugTime = 30, -- 81
		UseText = { -- 82
			"takes a fat rip of melange.", -- 82
			"smokes a mysterious cigar.", -- 83
			"lights up a red cigar.", -- 84
			"smokes enough melange to trigger a smoke alarm.", -- 85
			"smokes it to the butt.", -- 86
			"takes a strong hit of melange.", -- 87
			"leaves a disgusting cloud of red smoke." -- 88
		}, -- 91
		ConsumeThink = function(self, ply, drug) -- 91
			drug.nextTime = drug.nextTime or 0 -- 92
			if CurTime() >= drug.nextTime then -- 93
				drug.nextTime = CurTime() + 5 -- 94
				net.Start("evilrp_frighten") -- 95
				return net.Send(ply) -- 96
			end -- 93
		end, -- 98
		Consume = function(self, ply) -- 98
			_class_0.__parent.__base.Consume(self, ply) -- 99
			if CLIENT then -- 100
				return -- 100
			end -- 100
			if ply:Team() ~= TEAM_KOMMANDANT then -- 101
				ply:Notify("<c=200,0,0> WHAT THE FUCK IS THIS? HOLY SHI~") -- 102
				ply:AddDespair(100) -- 103
				net.Start("evilrp_jumpscare") -- 104
				net.Send(ply) -- 105
				return -- 106
			end -- 101
			ply:AddStemCells(2) -- 108
			return ply:Notify("<c=0,200,0> You embrace the prescient path.") -- 109
		end, -- 111
		End = function(self, ply) -- 111
			_class_0.__parent.__base.End(self, ply) -- 112
			if CLIENT then -- 113
				return -- 113
			end -- 113
			return ply:Notify("<c=200,0,0> Your addiction to melange slowly fades.") -- 114
		end -- 69
	} -- 69
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 114
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 69
			_base_0[_key_0] = _val_0 -- 69
		end -- 69
	end -- 114
	if _base_0.__index == nil then -- 69
		_base_0.__index = _base_0 -- 69
	end -- 114
	setmetatable(_base_0, _parent_0.__base) -- 69
	_class_0 = setmetatable({ -- 69
		__init = function(self, ...) -- 69
			return _class_0.__parent.__init(self, ...) -- 69
		end, -- 69
		__base = _base_0, -- 69
		__name = "Rotmelange", -- 69
		__parent = _parent_0 -- 69
	}, { -- 69
		__index = function(cls, name) -- 69
			local val = rawget(_base_0, name) -- 69
			if val == nil then -- 69
				local parent = rawget(cls, "__parent") -- 69
				if parent then -- 69
					return parent[name] -- 69
				end -- 69
			else -- 69
				return val -- 69
			end -- 69
		end, -- 69
		__call = function(cls, ...) -- 69
			local _self_0 = setmetatable({ }, _base_0) -- 69
			cls.__init(_self_0, ...) -- 69
			return _self_0 -- 69
		end -- 69
	}) -- 69
	_base_0.__class = _class_0 -- 69
	if _parent_0.__inherited then -- 69
		_parent_0.__inherited(_parent_0, _class_0) -- 69
	end -- 69
	Rotmelange = _class_0 -- 69
end -- 114
local drug_think -- 117
drug_think = function() -- 117
	if CLIENT then -- 118
		return -- 118
	end -- 118
	local _list_0 = player.GetAll() -- 119
	for _index_0 = 1, #_list_0 do -- 119
		local ply = _list_0[_index_0] -- 119
		local _continue_0 = false -- 120
		repeat -- 120
			if not ply:Alive() then -- 120
				ply.Drugs = { } -- 121
				return -- 122
			end -- 120
			if not ply.Drugs then -- 123
				_continue_0 = true -- 123
				break -- 123
			end -- 123
			for key, drug in pairs(ply.Drugs) do -- 124
				if CurTime() > drug["end"] then -- 125
					drug.onEnd(nil, ply) -- 126
					ply.Drugs[key] = nil -- 127
				else -- 129
					drug.onThink(nil, ply, drug) -- 129
				end -- 125
			end -- 129
			_continue_0 = true -- 120
		until true -- 129
		if not _continue_0 then -- 129
			break -- 129
		end -- 129
	end -- 129
end -- 117
return hook.Add("Think", "evilrp_drug_think", drug_think) -- 131
