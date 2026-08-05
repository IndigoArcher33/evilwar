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
	}, -- 19
	{ -- 26
		cls = "npc_manned_emplacement", -- 26
		precursors = { -- 28
			metal = 10, -- 28
			wood = 5 -- 29
		} -- 27
	} -- 25
} -- 7
local getCostFromCls -- 33
getCostFromCls = function(cls, precursor) -- 33
	if not (cls and cls ~= "") then -- 34
		return 0 -- 34
	end -- 34
	for _index_0 = 1, #entity_cost do -- 35
		local ent = entity_cost[_index_0] -- 35
		if ent.cls == cls then -- 36
			return ent.precursors[precursor] or 0 -- 37
		end -- 36
	end -- 37
	return 0 -- 38
end -- 33
local Construct -- 41
do -- 41
	local _class_0 -- 41
	local _parent_0 = ITEM -- 41
	local _base_0 = { -- 41
		PrintName = "Construct", -- 44
		Spawnable = true, -- 45
		Model = Model("models/props_c17/consolebox05a.mdl"), -- 46
		AdminSpawnable = true, -- 47
		Interesting = true, -- 49
		Precursors = { -- 50
			{ -- 50
				name = "biomass" -- 50
			}, -- 50
			{ -- 51
				name = "fluid" -- 51
			}, -- 51
			{ -- 52
				name = "metal" -- 52
			}, -- 52
			{ -- 53
				name = "wood" -- 53
			} -- 53
		}, -- 55
		ImpactSound = { -- 56
			soft = "weapon.ImpactSoft", -- 56
			hard = "weapon.ImpactHard" -- 57
		}, -- 59
		BasePay = 5, -- 61
		SetupDataTables = function(self) -- 61
			_class_0.__parent.__base.SetupDataTables(self) -- 62
			self:NetworkVar("String", "EntityClass") -- 63
			self:NetworkVar("Bool", "Started") -- 64
			local _list_0 = self.Precursors -- 66
			for _index_0 = 1, #_list_0 do -- 66
				local p = _list_0[_index_0] -- 66
				local name = tostring(p.name:sub(1, 1):upper()) .. tostring(p.name:sub(2, -1)) -- 67
				self:NetworkVar("Int", "Precursor" .. tostring(name)) -- 68
			end -- 68
			return self:NetworkVar("Entity", "Worker") -- 69
		end, -- 71
		AddPrecursor = function(self, pre, amt) -- 71
			local cls = self:GetEntityClass() -- 72
			if not (cls and cls ~= "") then -- 73
				return false -- 73
			end -- 73
			local cost = getCostFromCls(cls, pre) -- 74
			if cost <= 0 then -- 75
				return false -- 75
			end -- 75
			local name = tostring(pre:sub(1, 1):upper()) .. tostring(pre:sub(2, -1)) -- 76
			local current = self["GetPrecursor" .. tostring(name)](self) -- 81
			if current >= cost then -- 82
				return false -- 82
			end -- 82
			self["SetPrecursor" .. tostring(name)](self, math.min(current + amt, cost)) -- 83
			if not self:GetStarted() then -- 84
				self:SetStarted(true) -- 84
			end -- 84
			return true -- 85
		end, -- 87
		Touch = function(self, what) -- 87
			if SERVER then -- 88
				if not what.Precursor then -- 89
					return -- 89
				end -- 89
				if what.Processed then -- 90
					return -- 90
				end -- 90
				local pre, amt -- 92
				local _list_0 = self.Precursors -- 93
				for _index_0 = 1, #_list_0 do -- 93
					local p = _list_0[_index_0] -- 93
					for k, v in pairs(what.Precursor) do -- 94
						if p.name == k then -- 95
							pre = k -- 96
							amt = v -- 97
							if isfunction(amt) then -- 98
								amt = amt(self) -- 98
							end -- 98
							break -- 99
						end -- 95
					end -- 99
				end -- 99
				if not (pre and amt) then -- 100
					return -- 100
				end -- 100
				if not self:AddPrecursor(pre, amt) then -- 102
					return -- 102
				end -- 102
				what.Processed = true -- 104
				if what.SubmitSound then -- 105
					what:EmitSound(what.SubmitSound) -- 105
				end -- 105
				if what.Submitted then -- 106
					what.Submitted(what) -- 106
				end -- 106
				local submitter = what:GetNWEntity("evilrp_submitter", NULL) -- 108
				local reward = math.random(10, 15) * amt -- 109
				local rate = GAMEMODE.taxes.labor / 100 -- 110
				local taxed = math.floor(reward * rate) -- 111
				reward = reward - taxed -- 112
				if taxed > 0 then -- 113
					local _obj_0 = GAMEMODE.taxes_stored -- 113
					_obj_0.labor = _obj_0.labor + taxed -- 113
				end -- 113
				reward = math.ceil(reward) -- 114
				if submitter and IsValid(submitter) and submitter:IsPlayer() and submitter:Alive() then -- 116
					submitter:AddMoney(reward, "The Operation") -- 117
				else -- 119
					if reward > 0 then -- 119
						local _obj_0 = GAMEMODE.taxes_stored -- 119
						_obj_0.labor = _obj_0.labor + reward -- 119
					end -- 119
				end -- 116
				what:Remove() -- 121
				if submitter and IsValid(submitter) and submitter:IsPlayer() and submitter:Team() == TEAM_PRIVATE then -- 123
					submitter.precursor_supplied = submitter.precursor_supplied or 0 -- 124
					submitter.precursor_supplied = submitter.precursor_supplied + amt -- 125
					if submitter.precursor_supplied_difference and (submitter.precursor_supplied % 50) < submitter.precursor_supplied_difference then -- 126
						submitter:Notify("<c=0,200,0>Your work ethic makes Liver Failure proud.") -- 127
						submitter:AddStemCells(1) -- 128
					end -- 126
					submitter.precursor_supplied_difference = submitter.precursor_supplied % 50 -- 129
				end -- 123
			end -- 88
		end, -- 131
		HUDRender = function(self) -- 131
			local ct = { } -- 132
			local cls = self:GetEntityClass() -- 133
			local ent -- 134
			if cls and cls ~= "" then -- 134
				ent = scripted_ents.Get(cls) -- 134
			end -- 134
			local printName = "" -- 135
			if ent and ent.PrintName then -- 136
				printName = ent.PrintName -- 136
			end -- 136
			if cls == "npc_manned_emplacement" then -- 137
				printName = "MG Emplacement" -- 137
			end -- 137
			ct[#ct + 1] = "Constructing... " .. tostring(printName) -- 138
			ct[#ct + 1] = "" -- 139
			ct[#ct + 1] = { -- 140
				text = "Supply the necessary materials.", -- 140
				font = "Spleen_Label_Small" -- 140
			} -- 140
			return ct -- 141
		end, -- 143
		Draw = function(self) -- 143
			self:DrawModel() -- 144
			return self:Render3D2D() -- 145
		end, -- 147
		Render3D2D = function(self) -- 147
			local cls = self:GetEntityClass() -- 148
			local ent -- 149
			if cls and cls ~= "" then -- 149
				ent = scripted_ents.Get(cls) -- 149
			end -- 149
			local printName = ent and ent.PrintName or self.PrintName -- 150
			if cls == "npc_manned_emplacement" then -- 151
				printName = "MG Emplacement" -- 151
			end -- 151
			local dist_sqr = self:GetPos():DistToSqr(lp:GetPos()) -- 153
			if not (dist_sqr < 128 ^ 2) then -- 154
				return -- 154
			end -- 154
			local font = "Spleen_Label" -- 155
			local desp = lp:GetDespair() * 0.01 -- 156
			local ct = CurTime() -- 157
			local pos = self:GetPos() + (self:GetUp() * 6) - (self:GetForward() * 18) + (self:GetRight() * 13) -- 158
			local ang = self:GetAngles() -- 159
			ang:RotateAroundAxis(ang:Up(), 90) -- 161
			ang:RotateAroundAxis(ang:Forward(), 0) -- 162
			ang:RotateAroundAxis(ang:Right(), 0) -- 163
			cam.Start3D2D(pos, ang, 0.1) -- 165
			surface.SetMaterial(noise) -- 167
			surface.SetDrawColor(Color(255, 255, 255, 255)) -- 168
			surface.DrawTexturedRect(0, 0, 265, 38) -- 169
			local txt = tostring(printName) -- 171
			local txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 172
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 173
			cam.End3D2D() -- 175
			pos = self:GetPos() + (self:GetUp() * 6) - (self:GetForward() * 7) + (self:GetRight() * 11) -- 177
			local _list_0 = self.Precursors -- 179
			for _index_0 = 1, #_list_0 do -- 179
				local p = _list_0[_index_0] -- 179
				local _continue_0 = false -- 180
				repeat -- 180
					if p and p.name and getCostFromCls(cls, p.name) <= 0 then -- 181
						_continue_0 = true -- 181
						break -- 181
					end -- 181
					pos = pos + (-self:GetForward() * 3) -- 182
					cam.Start3D2D(pos, ang, 0.1) -- 183
					local name = tostring(p.name:sub(1, 1):upper()) .. tostring(p.name:sub(2, -1)) -- 184
					local amt = self["GetPrecursor" .. tostring(name)](self) -- 185
					local cost = getCostFromCls(cls, p.name) -- 186
					local amt_str -- 187
					if amt < cost then -- 187
						amt_str = "<c=200,0,0>" .. tostring(amt) -- 187
					end -- 187
					amt_str = amt_str or "<c=0,200,0>" .. tostring(amt) -- 188
					txt = tostring(p.name:sub(1, 1):upper()) .. tostring(p.name:sub(2, -1)) .. ": " .. tostring(amt_str) .. "/" .. tostring(cost) -- 189
					txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 190
					txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 191
					cam.End3D2D() -- 192
					_continue_0 = true -- 180
				until true -- 193
				if not _continue_0 then -- 193
					break -- 193
				end -- 193
			end -- 193
		end, -- 195
		Sound = "Equip_Weapon", -- 197
		IsFinished = function(self) -- 197
			local cls = self:GetEntityClass() -- 198
			if not (cls and cls ~= "") then -- 199
				return false -- 199
			end -- 199
			local _list_0 = self.Precursors -- 201
			for _index_0 = 1, #_list_0 do -- 201
				local p = _list_0[_index_0] -- 201
				local cost = getCostFromCls(cls, p.name) -- 202
				if cost > 0 then -- 203
					local name = tostring(p.name:sub(1, 1):upper()) .. tostring(p.name:sub(2, -1)) -- 204
					local amt = self["GetPrecursor" .. tostring(name)](self) -- 205
					if not amt or amt < cost then -- 206
						return false -- 207
					end -- 206
				end -- 203
			end -- 207
			return true -- 208
		end, -- 210
		Initialize = function(self) -- 210
			self:SetModel(self.Model) -- 211
			if SERVER then -- 212
				self:PhysicsInit(SOLID_VPHYSICS) -- 213
				self:SetMoveType(MOVETYPE_VPHYSICS) -- 214
				self:SetSolid(SOLID_VPHYSICS) -- 215
				self:PhysWake() -- 216
			end -- 212
			return self:SetStarted(false) -- 217
		end, -- 219
		OnTakeDamage = function(self, dmg) -- 219
			return self:TakePhysicsDamage(dmg) -- 219
		end, -- 221
		SetConstruct = function(self, cls) -- 221
			self:SetEntityClass(cls) -- 222
			local _list_0 = self.Precursors -- 223
			for _index_0 = 1, #_list_0 do -- 223
				local p = _list_0[_index_0] -- 223
				local name = tostring(p.name:sub(1, 1):upper()) .. tostring(p.name:sub(2, -1)) -- 224
				local set = self["SetPrecursor" .. tostring(name)] -- 225
				if set then -- 226
					set(self, 0) -- 226
				end -- 226
			end -- 226
		end, -- 228
		OnUseFinish = function(self, ply) -- 228
			self.index = self.index or 1 -- 229
			if not self:GetStarted() then -- 230
				if self.index >= #entity_cost then -- 231
					self.index = 1 -- 232
				else -- 234
					self.index = self.index + 1 -- 234
				end -- 231
				self:SetConstruct(entity_cost[self.index].cls) -- 235
				return -- 236
			end -- 230
			if not self:IsFinished() then -- 238
				return -- 238
			end -- 238
			_class_0.__parent.__base.OnUseFinish(self, ply) -- 240
			if SERVER then -- 242
				local cls = self:GetEntityClass() -- 243
				local ent = ents.Create(cls) -- 244
				if IsValid(ent) then -- 245
					ent:SetPos(self:GetPos()) -- 247
					ent:SetAngles(self:GetAngles()) -- 248
					ent:Spawn() -- 249
					ent:CPPISetOwner(ply) -- 250
					ent:Activate() -- 251
					return self:Remove() -- 252
				end -- 245
			end -- 242
		end -- 41
	} -- 41
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 252
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 41
			_base_0[_key_0] = _val_0 -- 41
		end -- 41
	end -- 252
	if _base_0.__index == nil then -- 41
		_base_0.__index = _base_0 -- 41
	end -- 252
	setmetatable(_base_0, _parent_0.__base) -- 41
	_class_0 = setmetatable({ -- 41
		__init = function(self, ...) -- 41
			return _class_0.__parent.__init(self, ...) -- 41
		end, -- 41
		__base = _base_0, -- 41
		__name = "Construct", -- 41
		__parent = _parent_0 -- 41
	}, { -- 41
		__index = function(cls, name) -- 41
			local val = rawget(_base_0, name) -- 41
			if val == nil then -- 41
				local parent = rawget(cls, "__parent") -- 41
				if parent then -- 41
					return parent[name] -- 41
				end -- 41
			else -- 41
				return val -- 41
			end -- 41
		end, -- 41
		__call = function(cls, ...) -- 41
			local _self_0 = setmetatable({ }, _base_0) -- 41
			cls.__init(_self_0, ...) -- 41
			return _self_0 -- 41
		end -- 41
	}) -- 41
	_base_0.__class = _class_0 -- 41
	local self = _class_0; -- 41
	self.__entity = "evilrp/spawned/construct" -- 42
	if _parent_0.__inherited then -- 41
		_parent_0.__inherited(_parent_0, _class_0) -- 41
	end -- 41
	Construct = _class_0 -- 41
end -- 252
if SERVER then -- 254
	local block_types = { -- 255
		"Physgun1", -- 255
		"Spawning1", -- 255
		"Toolgun1" -- 255
	} -- 255
	FPP.AddDefaultBlocked(block_types, "evilrp/spawned/weapon") -- 256
	return FPP.AddDefaultBlocked(block_types, "evilrp_weapon") -- 257
end -- 254
