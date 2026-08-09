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
	}, -- 25
	{ -- 32
		cls = "cooker", -- 32
		precursors = { -- 34
			metal = 8, -- 34
			wood = 3, -- 35
			biomass = 5 -- 36
		} -- 33
	} -- 31
} -- 7
local getCostFromCls -- 40
getCostFromCls = function(cls, precursor) -- 40
	if not (cls and cls ~= "") then -- 41
		return 0 -- 41
	end -- 41
	for _index_0 = 1, #entity_cost do -- 42
		local ent = entity_cost[_index_0] -- 42
		if ent.cls == cls then -- 43
			return ent.precursors[precursor] or 0 -- 44
		end -- 43
	end -- 44
	return 0 -- 45
end -- 40
local Construct -- 48
do -- 48
	local _class_0 -- 48
	local _parent_0 = ITEM -- 48
	local _base_0 = { -- 48
		PrintName = "Construct", -- 51
		Spawnable = true, -- 52
		Model = Model("models/props_c17/consolebox05a.mdl"), -- 53
		AdminSpawnable = true, -- 54
		Interesting = true, -- 56
		Precursors = { -- 57
			{ -- 57
				name = "biomass" -- 57
			}, -- 57
			{ -- 58
				name = "fluid" -- 58
			}, -- 58
			{ -- 59
				name = "metal" -- 59
			}, -- 59
			{ -- 60
				name = "wood" -- 60
			} -- 60
		}, -- 62
		ImpactSound = { -- 63
			soft = "weapon.ImpactSoft", -- 63
			hard = "weapon.ImpactHard" -- 64
		}, -- 66
		BasePay = 5, -- 68
		SetupDataTables = function(self) -- 68
			_class_0.__parent.__base.SetupDataTables(self) -- 69
			self:NetworkVar("String", "EntityClass") -- 70
			self:NetworkVar("Bool", "Started") -- 71
			local _list_0 = self.Precursors -- 73
			for _index_0 = 1, #_list_0 do -- 73
				local p = _list_0[_index_0] -- 73
				local name = tostring(p.name:sub(1, 1):upper()) .. tostring(p.name:sub(2, -1)) -- 74
				self:NetworkVar("Int", "Precursor" .. tostring(name)) -- 75
			end -- 75
			return self:NetworkVar("Entity", "Worker") -- 76
		end, -- 78
		AddPrecursor = function(self, pre, amt) -- 78
			local cls = self:GetEntityClass() -- 79
			if not (cls and cls ~= "") then -- 80
				return false -- 80
			end -- 80
			local cost = getCostFromCls(cls, pre) -- 81
			if cost <= 0 then -- 82
				return false -- 82
			end -- 82
			local name = tostring(pre:sub(1, 1):upper()) .. tostring(pre:sub(2, -1)) -- 83
			local current = self["GetPrecursor" .. tostring(name)](self) -- 88
			if current >= cost then -- 89
				return false -- 89
			end -- 89
			self["SetPrecursor" .. tostring(name)](self, math.min(current + amt, cost)) -- 90
			if not self:GetStarted() then -- 91
				self:SetStarted(true) -- 91
			end -- 91
			return true -- 92
		end, -- 94
		Touch = function(self, what) -- 94
			if SERVER then -- 95
				if not what.Precursor then -- 96
					return -- 96
				end -- 96
				if what.Processed then -- 97
					return -- 97
				end -- 97
				local pre, amt -- 99
				local _list_0 = self.Precursors -- 100
				for _index_0 = 1, #_list_0 do -- 100
					local p = _list_0[_index_0] -- 100
					for k, v in pairs(what.Precursor) do -- 101
						if p.name == k then -- 102
							pre = k -- 103
							amt = v -- 104
							if isfunction(amt) then -- 105
								amt = amt(self) -- 105
							end -- 105
							break -- 106
						end -- 102
					end -- 106
				end -- 106
				if not (pre and amt) then -- 107
					return -- 107
				end -- 107
				if not self:AddPrecursor(pre, amt) then -- 109
					return -- 109
				end -- 109
				what.Processed = true -- 111
				if what.SubmitSound then -- 112
					what:EmitSound(what.SubmitSound) -- 112
				end -- 112
				if what.Submitted then -- 113
					what.Submitted(what) -- 113
				end -- 113
				local submitter = what:GetNWEntity("evilrp_submitter", NULL) -- 115
				local reward = math.random(10, 15) * amt -- 116
				local rate = GAMEMODE.taxes.labor / 100 -- 117
				local taxed = math.floor(reward * rate) -- 118
				reward = reward - taxed -- 119
				if taxed > 0 then -- 120
					local _obj_0 = GAMEMODE.taxes_stored -- 120
					_obj_0.labor = _obj_0.labor + taxed -- 120
				end -- 120
				reward = math.ceil(reward) -- 121
				if submitter and IsValid(submitter) and submitter:IsPlayer() and submitter:Alive() then -- 123
					submitter:AddMoney(reward, "The Operation") -- 124
				else -- 126
					if reward > 0 then -- 126
						local _obj_0 = GAMEMODE.taxes_stored -- 126
						_obj_0.labor = _obj_0.labor + reward -- 126
					end -- 126
				end -- 123
				what:Remove() -- 128
				if submitter and IsValid(submitter) and submitter:IsPlayer() and submitter:Team() == TEAM_PRIVATE then -- 130
					submitter.precursor_supplied = submitter.precursor_supplied or 0 -- 131
					submitter.precursor_supplied = submitter.precursor_supplied + amt -- 132
					if submitter.precursor_supplied_difference and (submitter.precursor_supplied % 50) < submitter.precursor_supplied_difference then -- 133
						submitter:Notify("<c=0,200,0>Your work ethic makes Liver Failure proud.") -- 134
						submitter:AddStemCells(1) -- 135
					end -- 133
					submitter.precursor_supplied_difference = submitter.precursor_supplied % 50 -- 136
				end -- 130
			end -- 95
		end, -- 138
		HUDRender = function(self) -- 138
			local ct = { } -- 139
			local cls = self:GetEntityClass() -- 140
			local ent -- 141
			if cls and cls ~= "" then -- 141
				ent = scripted_ents.Get(cls) -- 141
			end -- 141
			local printName = "" -- 142
			if ent and ent.PrintName then -- 143
				printName = ent.PrintName -- 143
			end -- 143
			if cls == "npc_manned_emplacement" then -- 144
				printName = "MG Emplacement" -- 144
			end -- 144
			ct[#ct + 1] = "Constructing... " .. tostring(printName) -- 145
			ct[#ct + 1] = "" -- 146
			ct[#ct + 1] = { -- 147
				text = "Supply the necessary materials.", -- 147
				font = "Spleen_Label_Small" -- 147
			} -- 147
			return ct -- 148
		end, -- 150
		Draw = function(self) -- 150
			self:DrawModel() -- 151
			return self:Render3D2D() -- 152
		end, -- 154
		Render3D2D = function(self) -- 154
			local cls = self:GetEntityClass() -- 155
			local ent -- 156
			if cls and cls ~= "" then -- 156
				ent = scripted_ents.Get(cls) -- 156
			end -- 156
			local printName = ent and ent.PrintName or self.PrintName -- 157
			if cls == "npc_manned_emplacement" then -- 158
				printName = "MG Emplacement" -- 158
			end -- 158
			local dist_sqr = self:GetPos():DistToSqr(lp:GetPos()) -- 160
			if not (dist_sqr < 128 ^ 2) then -- 161
				return -- 161
			end -- 161
			local font = "Spleen_Label" -- 162
			local desp = lp:GetDespair() * 0.01 -- 163
			local ct = CurTime() -- 164
			local pos = self:GetPos() + (self:GetUp() * 6) - (self:GetForward() * 18) + (self:GetRight() * 13) -- 165
			local ang = self:GetAngles() -- 166
			ang:RotateAroundAxis(ang:Up(), 90) -- 168
			ang:RotateAroundAxis(ang:Forward(), 0) -- 169
			ang:RotateAroundAxis(ang:Right(), 0) -- 170
			cam.Start3D2D(pos, ang, 0.1) -- 172
			surface.SetMaterial(noise) -- 174
			surface.SetDrawColor(Color(255, 255, 255, 255)) -- 175
			surface.DrawTexturedRect(0, 0, 265, 38) -- 176
			local txt = tostring(printName) -- 178
			local txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 179
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 180
			cam.End3D2D() -- 182
			pos = self:GetPos() + (self:GetUp() * 6) - (self:GetForward() * 7) + (self:GetRight() * 11) -- 184
			local _list_0 = self.Precursors -- 186
			for _index_0 = 1, #_list_0 do -- 186
				local p = _list_0[_index_0] -- 186
				local _continue_0 = false -- 187
				repeat -- 187
					if p and p.name and getCostFromCls(cls, p.name) <= 0 then -- 188
						_continue_0 = true -- 188
						break -- 188
					end -- 188
					pos = pos + (-self:GetForward() * 3) -- 189
					cam.Start3D2D(pos, ang, 0.1) -- 190
					local name = tostring(p.name:sub(1, 1):upper()) .. tostring(p.name:sub(2, -1)) -- 191
					local amt = self["GetPrecursor" .. tostring(name)](self) -- 192
					local cost = getCostFromCls(cls, p.name) -- 193
					local amt_str -- 194
					if amt < cost then -- 194
						amt_str = "<c=200,0,0>" .. tostring(amt) -- 194
					end -- 194
					amt_str = amt_str or "<c=0,200,0>" .. tostring(amt) -- 195
					txt = tostring(p.name:sub(1, 1):upper()) .. tostring(p.name:sub(2, -1)) .. ": " .. tostring(amt_str) .. "/" .. tostring(cost) -- 196
					txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 197
					txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 198
					cam.End3D2D() -- 199
					_continue_0 = true -- 187
				until true -- 200
				if not _continue_0 then -- 200
					break -- 200
				end -- 200
			end -- 200
		end, -- 202
		Sound = "Equip_Weapon", -- 204
		IsFinished = function(self) -- 204
			local cls = self:GetEntityClass() -- 205
			if not (cls and cls ~= "") then -- 206
				return false -- 206
			end -- 206
			local _list_0 = self.Precursors -- 208
			for _index_0 = 1, #_list_0 do -- 208
				local p = _list_0[_index_0] -- 208
				local cost = getCostFromCls(cls, p.name) -- 209
				if cost > 0 then -- 210
					local name = tostring(p.name:sub(1, 1):upper()) .. tostring(p.name:sub(2, -1)) -- 211
					local amt = self["GetPrecursor" .. tostring(name)](self) -- 212
					if not amt or amt < cost then -- 213
						return false -- 214
					end -- 213
				end -- 210
			end -- 214
			return true -- 215
		end, -- 217
		Initialize = function(self) -- 217
			self:SetModel(self.Model) -- 218
			if SERVER then -- 219
				self:PhysicsInit(SOLID_VPHYSICS) -- 220
				self:SetMoveType(MOVETYPE_VPHYSICS) -- 221
				self:SetSolid(SOLID_VPHYSICS) -- 222
				self:PhysWake() -- 223
			end -- 219
			return self:SetStarted(false) -- 224
		end, -- 226
		OnTakeDamage = function(self, dmg) -- 226
			return self:TakePhysicsDamage(dmg) -- 226
		end, -- 228
		SetConstruct = function(self, cls) -- 228
			self:SetEntityClass(cls) -- 229
			local _list_0 = self.Precursors -- 230
			for _index_0 = 1, #_list_0 do -- 230
				local p = _list_0[_index_0] -- 230
				local name = tostring(p.name:sub(1, 1):upper()) .. tostring(p.name:sub(2, -1)) -- 231
				local set = self["SetPrecursor" .. tostring(name)] -- 232
				if set then -- 233
					set(self, 0) -- 233
				end -- 233
			end -- 233
		end, -- 235
		OnUseFinish = function(self, ply) -- 235
			self.index = self.index or 1 -- 236
			if not self:GetStarted() then -- 237
				if self.index >= #entity_cost then -- 238
					self.index = 1 -- 239
				else -- 241
					self.index = self.index + 1 -- 241
				end -- 238
				self:SetConstruct(entity_cost[self.index].cls) -- 242
				return -- 243
			end -- 237
			if not self:IsFinished() then -- 245
				return -- 245
			end -- 245
			_class_0.__parent.__base.OnUseFinish(self, ply) -- 247
			if SERVER then -- 249
				local cls = self:GetEntityClass() -- 250
				local ent = ents.Create(cls) -- 251
				if IsValid(ent) then -- 252
					ent:SetPos(self:GetPos()) -- 254
					ent:SetAngles(self:GetAngles()) -- 255
					ent:Spawn() -- 256
					ent:CPPISetOwner(ply) -- 257
					ent:Activate() -- 258
					return self:Remove() -- 259
				end -- 252
			end -- 249
		end -- 48
	} -- 48
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 259
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 48
			_base_0[_key_0] = _val_0 -- 48
		end -- 48
	end -- 259
	if _base_0.__index == nil then -- 48
		_base_0.__index = _base_0 -- 48
	end -- 259
	setmetatable(_base_0, _parent_0.__base) -- 48
	_class_0 = setmetatable({ -- 48
		__init = function(self, ...) -- 48
			return _class_0.__parent.__init(self, ...) -- 48
		end, -- 48
		__base = _base_0, -- 48
		__name = "Construct", -- 48
		__parent = _parent_0 -- 48
	}, { -- 48
		__index = function(cls, name) -- 48
			local val = rawget(_base_0, name) -- 48
			if val == nil then -- 48
				local parent = rawget(cls, "__parent") -- 48
				if parent then -- 48
					return parent[name] -- 48
				end -- 48
			else -- 48
				return val -- 48
			end -- 48
		end, -- 48
		__call = function(cls, ...) -- 48
			local _self_0 = setmetatable({ }, _base_0) -- 48
			cls.__init(_self_0, ...) -- 48
			return _self_0 -- 48
		end -- 48
	}) -- 48
	_base_0.__class = _class_0 -- 48
	local self = _class_0; -- 48
	self.__entity = "evilrp/spawned/construct" -- 49
	if _parent_0.__inherited then -- 48
		_parent_0.__inherited(_parent_0, _class_0) -- 48
	end -- 48
	Construct = _class_0 -- 48
end -- 259
if SERVER then -- 261
	local block_types = { -- 262
		"Physgun1", -- 262
		"Spawning1", -- 262
		"Toolgun1" -- 262
	} -- 262
	FPP.AddDefaultBlocked(block_types, "evilrp/spawned/weapon") -- 263
	return FPP.AddDefaultBlocked(block_types, "evilrp_weapon") -- 264
end -- 261
