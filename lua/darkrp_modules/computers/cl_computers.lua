net.Receive("evilrp_terminal_addline", function()
	local idx = net.ReadUInt(16)
	local ent = Entity(idx)
	if not IsValid(ent) then
		return
	end
	if IsValid(ent) then
		ent:EmitSound("TerrorLine")
	end
	local text = net.ReadString()
	local color_type = net.ReadUInt(8)
	local pos = net.ReadInt(16)
	if not gterm[idx] then
		gterm[idx] = { }
	end
	local line = {
		text = text,
		color = color_type
	}
	if (not pos) or (pos == -1) then
		do
			local _obj_0 = gterm[idx]
			_obj_0[#_obj_0 + 1] = line
		end
	else
		gterm[idx][pos] = line
	end
	if #gterm[idx] > ent.max_lines then
		return table.remove(gterm[idx], 1)
	end
end)
local TerrorLine
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = "dysphoria/ui/interactor_scrolldown.ogg",
		level = SNDLVL_20DB,
		pitch = {
			60,
			85
		}
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
		__name = "TerrorLine",
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
	TerrorLine = _class_0
end
local TerrorType
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = "buttons/lightswitch2.wav",
		pitch = {
			60,
			80
		}
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
		__name = "TerrorType",
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
	TerrorType = _class_0
end
local TerrorTypeEnter
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = "buttons/button9.wav",
		pitch = {
			60,
			80
		}
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
		__name = "TerrorTypeEnter",
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
	TerrorTypeEnter = _class_0
end
local TerrorTypeExit
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = "buttons/combine_button2.wav",
		pitch = {
			110,
			130
		}
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
		__name = "TerrorTypeExit",
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
	TerrorTypeExit = _class_0
end
net.Receive("evilrp_terminal_flicker", function()
	local idx = net.ReadUInt(16)
	local ent = Entity(idx)
	ent.flicker = 1
end)
net.Receive("evilrp_terminal_activeconsole", function()
	local idx = net.ReadUInt(16)
	local ent = Entity(idx)
	local ply = LocalPlayer()
	if IsValid(ent) then
		ply.gterm_entity = ent
		local _with_0 = vgui.Create("DTextEntry")
		ply.gterm_textentry = _with_0
		_with_0:SetSize(0, 0)
		_with_0:SetPos(0, 0)
		_with_0:MakePopup()
		_with_0.KILL = function(self)
			self:Remove()
			do
				local _obj_0 = self.OnClose
				if _obj_0 ~= nil then
					_obj_0(self)
				end
			end
			gui.HideGameUI()
			net.Start("evilrp_terminal_endconsole")
			net.WriteUInt(idx, 16)
			net.WriteString("")
			net.SendToServer()
			if #self:GetValue() > 1 then
			else
				ent:EmitSound("TerrorTypeExit")
			end
			ent.flicker = 1
			self = nil
			lp.gterm_entity = nil
		end
		_with_0.Think = function(self)
			local ct = CurTime()
			if not self.TryClose then
				self.TryClose = ct + 0.2
			end
			if ct >= self.TryClose then
				if not lp:Alive() then
					self:KILL()
				end
				if input.IsKeyDown(KEY_ESCAPE) then
					self:KILL()
				end
				if input.IsKeyDown(KEY_F3) then
					self:KILL()
				end
				local gx = gui.MouseX()
				local gy = gui.MouseY()
				local sw = ScrW()
				local sh = ScrH()
				if gx < (sw * .2) then
					self:KILL()
				end
				if gy < (sh * .1) then
					self:KILL()
				end
				if gx > (sw * .8) then
					self:KILL()
				end
				if gy > (sh * .9) then
					return self:KILL()
				end
			end
		end
		_with_0.OnTextChanged = function(self)
			local offset = 0
			local text = self:GetValue()
			if (string.len(text) > ent.max_chars) then
				offset = self:GetCaretPos() - (ent.max_chars - 3)
			end
			ent.console_text = string.sub(text, offset)
			return ent:EmitSound("TerrorType")
		end
		_with_0.OnEnter = function(self)
			net.Start("evilrp_terminal_endconsole")
			net.WriteUInt(idx, 16)
			net.WriteString(tostring(self:GetValue()))
			net.SendToServer()
			if #self:GetValue() > 1 then
			else
				ent:EmitSound("TerrorTypeExit")
			end
			ent.flicker = 1
			self:SetText("")
			self:SetCaretPos(0)
			ent.console_text = ""
		end
		return _with_0
	end
end)
net.Receive("evilrp_terminal_endtyping", function()
	local ply = LocalPlayer()
	if not IsValid(ply.gterm_textentry) then
		return
	end
	ply.gterm_textentry:Remove()
	if IsValid(ply.gterm_entity) then
		ply.gterm_entity.console_text = ""
	end
	ply.gterm_entity = nil
end)
return MsgC(Color(255, 0, 0), "INITIALIZED EVILRP TERMINALS\n")
