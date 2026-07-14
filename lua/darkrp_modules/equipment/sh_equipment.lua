-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/equipment/sh_equipment.yue
EQUIP_SLOTS = { -- 2
	"torso", -- 2
	"mask" -- 3
} -- 1
local dequip -- 5
dequip = function(ply, cmd, args) -- 5
	if not (#args > 0) then -- 6
		if CLIENT then -- 7
			MsgC(Color(200, 0, 0), "No argument specified.\n", Color(200, 200, 200), "Options follow:\n") -- 8
			local _list_0 = EQUIP_SLOTS -- 9
			for _index_0 = 1, #_list_0 do -- 9
				local slot = _list_0[_index_0] -- 9
				MsgC(Color(0, 200, 0), tostring(slot) .. "\n") -- 10
			end -- 10
			return -- 11
		end -- 7
	else -- 13
		local slot = args[1] -- 13
		local equipped = EQUIPMENT:GetEquipped(ply, slot) -- 14
		if not IsValid(equipped) then -- 15
			if CLIENT then -- 16
				MsgC(Color(200, 0, 0), "No equipment found in slot '", Color(200, 200, 200), slot, Color(200, 0, 0), "'.\n") -- 17
			end -- 16
			return -- 18
		else -- 20
			if CLIENT then -- 20
				net.Start("evilrp_dequip") -- 21
				net.WriteString(slot) -- 22
				return net.SendToServer() -- 23
			end -- 20
		end -- 15
	end -- 6
end -- 5
concommand.Add("dequip", dequip) -- 25
if SERVER then -- 27
	util.AddNetworkString("evilrp_dequip") -- 28
	net.Receive("evilrp_dequip", function(len, ply) -- 29
		local slot = net.ReadString() -- 30
		local equipped = EQUIPMENT:GetEquipped(ply, slot) -- 31
		if not IsValid(equipped) then -- 32
			return -- 32
		end -- 32
		EQUIPMENT:Unequip(equipped) -- 33
		local start = ply:EyePos() -- 34
		local tr = util.TraceLine({ -- 36
			start = start, -- 36
			endpos = start + ply:GetAimVector() * 65, -- 37
			filter = ply -- 38
		}) -- 35
		DarkRP.placeEntity(equipped, tr, ply) -- 39
		return equipped:PhysWake() -- 40
	end) -- 29
end -- 27
do -- 42
	local _class_0 -- 42
	local _parent_0 = ITEM -- 42
	local _base_0 = { -- 42
		EquipSlot = "torso", -- 79
		Sound = "placenta/ui/equip_clothes.wav", -- 81
		CanEquip = function(self, ply) -- 81
			return true -- 81
		end, -- 83
		CanUnequip = function(self, ply) -- 83
			return true -- 83
		end, -- 85
		OnRemove = function(self) -- 85
			return EQUIPMENT:Unequip(self) -- 85
		end, -- 87
		OnUseFinish = function(self, ply) -- 87
			if not (IsValid(ply) and ply:IsPlayer()) then -- 88
				return -- 88
			end -- 88
			if not self:CanEquip(ply) then -- 89
				return -- 89
			end -- 89
			local equipped = EQUIPMENT:GetEquipped(ply, self.EquipSlot) -- 90
			if IsValid(equipped) then -- 91
				if equipped:GetClass() == self:GetClass() then -- 92
					return -- 92
				end -- 92
				if not equipped:CanUnequip(ply) then -- 93
					return -- 93
				end -- 93
				EQUIPMENT:Unequip(equipped) -- 94
				equipped:SetPos(self:GetPos() + Vector(0, 0, 1)) -- 96
				equipped:SetAngles(self:Getangles()) -- 97
				equipped:PhysWake() -- 98
			end -- 91
			EQUIPMENT:Equip(ply, self) -- 99
			self.inventory_use = nil -- 100
			return _class_0.__parent.__base.OnUseFinish(self, ply) -- 101
		end, -- 103
		OnEquip = function(self, ply) -- 103
			self.StoreData = { } -- 104
			ply:UpdateAppearance() -- 105
			return ply:SetupHands() -- 106
		end, -- 111
		OnUnequip = function(self, ply) -- 111
			local data = self.StoreData -- 112
			return ply:UpdateAppearance() -- 113
		end, -- 117
		SetupModel = function(self, ply) end, -- 119
		RenderScreenspaceEffects = function(self) end, -- 121
		HUDPaint = function(self) end -- 42
	} -- 42
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 121
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 42
			_base_0[_key_0] = _val_0 -- 42
		end -- 42
	end -- 121
	if _base_0.__index == nil then -- 42
		_base_0.__index = _base_0 -- 42
	end -- 121
	setmetatable(_base_0, _parent_0.__base) -- 42
	_class_0 = setmetatable({ -- 42
		__init = function(self, ...) -- 42
			return _class_0.__parent.__init(self, ...) -- 42
		end, -- 42
		__base = _base_0, -- 42
		__name = "EQUIPMENT", -- 42
		__parent = _parent_0 -- 42
	}, { -- 42
		__index = function(cls, name) -- 42
			local val = rawget(_base_0, name) -- 42
			if val == nil then -- 42
				local parent = rawget(cls, "__parent") -- 42
				if parent then -- 42
					return parent[name] -- 42
				end -- 42
			else -- 42
				return val -- 42
			end -- 42
		end, -- 42
		__call = function(cls, ...) -- 42
			local _self_0 = setmetatable({ }, _base_0) -- 42
			cls.__init(_self_0, ...) -- 42
			return _self_0 -- 42
		end -- 42
	}) -- 42
	_base_0.__class = _class_0 -- 42
	local self = _class_0; -- 42
	self.__entity = "eq" -- 43
	self.GetEquipped = function(self, ply, slot) -- 45
		return ply:GetNWEntity("evilrp_equipped_" .. tostring(slot)) -- 46
	end -- 45
	self.Equip = function(self, ply, ent) -- 48
		if not SERVER then -- 49
			return -- 49
		end -- 49
		if not ent.EquipSlot then -- 50
			return -- 50
		end -- 50
		local slot = ent.EquipSlot -- 51
		if IsValid(self:GetEquipped(ply, slot)) then -- 52
			return -- 52
		end -- 52
		ply:SetNWEntity("evilrp_equipped_" .. tostring(slot), ent) -- 53
		ply:DeleteOnRemove(ent) -- 54
		ent:SetParent(ply) -- 56
		ent:SetNoDraw(true) -- 57
		ent:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE) -- 58
		ent:OnEquip(ply) -- 59
		ent:SetPos(Vector()) -- 60
		return ent -- 55
	end -- 48
	self.Unequip = function(self, ent) -- 62
		if not SERVER then -- 63
			return -- 63
		end -- 63
		if not ent.EquipSlot then -- 64
			return -- 64
		end -- 64
		local slot = ent.EquipSlot -- 65
		local ply = ent:GetParent() -- 66
		if not IsValid(ply) then -- 67
			return -- 67
		end -- 67
		ply:SetNWEntity("evilrp_equipped_" .. tostring(slot), NULL) -- 68
		ply:DontDeleteOnRemove(ent) -- 69
		ent:SetParent(nil) -- 71
		ent:SetNoDraw(false) -- 72
		ent:SetCollisionGroup(COLLISION_GROUP_WEAPON) -- 73
		ent:OnUnequip(ply) -- 74
		return table.Empty(ent.StoreData) -- 75
	end -- 62
	if _parent_0.__inherited then -- 42
		_parent_0.__inherited(_parent_0, _class_0) -- 42
	end -- 42
	EQUIPMENT = _class_0 -- 42
