local _list_0 = {
	"physics/flesh/flesh_bloody_impact_hard1.wav",
	"physics/flesh/flesh_squishy_impact_hard1.wav",
	"physics/flesh/flesh_squishy_impact_hard2.wav",
	"physics/flesh/flesh_squishy_impact_hard3.wav",
	"physics/flesh/flesh_squishy_impact_hard4.wav"
}
for _index_0 = 1, #_list_0 do
	local path = _list_0[_index_0]
	util.PrecacheSound(path)
end
local collide_callback_small
collide_callback_small = function(particle, hitpos, hitnormal)
	if particle:GetDieTime() == 0 then
		return
	end
	particle:SetDieTime(0)
	if math.random(3) == 3 then
		sound.Play("physics/flesh/flesh_bloody_impact_hard1.wav", hitpos, 50, math.Rand(95, 105))
		return util.Decal("Impact.Flesh", hitpos + hitnormal, hitpos - hitnormal)
	end
end
local collide_callback
collide_callback = function(oldparticle, hitpos, hitnormal)
	if oldparticle:GetDieTime() == 0 then
		return
	end
	oldparticle:SetDieTime(0)
	local pos = hitpos + hitnormal
	if math.random(3) == 3 then
		sound.Play("physics/flesh/flesh_squishy_impact_hard" .. tostring(math.random(4)) .. ".wav", hitpos, 50, math.Rand(95, 105))
		util.Decal("Blood", pos, hitpos - hitnormal)
		local num = math.random(-4, 4)
		if num < 1 then
			return
		end
		local nhitnormal = hitnormal * 90
		local emitter = ParticleEmitter(pos)
		for i = 1, num do
			local particle = emitter:Add("effects/base", pos)
			particle:SetLighting(true)
			particle:SetVelocity(VectorRand():GetNormalized() * math.Rand(75, 150) + nhitnormal)
			particle:SetDieTime(3)
			particle:SetStartAlpha(255)
			particle:SetEndAlpha(255)
			particle:SetStartSize(math.Rand(1.5, 2.5))
			particle:SetEndSize(1.5)
			particle:SetRoll(math.Rand(-25, 25))
			particle:SetRollDelta(math.Rand(-25, 25))
			particle:SetAirResistance(5)
			particle:SetGravity(Vector(0, 0, -600))
			particle:SetCollide(true)
			particle:SetColor(255, 0, 0)
			particle:SetCollideCallback(collide_callback_small)
		end
		return emitter:Finish()
	end
end
local Bloodstream
do
	local _class_0
	local _parent_0 = FX
	local _base_0 = {
		Init = function(self, data)
			local pos = data:GetOrigin() + Vector(0, 0, 10)
			local dir = data:GetNormal()
			local force = data:GetScale()
			local emitter = ParticleEmitter(pos)
			for i = 1, data:GetMagnitude() do
				local heading = (VectorRand():GetNormalized() * 3 + dir) / 4
				local particle = emitter:Add("effects/blood2", pos + heading)
				particle:SetVelocity(force * math.Rand(0.8, 1) * heading)
				particle:SetDieTime(math.Rand(3, 6))
				particle:SetStartAlpha(200)
				particle:SetEndAlpha(200)
				particle:SetStartSize(math.Rand(3, 5))
				particle:SetEndSize(3)
				particle:SetRoll(math.Rand(0, 360))
				particle:SetRollDelta(math.Rand(-20, 20))
				particle:SetAirResistance(5)
				particle:SetGravity(Vector(0, 0, -600))
				particle:SetCollide(true)
				particle:SetLighting(true)
				particle:SetColor(255, 0, 0)
				particle:SetCollideCallback(collide_callback)
			end
			return emitter:Finish()
		end,
		Think = function(self)
			return false
		end,
		Render = function(self) end
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
		__name = "Bloodstream",
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
	Bloodstream = _class_0
	return _class_0
end
