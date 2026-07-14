local cries_of_pain = {
	"aahhhh",
	"it burns, it burns",
	"aaaaaa sotla save me please",
	"oh sotla it burns",
	"i'm melting! i'm peeling",
	"fire! my bones want out",
	"agh fuck fuck fuck fuck fuck!",
	"somebody do something",
	"agh! help",
	"call a korpsman",
	"sotla, why",
	"i'm roasting",
	"the burning, the burning",
	"i am on fire",
	"i am on fucking fire",
	"i'm -- uhh -- ow! ow ow ow",
	"i'm -- uhh -- ow! ow ow ow shit",
	"it burns",
	"fire, fire, fire",
	"it's too hot!",
	"no! my face is gonna melt",
	"i'm cooking alive"
}
local BurningAgony
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		pitch = {
			130,
			160
		},
		sound = (function()
			local _accum_0 = { }
			local _len_0 = 1
			for i = 1, 4 do
				_accum_0[_len_0] = "lfr/corpse/caught_fire" .. tostring(i) .. ".wav"
				_len_0 = _len_0 + 1
			end
			return _accum_0
		end)()
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
		__name = "BurningAgony",
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
	BurningAgony = _class_0
end
local onfire_movement
onfire_movement = function(ply, dmg)
	if not ply:GetNWBool("speedcheck") and ply:IsPlayer() and ply:Alive() then
		ply:SetNWFloat("runspeed", ply:GetRunSpeed())
		ply:SetNWBool("speedcheck", true)
	end
	if ply:IsOnFire() and ply:IsPlayer() and ply:Alive() then
		ply.dont_scream = true
		ply:ConCommand("+forward")
		ply:ConCommand("-back")
		ply:ConCommand("+speed")
		ply:SetRunSpeed(ply:GetNWFloat("runspeed") + 100)
		if not ply:GetNWBool("burning") then
			ply:SetNWBool("burning", true)
		end
		local should_play = not (ply.burning_agony_sound and ply.burning_agony_sound:IsPlaying())
		if should_play then
			ply:ConCommand("say /y " .. tostring(cries_of_pain[math.random(#cries_of_pain)]))
			do
				local _with_0 = CreateSound(ply, "BurningAgony")
				ply.burning_agony_sound = _with_0
				_with_0:Play()
				_with_0:ChangePitch(math.random(100, 130))
			end
		end
	end
	return
end
hook.Add("EntityTakeDamage", "evilrp_onfire_movement", onfire_movement)
local onfire_stopmovement
onfire_stopmovement = function()
	local _list_0 = player.GetAll()
	for _index_0 = 1, #_list_0 do
		local ply = _list_0[_index_0]
		if ply:GetNWBool("burning") and not ply:IsOnFire() then
			ply:SetNWBool("burning", false)
			ply:ConCommand("-forward")
			ply:ConCommand("-speed")
			ply:ConCommand("-duck")
			ply:SetRunSpeed(ply:GetNWFloat("runspeed"))
			ply:SetNWBool("speedcheck", false)
			do
				local _obj_0 = ply.burning_agony_sound
				if _obj_0 ~= nil then
					_obj_0:Stop()
				end
			end
		end
	end
	return
end
return hook.Add("Think", "evilrp_onfire_stopmovement", onfire_stopmovement)
