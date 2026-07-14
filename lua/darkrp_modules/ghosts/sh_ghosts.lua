local Startled
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = (function()
			local _accum_0 = { }
			local _len_0 = 1
			for i = 1, 2 do
				_accum_0[_len_0] = "vo/npc/male01/startle0" .. tostring(i) .. ".wav"
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
		__name = "Startled",
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
	Startled = _class_0
end
local enable_custom_collisions
enable_custom_collisions = function(ply)
	ply:SetCustomCollisionCheck(true)
	return
end
hook.Add("PlayerInitialSpawn", "evilrp_custom_player_collisions", enable_custom_collisions)
local ghost_collision
ghost_collision = function(e_one, e_two)
	if e_one:IsPlayer() and e_one:Team() == TEAM_GHOST then
		return false
	end
	if e_two:IsPlayer() and e_two:Team() == TEAM_GHOST then
		return false
	end
	return
end
hook.Add("ShouldCollide", "evilrp_ghost_collision", ghost_collision)
local set_ghost_fx
set_ghost_fx = function(ply)
	do
		local _exp_0 = ply:Team()
		if TEAM_GHOST == _exp_0 then
			ply:SetRenderFX(16)
			ply:SetMaterial("effects/tp_eyefx/tpeye")
			ply:SetDSP(4)
		else
			ply:SetRenderFX(0)
			ply:SetMaterial(nil)
			ply:SetDSP(0)
		end
	end
	return
end
hook.Add("PlayerLoadout", "evilrp_ghost_fx", set_ghost_fx)
local ghost_flying
ghost_flying = function(ply, move)
	local sprinting = ply:KeyDown(IN_SPEED)
	local jumping = ply:KeyDown(IN_JUMP)
	if not (ply:Alive() and (ply:Team() == TEAM_GHOST) and sprinting and jumping) then
		return
	end
	local speed = 384
	move:SetVelocity(ply:GetAimVector() * speed)
	return
end
hook.Add("Move", "evilrp_ghost_flying", ghost_flying)
local ghost_spawn_effect
ghost_spawn_effect = function(ply, prev_team, t)
	if prev_team == TEAM_GHOST then
		local pos = ply:GetPos()
		local ed = EffectData()
		ed:SetOrigin(pos)
		ed:SetEntity(ply)
		ed:SetScale(5)
		util.Effect("LFR_PlayerSpawnEffect", ed)
	end
	return
end
hook.Add("OnPlayerChangedTeam", "evilrp_ghost_spawn_effect", ghost_spawn_effect)
local ghost_dont_footstep
ghost_dont_footstep = function(ply)
	local team = ply:Team()
	if team == TEAM_GHOST then
		return true
	end
	return
end
return hook.Add("PlayerFootstep", "evilrp_ghost_footstep", ghost_dont_footstep)
