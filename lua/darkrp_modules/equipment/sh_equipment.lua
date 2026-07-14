EQUIP_SLOTS = {
	"torso",
	"mask"
}
local dequip
dequip = function(ply, cmd, args)
	if not (#args > 0) then
		if CLIENT then
			MsgC(Color(200, 0, 0), "No argument specified.\n", Color(200, 200, 200), "Options follow:\n")
			local _list_0 = EQUIP_SLOTS
			for _index_0 = 1, #_list_0 do
				local slot = _list_0[_index_0]
				MsgC(Color(0, 200, 0), tostring(slot) .. "\n")
			end
			return
		end
	else
		local slot = args[1]
		local equipped = EQUIPMENT:GetEquipped(ply, slot)
		if not IsValid(equipped) then
			if CLIENT then
				MsgC(Color(200, 0, 0), "No equipment found in slot '", Color(200, 200, 200), slot, Color(200, 0, 0), "'.\n")
			end
			return
		else
			if CLIENT then
				net.Start("evilrp_dequip")
				net.WriteString(slot)
				return net.SendToServer()
			end
		end
	end
end
concommand.Add("dequip", dequip)
if SERVER then
	util.AddNetworkString("evilrp_dequip")
	net.Receive("evilrp_dequip", function(len, ply)
		local slot = net.ReadString()
		local equipped = EQUIPMENT:GetEquipped(ply, slot)
		if not IsValid(equipped) then
			return
		end
		EQUIPMENT:Unequip(equipped)
		local start = ply:EyePos()
		local tr = util.TraceLine({
			start = start,
			endpos = start + ply:GetAimVector() * 65,
			filter = ply
		})
		DarkRP.placeEntity(equipped, tr, ply)
		return equipped:PhysWake()
	end)
end
do
	local _class_0
	local _parent_0 = ITEM
	local _base_0 = {
		EquipSlot = "torso",
		Sound = "placenta/ui/equip_clothes.wav",
		CanEquip = function(self, ply)
			return true
		end,
		CanUnequip = function(self, ply)
			return true
		end,
		OnRemove = function(self)
			return EQUIPMENT:Unequip(self)
		end,
		OnUseFinish = function(self, ply)
			if not (IsValid(ply) and ply:IsPlayer()) then
				return
			end
			if not self:CanEquip(ply) then
				return
			end
			local equipped = EQUIPMENT:GetEquipped(ply, self.EquipSlot)
			if IsValid(equipped) then
				if equipped:GetClass() == self:GetClass() then
					return
				end
				if not equipped:CanUnequip(ply) then
					return
				end
				EQUIPMENT:Unequip(equipped)
				equipped:SetPos(self:GetPos() + Vector(0, 0, 1))
				equipped:SetAngles(self:Getangles())
				equipped:PhysWake()
			end
			EQUIPMENT:Equip(ply, self)
			self.inventory_use = nil
			return _class_0.__parent.__base.OnUseFinish(self, ply)
		end,
		OnEquip = function(self, ply)
			self.StoreData = { }
			ply:UpdateAppearance()
			return ply:SetupHands()
		end,
		OnUnequip = function(self, ply)
			local data = self.StoreData
			return ply:UpdateAppearance()
		end,
		SetupModel = function(self, ply) end,
		RenderScreenspaceEffects = function(self) end,
		HUDPaint = function(self) end
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "EQUIPMENT",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	local self = _class_0;
	self.__entity = "eq"
	self.GetEquipped = function(self, ply, slot)
		return ply:GetNWEntity("evilrp_equipped_" .. tostring(slot))
	end
	self.Equip = function(self, ply, ent)
		if not SERVER then
			return
		end
		if not ent.EquipSlot then
			return
		end
		local slot = ent.EquipSlot
		if IsValid(self:GetEquipped(ply, slot)) then
			return
		end
		ply:SetNWEntity("evilrp_equipped_" .. tostring(slot), ent)
		ply:DeleteOnRemove(ent)
		ent:SetParent(ply)
		ent:SetNoDraw(true)
		ent:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		ent:OnEquip(ply)
		ent:SetPos(Vector())
		return ent
	end
	self.Unequip = function(self, ent)
		if not SERVER then
			return
		end
		if not ent.EquipSlot then
			return
		end
		local slot = ent.EquipSlot
		local ply = ent:GetParent()
		if not IsValid(ply) then
			return
		end
		ply:SetNWEntity("evilrp_equipped_" .. tostring(slot), NULL)
		ply:DontDeleteOnRemove(ent)
		ent:SetParent(nil)
		ent:SetNoDraw(false)
		ent:SetCollisionGroup(COLLISION_GROUP_WEAPON)
		ent:OnUnequip(ply)
		return table.Empty(ent.StoreData)
	end
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	EQUIPMENT = _class_0
end
local meta = FindMetaTable("Player")
meta.GetAllEquipment = function(self)
	local equipment = { }
	local _list_0 = EQUIP_SLOTS
	for _index_0 = 1, #_list_0 do
		local slot = _list_0[_index_0]
		local equipped = EQUIPMENT:GetEquipped(self, slot)
		if IsValid(equipped) then
			equipment[#equipment + 1] = equipped
		end
	end
	return equipment
end
if CLIENT then
	local equipment_screenspace
	equipment_screenspace = function()
		local lp = LocalPlayer()
		local _list_0 = EQUIP_SLOTS
		for _index_0 = 1, #_list_0 do
			local slot = _list_0[_index_0]
			local equipped = EQUIPMENT:GetEquipped(lp, slot)
			if not IsValid(equipped) then
				goto _continue_0
			end
			equipped:RenderScreenspaceEffects()
			::_continue_0::
		end
		return
	end
	hook.Add("RenderScreenspaceEffects", "evilrp_equipment", equipment_screenspace)
	local equipment_hudpaint
	equipment_hudpaint = function()
		local lp = LocalPlayer()
		local _list_0 = EQUIP_SLOTS
		for _index_0 = 1, #_list_0 do
			local slot = _list_0[_index_0]
			local equipped = EQUIPMENT:GetEquipped(lp, slot)
			if not IsValid(equipped) then
				goto _continue_0
			end
			equipped:HUDPaint()
			::_continue_0::
		end
		return
	end
	hook.Add("HUDPaintBackground", "evilrp_equipment", equipment_hudpaint)
else
	local death_equipment_loss
	death_equipment_loss = function(ply, attacker, dmg)
		local _list_0 = EQUIP_SLOTS
		for _index_0 = 1, #_list_0 do
			local slot = _list_0[_index_0]
			local equipped = EQUIPMENT:GetEquipped(ply, slot)
			if not IsValid(equipped) then
				goto _continue_0
			end
			EQUIPMENT:Unequip(equipped)
			::_continue_0::
		end
		return
	end
	hook.Add("DoPlayerDeath", "evilrp_death_equipment", death_equipment_loss)
end
local Mask
do
	local _class_0
	local _parent_0 = EQUIPMENT
	local _base_0 = {
		EquipSlot = "mask"
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Mask",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Mask = _class_0
end
local GasMask
do
	local _class_0
	local _parent_0 = Mask
	local _base_0 = {
		Model = Model("models/betaroyale/gasmask.mdl"),
		OverlayMaterial = Material("placenta/respiratordmxmd"),
		RenderScreenspaceEffects = function(self)
			local abs, cos, sin = math.abs, math.cos, math.sin
			local ct = CurTime()
			local lp = LocalPlayer()
			if not (lp:GetViewEntity() == lp) then
				return
			end
			if cookie.GetNumber("evilrp_thirdperson", 0) == 1 then
				return
			end
			local tab = {
				["$pp_colour_addr"] = 0,
				["$pp_colour_addg"] = 0,
				["$pp_colour_addb"] = 0,
				["$pp_colour_brightness"] = -0.01,
				["$pp_colour_contrast"] = 3,
				["$pp_colour_colour"] = 2,
				["$pp_colour_mulr"] = 0,
				["$pp_colour_mulg"] = 0,
				["$pp_colour_mulb"] = 0
			}
			return DrawColorModify(tab)
		end,
		HUDPaint = function(self)
			if not (lp:GetViewEntity() == lp) then
				return
			end
			if cookie.GetNumber("evilrp_thirdperson", 0) == 1 then
				return
			end
			surface.SetMaterial(self.OverlayMaterial)
			surface.SetDrawColor(255, 255, 255)
			return surface.DrawTexturedRect(0, 0, ScrW(), ScrH())
		end
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "GasMask",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	GasMask = _class_0
end
local Worker
do
	local _class_0
	local _parent_0 = GasMask
	local _base_0 = {
		PrintName = "Industrial Gasmask",
		Description = "Mask of the worker.\nNot everyone gets the privilege of clean air.",
		Appearance = {
			Model = "models/toxidroma/shrouds/gasmask1.mdl"
		},
		OverlayMaterial = Material("placenta/hardhatdmxmd")
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Worker",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Worker = _class_0
end
local Sanitar
do
	local _class_0
	local _parent_0 = GasMask
	local _base_0 = {
		PrintName = "Sanitar Shroud",
		Description = "Mask of the Pigs.\nEquipped with Nightmarevision.",
		Appearance = {
			Model = "models/toxidroma/shrouds/gasmask3.mdl"
		},
		OverlayMaterial = Material("placenta/gasmaskdmxmd"),
		UseText = {
			"slips on the gasmask.",
			"puts on his gasmask.",
			"puts on the oppressor's face.",
			"distances himself from those around him.",
			"struggles on the gasmask."
		},
		RenderScreenspaceEffects = function(self)
			local abs, cos, sin = math.abs, math.cos, math.sin
			local ct = CurTime()
			local lp = LocalPlayer()
			if not (lp:GetViewEntity() == lp) then
				return
			end
			local tab = {
				["$pp_colour_addr"] = 0,
				["$pp_colour_addg"] = 0.013,
				["$pp_colour_addb"] = 0,
				["$pp_colour_brightness"] = -0.01,
				["$pp_colour_contrast"] = 3,
				["$pp_colour_colour"] = 2,
				["$pp_colour_mulr"] = 0,
				["$pp_colour_mulg"] = 23,
				["$pp_colour_mulb"] = 0
			}
			return DrawColorModify(tab)
		end
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Sanitar",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Sanitar = _class_0
end
local Evil
do
	local _class_0
	local _parent_0 = GasMask
	local _base_0 = {
		PrintName = "Outlander's Mask",
		Description = "This looks evil.\nIt's hard to tell if it'll actually help.",
		Appearance = {
			Model = "models/toxidroma/shrouds/gasmask3.mdl"
		},
		OverlayMaterial = Material("placenta/protectivedmxmd")
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Evil",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Evil = _class_0
	return _class_0
end
