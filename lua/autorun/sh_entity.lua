-- [yue]: autorun\sh_entity.yue
local Create = ents.Create -- 1
local Register = scripted_ents.Register -- 3
local lower, Left = string.lower, string.Left -- 5
local TraceLine = util.TraceLine -- 7
do -- 9
	local _class_0 -- 9
	local _base_0 = { } -- 9
	if _base_0.__index == nil then -- 9
		_base_0.__index = _base_0 -- 9
	end -- 39
	_class_0 = setmetatable({ -- 9
		__init = function(self, where) -- 33
			if isvector(where) then -- 34
				self:SetPos(where) -- 35
			elseif isentity(where) and where:IsPlayer() then -- 36
				self:SetPos(where:GetEyeTrace().HitPos) -- 37
			end -- 34
			self:Spawn() -- 38
			return self:Activate() -- 39
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
	self.registered = { } -- 10
	self.__inherited = function(self, child) -- 11
		do -- 12
			local _with_0 = getmetatable(child) -- 12
			_with_0.__call = function(self, ...) -- 13
				local ent = Create(self.__barcode) -- 14
				ent.__class = ent.BaseClass -- 15
				self.__init(ent, ...) -- 16
				return ent -- 17
			end -- 13
		end -- 12
		local fields -- 18
		do -- 18
			local _tbl_0 = { } -- 18
			for k, v in pairs(child.__base) do -- 18
				if Left(k, 2) ~= "__" then -- 18
					_tbl_0[k] = v -- 18
				end -- 18
			end -- 18
			fields = _tbl_0 -- 18
		end -- 18
		fields.Base = fields.Base or self.__barcode -- 19
		fields.Spawnable = fields.Spawnable or self.Spawnable -- 20
		fields.Category = fields.Category or self.Category -- 21
		local cls_name = rawget(child, "__entity") -- 22
		if cls_name then -- 23
			child.__barcode = lower(cls_name) -- 24
		else -- 26
			child.__barcode = tostring(self.__barcode and self.__barcode .. "/" or "") .. tostring(lower(cls_name or child.__name)) -- 26
		end -- 23
		Register(fields, child.__barcode) -- 27
		MsgC(Color(0, 200, 0), "+ENTITY: " .. tostring(child.__barcode) .. "\n") -- 28
		self.registered[child.__barcode] = child -- 29
	end -- 11
	self.create = function(self, name, ...) -- 30
		if not self.registered[name] then -- 31
			return -- 31
		end -- 31
		return self.registered[name](...) -- 32
	end -- 30
	ENTITY = _class_0 -- 9
end -- 39
if CLIENT then -- 41
	net.Receive("evilrp_use_fail", function() -- 42
		local failtext = net.ReadString() -- 43
		GAMEMODE:Frighten() -- 44
		return chat.AddNonParsedText(Color(200, 0, 0, 255), failtext) -- 45
	end) -- 42
else -- 47
	util.AddNetworkString("evilrp_use_fail") -- 47
end -- 41
do -- 49
	local _class_0 -- 49
	local _parent_0 = ENTITY -- 49
	local _base_0 = { -- 49
		Base = "base_anim", -- 51
		Type = "anim", -- 53
		TimeToUse = 1, -- 54
		PartialUse = 1, -- 55
		PartialUses = { }, -- 57
		SetupDataTables = function(self) -- 57
			self:NetworkVar("Float", "EndTime") -- 58
			self:NetworkVar("Entity", "User") -- 59
			self:NetworkVar("Bool", "DrawKeyPrompt") -- 60
			self:NetworkVar("Bool", "DrawProgress") -- 61
			if SERVER then -- 62
				self:SetEndTime(0) -- 63
				self:SetDrawKeyPrompt(false) -- 64
				self:SetDrawProgress(true) -- 65
				self.ProgPerTick = 1 / (self.TimeToUse * (1 / FrameTime()) / 100) -- 66
			end -- 62
		end, -- 68
		IsProgressUsable = function(self) -- 68
			return true -- 68
		end, -- 70
		OnUseFinish = function(self, ply) end, -- 72
		OnUseStart = function(self, ply) end, -- 74
		OnUseCancel = function(self, ply, end_time) end, -- 76
		Use = function(self, ply) -- 76
			local user = self:GetUser() -- 77
			if IsValid(user) and user ~= ply then -- 78
				return -- 78
			end -- 78
			if ply:KeyDownLast(IN_USE) and not IsValid(user) then -- 79
				return -- 79
			end -- 79
			self:SetUser(ply) -- 80
			if not ply:KeyDownLast(IN_USE) then -- 81
				self:SetEndTime(0) -- 82
				local started = self:OnUseStart(ply) -- 83
				if not (started == false) then -- 84
					self:SetEndTime(CurTime() + self.TimeToUse) -- 84
				end -- 84
			end -- 81
			local et = self:GetEndTime() -- 85
			local ct = CurTime() -- 86
			if ct >= et and IsValid(user) and et ~= 0 then -- 87
				self:OnUseFinish(user) -- 88
				self:SetEndTime(0) -- 89
				self.PartialUse = 0 -- 90
				return self:SetUser(NULL) -- 91
			end -- 87
		end, -- 93
		Think = function(self) -- 93
			local user = self:GetUser() -- 94
			local et = self:GetEndTime() -- 95
			local ct = CurTime() -- 96
			if IsValid(user) then -- 97
				if ((user:GetUseEntity() ~= self) or (not user:KeyDown(IN_USE))) and et ~= 0 then -- 98
					self:SetUser(NULL) -- 99
					local end_time = self:GetEndTime() -- 100
					self:SetEndTime(0) -- 101
					self.PartialUse = 0 -- 102
					if SERVER then -- 103
						self:OnUseCancel(user, end_time) -- 103
					end -- 103
				end -- 98
				if (self.PartialUses[self.PartialUse] ~= nil) then -- 104
					if (ct >= (et - self.TimeToUse) + (self.PartialUses[self.PartialUse].prog / 100) * self.TimeToUse) then -- 105
						if et ~= 0 then -- 106
							self.PartialUses[self.PartialUse].func(self, user) -- 107
							self.PartialUse = self.PartialUse + 1 -- 108
						end -- 106
					end -- 105
				elseif (#self.PartialUses > 0) then -- 109
					do -- 110
						local _exp_0 = self.PartialUse -- 110
						if 0 == _exp_0 then -- 111
							self.PartialUse = 1 -- 112
						else -- 114
							self:SetUser(NULL) -- 114
							self:SetEndTime(0) -- 115
							self.PartialUse = 0 -- 116
						end -- 116
					end -- 116
				end -- 104
			end -- 97
			self:NextThink(ct) -- 117
			return true -- 118
		end -- 49
	} -- 49
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 118
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 49
			_base_0[_key_0] = _val_0 -- 49
		end -- 49
	end -- 118
	if _base_0.__index == nil then -- 49
		_base_0.__index = _base_0 -- 49
	end -- 118
	setmetatable(_base_0, _parent_0.__base) -- 49
	_class_0 = setmetatable({ -- 49
		__init = function(self, ...) -- 49
			return _class_0.__parent.__init(self, ...) -- 49
		end, -- 49
		__base = _base_0, -- 49
		__name = "ENTITY_LONGUSE", -- 49
		__parent = _parent_0 -- 49
	}, { -- 49
		__index = function(cls, name) -- 49
			local val = rawget(_base_0, name) -- 49
			if val == nil then -- 49
				local parent = rawget(cls, "__parent") -- 49
				if parent then -- 49
					return parent[name] -- 49
				end -- 49
			else -- 49
				return val -- 49
			end -- 49
		end, -- 49
		__call = function(cls, ...) -- 49
			local _self_0 = setmetatable({ }, _base_0) -- 49
			cls.__init(_self_0, ...) -- 49
			return _self_0 -- 49
		end -- 49
	}) -- 49
	_base_0.__class = _class_0 -- 49
	if _parent_0.__inherited then -- 49
		_parent_0.__inherited(_parent_0, _class_0) -- 49
	end -- 49
	ENTITY_LONGUSE = _class_0 -- 49
end -- 118
do -- 120
	local _class_0 -- 120
	local _parent_0 = ENTITY_LONGUSE -- 120
	local _base_0 = { -- 120
		Spawnable = true, -- 125
		Interesting = true, -- 127
		PMRender = function(item) -- 127
			local ct = { } -- 128
			local wt = scripted_ents.Get(item.class) -- 129
			ct[#ct + 1] = wt.PrintName -- 130
			if wt.Description then -- 131
				ct[#ct + 1] = "" -- 132
				ct[#ct + 1] = { -- 133
					text = wt.Description, -- 133
					font = "Spleen_Label_Small" -- 133
				} -- 133
			end -- 131
			return ct -- 134
		end, -- 136
		HUDRender = function(self) -- 136
			local ct = { } -- 137
			ct[#ct + 1] = self.PrintName -- 138
			if self.Description then -- 139
				ct[#ct + 1] = "" -- 140
				ct[#ct + 1] = { -- 141
					text = self.Description, -- 141
					font = "Spleen_Label_Small" -- 141
				} -- 141
			end -- 139
			return ct -- 142
		end, -- 144
		Initialize = function(self) -- 144
			self:SetModel(self.Model) -- 145
			if SERVER then -- 146
				self:PhysicsInit(SOLID_VPHYSICS) -- 147
				self:SetMoveType(MOVETYPE_VPHYSICS) -- 148
				self:SetSolid(SOLID_VPHYSICS) -- 149
				return self:PhysWake() -- 150
			end -- 146
		end, -- 152
		Trash = function(self) -- 152
			local cls = self.TrashClass -- 153
			local pos = self:GetPos() -- 154
			local ang = self:GetAngles() -- 155
			self:Remove() -- 156
			if cls then -- 157
				local trash = ents.Create(cls) -- 158
				trash:SetPos(pos) -- 160
				trash:SetAngles(ang) -- 161
				trash:Spawn() -- 162
				trash:Activate() -- 163
				return trash -- 159
			end -- 157
		end, -- 165
		OnUseFinish = function(self, ply) -- 165
			if self.Sound then -- 166
				ply:EmitSound(self.Sound) -- 166
			end -- 166
			if self.UseText then -- 167
				return ply:ConCommand("say /me " .. tostring(self.UseText[math.random(1, #self.UseText)])) -- 168
			end -- 167
		end, -- 170
		OnUseStart = function(self, ply) end, -- 172
		OnUseCancel = function(self, ply, end_time) -- 172
			local time_left = end_time - CurTime() -- 174
			if (self.Pocketable ~= false) and time_left >= self.TimeToUse * .9 then -- 175
				local can_pickup, message = hook.Call("canPocket", GAMEMODE, ply, self) -- 176
				if not can_pickup then -- 177
					if message and SERVER then -- 178
						ply:Notify(message) -- 178
					end -- 178
					return -- 179
				end -- 177
				ply:DoAnimationEvent(ACT_GMOD_GESTURE_ITEM_GIVE) -- 180
				if SERVER then -- 181
					ply:EmitSound("Pocket_Item") -- 182
					return ply:addPocketItem(self) -- 183
				end -- 181
			end -- 175
		end, -- 185
		Model = Model("models/Gibs/HGIBS.mdl"), -- 186
		Spawnable = true, -- 188
		Sound = Sound("vo/k_lab/kl_fiddlesticks.wav"), -- 190
		OnlyInventoryUse = false, -- 192
		OnTakeDamage = function(self, dmg) -- 192
			return self:TakePhysicsDamage(dmg) -- 193
		end, -- 195
		Use = function(self, ply) -- 195
			if self.inventory_use then -- 196
				self:OnUseFinish(ply) -- 197
				self.inventory_use = nil -- 198
				return -- 199
			end -- 196
			if self.OnlyInventoryUse then -- 200
				if not ply.next_use_warn then -- 203
					ply.next_use_warn = ct -- 203
				end -- 203
				if not (ply.next_use_warn > ct) then -- 204
					ply.next_use_warn = ct + 2 -- 205
					local failtext = "Put it in your pockets first!" -- 206
					net.Start("evilrp_use_fail") -- 207
					net.WriteString(failtext) -- 208
					net.Send(ply) -- 209
				end -- 204
				return -- 210
			end -- 200
			return _class_0.__parent.__base.Use(self, ply) -- 211
		end, -- 213
		PhysicsCollide = function(self, data, physobj) -- 213
			local prop1 = util.GetSurfaceData(data.OurSurfaceProps) -- 214
			local prop2 = util.GetSurfaceData(data.TheirSurfaceProps) -- 215
			if data.Speed >= 75 and ((self.LastImpact or 0) + 0.1 < CurTime()) then -- 216
				self.LastImpact = CurTime() -- 217
				local snd -- 218
				do -- 218
					local _exp_0 = type(self.ImpactSound) -- 218
					if "table" == _exp_0 then -- 219
						snd = self.ImpactSound.hard -- 220
					elseif "string" == _exp_0 then -- 221
						snd = self.ImpactSound -- 222
					elseif "nil" == _exp_0 then -- 223
						snd = prop1.impactHardSound -- 224
					end -- 224
				end -- 224
				return self:EmitSound(snd) -- 225
			elseif data.Speed >= 25 and ((self.LastImpact or 0) + 0.1 < CurTime()) then -- 227
				self.LastImpact = CurTime() -- 228
				local snd -- 229
				do -- 229
					local _exp_0 = type(self.ImpactSound) -- 229
					if "table" == _exp_0 then -- 230
						snd = self.ImpactSound.soft -- 231
					elseif "string" == _exp_0 then -- 232
						snd = self.ImpactSound -- 233
					elseif "nil" == _exp_0 then -- 234
						snd = prop1.impactSoftSound -- 235
					end -- 235
				end -- 235
				return self:EmitSound(snd) -- 236
			end -- 216
		end, -- 239
		Interactions = function(self, ply) -- 239
			local actions = { } -- 240
			if (self.Pocketable ~= false) then -- 241
				actions[#actions + 1] = { -- 242
					desc = "Pocket", -- 242
					func = (function() -- 242
						return netstream.Send("PocketItem", self) -- 242
					end) -- 242
				} -- 242
			end -- 241
			return actions -- 243
		end -- 120
	} -- 120
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 243
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 120
			_base_0[_key_0] = _val_0 -- 120
		end -- 120
	end -- 243
	if _base_0.__index == nil then -- 120
		_base_0.__index = _base_0 -- 120
	end -- 243
	setmetatable(_base_0, _parent_0.__base) -- 120
	_class_0 = setmetatable({ -- 120
		__init = function(self, ...) -- 120
			return _class_0.__parent.__init(self, ...) -- 120
		end, -- 120
		__base = _base_0, -- 120
		__name = "ITEM", -- 120
		__parent = _parent_0 -- 120
	}, { -- 120
		__index = function(cls, name) -- 120
			local val = rawget(_base_0, name) -- 120
			if val == nil then -- 120
				local parent = rawget(cls, "__parent") -- 120
				if parent then -- 120
					return parent[name] -- 120
				end -- 120
			else -- 120
				return val -- 120
			end -- 120
		end, -- 120
		__call = function(cls, ...) -- 120
			local _self_0 = setmetatable({ }, _base_0) -- 120
			cls.__init(_self_0, ...) -- 120
			return _self_0 -- 120
		end -- 120
	}) -- 120
	_base_0.__class = _class_0 -- 120
	local self = _class_0; -- 120
	self.__entity = "item" -- 121
	if _parent_0.__inherited then -- 120
		_parent_0.__inherited(_parent_0, _class_0) -- 120
	end -- 120
	ITEM = _class_0 -- 120
end -- 243
