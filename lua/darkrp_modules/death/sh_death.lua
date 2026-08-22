-- [yue]: darkrp_modules\death\sh_death.yue
GAMEMODE.Deaths = function() -- 1
	return GetGlobalInt("DEATH") -- 1
end -- 1
local KOMDEATH -- 3
do -- 3
	local _class_0 -- 3
	local _parent_0 = SOUND -- 3
	local _base_0 = { -- 3
		level = SNDLVL_NONE, -- 5
		sound = "kidneydagger/deadkommandant.ogg" -- 3
	} -- 3
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 5
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 3
			_base_0[_key_0] = _val_0 -- 3
		end -- 3
	end -- 5
	if _base_0.__index == nil then -- 3
		_base_0.__index = _base_0 -- 3
	end -- 5
	setmetatable(_base_0, _parent_0.__base) -- 3
	_class_0 = setmetatable({ -- 3
		__init = function(self, ...) -- 3
			return _class_0.__parent.__init(self, ...) -- 3
		end, -- 3
		__base = _base_0, -- 3
		__name = "KOMDEATH", -- 3
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
	KOMDEATH = _class_0 -- 3
end -- 5
local emperor_death -- 8
emperor_death = function(ply) -- 8
	if not (ply:Team() == TEAM_EMPEROR) then -- 9
		return -- 9
	end -- 9
	Chat.Announce("GENERIC", "<c=230,0,0>The EMPEROR is dead. Long live the EMPEROR.") -- 10
	return ply:EmitSound("KOMDEATH") -- 11
end -- 8
local death -- 13
death = function(ply) -- 13
	local deaths = GAMEMODE.Deaths() + 1 -- 14
	SetGlobalInt("DEATH", deaths) -- 15
	local bodies = "BODIES" -- 16
	if deaths == 1 then -- 17
		bodies = "BODY" -- 17
	end -- 17
	if ply:Team() == TEAM_EMPEROR then -- 19
		emperor_death(ply) -- 20
	end -- 19
	local job = RPExtraTeams[ply:Team()] -- 21
	if job.cooldown and job.cooldown > 0 then -- 22
		ply.cooldowns = ply.cooldowns or (ply.cooldowns or { }) -- 23
		ply.cooldowns[ply:Team()] = CurTime() + job.cooldown -- 24
	end -- 22
	return RunConsoleCommand("hostname", tostring(string.english_number(deaths):upper()) .. " DEAD " .. tostring(bodies) .. " TODAY") -- 27
end -- 13
return hook.Add("DoPlayerDeath", "evilrp_death", death) -- 30
