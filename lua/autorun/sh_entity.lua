-- [yue]: .\sh_entity.yue
local Create = ents.Create -- 1
local Register = scripted_ents.Register -- 3
local lower, Left = string.lower, string.Left -- 5
local TraceLine = util.TraceLine -- 7
do -- 9
	local _class_0 -- 9
	local _base_0 = { -- 9
		CanSell = false -- 9
	} -- 9
	if _base_0.__index == nil then -- 9
		_base_0.__index = _base_0 -- 9
	end -- 42
	_class_0 = setmetatable({ -- 9
		__init = function(self, where) -- 36
			if isvector(where) then -- 37
				self:SetPos(where) -- 38
			elseif isentity(where) and where:IsPlayer() then -- 39
				self:SetPos(where:GetEyeTrace().HitPos) -- 40
			end -- 37
			self:Spawn() -- 41
			return self:Activate() -- 42
		end, -- 9
		__base = _base_0, -- 9
		__name = "ENTITY" -- 9
	}, { -- 9
		__index = _base_0, -- 9
		__call = function(cls, ...) -- 9
			local _self_0 = setmetatable({ }, _base_0) -- 9
			cls.__init(_self_0, ...) -- 9
			return _self_0 -- 9
		end -- 9
	}) -- 9
	_base_0.__class = _class_0 -- 9
	local self = _class_0; -- 9
	self.registered = { } -- 11
	self.__inherited = function(self, child) -- 12
		do -- 13
			local _with_0 = getmetatable(child) -- 13
			_with_0.__call = function(self, ...) -- 14
				local ent = Create(self.__barcode) -- 15
				ent.__class = ent.BaseClass -- 16
				self.__init(ent, ...) -- 17
				return ent -- 18
			end -- 14
		end -- 13
		local fields -- 19
		do -- 19
			local _tbl_0 = { } -- 19
			for k, v in pairs(child.__base) do -- 19
				if Left(k, 2) ~= "__" then -- 19
					_tbl_0[k] = v -- 19
				end -- 19
			end -- 19
			fields = _tbl_0 -- 19
		end -- 19
		fields.Base = fields.Base or self.__barcode -- 20
		fields.Spawnable = fields.Spawnable or self.Spawnable -- 21
		fields.Category = fields.Category or self.Category -- 22
		fields.CanSell = child.__base.CanSell -- 23
		if fields.CanSell == nil then -- 24
			fields.CanSell = false -- 24
		end -- 24
		local cls_name = rawget(child, "__entity") -- 25
		if cls_name then -- 26
			child.__barcode = lower(cls_name) -- 27
		else -- 29
			child.__barcode = tostring(self.__barcode and self.__barcode .. "/" or "") .. tostring(lower(cls_name or child.__name)) -- 29
		end -- 26
		Register(fields, child.__barcode) -- 30
		MsgC(Color(0, 200, 0), "+ENTITY: " .. tostring(child.__barcode) .. "\n") -- 31
		self.registered[child.__barcode] = child -- 32
	end -- 12
	self.create = function(self, name, ...) -- 33
		if not self.registered[name] then -- 34
			return -- 34
		end -- 34
		return self.registered[name](...) -- 35
	end -- 33
	ENTITY = _class_0 -- 9
end -- 42
if CLIENT then -- 44
	net.Receive("evilrp_use_fail", function() -- 45
		local failtext = net.ReadString() -- 46
		GAMEMODE:Frighten() -- 47
		return chat.AddNonParsedText(Color(200, 0, 0, 255), failtext) -- 48
	end) -- 45
else -- 50
	util.AddNetworkString("evilrp_use_fail") -- 50
