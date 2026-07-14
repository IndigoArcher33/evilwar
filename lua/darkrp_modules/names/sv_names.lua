local spawn_set_name
spawn_set_name = function(ply)
	local jt = ply:getJobTable()
	local name = ""
	if jt.GenerateName then
		name = jt:GenerateName(ply)
	else
		local first_name
		local last_name
		if jt.first_names then
			local fnames = jt.first_names
			do
				local _exp_0 = type(fnames)
				if "string" == _exp_0 then
					first_name = fnames
				elseif "table" == _exp_0 then
					first_name = fnames[math.random(1, #fnames)]
				end
			end
		end
		if jt.last_names then
			local lnames = jt.last_names
			do
				local _exp_0 = type(lnames)
				if "string" == _exp_0 then
					last_name = lnames
				elseif "table" == _exp_0 then
					last_name = lnames[math.random(1, #lnames)]
				end
			end
		end
		name = tostring(first_name) .. " " .. tostring(last_name or '')
		name = string.Trim(name)
		if jt.special_name then
			if math.random(1, jt.special_name_chance) == 1 then
				name = jt.special_name
			end
		end
	end
	ply:setDarkRPVar("rpname", name)
	ply:Notify("<rgb=3,10,30>" .. tostring(name) .. "</rgb> is my name.")
	local hint = jt.hint
	if hint then
		ply:Notify("<rgb=3,10,30>" .. tostring(hint))
	end
	return
end
return hook.Add("PlayerLoadout", "evilrp_spawn_name", spawn_set_name)
