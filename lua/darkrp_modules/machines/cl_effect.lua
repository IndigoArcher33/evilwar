local Round, Rand, random = math.Round, math.Rand, math.random
local LFR_GeneratorSmoke
do
	local _class_0
	local _parent_0 = FX
	local _base_0 = {
		Init = function(self, data)
			local pos, speed, ang, scale
			do
				pos = data:GetOrigin()
				speed = data:GetStart()
				ang = data:GetNormal()
				scale = data:GetScale()
			end
			for i = 1, 3 do
				local chance = Round(Rand(1, 3))
				local particle_mat
				if 1 == chance then
					particle_mat = "sprites/heatwave"
				else
					particle_mat = "particle/smokesprites_000" .. tostring(Round(Rand(1, 9)))
				end
				if GAMEMODE.Emitter2D then
					local particle = GAMEMODE.Emitter2D:Add(particle_mat, pos)
					do
						local vel = ((ang * 2) * i) * 1
						vel = vel + Vector(random(-4, -14), random(-4, 4), random(-4, 4))
						particle:SetVelocity(vel)
						particle:SetDieTime(Rand(1, 4))
						particle:SetEndAlpha(0)
						particle:SetDieTime(Rand(1, 4))
						particle:SetEndAlpha(0)
						particle:SetStartSize(1 * scale)
						particle:SetEndSize(random(2, 4) * scale)
						particle:SetRoll(Rand(-10, 10))
						particle:SetRollDelta(Rand(-0.2, 0.2))
						local color_num = Rand(20, 75)
						particle:SetColor(color_num, color_num, color_num)
						particle:SetStartAlpha(color_num)
						particle:SetGravity(Vector(0, 0, random(60, 120)))
						particle:SetCollide(true)
						particle:SetAirResistance(300)
						particle:SetBounce(2)
					end
				end
			end
		end,
		Render = function(self) end,
		Think = function(self)
			return false
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
		__name = "LFR_GeneratorSmoke",
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
	LFR_GeneratorSmoke = _class_0
	return _class_0
end
