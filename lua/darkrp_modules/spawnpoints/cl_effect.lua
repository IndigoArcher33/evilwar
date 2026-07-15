-- [yue]: darkrp_modules\spawnpoints\cl_effect.yue
local Rand, random = math.Rand, math.random -- 1
local LFR_PlayerSpawnEffect -- 3
do -- 3
	local _class_0 -- 3
	local _parent_0 = FX -- 3
	local _base_0 = { -- 3
		Init = function(self, data) -- 4
			local pos, speed, ang, scale, ent -- 5
			do -- 6
				pos = data:GetOrigin() -- 7
				speed = data:GetStart() -- 8
				ang = data:GetNormal() -- 9
				scale = data:GetScale() -- 10
				ent = data:GetEntity() -- 11
			end -- 6
			local minb, maxb = ent:GetModelBounds() -- 12
			local x1, x2 = minb[1], maxb[1] -- 13
			local y1, y2 = minb[2], maxb[2] -- 14
			local z1, z2 = minb[3], maxb[3] -- 15
			local pmat = "effects/splashwake3" -- 16
			for i = 1, 40 do -- 18
				local rand_pos = VectorRand(x1, x2) -- 19
				pos = pos + rand_pos -- 20
				local particle = GAMEMODE.Emitter2D:Add(pmat, pos) -- 21
				do -- 22
					particle:SetVelocity((((ang * 15) * i) * 1) + Vector(random(-4, 4), random(-4, 4), random(-4, 4))) -- 23
					particle:SetDieTime(Rand(1, 4)) -- 24
					particle:SetEndAlpha(0) -- 25
					particle:SetStartSize(2 * scale) -- 26
					particle:SetEndSize(random(2, 4) * scale) -- 27
					particle:SetRoll(Rand(-10, 10)) -- 28
					particle:SetRollDelta(Rand(-2, 2)) -- 29
					local cnum = Rand(50, 255) -- 30
					particle:SetColor(cnum, cnum / 2, cnum / 2) -- 31
					particle:SetStartAlpha(cnum) -- 32
					particle:SetGravity(Vector(0, 0, random(75, 200))) -- 33
					particle:SetAirResistance(300) -- 34
				end -- 22
			end -- 34
		end, -- 35
		Render = function(self) end, -- 36
		Think = function(self) -- 36
			return false -- 36
		end -- 3
	} -- 3
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 36
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 3
			_base_0[_key_0] = _val_0 -- 3
		end -- 3
	end -- 36
	if _base_0.__index == nil then -- 3
		_base_0.__index = _base_0 -- 3
	end -- 36
	setmetatable(_base_0, _parent_0.__base) -- 3
	_class_0 = setmetatable({ -- 3
		__init = function(self, ...) -- 3
			return _class_0.__parent.__init(self, ...) -- 3
		end, -- 3
		__base = _base_0, -- 3
		__name = "LFR_PlayerSpawnEffect", -- 3
		__parent = _parent_0 -- 3
	}, { -- 3
		__index = function(cls, name) -- 3
			local val = rawget(_base_0, name) -- 3
			if val == nil then -- 3
				local parent = rawget(cls, "__parent") -- 3
				if parent then -- 3
					return parent[name] -- 3
				end -- 3
			else -- 3
				return val -- 3
			end -- 3
		end, -- 3
		__call = function(cls, ...) -- 3
			local _self_0 = setmetatable({ }, _base_0) -- 3
			cls.__init(_self_0, ...) -- 3
			return _self_0 -- 3
		end -- 3
	}) -- 3
	_base_0.__class = _class_0 -- 3
	if _parent_0.__inherited then -- 3
		_parent_0.__inherited(_parent_0, _class_0) -- 3
	end -- 3
	LFR_PlayerSpawnEffect = _class_0 -- 3
	return _class_0 -- 36
end -- 36
