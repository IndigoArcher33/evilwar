-- [yue]: darkrp_modules\constructs\sh_construct.yue
local Equip_Weapon -- 1
do -- 1
	local _class_0 -- 1
	local _parent_0 = SOUND -- 1
	local _base_0 = { -- 1
		sound = (function() -- 2
			local _accum_0 = { } -- 2
			local _len_0 = 1 -- 2
			for i = 1, 3 do -- 2
				_accum_0[_len_0] = "dysphoria/weapons/wield_gun" .. tostring(i) .. ".ogg" -- 2
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
		__name = "Equip_Weapon", -- 1
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
	Equip_Weapon = _class_0 -- 1
end -- 2
local entity_cost = { -- 5
	{ -- 6
		cls = "entity_longuse/trap/wiretrap/shotgunwire", -- 6
		precursors = { -- 8
			metal = 5, -- 8
			wood = 5 -- 9
		} -- 7
	} -- 5
} -- 4
local getCostFromCls -- 13
getCostFromCls = function(cls, precursor) -- 13
	if not (cls and cls ~= "") then -- 14
		return 0 -- 14
	end -- 14
	for _index_0 = 1, #entity_cost do -- 15
		local ent = entity_cost[_index_0] -- 15
		if ent.cls == cls then -- 16
			return ent.precursors[precursor] or 0 -- 17
		end -- 16
	end -- 17
	return 0 -- 18
end -- 13
local Construct -- 21
do -- 21
	local _class_0 -- 21
	local _parent_0 = ITEM -- 21
	local _base_0 = { -- 21
		PrintName = "Construct", -- 24
		Spawnable = true, -- 25
		Model = Model("models/props_c17/consolebox05a.mdl"), -- 26
		AdminSpawnable = true, -- 27
		Interesting = true, -- 29
		Precursors = { -- 30
			{ -- 30
				name = "biomass" -- 30
			}, -- 30
			{ -- 31
				name = "fluid" -- 31
			}, -- 31
			{ -- 32
				name = "metal" -- 32
			}, -- 32
			{ -- 33
				name = "wood" -- 33
			} -- 33
		}, -- 35
		ImpactSound = { -- 36
			soft = "weapon.ImpactSoft", -- 36
			hard = "weapon.ImpactHard" -- 37
		}, -- 39
		BasePay = 5, -- 41
		SetupDataTables = function(self) -- 41
			_class_0.__parent.__base.SetupDataTables(self) -- 42
			self:NetworkVar("String", "EntityClass") -- 43
			local _list_0 = self.Precursors -- 45
			for _index_0 = 1, #_list_0 do -- 45
				local p = _list_0[_index_0] -- 45
				local name = tostring(p.name:sub(1, 1):upper()) .. tostring(p.name:sub(2, -1)) -- 46
				self:NetworkVar("Int", "Precursor" .. tostring(name)) -- 47
			end -- 47
			return self:NetworkVar("Entity", "Worker") -- 48
		end, -- 50
		AddPrecursor = function(self, pre, amt) -- 50
			local cls = self:GetEntityClass() -- 51
			if not (cls and cls ~= "") then -- 52
				return false -- 52
			end -- 52
			local cost = getCostFromCls(cls, pre) -- 53
			if cost <= 0 then -- 54
				return false -- 54
			end -- 54
			local name = tostring(pre:sub(1, 1):upper()) .. tostring(pre:sub(2, -1)) -- 55
			local current = self["GetPrecursor" .. tostring(name)](self) -- 60
			if current >= cost then -- 61
				return false -- 61
			end -- 61
			self["SetPrecursor" .. tostring(name)](self, math.min(current + amt, cost)) -- 62
			return true -- 63
			return false -- 65
		end, -- 67
		Touch = function(self, what) -- 67
			if SERVER then -- 68
				if not what.Precursor then -- 69
					return -- 69
				end -- 69
				if what.Processed then -- 70
					return -- 70
				end -- 70
				local pre, amt -- 72
				local _list_0 = self.Precursors -- 73
				for _index_0 = 1, #_list_0 do -- 73
					local p = _list_0[_index_0] -- 73
					for k, v in pairs(what.Precursor) do -- 74
						if p.name == k then -- 75
							pre = k -- 76
							amt = v -- 77
							if isfunction(amt) then -- 78
								amt = amt(self) -- 78
							end -- 78
							break -- 79
						end -- 75
					end -- 79
				end -- 79
				if not (pre and amt) then -- 80
					return -- 80
				end -- 80
				if not self:AddPrecursor(pre, amt) then -- 82
					return -- 82
				end -- 82
				what.Processed = true -- 84
				if what.SubmitSound then -- 85
					what:EmitSound(what.SubmitSound) -- 85
				end -- 85
				if what.Submitted then -- 86
					what.Submitted(what) -- 86
				end -- 86
				local submitter = what:GetNWEntity("evilrp_submitter", NULL) -- 88
				local reward = math.random(10, 15) * amt -- 89
				local rate = GAMEMODE.taxes.labor / 100 -- 90
				local taxed = math.floor(reward * rate) -- 91
				reward = reward - taxed -- 92
				if taxed > 0 then -- 93
					local _obj_0 = GAMEMODE.taxes_stored -- 93
					_obj_0.labor = _obj_0.labor + taxed -- 93
				end -- 93
				reward = math.ceil(reward) -- 94
				if submitter and IsValid(submitter) and submitter:IsPlayer() and submitter:Alive() then -- 96
					submitter:AddMoney(reward, "The Operation") -- 97
				else -- 99
					if reward > 0 then -- 99
						local _obj_0 = GAMEMODE.taxes_stored -- 99
						_obj_0.labor = _obj_0.labor + reward -- 99
					end -- 99
				end -- 96
				what:Remove() -- 101
				if submitter and IsValid(submitter) and submitter:IsPlayer() and submitter:Team() == TEAM_PRIVATE then -- 103
					submitter.precursor_supplied = submitter.precursor_supplied or 0 -- 104
					submitter.precursor_supplied = submitter.precursor_supplied + amt -- 105
					if submitter.precursor_supplied_difference and (submitter.precursor_supplied % 50) < submitter.precursor_supplied_difference then -- 106
						submitter:Notify("<c=0,200,0>Your work ethic makes Liver Failure proud.") -- 107
						submitter:AddStemCells(1) -- 108
					end -- 106
					submitter.precursor_supplied_difference = submitter.precursor_supplied % 50 -- 109
				end -- 103
			end -- 68
		end, -- 111
		HUDRender = function(self) -- 111
			local ct = { } -- 112
			local cls = self:GetEntityClass() -- 113
			local ent -- 114
			if cls and cls ~= "" then -- 114
				ent = scripted_ents.Get(cls) -- 114
			end -- 114
			local printName = ent and ent.PrintName or self.PrintName -- 115
			ct[#ct + 1] = "Constructing... " .. tostring(printName) -- 116
			ct[#ct + 1] = "" -- 117
			ct[#ct + 1] = { -- 118
				text = "Supply the necessary materials.", -- 118
				font = "Spleen_Label_Small" -- 118
			} -- 118
			return ct -- 119
		end, -- 121
		Sound = "Equip_Weapon", -- 123
		IsFinished = function(self) -- 123
			local cls = self:GetEntityClass() -- 124
			if not (cls and cls ~= "") then -- 125
				return false -- 125
			end -- 125
			local _list_0 = self.Precursors -- 127
			for _index_0 = 1, #_list_0 do -- 127
				local p = _list_0[_index_0] -- 127
				local cost = getCostFromCls(cls, p.name) -- 128
				if cost > 0 then -- 129
					local name = tostring(p.name:sub(1, 1):upper()) .. tostring(p.name:sub(2, -1)) -- 130
					local get = self["GetPrecursor" .. tostring(name)] -- 131
					if not get or get(self) < cost then -- 132
						return false -- 133
					end -- 132
				end -- 129
			end -- 133
			return true -- 134
		end, -- 136
		Initialize = function(self) -- 136
			self:SetModel(self.Model) -- 137
			if SERVER then -- 138
				DarkRP.ValidatedPhysicsInit(self, SOLID_VPHYSICS, "The issue lies with entity\"" .. tostring(self:GetEntityClass() or 'unknown') .. "\"") -- 139
				self:SetMoveType(MOVETYPE_VPHYSICS) -- 140
				self:SetSolid(SOLID_VPHYSICS) -- 141
				return self:PhysWake() -- 142
			end -- 138
		end, -- 144
		OnTakeDamage = function(self, dmg) -- 144
			return self:TakePhysicsDamage(dmg) -- 144
		end, -- 146
		SetConstruct = function(self, cls) -- 146
			self:SetEntityClass(cls) -- 147
			local _list_0 = self.Precursors -- 148
			for _index_0 = 1, #_list_0 do -- 148
				local p = _list_0[_index_0] -- 148
				local name = tostring(p.name:sub(1, 1):upper()) .. tostring(p.name:sub(2, -1)) -- 149
				local set = self["SetPrecursor" .. tostring(name)] -- 150
				if set then -- 151
					set(self, 0) -- 151
				end -- 151
			end -- 151
		end, -- 153
		OnUseFinish = function(self, ply) -- 153
			if self:GetEntityClass() == "" or self:GetEntityClass() == nil then -- 154
				self:SetConstruct("entity_longuse/trap/wiretrap/shotgunwire") -- 155
				return -- 156
			end -- 154
			if not self:IsFinished() then -- 158
				return -- 158
			end -- 158
			_class_0.__parent.__base.OnUseFinish(self, ply) -- 160
			if SERVER then -- 162
				local cls = self:GetEntityClass() -- 163
				local ent = ents.Create(cls) -- 164
				if IsValid(ent) then -- 165
					ent:SetPos(self:GetPos()) -- 167
					ent:SetAngles(self:GetAngles()) -- 168
					ent:Spawn() -- 169
					ent:Activate() -- 170
					return self:Remove() -- 171
				end -- 165
			end -- 162
		end -- 21
	} -- 21
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 171
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 21
			_base_0[_key_0] = _val_0 -- 21
		end -- 21
	end -- 171
	if _base_0.__index == nil then -- 21
		_base_0.__index = _base_0 -- 21
	end -- 171
	setmetatable(_base_0, _parent_0.__base) -- 21
	_class_0 = setmetatable({ -- 21
		__init = function(self, ...) -- 21
			return _class_0.__parent.__init(self, ...) -- 21
		end, -- 21
		__base = _base_0, -- 21
		__name = "Construct", -- 21
		__parent = _parent_0 -- 21
	}, { -- 21
		__index = function(cls, name) -- 21
			local val = rawget(_base_0, name) -- 21
			if val == nil then -- 21
				local parent = rawget(cls, "__parent") -- 21
				if parent then -- 21
					return parent[name] -- 21
				end -- 21
			else -- 21
				return val -- 21
			end -- 21
		end, -- 21
		__call = function(cls, ...) -- 21
			local _self_0 = setmetatable({ }, _base_0) -- 21
			cls.__init(_self_0, ...) -- 21
			return _self_0 -- 21
		end -- 21
	}) -- 21
	_base_0.__class = _class_0 -- 21
	local self = _class_0; -- 21
	self.__entity = "evilrp/spawned/construct" -- 22
	if _parent_0.__inherited then -- 21
		_parent_0.__inherited(_parent_0, _class_0) -- 21
	end -- 21
	Construct = _class_0 -- 21
end -- 171
if SERVER then -- 173
	local block_types = { -- 174
		"Physgun1", -- 174
		"Spawning1", -- 174
		"Toolgun1" -- 174
	} -- 174
	FPP.AddDefaultBlocked(block_types, "evilrp/spawned/weapon") -- 175
	return FPP.AddDefaultBlocked(block_types, "evilrp_weapon") -- 176
end -- 173
