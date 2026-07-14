-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/hud/cl_doors.yue
local is_door -- 1
is_door = function(ent) -- 1
	local _exp_0 = ent:GetClass() -- 2
	if "func_door" == _exp_0 or "func_door_rotating" == _exp_0 or "prop_door_rotating" == _exp_0 or "func_movelinear" == _exp_0 or "prop_dynamic" == _exp_0 then -- 3
		return true -- 4
	else -- 6
		return false -- 6
	end -- 6
end -- 1
local change_door_access = false -- 8
local cross_text_doors -- 10
cross_text_doors = function(ent) -- 10
	local blocked = ent:getKeysNonOwnable() -- 11
	local door_teams = ent:getKeysDoorTeams() -- 12
	local door_group = ent:getKeysDoorGroup() -- 13
	local player_owned = ent:isKeysOwned() or table.GetFirstValue(ent:getKeysCoOwners() or { }) ~= nil -- 14
	local owned = player_owned or door_group or door_teams -- 15
	local door_info = { } -- 17
	local title = ent:getKeysTitle() -- 19
	if title then -- 20
		door_info[#door_info + 1] = title -- 20
	end -- 20
	if owned then -- 22
		door_info[#door_info + 1] = DarkRP.getPhrase("keys_owned_by") -- 22
	end -- 22
	if player_owned then -- 24
		if ent:isKeysOwned() then -- 25
			door_info[#door_info + 1] = ent:getDoorOwner():Nick() -- 25
		end -- 25
		for k in pairs(ent:getKeysCoOwners() or { }) do -- 26
			local _continue_0 = false -- 27
			repeat -- 27
				ent = Player(k) -- 27
				if not (IsValid(ent) and ent:IsPlayer()) then -- 28
					_continue_0 = true -- 28
					break -- 28
				end -- 28
				door_info[#door_info + 1] = ent:Nick() -- 29
				_continue_0 = true -- 27
			until true -- 29
			if not _continue_0 then -- 29
				break -- 29
			end -- 29
		end -- 29
		local allowed_co_own = ent:getKeysAllowedToOwn() -- 31
		if allowed_co_own and not fn.Null(allowed_co_own) then -- 32
			door_info[#door_info + 1] = DarkRP.getPhrase("keys_other_allowed") -- 33
			for k in pairs(allowed_co_own) do -- 35
				local _continue_0 = false -- 36
				repeat -- 36
					ent = Player(k) -- 36
					if not (IsValid(ent) and ent:IsPlayer()) then -- 37
						_continue_0 = true -- 37
						break -- 37
					end -- 37
					door_info[#door_info + 1] = ent:Nick() -- 38
					_continue_0 = true -- 36
				until true -- 38
				if not _continue_0 then -- 38
					break -- 38
				end -- 38
			end -- 38
		end -- 32
	elseif door_group then -- 39
		door_info[#door_info + 1] = door_group -- 40
	elseif door_teams then -- 41
		for k, v in pairs(door_teams) do -- 42
			local _continue_0 = false -- 43
			repeat -- 43
				if not (v and RPExtraTeams[k]) then -- 43
					_continue_0 = true -- 43
					break -- 43
				end -- 43
				door_info[#door_info + 1] = RPExtraTeams[k].name -- 44
				_continue_0 = true -- 43
			until true -- 44
			if not _continue_0 then -- 44
				break -- 44
			end -- 44
		end -- 44
	elseif blocked and change_door_access then -- 45
		door_info[#door_info + 1] = DarkRP.getPhrase("keys_allow_ownership") -- 46
	elseif not blocked then -- 47
		door_info[#door_info + 1] = DarkRP.getPhrase("keys_unowned") -- 48
		if change_door_access then -- 49
			door_info[#door_info + 1] = DarkRP.getPhrase("keys_disallow_ownership") -- 49
		end -- 49
	end -- 24
	if ent:IsVehicle() then -- 51
		local driver = ent:GetDriver() -- 52
		if driver:IsPlayer() then -- 53
			door_info[#door_info + 1] = DarkRP.getPhrase("driver", driver:Nick()) -- 53
		end -- 53
	end -- 51
	return door_info -- 55
end -- 10
hook.Add("HUDDrawDoorData", "evilrp_draw_doordata", cross_text_doors) -- 57
local emeta = FindMetaTable("Entity") -- 59
emeta._HUDRender = function(self) -- 60
	if is_door(self) and self:isKeysOwnable() then -- 61
		return cross_text_doors(self) -- 62
	end -- 61
	if self:GetClass() == "prop_ragdoll" then -- 63
		return hud_render_ragdoll(self) -- 64
	end -- 63
	return { } -- 65
end -- 60
