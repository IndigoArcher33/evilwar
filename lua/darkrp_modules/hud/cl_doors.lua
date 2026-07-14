local is_door
is_door = function(ent)
	local _exp_0 = ent:GetClass()
	if "func_door" == _exp_0 or "func_door_rotating" == _exp_0 or "prop_door_rotating" == _exp_0 or "func_movelinear" == _exp_0 or "prop_dynamic" == _exp_0 then
		return true
	else
		return false
	end
end
local change_door_access = false
local cross_text_doors
cross_text_doors = function(ent)
	local blocked = ent:getKeysNonOwnable()
	local door_teams = ent:getKeysDoorTeams()
	local door_group = ent:getKeysDoorGroup()
	local player_owned = ent:isKeysOwned() or table.GetFirstValue(ent:getKeysCoOwners() or { }) ~= nil
	local owned = player_owned or door_group or door_teams
	local door_info = { }
	local title = ent:getKeysTitle()
	if title then
		door_info[#door_info + 1] = title
	end
	if owned then
		door_info[#door_info + 1] = DarkRP.getPhrase("keys_owned_by")
	end
	if player_owned then
		if ent:isKeysOwned() then
			door_info[#door_info + 1] = ent:getDoorOwner():Nick()
		end
		for k in pairs(ent:getKeysCoOwners() or { }) do
			ent = Player(k)
			if not (IsValid(ent) and ent:IsPlayer()) then
				goto _continue_0
			end
			door_info[#door_info + 1] = ent:Nick()
			::_continue_0::
		end
		local allowed_co_own = ent:getKeysAllowedToOwn()
		if allowed_co_own and not fn.Null(allowed_co_own) then
			door_info[#door_info + 1] = DarkRP.getPhrase("keys_other_allowed")
			for k in pairs(allowed_co_own) do
				ent = Player(k)
				if not (IsValid(ent) and ent:IsPlayer()) then
					goto _continue_1
				end
				door_info[#door_info + 1] = ent:Nick()
				::_continue_1::
			end
		end
	elseif door_group then
		door_info[#door_info + 1] = door_group
	elseif door_teams then
		for k, v in pairs(door_teams) do
			if not (v and RPExtraTeams[k]) then
				goto _continue_2
			end
			door_info[#door_info + 1] = RPExtraTeams[k].name
			::_continue_2::
		end
	elseif blocked and change_door_access then
		door_info[#door_info + 1] = DarkRP.getPhrase("keys_allow_ownership")
	elseif not blocked then
		door_info[#door_info + 1] = DarkRP.getPhrase("keys_unowned")
		if change_door_access then
			door_info[#door_info + 1] = DarkRP.getPhrase("keys_disallow_ownership")
		end
	end
	if ent:IsVehicle() then
		local driver = ent:GetDriver()
		if driver:IsPlayer() then
			door_info[#door_info + 1] = DarkRP.getPhrase("driver", driver:Nick())
		end
	end
	return door_info
end
hook.Add("HUDDrawDoorData", "evilrp_draw_doordata", cross_text_doors)
local emeta = FindMetaTable("Entity")
emeta._HUDRender = function(self)
	if is_door(self) and self:isKeysOwnable() then
		return cross_text_doors(self)
	end
	if self:GetClass() == "prop_ragdoll" then
		return hud_render_ragdoll(self)
	end
	return { }
end
