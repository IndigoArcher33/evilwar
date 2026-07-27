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
		if amt == 0 then -- 9
			return -- 9
		end -- 9
		local c = self:GetStemCells() -- 10
		c = math.Clamp(c + amt, 0, 666) -- 11
		self:SetStemCells(c) -- 12
		local cells = "cells" -- 13
		if math.abs(amt) == 1 then -- 14
			cells = "cell" -- 14
		end -- 14
		local amt_str -- 15
		if amt == 1 then -- 16
			amt_str = "a" -- 17
		else -- 19
			amt_str = string.english_number(math.abs(amt)) -- 19
		end -- 16
		if amt >= 0 then -- 20
			self:EmitSound("StemSound") -- 21
			return self:Notify("<c=0,200,0>Gained " .. tostring(amt_str) .. " stem " .. tostring(cells) .. ".") -- 22
		else -- 24
			return self:Notify("<c=200,0,0>Lost " .. tostring(amt_str) .. " stem " .. tostring(cells) .. ".") -- 24
		end -- 20
	end, -- 8
	SetStemCells = function(self, amt) -- 25
		if SERVER then -- 26
			sql.Query("UPDATE evilrp_stem_cells SET Amount = '" .. tostring(amt) .. "' WHERE SteamID = '" .. tostring(self:SteamID64()) .. "'") -- 27
			return self:SetNWFloat("evilrp_stem_cells", amt) -- 28
		end -- 26
	end, -- 25
	GetStemCells = function(self) -- 29
		if SERVER then -- 30
			return tonumber(sql.Query("SELECT Amount FROM evilrp_stem_cells WHERE SteamID = '" .. tostring(self:SteamID64()) .. "'")[1].Amount) -- 31
		else -- 33
			return self:GetNWFloat("evilrp_stem_cells", 0) -- 33
		end -- 30
	end -- 29
}) do -- 34
	meta[k] = v -- 6
end -- 6
