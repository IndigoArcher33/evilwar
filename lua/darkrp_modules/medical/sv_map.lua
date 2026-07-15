-- [yue]: darkrp_modules\medical\sv_map.yue
local create_autostitchers -- 1
create_autostitchers = function() -- 1
	local EVIL_AUTOSTITCHER_POSITIONS = { -- 3
		["rp_liverfailure_kidneydagger"] = { -- 4
			{ -- 4
				pos = Vector(-2200, 2233, 162), -- 4
				ang = Angle(0, 90, 0) -- 5
			}, -- 4
			{ -- 6
				pos = Vector(2570, 2233, 163), -- 6
				ang = Angle(0, 90, 0) -- 7
			}, -- 6
			{ -- 8
				pos = Vector(2625, 2468, 282), -- 8
				ang = Angle(-90, 0, 180) -- 9
			}, -- 8
			{ -- 10
				pos = Vector(2241, 2465, 282), -- 10
				ang = Angle(-90, 0, 180) -- 11
			}, -- 10
			{ -- 12
				pos = Vector(-1426, 1919, -72), -- 12
				ang = Angle(0, 0, 0) -- 13
			} -- 12
		}, -- 3
		["rp_lymphoma"] = { -- 15
			{ -- 15
				pos = Vector(1099, 795, 56), -- 15
				ang = Angle(0, -90, 0) -- 16
			}, -- 15
			{ -- 17
				pos = Vector(1219, 795, 56), -- 17
				ang = Angle(0, -90, 0) -- 18
			}, -- 17
			{ -- 19
				pos = Vector(1328, 795, 56), -- 19
				ang = Angle(0, -90, 0) -- 20
			} -- 19
		} -- 14
	} -- 2
	local map = game.GetMap() -- 22
	if EVIL_AUTOSTITCHER_POSITIONS[map] then -- 23
		local _list_0 = EVIL_AUTOSTITCHER_POSITIONS[map] -- 24
		for _index_0 = 1, #_list_0 do -- 24
			local v = _list_0[_index_0] -- 24
			local sp = ents.Create("autostitcher") -- 25
			sp:SetPos(v.pos) -- 27
			sp:SetAngles(v.ang) -- 28
			sp:Spawn() -- 29
			sp:Activate() -- 30
			sp:GetPhysicsObject():EnableMotion(false) -- 31
		end -- 31
	end -- 23
	return -- 32
end -- 1
return hook.Add("InitPostEntity", "evilrp_create_autostitchers", create_autostitchers) -- 34
