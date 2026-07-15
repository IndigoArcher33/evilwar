-- [yue]: darkrp_modules\names\sv_names.yue
local spawn_set_name -- 1
spawn_set_name = function(ply) -- 1
	local jt = ply:getJobTable() -- 2
	local name = "" -- 3
	if jt.GenerateName then -- 4
		name = jt:GenerateName(ply) -- 5
	else -- 7
		local first_name -- 7
		local last_name -- 8
		if jt.first_names then -- 9
			local fnames = jt.first_names -- 10
			do -- 11
				local _exp_0 = type(fnames) -- 11
				if "string" == _exp_0 then -- 12
					first_name = fnames -- 13
				elseif "table" == _exp_0 then -- 14
					first_name = fnames[math.random(1, #fnames)] -- 15
				end -- 15
			end -- 15
		end -- 9
		if jt.last_names then -- 16
			local lnames = jt.last_names -- 17
			do -- 18
				local _exp_0 = type(lnames) -- 18
				if "string" == _exp_0 then -- 19
					last_name = lnames -- 20
				elseif "table" == _exp_0 then -- 21
					last_name = lnames[math.random(1, #lnames)] -- 22
				end -- 22
			end -- 22
		end -- 16
		name = tostring(first_name) .. " " .. tostring(last_name or '') -- 23
		name = string.Trim(name) -- 24
		if jt.special_name then -- 25
			if math.random(1, jt.special_name_chance) == 1 then -- 26
				name = jt.special_name -- 27
			end -- 26
		end -- 25
	end -- 4
	ply:setDarkRPVar("rpname", name) -- 28
	ply:Notify("<rgb=3,10,30>" .. tostring(name) .. "</rgb> is my name.") -- 29
	local hint = jt.hint -- 30
	if hint then -- 31
		ply:Notify("<rgb=3,10,30>" .. tostring(hint)) -- 32
	end -- 31
	return -- 33
end -- 1
return hook.Add("PlayerLoadout", "evilrp_spawn_name", spawn_set_name) -- 35
