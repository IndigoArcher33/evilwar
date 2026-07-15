-- [yue]: darkrp_modules\ghosts\sh_ghosts.yue
local Startled -- 1
do -- 1
	local _class_0 -- 1
	local _parent_0 = SOUND -- 1
	local _base_0 = { -- 1
		sound = (function() -- 2
			local _accum_0 = { } -- 2
			local _len_0 = 1 -- 2
			for i = 1, 2 do -- 2
				_accum_0[_len_0] = "vo/npc/male01/startle0" .. tostring(i) .. ".wav" -- 2
				_len_0 = _len_0 + 1 -- 2
			end -- 2
			return _accum_0 -- 2
		end)() -- 1
	} -- 1
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 2
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 1
			_base_0[_key_0] = _val_0 -- 1
		end -- 1
	end -- 2
	if _base_0.__index == nil then -- 1
		_base_0.__index = _base_0 -- 1
	end -- 2
	setmetatable(_base_0, _parent_0.__base) -- 1
	_class_0 = setmetatable({ -- 1
		__init = function(self, ...) -- 1
			return _class_0.__parent.__init(self, ...) -- 1
		end, -- 1
		__base = _base_0, -- 1
		__name = "Startled", -- 1
		__parent = _parent_0 -- 1
	}, { -- 1
		__index = function(cls, name) -- 1
			local val = rawget(_base_0, name) -- 1
			if val == nil then -- 1
				local parent = rawget(cls, "__parent") -- 1
				if parent then -- 1
					return parent[name] -- 1
				end -- 1
			else -- 1
				return val -- 1
			end -- 1
		end, -- 1
		__call = function(cls, ...) -- 1
			local _self_0 = setmetatable({ }, _base_0) -- 1
			cls.__init(_self_0, ...) -- 1
			return _self_0 -- 1
		end -- 1
	}) -- 1
	_base_0.__class = _class_0 -- 1
	if _parent_0.__inherited then -- 1
		_parent_0.__inherited(_parent_0, _class_0) -- 1
	end -- 1
	Startled = _class_0 -- 1
end -- 2
local enable_custom_collisions -- 4
enable_custom_collisions = function(ply) -- 4
	ply:SetCustomCollisionCheck(true) -- 5
	return -- 6
end -- 4
hook.Add("PlayerInitialSpawn", "evilrp_custom_player_collisions", enable_custom_collisions) -- 8
local ghost_collision -- 10
ghost_collision = function(e_one, e_two) -- 10
	if e_one:IsPlayer() and e_one:Team() == TEAM_GHOST then -- 11
		return false -- 11
	end -- 11
	if e_two:IsPlayer() and e_two:Team() == TEAM_GHOST then -- 12
		return false -- 12
	end -- 12
	return -- 13
end -- 10
hook.Add("ShouldCollide", "evilrp_ghost_collision", ghost_collision) -- 15
local set_ghost_fx -- 17
set_ghost_fx = function(ply) -- 17
	do -- 18
		local _exp_0 = ply:Team() -- 18
		if TEAM_GHOST == _exp_0 then -- 19
			ply:SetRenderFX(16) -- 20
			ply:SetMaterial("effects/tp_eyefx/tpeye") -- 21
			ply:SetDSP(4) -- 22
		else -- 24
			ply:SetRenderFX(0) -- 24
			ply:SetMaterial(nil) -- 25
			ply:SetDSP(0) -- 26
		end -- 26
	end -- 26
	return -- 27
end -- 17
hook.Add("PlayerLoadout", "evilrp_ghost_fx", set_ghost_fx) -- 29
local ghost_flying -- 31
ghost_flying = function(ply, move) -- 31
	local sprinting = ply:KeyDown(IN_SPEED) -- 32
	local jumping = ply:KeyDown(IN_JUMP) -- 33
	if not (ply:Alive() and (ply:Team() == TEAM_GHOST) and sprinting and jumping) then -- 35
		return -- 35
	end -- 35
	local speed = 384 -- 36
	move:SetVelocity(ply:GetAimVector() * speed) -- 37
	return -- 39
end -- 31
hook.Add("Move", "evilrp_ghost_flying", ghost_flying) -- 41
local ghost_spawn_effect -- 43
ghost_spawn_effect = function(ply, prev_team, t) -- 43
	if prev_team == TEAM_GHOST then -- 44
		local pos = ply:GetPos() -- 45
		local ed = EffectData() -- 46
		ed:SetOrigin(pos) -- 48
		ed:SetEntity(ply) -- 49
		ed:SetScale(5) -- 50
		util.Effect("LFR_PlayerSpawnEffect", ed) -- 51
	end -- 44
	return -- 53
end -- 43
hook.Add("OnPlayerChangedTeam", "evilrp_ghost_spawn_effect", ghost_spawn_effect) -- 55
local ghost_dont_footstep -- 57
ghost_dont_footstep = function(ply) -- 57
	local team = ply:Team() -- 58
	if team == TEAM_GHOST then -- 59
		return true -- 60
	end -- 59
	return -- 61
end -- 57
return hook.Add("PlayerFootstep", "evilrp_ghost_footstep", ghost_dont_footstep) -- 63
