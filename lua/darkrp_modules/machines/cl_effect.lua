-- [yue]: darkrp_modules\machines\cl_effect.yue
local Round, Rand, random = math.Round, math.Rand, math.random -- 1
local LFR_GeneratorSmoke -- 3
do -- 3
	local _class_0 -- 3
	local _parent_0 = FX -- 3
	local _base_0 = { -- 3
		Init = function(self, data) -- 4
			local pos, speed, ang, scale -- 5
			do -- 6
				pos = data:GetOrigin() -- 7
				speed = data:GetStart() -- 8
				ang = data:GetNormal() -- 9
				scale = data:GetScale() -- 10
			end -- 6
			for i = 1, 3 do -- 11
				local chance = Round(Rand(1, 3)) -- 12
				local particle_mat -- 13
				if 1 == chance then -- 15
					particle_mat = "sprites/heatwave" -- 16
				else -- 18
					particle_mat = "particle/smokesprites_000" .. tostring(Round(Rand(1, 9))) -- 18
				end -- 18
				if GAMEMODE.Emitter2D then -- 19
					local particle = GAMEMODE.Emitter2D:Add(particle_mat, pos) -- 20
					do -- 21
						local vel = ((ang * 2) * i) * 1 -- 22
						vel = vel + Vector(random(-4, -14), random(-4, 4), random(-4, 4)) -- 23
						particle:SetVelocity(vel) -- 24
						particle:SetDieTime(Rand(1, 4)) -- 25
						particle:SetEndAlpha(0) -- 26
						particle:SetDieTime(Rand(1, 4)) -- 27
						particle:SetEndAlpha(0) -- 28
						particle:SetStartSize(1 * scale) -- 29
						particle:SetEndSize(random(2, 4) * scale) -- 30
						particle:SetRoll(Rand(-10, 10)) -- 31
						particle:SetRollDelta(Rand(-0.2, 0.2)) -- 32
						local color_num = Rand(20, 75) -- 33
						particle:SetColor(color_num, color_num, color_num) -- 34
						particle:SetStartAlpha(color_num) -- 35
						particle:SetGravity(Vector(0, 0, random(60, 120))) -- 36
						particle:SetCollide(true) -- 37
						particle:SetAirResistance(300) -- 38
						particle:SetBounce(2) -- 39
					end -- 21
				end -- 19
			end -- 39
		end, -- 40
		Render = function(self) end, -- 41
		Think = function(self) -- 41
			return false -- 41
		end -- 3
	} -- 3
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 41
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 3
			_base_0[_key_0] = _val_0 -- 3
		end -- 3
	end -- 41
	if _base_0.__index == nil then -- 3
		_base_0.__index = _base_0 -- 3
	end -- 41
	setmetatable(_base_0, _parent_0.__base) -- 3
	_class_0 = setmetatable({ -- 3
		__init = function(self, ...) -- 3
			return _class_0.__parent.__init(self, ...) -- 3
		end, -- 3
		__base = _base_0, -- 3
		__name = "LFR_GeneratorSmoke", -- 3
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
	LFR_GeneratorSmoke = _class_0 -- 3
	return _class_0 -- 41
end -- 41
