-- [yue]: darkrp_modules\effects\cl_blood.yue
local _list_0 = { -- 4
	"physics/flesh/flesh_bloody_impact_hard1.wav", -- 4
	"physics/flesh/flesh_squishy_impact_hard1.wav", -- 5
	"physics/flesh/flesh_squishy_impact_hard2.wav", -- 6
	"physics/flesh/flesh_squishy_impact_hard3.wav", -- 7
	"physics/flesh/flesh_squishy_impact_hard4.wav" -- 8
} -- 3
for _index_0 = 1, #_list_0 do -- 9
	local path = _list_0[_index_0] -- 3
	util.PrecacheSound(path) -- 3
end -- 3
local collide_callback_small -- 11
collide_callback_small = function(particle, hitpos, hitnormal) -- 11
	if particle:GetDieTime() == 0 then -- 12
		return -- 12
	end -- 12
	particle:SetDieTime(0) -- 13
	if math.random(3) == 3 then -- 14
		sound.Play("physics/flesh/flesh_bloody_impact_hard1.wav", hitpos, 50, math.Rand(95, 105)) -- 15
		return util.Decal("Impact.Flesh", hitpos + hitnormal, hitpos - hitnormal) -- 19
	end -- 14
end -- 11
local collide_callback -- 21
collide_callback = function(oldparticle, hitpos, hitnormal) -- 21
	if oldparticle:GetDieTime() == 0 then -- 22
		return -- 22
	end -- 22
	oldparticle:SetDieTime(0) -- 23
	local pos = hitpos + hitnormal -- 24
	if math.random(3) == 3 then -- 25
		sound.Play("physics/flesh/flesh_squishy_impact_hard" .. tostring(math.random(4)) .. ".wav", hitpos, 50, math.Rand(95, 105)) -- 26
		util.Decal("Blood", pos, hitpos - hitnormal) -- 30
		local num = math.random(-4, 4) -- 31
		if num < 1 then -- 32
			return -- 32
		end -- 32
		local nhitnormal = hitnormal * 90 -- 33
		local emitter = ParticleEmitter(pos) -- 34
		for i = 1, num do -- 35
			local particle = emitter:Add("effects/base", pos) -- 36
			particle:SetLighting(true) -- 38
			particle:SetVelocity(VectorRand():GetNormalized() * math.Rand(75, 150) + nhitnormal) -- 39
			particle:SetDieTime(3) -- 40
			particle:SetStartAlpha(255) -- 41
			particle:SetEndAlpha(255) -- 42
			particle:SetStartSize(math.Rand(1.5, 2.5)) -- 43
			particle:SetEndSize(1.5) -- 44
			particle:SetRoll(math.Rand(-25, 25)) -- 45
			particle:SetRollDelta(math.Rand(-25, 25)) -- 46
			particle:SetAirResistance(5) -- 47
			particle:SetGravity(Vector(0, 0, -600)) -- 48
			particle:SetCollide(true) -- 49
			particle:SetColor(255, 0, 0) -- 50
			particle:SetCollideCallback(collide_callback_small) -- 51
		end -- 51
		return emitter:Finish() -- 52
	end -- 25
end -- 21
local Bloodstream -- 54
do -- 54
	local _class_0 -- 54
	local _parent_0 = FX -- 54
	local _base_0 = { -- 54
		Init = function(self, data) -- 55
			local pos = data:GetOrigin() + Vector(0, 0, 10) -- 56
			local dir = data:GetNormal() -- 57
			local force = data:GetScale() -- 58
			local emitter = ParticleEmitter(pos) -- 59
			for i = 1, data:GetMagnitude() do -- 60
				local heading = (VectorRand():GetNormalized() * 3 + dir) / 4 -- 61
				local particle = emitter:Add("effects/blood2", pos + heading) -- 62
				particle:SetVelocity(force * math.Rand(0.8, 1) * heading) -- 64
				particle:SetDieTime(math.Rand(3, 6)) -- 65
				particle:SetStartAlpha(200) -- 66
				particle:SetEndAlpha(200) -- 67
				particle:SetStartSize(math.Rand(3, 5)) -- 68
				particle:SetEndSize(3) -- 69
				particle:SetRoll(math.Rand(0, 360)) -- 70
				particle:SetRollDelta(math.Rand(-20, 20)) -- 71
				particle:SetAirResistance(5) -- 72
				particle:SetGravity(Vector(0, 0, -600)) -- 73
				particle:SetCollide(true) -- 74
				particle:SetLighting(true) -- 75
				particle:SetColor(255, 0, 0) -- 76
				particle:SetCollideCallback(collide_callback) -- 77
			end -- 77
			return emitter:Finish() -- 78
		end, -- 80
		Think = function(self) -- 80
			return false -- 80
		end, -- 82
		Render = function(self) end -- 54
	} -- 54
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 82
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 54
			_base_0[_key_0] = _val_0 -- 54
		end -- 54
	end -- 82
	if _base_0.__index == nil then -- 54
		_base_0.__index = _base_0 -- 54
	end -- 82
	setmetatable(_base_0, _parent_0.__base) -- 54
	_class_0 = setmetatable({ -- 54
		__init = function(self, ...) -- 54
			return _class_0.__parent.__init(self, ...) -- 54
		end, -- 54
		__base = _base_0, -- 54
		__name = "Bloodstream", -- 54
		__parent = _parent_0 -- 54
	}, { -- 54
		__index = function(cls, name) -- 54
			local val = rawget(_base_0, name) -- 54
			if val == nil then -- 54
				local parent = rawget(cls, "__parent") -- 54
				if parent then -- 54
					return parent[name] -- 54
				end -- 54
			else -- 54
				return val -- 54
			end -- 54
		end, -- 54
		__call = function(cls, ...) -- 54
			local _self_0 = setmetatable({ }, _base_0) -- 54
			cls.__init(_self_0, ...) -- 54
			return _self_0 -- 54
		end -- 54
	}) -- 54
	_base_0.__class = _class_0 -- 54
	if _parent_0.__inherited then -- 54
		_parent_0.__inherited(_parent_0, _class_0) -- 54
	end -- 54
	Bloodstream = _class_0 -- 54
	return _class_0 -- 82
end -- 82
