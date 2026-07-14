local Rand, random = math.Rand, math.random
local LFR_PlayerSpawnEffect
do
	local _class_0
	local _parent_0 = FX
	local _base_0 = {
		Init = function(self, data)
			local pos, speed, ang, scale, ent
			do
				pos = data:GetOrigin()
				speed = data:GetStart()
				ang = data:GetNormal()
				scale = data:GetScale()
				ent = data:GetEntity()
			end
			local minb, maxb = ent:GetModelBounds()
			local x1, x2 = minb[1], maxb[1]
			local y1, y2 = minb[2], maxb[2]
			local z1, z2 = minb[3], maxb[3]
			local pmat = "effects/splashwake3"
			for i = 1, 40 do
				local rand_pos = VectorRand(x1, x2)
				pos = pos + rand_pos
				local particle = GAMEMODE.Emitter2D:Add(pmat, pos)
				do
					particle:SetVelocity((((ang * 15) * i) * 1) + Vector(random(-4, 4), random(-4, 4), random(-4, 4)))
					particle:SetDieTime(Rand(1, 4))
					particle:SetEndAlpha(0)
					particle:SetStartSize(2 * scale)
					particle:SetEndSize(random(2, 4) * scale)
					particle:SetRoll(Rand(-10, 10))
					particle:SetRollDelta(Rand(-2, 2))
					local cnum = Rand(50, 255)
					particle:SetColor(cnum, cnum / 2, cnum / 2)
					particle:SetStartAlpha(cnum)
					particle:SetGravity(Vector(0, 0, random(75, 200)))
					particle:SetAirResistance(300)
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
		__name = "LFR_PlayerSpawnEffect",
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
	LFR_PlayerSpawnEffect = _class_0
	return _class_0
end
