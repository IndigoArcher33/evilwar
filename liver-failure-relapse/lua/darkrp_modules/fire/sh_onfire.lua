-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/fire/sh_onfire.yue
local cries_of_pain = { -- 2
	"aahhhh", -- 2
	"it burns, it burns", -- 3
	"aaaaaa sotla save me please", -- 4
	"oh sotla it burns", -- 5
	"i'm melting! i'm peeling", -- 6
	"fire! my bones want out", -- 7
	"agh fuck fuck fuck fuck fuck!", -- 8
	"somebody do something", -- 9
	"agh! help", -- 10
	"call a korpsman", -- 11
	"sotla, why", -- 12
	"i'm roasting", -- 13
	"the burning, the burning", -- 14
	"i am on fire", -- 15
	"i am on fucking fire", -- 16
	"i'm -- uhh -- ow! ow ow ow", -- 17
	"i'm -- uhh -- ow! ow ow ow shit", -- 18
	"it burns", -- 19
	"fire, fire, fire", -- 20
	"it's too hot!", -- 21
	"no! my face is gonna melt", -- 22
	"i'm cooking alive" -- 23
} -- 1
local BurningAgony -- 25
do -- 25
	local _class_0 -- 25
	local _parent_0 = SOUND -- 25
	local _base_0 = { -- 25
		pitch = { -- 26
			130, -- 26
			160 -- 26
		}, -- 27
		sound = (function() -- 27
			local _accum_0 = { } -- 27
			local _len_0 = 1 -- 27
			for i = 1, 4 do -- 27
				_accum_0[_len_0] = "lfr/corpse/caught_fire" .. tostring(i) .. ".wav" -- 27
				_len_0 = _len_0 + 1 -- 27
			end -- 27
			return _accum_0 -- 27
		end)() -- 25
	} -- 25
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 27
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 25
			_base_0[_key_0] = _val_0 -- 25
		end -- 25
	end -- 27
	if _base_0.__index == nil then -- 25
		_base_0.__index = _base_0 -- 25
	end -- 27
	setmetatable(_base_0, _parent_0.__base) -- 25
	_class_0 = setmetatable({ -- 25
		__init = function(self, ...) -- 25
			return _class_0.__parent.__init(self, ...) -- 25
		end, -- 25
		__base = _base_0, -- 25
		__name = "BurningAgony", -- 25
		__parent = _parent_0 -- 25
	}, { -- 25
		__index = function(cls, name) -- 25
			local val = rawget(_base_0, name) -- 25
			if val == nil then -- 25
				local parent = rawget(cls, "__parent") -- 25
				if parent then -- 25
					return parent[name] -- 25
				end -- 25
			else -- 25
				return val -- 25
			end -- 25
		end, -- 25
		__call = function(cls, ...) -- 25
			local _self_0 = setmetatable({ }, _base_0) -- 25
			cls.__init(_self_0, ...) -- 25
			return _self_0 -- 25
		end -- 25
	}) -- 25
	_base_0.__class = _class_0 -- 25
	if _parent_0.__inherited then -- 25
		_parent_0.__inherited(_parent_0, _class_0) -- 25
	end -- 25
	BurningAgony = _class_0 -- 25
end -- 27
local onfire_movement -- 29
onfire_movement = function(ply, dmg) -- 29
	if not ply:GetNWBool("speedcheck") and ply:IsPlayer() and ply:Alive() then -- 30
		ply:SetNWFloat("runspeed", ply:GetRunSpeed()) -- 31
		ply:SetNWBool("speedcheck", true) -- 32
	end -- 30
	if ply:IsOnFire() and ply:IsPlayer() and ply:Alive() then -- 33
		ply.dont_scream = true -- 34
		ply:ConCommand("+forward") -- 35
		ply:ConCommand("-back") -- 36
		ply:ConCommand("+speed") -- 37
		ply:SetRunSpeed(ply:GetNWFloat("runspeed") + 100) -- 38
		if not ply:GetNWBool("burning") then -- 39
			ply:SetNWBool("burning", true) -- 40
		end -- 39
		local should_play = not (ply.burning_agony_sound and ply.burning_agony_sound:IsPlaying()) -- 41
		if should_play then -- 42
			ply:ConCommand("say /y " .. tostring(cries_of_pain[math.random(#cries_of_pain)])) -- 43
			local _with_0 = CreateSound(ply, "BurningAgony") -- 44
			ply.burning_agony_sound = _with_0 -- 44
			_with_0:Play() -- 45
			_with_0:ChangePitch(math.random(100, 130)) -- 46
		end -- 42
	end -- 33
	return -- 47
end -- 29
hook.Add("EntityTakeDamage", "evilrp_onfire_movement", onfire_movement) -- 49
local onfire_stopmovement -- 51
onfire_stopmovement = function() -- 51
	local _list_0 = player.GetAll() -- 52
	for _index_0 = 1, #_list_0 do -- 52
		local ply = _list_0[_index_0] -- 52
		if ply:GetNWBool("burning") and not ply:IsOnFire() then -- 53
			ply:SetNWBool("burning", false) -- 54
			ply:ConCommand("-forward") -- 55
			ply:ConCommand("-speed") -- 56
			ply:ConCommand("-duck") -- 57
			ply:SetRunSpeed(ply:GetNWFloat("runspeed")) -- 58
			ply:SetNWBool("speedcheck", false) -- 59
			local _obj_0 = ply.burning_agony_sound -- 60
			if _obj_0 ~= nil then -- 60
				_obj_0:Stop() -- 60
			end -- 60
		end -- 53
	end -- 60
	return -- 61
end -- 51
return hook.Add("Think", "evilrp_onfire_stopmovement", onfire_stopmovement) -- 63
