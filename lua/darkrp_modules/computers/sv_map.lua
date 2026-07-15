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
				pos = Vector(242, 225, 68), -- 7
				ang = Angle(0, -0, 0), -- 8
				cls = "terminal/public" -- 9
			}, -- 7
			{ -- 10
				pos = Vector(242, 352, 68), -- 10
				ang = Angle(0, -0, 0), -- 11
				cls = "terminal/public" -- 12
			} -- 10
		} -- 3
	} -- 2
	local map = game.GetMap() -- 14
	local _list_0 = ents.FindByClass("terminal*") -- 15
	for _index_0 = 1, #_list_0 do -- 15
		local computer = _list_0[_index_0] -- 15
		computer:Remove() -- 16
	end -- 16
	if EVIL_COMPUTER_POSITIONS[map] then -- 17
		local _list_1 = EVIL_COMPUTER_POSITIONS[map] -- 18
		for _index_0 = 1, #_list_1 do -- 18
			local v = _list_1[_index_0] -- 18
			local sp = ents.Create(v.cls) -- 19
			sp:SetPos(v.pos) -- 21
			sp:SetAngles(v.ang) -- 22
			sp:Spawn() -- 23
			sp:Activate() -- 24
			sp:GetPhysicsObject():EnableMotion(false) -- 25
			MsgC(Color(0, 200, 200), tostring(sp) .. " created.\n") -- 26
		end -- 27
	end -- 17
	return -- 28
end -- 1
return hook.Add("InitPostEntity", "evilrp_create_computers", create_computers) -- 30
