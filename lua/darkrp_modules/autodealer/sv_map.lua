-- [yue]: darkrp_modules\autodealer\sv_map.yue
local create_autodealers -- 1
create_autodealers = function() -- 1
	local EVIL_AUTODEALER_POSITIONS = { -- 3
		["rp_lymphoma"] = { -- 4
			{ -- 4
				pos = Vector(233, 1002, 253), -- 4
				ang = Angle(0, 0, 0) -- 5
			}, -- 4
			{ -- 6
				pos = Vector(600, 353, 49), -- 6
				ang = Angle(0, -180, -0) -- 7
			}, -- 6
			{ -- 8
				pos = Vector(1088, 505, 46), -- 8
				ang = Angle(0, 90, 0) -- 9
			}, -- 8
			{ -- 10
				pos = Vector(-576, 588, 100), -- 10
				ang = Angle(0, 0, 0) -- 11
			} -- 10
		} -- 3
	} -- 2
	local map = game.GetMap() -- 13
	if EVIL_AUTODEALER_POSITIONS[map] then -- 14
		local _list_0 = EVIL_AUTODEALER_POSITIONS[map] -- 15
		for _index_0 = 1, #_list_0 do -- 15
			local v = _list_0[_index_0] -- 15
			local sp = ents.Create("autodealer") -- 16
			sp:SetPos(v.pos) -- 18
			sp:SetAngles(v.ang) -- 19
			sp:Spawn() -- 20
			sp:Activate() -- 21
			sp:GetPhysicsObject():EnableMotion(false) -- 22
		end -- 22
	end -- 14
	return -- 23
end -- 1
return hook.Add("InitPostEntity", "evilrp_create_autodealers", create_autodealers) -- 25