end -- 44
do -- 52
	local _class_0 -- 52
	local _parent_0 = ENTITY -- 52
	local _base_0 = { -- 52
		Base = "base_anim", -- 54
		CanSell = false, -- 55
		Type = "anim", -- 57
		TimeToUse = 1, -- 58
		PartialUse = 1, -- 59
		PartialUses = { }, -- 61
		SetupDataTables = function(self) -- 61
			self:NetworkVar("Float", "EndTime") -- 62
			self:NetworkVar("Entity", "User") -- 63
			self:NetworkVar("Bool", "DrawKeyPrompt") -- 64
			self:NetworkVar("Bool", "DrawProgress") -- 65
			if SERVER then -- 66
				self:SetEndTime(0) -- 67
				self:SetDrawKeyPrompt(false) -- 68
				self:SetDrawProgress(true) -- 69
				self.ProgPerTick = 1 / (self.TimeToUse * (1 / FrameTime()) / 100) -- 70
			end -- 66
		end, -- 72
		IsProgressUsable = function(self) -- 72
			return true -- 72
		end, -- 74
		OnUseFinish = function(self, ply) end, -- 76
		OnUseStart = function(self, ply) end, -- 78
		OnUseCancel = function(self, ply, end_time) end, -- 80
		Use = function(self, ply) -- 80
			local user = self:GetUser() -- 81
			if IsValid(user) and user ~= ply then -- 82
				return -- 82
			end -- 82
			if ply:KeyDownLast(IN_USE) and not IsValid(user) then -- 83
				return -- 83
			end -- 83
			self:SetUser(ply) -- 84
			if not ply:KeyDownLast(IN_USE) then -- 85
				self:SetEndTime(0) -- 86
				local started = self:OnUseStart(ply) -- 87
				if not (started == false) then -- 88
					self:SetEndTime(CurTime() + self.TimeToUse) -- 88
				end -- 88
			end -- 85
			local et = self:GetEndTime() -- 89
			local ct = CurTime() -- 90
			if ct >= et and IsValid(user) and et ~= 0 then -- 91
				self:OnUseFinish(user) -- 92
				self:SetEndTime(0) -- 93
				self.PartialUse = 0 -- 94
				return self:SetUser(NULL) -- 95
			end -- 91
		end, -- 97
		Think = function(self) -- 97
			local user = self:GetUser() -- 98
			local et = self:GetEndTime() -- 99
			local ct = CurTime() -- 100
			if IsValid(user) then -- 101
				if ((user:GetUseEntity() ~= self) or (not user:KeyDown(IN_USE))) and et ~= 0 then -- 102
					self:SetUser(NULL) -- 103
					local end_time = self:GetEndTime() -- 104
					self:SetEndTime(0) -- 105
					self.PartialUse = 0 -- 106
					if SERVER then -- 107
						self:OnUseCancel(user, end_time) -- 107
					end -- 107
				end -- 102
				if (self.PartialUses[self.PartialUse] ~= nil) then -- 108
					if (ct >= (et - self.TimeToUse) + (self.PartialUses[self.PartialUse].prog / 100) * self.TimeToUse) then -- 109
						if et ~= 0 then -- 110
							self.PartialUses[self.PartialUse].func(self, user) -- 111
							self.PartialUse = self.PartialUse + 1 -- 112
						end -- 110
					end -- 109
				elseif (#self.PartialUses > 0) then -- 113
					do -- 114
						local _exp_0 = self.PartialUse -- 114
						if 0 == _exp_0 then -- 115
							self.PartialUse = 1 -- 116
						else -- 118
							self:SetUser(NULL) -- 118
							self:SetEndTime(0) -- 119
							self.PartialUse = 0 -- 120
						end -- 120
					end -- 120
				end -- 108
			end -- 101
			self:NextThink(ct) -- 121
			return true -- 122
		end -- 52
	} -- 52
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 122
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 52
			_base_0[_key_0] = _val_0 -- 52
		end -- 52
	end -- 122
	if _base_0.__index == nil then -- 52
		_base_0.__index = _base_0 -- 52
	end -- 122
	setmetatable(_base_0, _parent_0.__base) -- 52
	_class_0 = setmetatable({ -- 52
		__init = function(self, ...) -- 52
			return _class_0.__parent.__init(self, ...) -- 52
		end, -- 52
		__base = _base_0, -- 52
		__name = "ENTITY_LONGUSE", -- 52
		__parent = _parent_0 -- 52
	}, { -- 52
		__index = function(cls, name) -- 52
			local val = rawget(_base_0, name) -- 52
			if val == nil then -- 52
				local parent = rawget(cls, "__parent") -- 52
				if parent then -- 52
					return parent[name] -- 52
				end -- 52
			else -- 52
				return val -- 52
			end -- 52
		end, -- 52
		__call = function(cls, ...) -- 52
			local _self_0 = setmetatable({ }, _base_0) -- 52
			cls.__init(_self_0, ...) -- 52
			return _self_0 -- 52
		end -- 52
	}) -- 52
	_base_0.__class = _class_0 -- 52
	if _parent_0.__inherited then -- 52
		_parent_0.__inherited(_parent_0, _class_0) -- 52
	end -- 52
	ENTITY_LONGUSE = _class_0 -- 52
end -- 122
do -- 124
	local _class_0 -- 124
	local _parent_0 = ENTITY_LONGUSE -- 124
	local _base_0 = { -- 124
		Spawnable = true, -- 128
		CanSell = false, -- 129
		Interesting = true, -- 131
		PMRender = function(item) -- 131
			local ct = { } -- 132
			local wt = scripted_ents.Get(item.class) -- 133
			ct[#ct + 1] = wt.PrintName -- 134
			if wt.Description then -- 135
				ct[#ct + 1] = "" -- 136
				ct[#ct + 1] = { -- 137
					text = wt.Description, -- 137
					font = "Spleen_Label_Small" -- 137
				} -- 137
			end -- 135
			return ct -- 138
		end, -- 140
		HUDRender = function(self) -- 140
			local ct = { } -- 141
			ct[#ct + 1] = self.PrintName -- 142
			if self.Description then -- 143
				ct[#ct + 1] = "" -- 144
				ct[#ct + 1] = { -- 145
					text = self.Description, -- 145
					font = "Spleen_Label_Small" -- 145
				} -- 145
			end -- 143
			return ct -- 146
		end, -- 148
		Initialize = function(self) -- 148
			self:SetModel(self.Model) -- 149
			if SERVER then -- 150
				self:PhysicsInit(SOLID_VPHYSICS) -- 151
				self:SetMoveType(MOVETYPE_VPHYSICS) -- 152
				self:SetSolid(SOLID_VPHYSICS) -- 153
				return self:PhysWake() -- 154
			end -- 150
		end, -- 156
		Trash = function(self) -- 156
			local cls = self.TrashClass -- 157
			local pos = self:GetPos() -- 158
			local ang = self:GetAngles() -- 159
			self:Remove() -- 160
			if cls then -- 161
				local trash = ents.Create(cls) -- 162
				trash:SetPos(pos) -- 164
				trash:SetAngles(ang) -- 165
				trash:Spawn() -- 166
				trash:Activate() -- 167
				return trash -- 163
			end -- 161
		end, -- 169
		OnUseFinish = function(self, ply) -- 169
			if self.Sound then -- 170
				ply:EmitSound(self.Sound) -- 170
			end -- 170
			if self.UseText then -- 171
				return ply:ConCommand("say /me " .. tostring(self.UseText[math.random(1, #self.UseText)])) -- 172
			end -- 171
		end, -- 174
		OnUseStart = function(self, ply) end, -- 176
		OnUseCancel = function(self, ply, end_time) -- 176
			local time_left = end_time - CurTime() -- 178
			if (self.Pocketable ~= false) and time_left >= self.TimeToUse * .5 then -- 179
				local can_pickup, message = hook.Call("canPocket", GAMEMODE, ply, self) -- 180
				if not can_pickup then -- 181
					if message and SERVER then -- 182
						ply:Notify(message) -- 182
					end -- 182
					return -- 183
				end -- 181
				ply:DoAnimationEvent(ACT_GMOD_GESTURE_ITEM_GIVE) -- 184
				if SERVER then -- 185
					ply:EmitSound("Pocket_Item") -- 186
					return ply:addPocketItem(self) -- 187
				end -- 185
			end -- 179
		end, -- 189
		Model = Model("models/Gibs/HGIBS.mdl"), -- 190
		Spawnable = true, -- 192
		Sound = Sound("vo/k_lab/kl_fiddlesticks.wav"), -- 194
		OnlyInventoryUse = false, -- 196
		OnTakeDamage = function(self, dmg) -- 196
			return self:TakePhysicsDamage(dmg) -- 197
		end, -- 199
		Use = function(self, ply) -- 199
			if self.inventory_use then -- 200
				self:OnUseFinish(ply) -- 201
				self.inventory_use = nil -- 202
				return -- 203
			end -- 200
			if self.OnlyInventoryUse then -- 204
				if not ply.next_use_warn then -- 207
					ply.next_use_warn = ct -- 207
				end -- 207
				if not (ply.next_use_warn > ct) then -- 208
					ply.next_use_warn = ct + 2 -- 209
					local failtext = "Put it in your pockets first!" -- 210
					net.Start("evilrp_use_fail") -- 211
					net.WriteString(failtext) -- 212
					net.Send(ply) -- 213
				end -- 208
				return -- 214
			end -- 204
			return _class_0.__parent.__base.Use(self, ply) -- 215
		end, -- 217
		PhysicsCollide = function(self, data, physobj) -- 217
			local prop1 = util.GetSurfaceData(data.OurSurfaceProps) -- 218
			local prop2 = util.GetSurfaceData(data.TheirSurfaceProps) -- 219
			if data.Speed >= 75 and ((self.LastImpact or 0) + 0.1 < CurTime()) then -- 220
				self.LastImpact = CurTime() -- 221
				local snd -- 222
				do -- 222
					local _exp_0 = type(self.ImpactSound) -- 222
					if "table" == _exp_0 then -- 223
						snd = self.ImpactSound.hard -- 224
					elseif "string" == _exp_0 then -- 225
						snd = self.ImpactSound -- 226
					elseif "nil" == _exp_0 then -- 227
						snd = prop1.impactHardSound -- 228
					end -- 228
				end -- 228
				return self:EmitSound(snd) -- 229
			elseif data.Speed >= 25 and ((self.LastImpact or 0) + 0.1 < CurTime()) then -- 231
				self.LastImpact = CurTime() -- 232
				local snd -- 233
				do -- 233
					local _exp_0 = type(self.ImpactSound) -- 233
					if "table" == _exp_0 then -- 234
						snd = self.ImpactSound.soft -- 235
					elseif "string" == _exp_0 then -- 236
						snd = self.ImpactSound -- 237
					elseif "nil" == _exp_0 then -- 238
						snd = prop1.impactSoftSound -- 239
					end -- 239
				end -- 239
				return self:EmitSound(snd) -- 240
			end -- 220
		end, -- 243
		Interactions = function(self, ply) -- 243
			local actions = { } -- 244
			if (self.Pocketable ~= false) then -- 245
				actions[#actions + 1] = { -- 246
					desc = "Pocket", -- 246
					func = (function() -- 246
						return netstream.Send("PocketItem", self) -- 246
					end) -- 246
				} -- 246
			end -- 245
			return actions -- 247
		end -- 124
	} -- 124
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 247
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 124
			_base_0[_key_0] = _val_0 -- 124
		end -- 124
	end -- 247
	if _base_0.__index == nil then -- 124
		_base_0.__index = _base_0 -- 124
	end -- 247
	setmetatable(_base_0, _parent_0.__base) -- 124
	_class_0 = setmetatable({ -- 124
		__init = function(self, ...) -- 124
			return _class_0.__parent.__init(self, ...) -- 124
		end, -- 124
		__base = _base_0, -- 124
		__name = "ITEM", -- 124
		__parent = _parent_0 -- 124
	}, { -- 124
		__index = function(cls, name) -- 124
			local val = rawget(_base_0, name) -- 124
			if val == nil then -- 124
				local parent = rawget(cls, "__parent") -- 124
				if parent then -- 124
					return parent[name] -- 124
				end -- 124
			else -- 124
				return val -- 124
			end -- 124
		end, -- 124
		__call = function(cls, ...) -- 124
			local _self_0 = setmetatable({ }, _base_0) -- 124
			cls.__init(_self_0, ...) -- 124
			return _self_0 -- 124
		end -- 124
	}) -- 124
	_base_0.__class = _class_0 -- 124
	local self = _class_0; -- 124
	self.__entity = "item" -- 125
	if _parent_0.__inherited then -- 124
		_parent_0.__inherited(_parent_0, _class_0) -- 124
	end -- 124
	ITEM = _class_0 -- 124
end -- 247
