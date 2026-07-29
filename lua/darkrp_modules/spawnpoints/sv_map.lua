-- [yue]: darkrp_modules\spawnpoints\sv_map.yue
local create_spawnpoints -- 1
create_spawnpoints = function() -- 1
	local EVIL_SPAWN_POSITIONS = { -- 3
		["rp_lymphoma"] = { -- 4
			{ -- 4
				pos = Vector(422, 275, 29), -- 4
				job = TEAM_PRIVATE -- 5
			}, -- 4
			{ -- 6
				pos = Vector(3, 1305, 1), -- 6
				job = TEAM_PRIVATE -- 7
			}, -- 6
			{ -- 8
				pos = Vector(-1153, 898, 1), -- 8
				job = TEAM_PRIVATE -- 9
			}, -- 8
			{ -- 10
				pos = Vector(412, -234, 199), -- 10
				job = TEAM_SANITAR -- 11
			}, -- 10
			{ -- 12
				pos = Vector(1283, 681, 1), -- 12
				job = TEAM_KORPSMAN -- 13
			}, -- 12
			{ -- 14
				pos = Vector(403, 981, 234), -- 14
				job = TEAM_EMPEROR -- 15
			}, -- 14
			{ -- 16
				pos = Vector(525, -7046, -786), -- 16
				job = TEAM_STALKER -- 17
			}, -- 16
			{ -- 18
				pos = Vector(-461, 830, 80), -- 18
				job = TEAM_DEALER -- 19
			} -- 18
		}, -- 3
		["rp_slumtown"] = { -- 21
			{ -- 21
				pos = Vector(251, 47, 137), -- 21
				job = TEAM_PRIVATE -- 22
			}, -- 21
			{ -- 23
				pos = Vector(-865, 193, 1), -- 23
				job = TEAM_PRIVATE -- 24
			}, -- 23
			{ -- 25
				pos = Vector(541, -65, 1), -- 25
				job = TEAM_PRIVATE -- 26
			}, -- 25
			{ -- 27
				pos = Vector(-138, 627, 1), -- 27
				job = TEAM_PRIVATE -- 28
			}, -- 27
			{ -- 29
				pos = Vector(-807, 1577, 129), -- 29
				job = TEAM_PRIVATE -- 30
			}, -- 29
			{ -- 31
				pos = Vector(-629, 774, 1), -- 31
				job = TEAM_PRIVATE -- 32
			}, -- 31
			{ -- 33
				pos = Vector(551, 168, 137), -- 33
				job = TEAM_PRIVATE -- 34
			}, -- 33
			{ -- 35
				pos = Vector(385, 423, 1), -- 35
				job = TEAM_PRIVATE -- 36
			}, -- 35
			{ -- 37
				pos = Vector(-773, -417, 129), -- 37
				job = TEAM_SANITAR -- 38
			}, -- 37
			{ -- 39
				pos = Vector(-773, -446, 1), -- 39
				job = TEAM_SANITAR -- 40
			} -- 39
		}, -- 20
		["rp_district_slums_v2"] = { -- 42
			{ -- 42
				pos = Vector(3414, 1980, 193), -- 42
				job = TEAM_PRIVATE -- 43
			}, -- 42
			{ -- 44
				pos = Vector(4923, 5067, 161), -- 44
				job = TEAM_PRIVATE -- 45
			}, -- 44
			{ -- 46
				pos = Vector(8573, -1276, 177), -- 46
				job = TEAM_PRIVATE -- 47
			}, -- 46
			{ -- 48
				pos = Vector(7629, 2628, 193), -- 48
				job = TEAM_PRIVATE -- 49
			} -- 48
		}, -- 41
		["rp_beta17"] = { -- 51
			{ -- 51
				pos = Vector(-3172, -406, 17), -- 51
				job = TEAM_PRIVATE -- 52
			}, -- 51
			{ -- 53
				pos = Vector(-92, -179, 1), -- 53
				job = TEAM_PRIVATE -- 54
			}, -- 53
			{ -- 55
				pos = Vector(-92, -273, 1), -- 55
				job = TEAM_PRIVATE -- 56
			} -- 55
		}, -- 50
		["rp_central17_v4"] = { -- 58
			{ -- 58
				pos = Vector(-1182, 859, -1064), -- 58
				job = TEAM_PRIVATE -- 59
			} -- 58
		}, -- 57
		["rp_liverfailure_kidneydagger"] = { -- 61
			{ -- 61
				pos = Vector(5724, 1175, 256), -- 61
				job = TEAM_EMPEROR -- 62
			}, -- 61
			{ -- 63
				pos = Vector(3768, 4313, 100), -- 63
				job = TEAM_PRIVATE -- 64
			}, -- 63
			{ -- 65
				pos = Vector(3555, 2199, 100), -- 65
				job = TEAM_PRIVATE -- 66
			}, -- 65
			{ -- 67
				pos = Vector(-386, 1735, 100), -- 67
				job = TEAM_PRIVATE -- 68
			}, -- 67
			{ -- 69
				pos = Vector(2182, 909, 40), -- 69
				job = TEAM_PRIVATE -- 70
			}, -- 69
			{ -- 71
				pos = Vector(4398, 383, 100), -- 71
				job = TEAM_PRIVATE -- 72
			}, -- 71
			{ -- 73
				pos = Vector(5818, 3053, 100), -- 73
				job = TEAM_PRIVATE -- 74
			}, -- 73
			{ -- 75
				pos = Vector(295, -498, 100), -- 75
				job = TEAM_PRIVATE -- 76
			}, -- 75
			{ -- 77
				pos = Vector(2918, 464, 360), -- 77
				job = TEAM_PRIVATE -- 78
			}, -- 77
			{ -- 79
				pos = Vector(1100, -474, 100), -- 79
				job = TEAM_PRIVATE -- 80
			}, -- 79
			{ -- 81
				pos = Vector(3442, 2813, 100), -- 81
				job = TEAM_PRIVATE -- 82
			}, -- 81
			{ -- 83
				pos = Vector(5975, 2071, 65), -- 83
				job = TEAM_PRIVATE -- 84
			}, -- 83
			{ -- 85
				pos = Vector(4353, 2742, 100), -- 85
				job = TEAM_SANITAR -- 86
			}, -- 85
			{ -- 87
				pos = Vector(4851, 340, 100), -- 87
				job = TEAM_SANITAR -- 88
			}, -- 87
			{ -- 89
				pos = Vector(4479, 1016, 105), -- 89
				job = TEAM_SANITAR -- 90
			}, -- 89
			{ -- 91
				pos = Vector(4597, 1219, 369), -- 91
				job = TEAM_SANITAR -- 92
			}, -- 91
			{ -- 93
				pos = Vector(2517, 1668, 321), -- 93
				job = TEAM_SANITAR -- 94
			}, -- 93
			{ -- 95
				pos = Vector(-1302, 1944, -100), -- 95
				job = TEAM_KORPSMAN -- 96
			}, -- 95
			{ -- 97
				pos = Vector(2848, 2097, 150), -- 97
				job = TEAM_KORPSMAN -- 98
			}, -- 97
			{ -- 99
				pos = Vector(5568, 1969, 264), -- 99
				job = TEAM_KORPSMAN -- 100
			} -- 99
		} -- 60
	} -- 2
	local _list_0 = ents.FindByClass("portal/spawn") -- 102
	for _index_0 = 1, #_list_0 do -- 102
		local portal = _list_0[_index_0] -- 102
		portal:Remove() -- 103
	end -- 103
	MsgC(Color(200, 200, 0), "Preparing to create spawnpoints.\n") -- 104
	local map = game.GetMap() -- 105
	if EVIL_SPAWN_POSITIONS[map] then -- 106
		local _list_1 = EVIL_SPAWN_POSITIONS[map] -- 107
		for _index_0 = 1, #_list_1 do -- 107
			local v = _list_1[_index_0] -- 107
			local sp = ents.Create(v.cls or "portal/spawn") -- 108
			sp:SetPos(v.pos) -- 110
			sp:SetFate(v.job) -- 111
			sp:Spawn() -- 112
			sp:Activate() -- 113
			sp:GetPhysicsObject():EnableMotion(false) -- 114
			MsgC(Color(0, 200, 0), tostring(sp) .. " created for '", Color(200, 200, 200), RPExtraTeams[v.job].name, Color(0, 200, 0), "'.\n") -- 115
		end -- 120
	end -- 106
	return -- 121
end -- 1
return hook.Add("InitPostEntity", "evilrp_create_spawnpoints", create_spawnpoints) -- 123