end -- 121
local meta = FindMetaTable("Player") -- 123
meta.GetAllEquipment = function(self) -- 124
	local equipment = { } -- 125
	local _list_0 = EQUIP_SLOTS -- 126
	for _index_0 = 1, #_list_0 do -- 126
		local slot = _list_0[_index_0] -- 126
		local equipped = EQUIPMENT:GetEquipped(self, slot) -- 127
		if IsValid(equipped) then -- 128
			equipment[#equipment + 1] = equipped -- 129
		end -- 128
	end -- 129
	return equipment -- 130
end -- 124
if CLIENT then -- 132
	local equipment_screenspace -- 133
	equipment_screenspace = function() -- 133
		local lp = LocalPlayer() -- 134
		local _list_0 = EQUIP_SLOTS -- 135
		for _index_0 = 1, #_list_0 do -- 135
			local slot = _list_0[_index_0] -- 135
			local _continue_0 = false -- 136
			repeat -- 136
				local equipped = EQUIPMENT:GetEquipped(lp, slot) -- 136
				if not IsValid(equipped) then -- 137
					_continue_0 = true -- 137
					break -- 137
				end -- 137
				equipped:RenderScreenspaceEffects() -- 138
				_continue_0 = true -- 136
			until true -- 138
			if not _continue_0 then -- 138
				break -- 138
			end -- 138
		end -- 138
		return -- 139
	end -- 133
	hook.Add("RenderScreenspaceEffects", "evilrp_equipment", equipment_screenspace) -- 140
	local equipment_hudpaint -- 142
	equipment_hudpaint = function() -- 142
		local lp = LocalPlayer() -- 143
		local _list_0 = EQUIP_SLOTS -- 144
		for _index_0 = 1, #_list_0 do -- 144
			local slot = _list_0[_index_0] -- 144
			local _continue_0 = false -- 145
			repeat -- 145
				local equipped = EQUIPMENT:GetEquipped(lp, slot) -- 145
				if not IsValid(equipped) then -- 146
					_continue_0 = true -- 146
					break -- 146
				end -- 146
				equipped:HUDPaint() -- 147
				_continue_0 = true -- 145
			until true -- 147
			if not _continue_0 then -- 147
				break -- 147
			end -- 147
		end -- 147
		return -- 148
	end -- 142
	hook.Add("HUDPaintBackground", "evilrp_equipment", equipment_hudpaint) -- 149
else -- 151
	local death_equipment_loss -- 151
	death_equipment_loss = function(ply, attacker, dmg) -- 151
		local _list_0 = EQUIP_SLOTS -- 152
		for _index_0 = 1, #_list_0 do -- 152
			local slot = _list_0[_index_0] -- 152
			local _continue_0 = false -- 153
			repeat -- 153
				local equipped = EQUIPMENT:GetEquipped(ply, slot) -- 153
				if not IsValid(equipped) then -- 154
					_continue_0 = true -- 154
					break -- 154
				end -- 154
				EQUIPMENT:Unequip(equipped) -- 155
				_continue_0 = true -- 153
			until true -- 155
			if not _continue_0 then -- 155
				break -- 155
			end -- 155
		end -- 155
		return -- 156
	end -- 151
	hook.Add("DoPlayerDeath", "evilrp_death_equipment", death_equipment_loss) -- 158
end -- 132
local Mask -- 160
do -- 160
	local _class_0 -- 160
	local _parent_0 = EQUIPMENT -- 160
	local _base_0 = { -- 160
		EquipSlot = "mask" -- 160
	} -- 160
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 161
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 160
			_base_0[_key_0] = _val_0 -- 160
		end -- 160
	end -- 161
	if _base_0.__index == nil then -- 160
		_base_0.__index = _base_0 -- 160
	end -- 161
	setmetatable(_base_0, _parent_0.__base) -- 160
	_class_0 = setmetatable({ -- 160
		__init = function(self, ...) -- 160
			return _class_0.__parent.__init(self, ...) -- 160
		end, -- 160
		__base = _base_0, -- 160
		__name = "Mask", -- 160
		__parent = _parent_0 -- 160
	}, { -- 160
		__index = function(cls, name) -- 160
			local val = rawget(_base_0, name) -- 160
			if val == nil then -- 160
				local parent = rawget(cls, "__parent") -- 160
				if parent then -- 160
					return parent[name] -- 160
				end -- 160
			else -- 160
				return val -- 160
			end -- 160
		end, -- 160
		__call = function(cls, ...) -- 160
			local _self_0 = setmetatable({ }, _base_0) -- 160
			cls.__init(_self_0, ...) -- 160
			return _self_0 -- 160
		end -- 160
	}) -- 160
	_base_0.__class = _class_0 -- 160
	if _parent_0.__inherited then -- 160
		_parent_0.__inherited(_parent_0, _class_0) -- 160
	end -- 160
	Mask = _class_0 -- 160
end -- 161
local GasMask -- 163
do -- 163
	local _class_0 -- 163
	local _parent_0 = Mask -- 163
	local _base_0 = { -- 163
		Model = Model("models/betaroyale/gasmask.mdl"), -- 166
		OverlayMaterial = Material("placenta/respiratordmxmd"), -- 168
		RenderScreenspaceEffects = function(self) -- 168
			local abs, cos, sin = math.abs, math.cos, math.sin -- 169
			local ct = CurTime() -- 170
			local lp = LocalPlayer() -- 171
			if not (lp:GetViewEntity() == lp) then -- 172
				return -- 172
			end -- 172
			if cookie.GetNumber("evilrp_thirdperson", 0) == 1 then -- 173
				return -- 173
			end -- 173
			local tab = { -- 175
				["$pp_colour_addr"] = 0, -- 175
				["$pp_colour_addg"] = 0, -- 176
				["$pp_colour_addb"] = 0, -- 177
				["$pp_colour_brightness"] = -0.01, -- 178
				["$pp_colour_contrast"] = 3, -- 179
				["$pp_colour_colour"] = 2, -- 180
				["$pp_colour_mulr"] = 0, -- 181
				["$pp_colour_mulg"] = 0, -- 182
				["$pp_colour_mulb"] = 0 -- 183
			} -- 174
			return DrawColorModify(tab) -- 184
		end, -- 186
		HUDPaint = function(self) -- 186
			if not (lp:GetViewEntity() == lp) then -- 187
				return -- 187
			end -- 187
			if cookie.GetNumber("evilrp_thirdperson", 0) == 1 then -- 188
				return -- 188
			end -- 188
			surface.SetMaterial(self.OverlayMaterial) -- 189
			surface.SetDrawColor(255, 255, 255) -- 190
			return surface.DrawTexturedRect(0, 0, ScrW(), ScrH()) -- 191
		end -- 163
	} -- 163
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 191
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 163
			_base_0[_key_0] = _val_0 -- 163
		end -- 163
	end -- 191
	if _base_0.__index == nil then -- 163
		_base_0.__index = _base_0 -- 163
	end -- 191
	setmetatable(_base_0, _parent_0.__base) -- 163
	_class_0 = setmetatable({ -- 163
		__init = function(self, ...) -- 163
			return _class_0.__parent.__init(self, ...) -- 163
		end, -- 163
		__base = _base_0, -- 163
		__name = "GasMask", -- 163
		__parent = _parent_0 -- 163
	}, { -- 163
		__index = function(cls, name) -- 163
			local val = rawget(_base_0, name) -- 163
			if val == nil then -- 163
				local parent = rawget(cls, "__parent") -- 163
				if parent then -- 163
					return parent[name] -- 163
				end -- 163
			else -- 163
				return val -- 163
			end -- 163
		end, -- 163
		__call = function(cls, ...) -- 163
			local _self_0 = setmetatable({ }, _base_0) -- 163
			cls.__init(_self_0, ...) -- 163
			return _self_0 -- 163
		end -- 163
	}) -- 163
	_base_0.__class = _class_0 -- 163
	if _parent_0.__inherited then -- 163
		_parent_0.__inherited(_parent_0, _class_0) -- 163
	end -- 163
	GasMask = _class_0 -- 163
end -- 191
local Worker -- 193
do -- 193
	local _class_0 -- 193
	local _parent_0 = GasMask -- 193
	local _base_0 = { -- 193
		PrintName = "Industrial Gasmask", -- 196
		Description = "Mask of the worker.\nNot everyone gets the privilege of clean air.", -- 198
		Appearance = { -- 199
			Model = "models/toxidroma/shrouds/gasmask1.mdl" -- 199
		}, -- 201
		OverlayMaterial = Material("placenta/hardhatdmxmd") -- 193
	} -- 193
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 201
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 193
			_base_0[_key_0] = _val_0 -- 193
		end -- 193
	end -- 201
	if _base_0.__index == nil then -- 193
		_base_0.__index = _base_0 -- 193
	end -- 201
	setmetatable(_base_0, _parent_0.__base) -- 193
	_class_0 = setmetatable({ -- 193
		__init = function(self, ...) -- 193
			return _class_0.__parent.__init(self, ...) -- 193
		end, -- 193
		__base = _base_0, -- 193
		__name = "Worker", -- 193
		__parent = _parent_0 -- 193
	}, { -- 193
		__index = function(cls, name) -- 193
			local val = rawget(_base_0, name) -- 193
			if val == nil then -- 193
				local parent = rawget(cls, "__parent") -- 193
				if parent then -- 193
					return parent[name] -- 193
				end -- 193
			else -- 193
				return val -- 193
			end -- 193
		end, -- 193
		__call = function(cls, ...) -- 193
			local _self_0 = setmetatable({ }, _base_0) -- 193
			cls.__init(_self_0, ...) -- 193
			return _self_0 -- 193
		end -- 193
	}) -- 193
	_base_0.__class = _class_0 -- 193
	if _parent_0.__inherited then -- 193
		_parent_0.__inherited(_parent_0, _class_0) -- 193
	end -- 193
	Worker = _class_0 -- 193
end -- 201
local Sanitar -- 203
do -- 203
	local _class_0 -- 203
	local _parent_0 = GasMask -- 203
	local _base_0 = { -- 203
		PrintName = "Sanitar Shroud", -- 206
		Description = "Mask of the Pigs.\nEquipped with Nightmarevision.", -- 208
		Appearance = { -- 209
			Model = "models/toxidroma/shrouds/gasmask3.mdl" -- 209
		}, -- 211
		OverlayMaterial = Material("placenta/gasmaskdmxmd"), -- 213
		UseText = { -- 214
			"slips on the gasmask.", -- 214
			"puts on his gasmask.", -- 215
			"puts on the oppressor's face.", -- 216
			"distances himself from those around him.", -- 217
			"struggles on the gasmask." -- 218
		}, -- 221
		RenderScreenspaceEffects = function(self) -- 221
			local abs, cos, sin = math.abs, math.cos, math.sin -- 222
			local ct = CurTime() -- 223
			local lp = LocalPlayer() -- 224
			if not (lp:GetViewEntity() == lp) then -- 225
				return -- 225
			end -- 225
			local tab = { -- 227
				["$pp_colour_addr"] = 0, -- 227
				["$pp_colour_addg"] = 0.013, -- 228
				["$pp_colour_addb"] = 0, -- 229
				["$pp_colour_brightness"] = -0.01, -- 230
				["$pp_colour_contrast"] = 3, -- 231
				["$pp_colour_colour"] = 2, -- 232
				["$pp_colour_mulr"] = 0, -- 233
				["$pp_colour_mulg"] = 23, -- 234
				["$pp_colour_mulb"] = 0 -- 235
			} -- 226
			return DrawColorModify(tab) -- 236
		end -- 203
	} -- 203
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 236
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 203
			_base_0[_key_0] = _val_0 -- 203
		end -- 203
	end -- 236
	if _base_0.__index == nil then -- 203
		_base_0.__index = _base_0 -- 203
	end -- 236
	setmetatable(_base_0, _parent_0.__base) -- 203
	_class_0 = setmetatable({ -- 203
		__init = function(self, ...) -- 203
			return _class_0.__parent.__init(self, ...) -- 203
		end, -- 203
		__base = _base_0, -- 203
		__name = "Sanitar", -- 203
		__parent = _parent_0 -- 203
	}, { -- 203
		__index = function(cls, name) -- 203
			local val = rawget(_base_0, name) -- 203
			if val == nil then -- 203
				local parent = rawget(cls, "__parent") -- 203
				if parent then -- 203
					return parent[name] -- 203
				end -- 203
			else -- 203
				return val -- 203
			end -- 203
		end, -- 203
		__call = function(cls, ...) -- 203
			local _self_0 = setmetatable({ }, _base_0) -- 203
			cls.__init(_self_0, ...) -- 203
			return _self_0 -- 203
		end -- 203
	}) -- 203
	_base_0.__class = _class_0 -- 203
	if _parent_0.__inherited then -- 203
		_parent_0.__inherited(_parent_0, _class_0) -- 203
	end -- 203
	Sanitar = _class_0 -- 203
end -- 236
local Evil -- 238
do -- 238
	local _class_0 -- 238
	local _parent_0 = GasMask -- 238
	local _base_0 = { -- 238
		PrintName = "Outlander's Mask", -- 241
		Description = "This looks evil.\nIt's hard to tell if it'll actually help.", -- 243
		Appearance = { -- 244
			Model = "models/toxidroma/shrouds/gasmask3.mdl" -- 244
		}, -- 246
		OverlayMaterial = Material("placenta/protectivedmxmd") -- 238
	} -- 238
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 246
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 238
			_base_0[_key_0] = _val_0 -- 238
		end -- 238
	end -- 246
	if _base_0.__index == nil then -- 238
		_base_0.__index = _base_0 -- 238
	end -- 246
	setmetatable(_base_0, _parent_0.__base) -- 238
	_class_0 = setmetatable({ -- 238
		__init = function(self, ...) -- 238
			return _class_0.__parent.__init(self, ...) -- 238
		end, -- 238
		__base = _base_0, -- 238
		__name = "Evil", -- 238
		__parent = _parent_0 -- 238
	}, { -- 238
		__index = function(cls, name) -- 238
			local val = rawget(_base_0, name) -- 238
			if val == nil then -- 238
				local parent = rawget(cls, "__parent") -- 238
				if parent then -- 238
					return parent[name] -- 238
				end -- 238
			else -- 238
				return val -- 238
			end -- 238
		end, -- 238
		__call = function(cls, ...) -- 238
			local _self_0 = setmetatable({ }, _base_0) -- 238
			cls.__init(_self_0, ...) -- 238
			return _self_0 -- 238
		end -- 238
	}) -- 238
	_base_0.__class = _class_0 -- 238
	if _parent_0.__inherited then -- 238
		_parent_0.__inherited(_parent_0, _class_0) -- 238
	end -- 238
	Evil = _class_0 -- 238
	return _class_0 -- 246
end -- 246
