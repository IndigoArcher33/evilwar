-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/computers/cl_computers.yue
net.Receive("evilrp_terminal_addline", function() -- 3
	local idx = net.ReadUInt(16) -- 4
	local ent = Entity(idx) -- 5
	if not IsValid(ent) then -- 6
		return -- 6
	end -- 6
	if IsValid(ent) then -- 7
		ent:EmitSound("TerrorLine") -- 7
	end -- 7
	local text = net.ReadString() -- 8
	local color_type = net.ReadUInt(8) -- 9
	local pos = net.ReadInt(16) -- 10
	if not gterm[idx] then -- 11
		gterm[idx] = { } -- 11
	end -- 11
	local line = { -- 12
		text = text, -- 12
		color = color_type -- 12
	} -- 12
	if (not pos) or (pos == -1) then -- 13
		local _obj_0 = gterm[idx] -- 14
		_obj_0[#_obj_0 + 1] = line -- 14
	else -- 16
		gterm[idx][pos] = line -- 16
	end -- 13
	if #gterm[idx] > ent.max_lines then -- 17
		return table.remove(gterm[idx], 1) -- 17
	end -- 17
end) -- 3
local TerrorLine -- 19
do -- 19
	local _class_0 -- 19
	local _parent_0 = SOUND -- 19
	local _base_0 = { -- 19
		sound = "dysphoria/ui/interactor_scrolldown.ogg", -- 21
		level = SNDLVL_20DB, -- 22
		pitch = { -- 22
			60, -- 22
			85 -- 22
		} -- 19
	} -- 19
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 22
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 19
			_base_0[_key_0] = _val_0 -- 19
		end -- 19
	end -- 22
	if _base_0.__index == nil then -- 19
		_base_0.__index = _base_0 -- 19
	end -- 22
	setmetatable(_base_0, _parent_0.__base) -- 19
	_class_0 = setmetatable({ -- 19
		__init = function(self, ...) -- 19
			return _class_0.__parent.__init(self, ...) -- 19
		end, -- 19
		__base = _base_0, -- 19
		__name = "TerrorLine", -- 19
		__parent = _parent_0 -- 19
	}, { -- 19
		__index = function(cls, name) -- 19
			local val = rawget(_base_0, name) -- 19
			if val == nil then -- 19
				local parent = rawget(cls, "__parent") -- 19
				if parent then -- 19
					return parent[name] -- 19
				end -- 19
			else -- 19
				return val -- 19
			end -- 19
		end, -- 19
		__call = function(cls, ...) -- 19
			local _self_0 = setmetatable({ }, _base_0) -- 19
			cls.__init(_self_0, ...) -- 19
			return _self_0 -- 19
		end -- 19
	}) -- 19
	_base_0.__class = _class_0 -- 19
	if _parent_0.__inherited then -- 19
		_parent_0.__inherited(_parent_0, _class_0) -- 19
	end -- 19
	TerrorLine = _class_0 -- 19
end -- 22
local TerrorType -- 24
do -- 24
	local _class_0 -- 24
	local _parent_0 = SOUND -- 24
	local _base_0 = { -- 24
		sound = "buttons/lightswitch2.wav", -- 26
		pitch = { -- 26
			60, -- 26
			80 -- 26
		} -- 24
	} -- 24
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 26
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 24
			_base_0[_key_0] = _val_0 -- 24
		end -- 24
	end -- 26
	if _base_0.__index == nil then -- 24
		_base_0.__index = _base_0 -- 24
	end -- 26
	setmetatable(_base_0, _parent_0.__base) -- 24
	_class_0 = setmetatable({ -- 24
		__init = function(self, ...) -- 24
			return _class_0.__parent.__init(self, ...) -- 24
		end, -- 24
		__base = _base_0, -- 24
		__name = "TerrorType", -- 24
		__parent = _parent_0 -- 24
	}, { -- 24
		__index = function(cls, name) -- 24
			local val = rawget(_base_0, name) -- 24
			if val == nil then -- 24
				local parent = rawget(cls, "__parent") -- 24
				if parent then -- 24
					return parent[name] -- 24
				end -- 24
			else -- 24
				return val -- 24
			end -- 24
		end, -- 24
		__call = function(cls, ...) -- 24
			local _self_0 = setmetatable({ }, _base_0) -- 24
			cls.__init(_self_0, ...) -- 24
			return _self_0 -- 24
		end -- 24
	}) -- 24
	_base_0.__class = _class_0 -- 24
	if _parent_0.__inherited then -- 24
		_parent_0.__inherited(_parent_0, _class_0) -- 24
	end -- 24
	TerrorType = _class_0 -- 24
end -- 26
local TerrorTypeEnter -- 28
do -- 28
	local _class_0 -- 28
	local _parent_0 = SOUND -- 28
	local _base_0 = { -- 28
		sound = "buttons/button9.wav", -- 30
		pitch = { -- 30
			60, -- 30
			80 -- 30
		} -- 28
	} -- 28
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 30
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 28
			_base_0[_key_0] = _val_0 -- 28
		end -- 28
	end -- 30
	if _base_0.__index == nil then -- 28
		_base_0.__index = _base_0 -- 28
	end -- 30
	setmetatable(_base_0, _parent_0.__base) -- 28
	_class_0 = setmetatable({ -- 28
		__init = function(self, ...) -- 28
			return _class_0.__parent.__init(self, ...) -- 28
		end, -- 28
		__base = _base_0, -- 28
		__name = "TerrorTypeEnter", -- 28
		__parent = _parent_0 -- 28
	}, { -- 28
		__index = function(cls, name) -- 28
			local val = rawget(_base_0, name) -- 28
			if val == nil then -- 28
				local parent = rawget(cls, "__parent") -- 28
				if parent then -- 28
					return parent[name] -- 28
				end -- 28
			else -- 28
				return val -- 28
			end -- 28
		end, -- 28
		__call = function(cls, ...) -- 28
			local _self_0 = setmetatable({ }, _base_0) -- 28
			cls.__init(_self_0, ...) -- 28
			return _self_0 -- 28
		end -- 28
	}) -- 28
	_base_0.__class = _class_0 -- 28
	if _parent_0.__inherited then -- 28
		_parent_0.__inherited(_parent_0, _class_0) -- 28
	end -- 28
	TerrorTypeEnter = _class_0 -- 28
end -- 30
local TerrorTypeExit -- 32
do -- 32
	local _class_0 -- 32
	local _parent_0 = SOUND -- 32
	local _base_0 = { -- 32
		sound = "buttons/combine_button2.wav", -- 34
		pitch = { -- 34
			110, -- 34
			130 -- 34
		} -- 32
	} -- 32
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 34
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 32
			_base_0[_key_0] = _val_0 -- 32
		end -- 32
	end -- 34
	if _base_0.__index == nil then -- 32
		_base_0.__index = _base_0 -- 32
	end -- 34
	setmetatable(_base_0, _parent_0.__base) -- 32
	_class_0 = setmetatable({ -- 32
		__init = function(self, ...) -- 32
			return _class_0.__parent.__init(self, ...) -- 32
		end, -- 32
		__base = _base_0, -- 32
		__name = "TerrorTypeExit", -- 32
		__parent = _parent_0 -- 32
	}, { -- 32
		__index = function(cls, name) -- 32
			local val = rawget(_base_0, name) -- 32
			if val == nil then -- 32
				local parent = rawget(cls, "__parent") -- 32
				if parent then -- 32
					return parent[name] -- 32
				end -- 32
			else -- 32
				return val -- 32
			end -- 32
		end, -- 32
		__call = function(cls, ...) -- 32
			local _self_0 = setmetatable({ }, _base_0) -- 32
			cls.__init(_self_0, ...) -- 32
			return _self_0 -- 32
		end -- 32
	}) -- 32
	_base_0.__class = _class_0 -- 32
	if _parent_0.__inherited then -- 32
		_parent_0.__inherited(_parent_0, _class_0) -- 32
	end -- 32
	TerrorTypeExit = _class_0 -- 32
end -- 34
net.Receive("evilrp_terminal_flicker", function() -- 36
	local idx = net.ReadUInt(16) -- 37
	local ent = Entity(idx) -- 38
	ent.flicker = 1 -- 39
end) -- 36
net.Receive("evilrp_terminal_activeconsole", function() -- 41
	local idx = net.ReadUInt(16) -- 42
	local ent = Entity(idx) -- 43
	local ply = LocalPlayer() -- 44
	if IsValid(ent) then -- 45
		ply.gterm_entity = ent -- 46
		local _with_0 = vgui.Create("DTextEntry") -- 47
		ply.gterm_textentry = _with_0 -- 47
		_with_0:SetSize(0, 0) -- 48
		_with_0:SetPos(0, 0) -- 49
		_with_0:MakePopup() -- 50
		_with_0.KILL = function(self) -- 51
			self:Remove() -- 52
			do -- 53
				local _obj_0 = self.OnClose -- 53
				if _obj_0 ~= nil then -- 53
					_obj_0(self) -- 53
				end -- 53
			end -- 53
			gui.HideGameUI() -- 54
			net.Start("evilrp_terminal_endconsole") -- 55
			net.WriteUInt(idx, 16) -- 56
			net.WriteString("") -- 57
			net.SendToServer() -- 58
			if #self:GetValue() > 1 then -- 59
			else -- 62
				ent:EmitSound("TerrorTypeExit") -- 62
			end -- 59
			ent.flicker = 1 -- 63
			self = nil -- 64
			lp.gterm_entity = nil -- 65
		end -- 51
		_with_0.Think = function(self) -- 66
			local ct = CurTime() -- 67
			if not self.TryClose then -- 68
				self.TryClose = ct + 0.2 -- 68
			end -- 68
			if ct >= self.TryClose then -- 69
				if not lp:Alive() then -- 70
					self:KILL() -- 70
				end -- 70
				if input.IsKeyDown(KEY_ESCAPE) then -- 71
					self:KILL() -- 71
				end -- 71
				if input.IsKeyDown(KEY_F3) then -- 72
					self:KILL() -- 72
				end -- 72
				local gx = gui.MouseX() -- 73
				local gy = gui.MouseY() -- 74
				local sw = ScrW() -- 75
				local sh = ScrH() -- 76
				if gx < (sw * .2) then -- 77
					self:KILL() -- 77
				end -- 77
				if gy < (sh * .1) then -- 78
					self:KILL() -- 78
				end -- 78
				if gx > (sw * .8) then -- 79
					self:KILL() -- 79
				end -- 79
				if gy > (sh * .9) then -- 80
					return self:KILL() -- 80
				end -- 80
			end -- 69
		end -- 66
		_with_0.OnTextChanged = function(self) -- 82
			local offset = 0 -- 83
			local text = self:GetValue() -- 84
			if (string.len(text) > ent.max_chars) then -- 85
				offset = self:GetCaretPos() - (ent.max_chars - 3) -- 85
			end -- 85
			ent.console_text = string.sub(text, offset) -- 86
			return ent:EmitSound("TerrorType") -- 87
		end -- 82
		_with_0.OnEnter = function(self) -- 88
			net.Start("evilrp_terminal_endconsole") -- 89
			net.WriteUInt(idx, 16) -- 90
			net.WriteString(tostring(self:GetValue())) -- 91
			net.SendToServer() -- 92
			if #self:GetValue() > 1 then -- 93
			else -- 96
				ent:EmitSound("TerrorTypeExit") -- 96
			end -- 93
			ent.flicker = 1 -- 97
			self:SetText("") -- 98
			self:SetCaretPos(0) -- 99
			ent.console_text = "" -- 100
		end -- 88
		return _with_0 -- 47
	end -- 45
end) -- 41
net.Receive("evilrp_terminal_endtyping", function() -- 102
	local ply = LocalPlayer() -- 103
	if not IsValid(ply.gterm_textentry) then -- 104
		return -- 104
	end -- 104
	ply.gterm_textentry:Remove() -- 105
	if IsValid(ply.gterm_entity) then -- 106
		ply.gterm_entity.console_text = "" -- 106
	end -- 106
	ply.gterm_entity = nil -- 107
end) -- 102
return MsgC(Color(255, 0, 0), "INITIALIZED EVILRP TERMINALS\n") -- 109
