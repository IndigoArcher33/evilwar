-- [yue]: darkrp_modules\computers\sv_map.yue
local create_computers -- 1
create_computers = function() -- 1
	local EVIL_COMPUTER_POSITIONS = { -- 3
		["rp_lymphoma"] = { -- 4
			{ -- 4
				pos = Vector(486, 910, 261), -- 4
				ang = Angle(1, 112, -0), -- 5
				cls = "terminal/xombokom" -- 6
			}, -- 4
			{ -- 7
				pos = Vector(-432, -304, 363), -- 7
				ang = Angle(0, -2, 0), -- 8
				cls = "terminal/polemarch" -- 9
			}, -- 7
			{ -- 10
				pos = Vector(242, 225, 68), -- 10
				ang = Angle(0, -0, 0), -- 11
				cls = "terminal/public" -- 12
			}, -- 10
			{ -- 13
				pos = Vector(242, 352, 68), -- 13
				ang = Angle(0, -0, 0), -- 14
				cls = "terminal/public" -- 15
			} -- 13
		} -- 3
	} -- 2
	local map = game.GetMap() -- 17
	local _list_0 = ents.FindByClass("terminal*") -- 18
	for _index_0 = 1, #_list_0 do -- 18
		local computer = _list_0[_index_0] -- 18
		computer:Remove() -- 19
	end -- 19
	if EVIL_COMPUTER_POSITIONS[map] then -- 20
		local _list_1 = EVIL_COMPUTER_POSITIONS[map] -- 21
		for _index_0 = 1, #_list_1 do -- 21
			local v = _list_1[_index_0] -- 21
			local sp = ents.Create(v.cls) -- 22
			sp:SetPos(v.pos) -- 24
			sp:SetAngles(v.ang) -- 25
			sp:Spawn() -- 26
			sp:Activate() -- 27
			sp:GetPhysicsObject():EnableMotion(false) -- 28
			MsgC(Color(0, 200, 200), tostring(sp) .. " created.\n") -- 29
		end -- 30
	end -- 20
	return -- 31
end -- 1
return hook.Add("InitPostEntity", "evilrp_create_computers", create_computers) -- 33
