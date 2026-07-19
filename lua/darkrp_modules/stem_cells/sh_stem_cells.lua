-- [yue]: darkrp_modules\stem_cells\sh_stem_cells.yue
local StemSound -- 1
do -- 1
	local _class_0 -- 1
	local _parent_0 = SOUND -- 1
	local _base_0 = { -- 1
		sound = (function() -- 2
			local _accum_0 = { } -- 2
			local _len_0 = 1 -- 2
			for i = 1, 4 do -- 2
				_accum_0[_len_0] = "garrysmod/save_load" .. tostring(i) .. ".wav" -- 2
				_len_0 = _len_0 + 1 -- 2
			end -- 2
			return _accum_0 -- 2
		end)(), -- 3
		level = SNDLVL_50dB -- 1
	} -- 1
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 3
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 1
			_base_0[_key_0] = _val_0 -- 1
		end -- 1
	end -- 3
	if _base_0.__index == nil then -- 1
		_base_0.__index = _base_0 -- 1
	end -- 3
	setmetatable(_base_0, _parent_0.__base) -- 1
	_class_0 = setmetatable({ -- 1
		__init = function(self, ...) -- 1
			return _class_0.__parent.__init(self, ...) -- 1
		end, -- 1
		__base = _base_0, -- 1
		__name = "StemSound", -- 1
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
	StemSound = _class_0 -- 1
end -- 3
local meta = FindMetaTable("Player") -- 5
for k, v in pairs({ -- 8
	AddStemCells = function(self, amt) -- 8
		local c = self:GetStemCells() -- 9
		c = math.Clamp(c + amt, 0, 666) -- 10
		self:SetStemCells(c) -- 11
		local cells = "cells" -- 12
		if math.abs(amt) == 1 then -- 13
			cells = "cell" -- 13
		end -- 13
		local amt_str -- 14
		if amt == 1 then -- 15
			amt_str = "a" -- 16
		else -- 18
			amt_str = string.english_number(math.abs(amt)) -- 18
		end -- 15
		if amt >= 0 then -- 19
			self:EmitSound("StemSound") -- 20
			return self:Notify("<c=0,200,0>Gained " .. tostring(amt_str) .. " stem " .. tostring(cells) .. ".") -- 21
		else -- 23
			return self:Notify("<c=200,0,0>Lost " .. tostring(amt_str) .. " stem " .. tostring(cells) .. ".") -- 23
		end -- 19
	end, -- 8
	SetStemCells = function(self, amt) -- 24
		if SERVER then -- 25
			sql.Query("UPDATE evilrp_stem_cells SET Amount = '" .. tostring(amt) .. "' WHERE SteamID = '" .. tostring(self:SteamID64()) .. "'") -- 26
			return self:SetNWFloat("evilrp_stem_cells", amt) -- 27
		end -- 25
	end, -- 24
	GetStemCells = function(self) -- 28
		if SERVER then -- 29
			return tonumber(sql.Query("SELECT Amount FROM evilrp_stem_cells WHERE SteamID = '" .. tostring(self:SteamID64()) .. "'")[1].Amount) -- 30
		else -- 32
			return self:GetNWFloat("evilrp_stem_cells", 0) -- 32
		end -- 29
	end -- 28
}) do -- 33
	meta[k] = v -- 6
end -- 6
