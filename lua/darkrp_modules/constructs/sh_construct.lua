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
local noise = Material("effects/tvscreen_noise001a") -- 4
local entity_cost = { -- 8
	{ -- 9
		cls = "entity_longuse/trap/wiretrap/shotgunwire", -- 9
		precursors = { -- 11
			metal = 3, -- 11
			wood = 3 -- 12
		} -- 10
	}, -- 8
	{ -- 15
		cls = "entity_longuse/trap/wiretrap", -- 15
		precursors = { -- 17
			metal = 2 -- 17
		} -- 16
	}, -- 14
	{ -- 20
		cls = "entity_longuse/trap/ied", -- 20
		precursors = { -- 22
			metal = 1, -- 22
			wood = 3 -- 23
		} -- 21
	} -- 19
} -- 7
local getCostFromCls -- 27
getCostFromCls = function(cls, precursor) -- 27
	if not (cls and cls ~= "") then -- 28
		return 0 -- 28
	end -- 28
	for _index_0 = 1, #entity_cost do -- 29
		local ent = entity_cost[_index_0] -- 29
		if ent.cls == cls then -- 30
			return ent.precursors[precursor] or 0 -- 31
		end -- 30
	end -- 31
	return 0 -- 32
end -- 27
local Construct -- 35
do -- 35
	local _class_0 -- 35
	local _parent_0 = ITEM -- 35
	local _base_0 = { -- 35
		PrintName = "Construct", -- 38
		Spawnable = true, -- 39
		Model = Model("models/props_c17/consolebox05a.mdl"), -- 40
		AdminSpawnable = true, -- 41
		Interesting = true, -- 43
		Precursors = { -- 44
			{ -- 44
				name = "biomass" -- 44
			}, -- 44
			{ -- 45
				name = "fluid" -- 45
			}, -- 45
			{ -- 46
				name = "metal" -- 46
			}, -- 46
			{ -- 47
				name = "wood" -- 47
			} -- 47
		}, -- 49
		ImpactSound = { -- 50
			soft = "weapon.ImpactSoft", -- 50
			hard = "weapon.ImpactHard" -- 51
		}, -- 53
		BasePay = 5, -- 55
		SetupDataTables = function(self) -- 55
			_class_0.__parent.__base.SetupDataTables(self) -- 56
			self:NetworkVar("String", "EntityClass") -- 57
			self:NetworkVar("Bool", "Started") -- 58
			local _list_0 = self.Precursors -- 60
			for _index_0 = 1, #_list_0 do -- 60
				local p = _list_0[_index_0] -- 60
				local name = tostring(p.name:sub(1, 1):upper()) .. tostring(p.name:sub(2, -1)) -- 61
				self:NetworkVar("Int", "Precursor" .. tostring(name)) -- 62
			end -- 62
			return self:NetworkVar("Entity", "Worker") -- 63
		end, -- 65
		AddPrecursor = function(self, pre, amt) -- 65
			local cls = self:GetEntityClass() -- 66
			if not (cls and cls ~= "") then -- 67
				return false -- 67
			end -- 67
			local cost = getCostFromCls(cls, pre) -- 68
			if cost <= 0 then -- 69
				return false -- 69
			end -- 69
			local name = tostring(pre:sub(1, 1):upper()) .. tostring(pre:sub(2, -1)) -- 70
			local current = self["GetPrecursor" .. tostring(name)](self) -- 75
			if current >= cost then -- 76
				return false -- 76
			end -- 76
			self["SetPrecursor" .. tostring(name)](self, math.min(current + amt, cost)) -- 77
			if not self:GetStarted() then -- 78
				self:SetStarted(true) -- 78
			end -- 78
			return true -- 79
		end, -- 81
		Touch = function(self, what) -- 81
			if SERVER then -- 82
				if not what.Precursor then -- 83
					return -- 83
				end -- 83
				if what.Processed then -- 84
					return -- 84
				end -- 84
				local pre, amt -- 86
				local _list_0 = self.Precursors -- 87
				for _index_0 = 1, #_list_0 do -- 87
					local p = _list_0[_index_0] -- 87
					for k, v in pairs(what.Precursor) do -- 88
						if p.name == k then -- 89
							pre = k -- 90
							amt = v -- 91
							if isfunction(amt) then -- 92
								amt = amt(self) -- 92
							end -- 92
							break -- 93
						end -- 89
					end -- 93
				end -- 93
				if not (pre and amt) then -- 94
					return -- 94
				end -- 94
				if not self:AddPrecursor(pre, amt) then -- 96
					return -- 96
				end -- 96
				what.Processed = true -- 98
				if what.SubmitSound then -- 99
					what:EmitSound(what.SubmitSound) -- 99
				end -- 99
				if what.Submitted then -- 100
					what.Submitted(what) -- 100
				end -- 100
				local submitter = what:GetNWEntity("evilrp_submitter", NULL) -- 102
				local reward = math.random(10, 15) * amt -- 103
				local rate = GAMEMODE.taxes.labor / 100 -- 104
				local taxed = math.floor(reward * rate) -- 105
				reward = reward - taxed -- 106
				if taxed > 0 then -- 107
					local _obj_0 = GAMEMODE.taxes_stored -- 107
					_obj_0.labor = _obj_0.labor + taxed -- 107
				end -- 107
				reward = math.ceil(reward) -- 108
				if submitter and IsValid(submitter) and submitter:IsPlayer() and submitter:Alive() then -- 110
					submitter:AddMoney(reward, "The Operation") -- 111
				else -- 113
					if reward > 0 then -- 113
						local _obj_0 = GAMEMODE.taxes_stored -- 113
						_obj_0.labor = _obj_0.labor + reward -- 113
					end -- 113
				end -- 110
				what:Remove() -- 115
				if submitter and IsValid(submitter) and submitter:IsPlayer() and submitter:Team() == TEAM_PRIVATE then -- 117
					submitter.precursor_supplied = submitter.precursor_supplied or 0 -- 118
					submitter.precursor_supplied = submitter.precursor_supplied + amt -- 119
					if submitter.precursor_supplied_difference and (submitter.precursor_supplied % 50) < submitter.precursor_supplied_difference then -- 120
						submitter:Notify("<c=0,200,0>Your work ethic makes Liver Failure proud.") -- 121
						submitter:AddStemCells(1) -- 122
					end -- 120
					submitter.precursor_supplied_difference = submitter.precursor_supplied % 50 -- 123
				end -- 117
			end -- 82
		end, -- 125
		HUDRender = function(self) -- 125
			local ct = { } -- 126
			local cls = self:GetEntityClass() -- 127
			local ent -- 128
			if cls and cls ~= "" then -- 128
				ent = scripted_ents.Get(cls) -- 128
			end -- 128
			local printName = "" -- 129
			if ent and ent.PrintName then -- 130
				printName = ent.PrintName -- 130
			end -- 130
			ct[#ct + 1] = "Constructing... " .. tostring(printName) -- 131
			ct[#ct + 1] = "" -- 132
			ct[#ct + 1] = { -- 133
				text = "Supply the necessary materials.", -- 133
				font = "Spleen_Label_Small" -- 133
			} -- 133
			return ct -- 134
		end, -- 136
		Draw = function(self) -- 136
			self:DrawModel() -- 137
			return self:Render3D2D() -- 138
		end, -- 140
		Render3D2D = function(self) -- 140
			local cls = self:GetEntityClass() -- 141
			local ent -- 142
			if cls and cls ~= "" then -- 142
				ent = scripted_ents.Get(cls) -- 142
			end -- 142
			local printName = ent and ent.PrintName or self.PrintName -- 143
			local dist_sqr = self:GetPos():DistToSqr(lp:GetPos()) -- 145
			if not (dist_sqr < 128 ^ 2) then -- 146
				return -- 146
			end -- 146
			local font = "Spleen_Label" -- 147
			local desp = lp:GetDespair() * 0.01 -- 148
			local ct = CurTime() -- 149
			local pos = self:GetPos() + (self:GetUp() * 6) - (self:GetForward() * 18) + (self:GetRight() * 13) -- 150
			local ang = self:GetAngles() -- 151
			ang:RotateAroundAxis(ang:Up(), 90) -- 153
			ang:RotateAroundAxis(ang:Forward(), 0) -- 154
			ang:RotateAroundAxis(ang:Right(), 0) -- 155
			cam.Start3D2D(pos, ang, 0.1) -- 157
			surface.SetMaterial(noise) -- 159
			surface.SetDrawColor(Color(255, 255, 255, 255)) -- 160
			surface.DrawTexturedRect(0, 0, 265, 38) -- 161
			local txt = tostring(printName) -- 163
			local txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 164
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 165
			cam.End3D2D() -- 167
			pos = self:GetPos() + (self:GetUp() * 6) - (self:GetForward() * 7) + (self:GetRight() * 11) -- 169
			local _list_0 = self.Precursors -- 171
			for _index_0 = 1, #_list_0 do -- 171
				local p = _list_0[_index_0] -- 171
				local _continue_0 = false -- 172
				repeat -- 172
					if p and p.name and getCostFromCls(cls, p.name) <= 0 then -- 173
						_continue_0 = true -- 173
						break -- 173
					end -- 173
					pos = pos + (-self:GetForward() * 3) -- 174
					cam.Start3D2D(pos, ang, 0.1) -- 175
					local name = tostring(p.name:sub(1, 1):upper()) .. tostring(p.name:sub(2, -1)) -- 176
					local amt = self["GetPrecursor" .. tostring(name)](self) -- 177
					local cost = getCostFromCls(cls, p.name) -- 178
					local amt_str -- 179
					if amt < cost then -- 179
						amt_str = "<c=200,0,0>" .. tostring(amt) -- 179
					end -- 179
					amt_str = amt_str or "<c=0,200,0>" .. tostring(amt) -- 180
					txt = tostring(p.name:sub(1, 1):upper()) .. tostring(p.name:sub(2, -1)) .. ": " .. tostring(amt_str) .. "/" .. tostring(cost) -- 181
					txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 182
					txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 183
					cam.End3D2D() -- 184
					_continue_0 = true -- 172
				until true -- 185
				if not _continue_0 then -- 185
					break -- 185
				end -- 185
			end -- 185
		end, -- 187
		Sound = "Equip_Weapon", -- 189
		IsFinished = function(self) -- 189
			local cls = self:GetEntityClass() -- 190
			if not (cls and cls ~= "") then -- 191
				return false -- 191
			end -- 191
			local _list_0 = self.Precursors -- 193
			for _index_0 = 1, #_list_0 do -- 193
				local p = _list_0[_index_0] -- 193
				local cost = getCostFromCls(cls, p.name) -- 194
				if cost > 0 then -- 195
					local name = tostring(p.name:sub(1, 1):upper()) .. tostring(p.name:sub(2, -1)) -- 196
					local amt = self["GetPrecursor" .. tostring(name)](self) -- 197
					if not amt or amt < cost then -- 198
						return false -- 199
					end -- 198
				end -- 195
			end -- 199
			return true -- 200
		end, -- 202
		Initialize = function(self) -- 202
			self:SetModel(self.Model) -- 203
			if SERVER then -- 204
				self:PhysicsInit(SOLID_VPHYSICS) -- 205
				self:SetMoveType(MOVETYPE_VPHYSICS) -- 206
				self:SetSolid(SOLID_VPHYSICS) -- 207
				self:PhysWake() -- 208
			end -- 204
			return self:SetStarted(false) -- 209
		end, -- 211
		OnTakeDamage = function(self, dmg) -- 211
			return self:TakePhysicsDamage(dmg) -- 211
		end, -- 213
		SetConstruct = function(self, cls) -- 213
			self:SetEntityClass(cls) -- 214
			local _list_0 = self.Precursors -- 215
			for _index_0 = 1, #_list_0 do -- 215
				local p = _list_0[_index_0] -- 215
				local name = tostring(p.name:sub(1, 1):upper()) .. tostring(p.name:sub(2, -1)) -- 216
				local set = self["SetPrecursor" .. tostring(name)] -- 217
				if set then -- 218
					set(self, 0) -- 218
				end -- 218
			end -- 218
		end, -- 220
		OnUseFinish = function(self, ply) -- 220
			self.index = self.index or 1 -- 221
			if not self:GetStarted() then -- 222
				if self.index >= #entity_cost then -- 223
					self.index = 1 -- 224
				else -- 226
					self.index = self.index + 1 -- 226
				end -- 223
				self:SetConstruct(entity_cost[self.index].cls) -- 227
				return -- 228
			end -- 222
			if not self:IsFinished() then -- 230
				return -- 230
			end -- 230
			_class_0.__parent.__base.OnUseFinish(self, ply) -- 232
			if SERVER then -- 234
				local cls = self:GetEntityClass() -- 235
				local ent = ents.Create(cls) -- 236
				if IsValid(ent) then -- 237
					ent:SetPos(self:GetPos()) -- 239
					ent:SetAngles(self:GetAngles()) -- 240
					ent:Spawn() -- 241
					ent:CPPISetOwner(ply) -- 242
					ent:Activate() -- 243
					return self:Remove() -- 244
				end -- 237
			end -- 234
		end -- 35
	} -- 35
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 244
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 35
			_base_0[_key_0] = _val_0 -- 35
		end -- 35
	end -- 244
	if _base_0.__index == nil then -- 35
		_base_0.__index = _base_0 -- 35
	end -- 244
	setmetatable(_base_0, _parent_0.__base) -- 35
	_class_0 = setmetatable({ -- 35
		__init = function(self, ...) -- 35
			return _class_0.__parent.__init(self, ...) -- 35
		end, -- 35
		__base = _base_0, -- 35
		__name = "Construct", -- 35
		__parent = _parent_0 -- 35
	}, { -- 35
		__index = function(cls, name) -- 35
			local val = rawget(_base_0, name) -- 35
			if val == nil then -- 35
				local parent = rawget(cls, "__parent") -- 35
				if parent then -- 35
					return parent[name] -- 35
				end -- 35
			else -- 35
				return val -- 35
			end -- 35
		end, -- 35
		__call = function(cls, ...) -- 35
			local _self_0 = setmetatable({ }, _base_0) -- 35
			cls.__init(_self_0, ...) -- 35
			return _self_0 -- 35
		end -- 35
	}) -- 35
	_base_0.__class = _class_0 -- 35
	local self = _class_0; -- 35
	self.__entity = "evilrp/spawned/construct" -- 36
	if _parent_0.__inherited then -- 35
		_parent_0.__inherited(_parent_0, _class_0) -- 35
	end -- 35
	Construct = _class_0 -- 35
end -- 244
if SERVER then -- 246
	local block_types = { -- 247
		"Physgun1", -- 247
		"Spawning1", -- 247
		"Toolgun1" -- 247
	} -- 247
	FPP.AddDefaultBlocked(block_types, "evilrp/spawned/weapon") -- 248
	return FPP.AddDefaultBlocked(block_types, "evilrp_weapon") -- 249
end -- 246
