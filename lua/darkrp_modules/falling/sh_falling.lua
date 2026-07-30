-- [yue]: darkrp_modules\falling\sh_falling.yue
local cries_of_pain = { -- 2
	"AAAAAAAAAAAH", -- 2
	"AAAAAAAAAGHHHH", -- 3
	"WAAAAAARGH", -- 4
	"I'M -- UHH... OWWWW-", -- 5
	"SOTLA SAVE ME", -- 6
	"FUCK, FUCK, FUUUUU-", -- 7
	"OHH... OOOOUGH." -- 8
} -- 1
local nt = 0 -- 10
local BurningAgony -- 12
do -- 12
	local _class_0 -- 12
	local _parent_0 = SOUND -- 12
	local _base_0 = { -- 12
		pitch = { -- 13
			130, -- 13
			160 -- 13
		}, -- 14
		sound = (function() -- 14
			local _accum_0 = { } -- 14
			local _len_0 = 1 -- 14
			for i = 1, 4 do -- 14
				_accum_0[_len_0] = "lfr/corpse/caught_fire" .. tostring(i) .. ".wav" -- 14
				_len_0 = _len_0 + 1 -- 14
			end -- 14
			return _accum_0 -- 14
		end)() -- 12
	} -- 12
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 14
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 12
			_base_0[_key_0] = _val_0 -- 12
		end -- 12
	end -- 14
	if _base_0.__index == nil then -- 12
		_base_0.__index = _base_0 -- 12
	end -- 14
	setmetatable(_base_0, _parent_0.__base) -- 12
	_class_0 = setmetatable({ -- 12
		__init = function(self, ...) -- 12
			return _class_0.__parent.__init(self, ...) -- 12
		end, -- 12
		__base = _base_0, -- 12
		__name = "BurningAgony", -- 12
		__parent = _parent_0 -- 12
	}, { -- 12
		__index = function(cls, name) -- 12
			local val = rawget(_base_0, name) -- 12
			if val == nil then -- 12
				local parent = rawget(cls, "__parent") -- 12
				if parent then -- 12
					return parent[name] -- 12
				end -- 12
			else -- 12
				return val -- 12
			end -- 12
		end, -- 12
		__call = function(cls, ...) -- 12
			local _self_0 = setmetatable({ }, _base_0) -- 12
			cls.__init(_self_0, ...) -- 12
			return _self_0 -- 12
		end -- 12
	}) -- 12
	_base_0.__class = _class_0 -- 12
	if _parent_0.__inherited then -- 12
		_parent_0.__inherited(_parent_0, _class_0) -- 12
	end -- 12
	BurningAgony = _class_0 -- 12
end -- 14
local onfall -- 16
onfall = function() -- 16
	if not CLIENT then -- 17
		return -- 17
	end -- 17
	local ply = LocalPlayer() -- 18
	if ply:Team() == TEAM_GHOST then -- 19
		return -- 19
	end -- 19
	if ply:GetMoveType() == MOVETYPE_NOCLIP then -- 20
		return -- 20
	end -- 20
	if ply:GetMoveType() == MOVETYPE_LADDER then -- 21
		return -- 21
	end -- 21
	local ct = CurTime() -- 23
	if nt > ct then -- 24
		return -- 24
	end -- 24
	if not ply:IsPlayer() or not ply:Alive() then -- 26
		return -- 27
	end -- 26
	if not ply:IsOnGround() and ply:GetVelocity().z < -500 then -- 28
		nt = ct + 5 -- 29
		ply.dont_scream = true -- 30
		local should_play = not (ply.burning_agony_sound and ply.burning_agony_sound:IsPlaying()) -- 31
		ply:ConCommand("say /y " .. tostring(cries_of_pain[math.random(#cries_of_pain)])) -- 32
		do -- 33
			local _with_0 = CreateSound(ply, "BurningAgony") -- 33
			ply.burning_agony_sound = _with_0 -- 33
			_with_0:Play() -- 34
			_with_0:ChangePitch(math.random(100, 130)) -- 35
		end -- 33
	end -- 28
	return -- 36
end -- 16
return hook.Add("Think", "evilrp_onfall", onfall) -- 38
