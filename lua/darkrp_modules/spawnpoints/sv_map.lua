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
				job = TEAM_KOMMANDANT -- 15
			} -- 14
		}, -- 3
		["rp_slumtown"] = { -- 17
			{ -- 17
				pos = Vector(251, 47, 137), -- 17
				job = TEAM_PRIVATE -- 18
			}, -- 17
			{ -- 19
				pos = Vector(-865, 193, 1), -- 19
				job = TEAM_PRIVATE -- 20
			}, -- 19
			{ -- 21
				pos = Vector(541, -65, 1), -- 21
				job = TEAM_PRIVATE -- 22
			}, -- 21
			{ -- 23
				pos = Vector(-138, 627, 1), -- 23
				job = TEAM_PRIVATE -- 24
			}, -- 23
			{ -- 25
				pos = Vector(-807, 1577, 129), -- 25
				job = TEAM_PRIVATE -- 26
			}, -- 25
			{ -- 27
				pos = Vector(-629, 774, 1), -- 27
				job = TEAM_PRIVATE -- 28
			}, -- 27
			{ -- 29
				pos = Vector(551, 168, 137), -- 29
				job = TEAM_PRIVATE -- 30
			}, -- 29
			{ -- 31
				pos = Vector(385, 423, 1), -- 31
				job = TEAM_PRIVATE -- 32
			}, -- 31
			{ -- 33
				pos = Vector(-773, -417, 129), -- 33
				job = TEAM_SANITAR -- 34
			}, -- 33
			{ -- 35
				pos = Vector(-773, -446, 1), -- 35
				job = TEAM_SANITAR -- 36
			} -- 35
		}, -- 16
		["rp_district_slums_v2"] = { -- 38
			{ -- 38
				pos = Vector(3414, 1980, 193), -- 38
				job = TEAM_PRIVATE -- 39
			}, -- 38
			{ -- 40
				pos = Vector(4923, 5067, 161), -- 40
				job = TEAM_PRIVATE -- 41
			}, -- 40
			{ -- 42
				pos = Vector(8573, -1276, 177), -- 42
				job = TEAM_PRIVATE -- 43
			}, -- 42
			{ -- 44
				pos = Vector(7629, 2628, 193), -- 44
				job = TEAM_PRIVATE -- 45
			} -- 44
		}, -- 37
		["rp_beta17"] = { -- 47
			{ -- 47
				pos = Vector(-3172, -406, 17), -- 47
				job = TEAM_PRIVATE -- 48
			}, -- 47
			{ -- 49
				pos = Vector(-92, -179, 1), -- 49
				job = TEAM_PRIVATE -- 50
			}, -- 49
			{ -- 51
				pos = Vector(-92, -273, 1), -- 51
				job = TEAM_PRIVATE -- 52
			} -- 51
		}, -- 46
		["rp_central17_v4"] = { -- 54
			{ -- 54
				pos = Vector(-1182, 859, -1064), -- 54
				job = TEAM_PRIVATE -- 55
			} -- 54
		}, -- 53
		["rp_liverfailure_kidneydagger"] = { -- 57
			{ -- 57
				pos = Vector(5724, 1175, 256), -- 57
				job = TEAM_KOMMANDANT -- 58
			}, -- 57
			{ -- 59
				pos = Vector(3768, 4313, 100), -- 59
				job = TEAM_PRIVATE -- 60
			}, -- 59
			{ -- 61
				pos = Vector(3555, 2199, 100), -- 61
				job = TEAM_PRIVATE -- 62
			}, -- 61
			{ -- 63
				pos = Vector(-386, 1735, 100), -- 63
				job = TEAM_PRIVATE -- 64
			}, -- 63
			{ -- 65
				pos = Vector(2182, 909, 40), -- 65
				job = TEAM_PRIVATE -- 66
			}, -- 65
			{ -- 67
				pos = Vector(4398, 383, 100), -- 67
				job = TEAM_PRIVATE -- 68
			}, -- 67
			{ -- 69
				pos = Vector(5818, 3053, 100), -- 69
				job = TEAM_PRIVATE -- 70
			}, -- 69
			{ -- 71
				pos = Vector(295, -498, 100), -- 71
				job = TEAM_PRIVATE -- 72
			}, -- 71
			{ -- 73
				pos = Vector(2918, 464, 360), -- 73
				job = TEAM_PRIVATE -- 74
			}, -- 73
			{ -- 75
				pos = Vector(1100, -474, 100), -- 75
				job = TEAM_PRIVATE -- 76
			}, -- 75
			{ -- 77
				pos = Vector(3442, 2813, 100), -- 77
				job = TEAM_PRIVATE -- 78
			}, -- 77
			{ -- 79
				pos = Vector(5975, 2071, 65), -- 79
				job = TEAM_PRIVATE -- 80
			}, -- 79
			{ -- 81
				pos = Vector(4353, 2742, 100), -- 81
				job = TEAM_SANITAR -- 82
			}, -- 81
			{ -- 83
				pos = Vector(4851, 340, 100), -- 83
				job = TEAM_SANITAR -- 84
			}, -- 83
			{ -- 85
				pos = Vector(4479, 1016, 105), -- 85
				job = TEAM_SANITAR -- 86
			}, -- 85
			{ -- 87
				pos = Vector(4597, 1219, 369), -- 87
				job = TEAM_SANITAR -- 88
			}, -- 87
			{ -- 89
				pos = Vector(2517, 1668, 321), -- 89
				job = TEAM_SANITAR -- 90
			}, -- 89
			{ -- 91
				pos = Vector(-1302, 1944, -100), -- 91
				job = TEAM_KORPSMAN -- 92
			}, -- 91
			{ -- 93
				pos = Vector(2848, 2097, 150), -- 93
				job = TEAM_KORPSMAN -- 94
			}, -- 93
			{ -- 95
				pos = Vector(5568, 1969, 264), -- 95
				job = TEAM_KORPSMAN -- 96
			} -- 95
		} -- 56
	} -- 2
	local _list_0 = ents.FindByClass("portal/spawn") -- 98
	for _index_0 = 1, #_list_0 do -- 98
		local portal = _list_0[_index_0] -- 98
		portal:Remove() -- 99
	end -- 99
	MsgC(Color(200, 200, 0), "Preparing to create spawnpoints.\n") -- 100
	local map = game.GetMap() -- 101
	if EVIL_SPAWN_POSITIONS[map] then -- 102
		local _list_1 = EVIL_SPAWN_POSITIONS[map] -- 103
		for _index_0 = 1, #_list_1 do -- 103
			local v = _list_1[_index_0] -- 103
			local sp = ents.Create(v.cls or "portal/spawn") -- 104
			sp:SetPos(v.pos) -- 106
			sp:SetFate(v.job) -- 107
			sp:Spawn() -- 108
			sp:Activate() -- 109
			sp:GetPhysicsObject():EnableMotion(false) -- 110
			MsgC(Color(0, 200, 0), tostring(sp) .. " created for '", Color(200, 200, 200), RPExtraTeams[v.job].name, Color(0, 200, 0), "'.\n") -- 111
		end -- 116
	end -- 102
	return -- 117
end -- 1
return hook.Add("InitPostEntity", "evilrp_create_spawnpoints", create_spawnpoints) -- 119
