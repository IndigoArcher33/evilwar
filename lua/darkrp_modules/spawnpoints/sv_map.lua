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
				pos = Vector(467, -7023, -886), -- 16
				job = TEAM_STALKER -- 17
			}, -- 16
			{ -- 18
				pos = Vector(-461, 830, 80), -- 18
				job = TEAM_DEALER -- 19
			}, -- 18
			{ -- 20
				pos = Vector(5593, -8336, -40), -- 20
				job = TEAM_BONEHEAD -- 21
			} -- 20
		}, -- 3
		["rp_slumtown"] = { -- 23
			{ -- 23
				pos = Vector(251, 47, 137), -- 23
				job = TEAM_PRIVATE -- 24
			}, -- 23
			{ -- 25
				pos = Vector(-865, 193, 1), -- 25
				job = TEAM_PRIVATE -- 26
			}, -- 25
			{ -- 27
				pos = Vector(541, -65, 1), -- 27
				job = TEAM_PRIVATE -- 28
			}, -- 27
			{ -- 29
				pos = Vector(-138, 627, 1), -- 29
				job = TEAM_PRIVATE -- 30
			}, -- 29
			{ -- 31
				pos = Vector(-807, 1577, 129), -- 31
				job = TEAM_PRIVATE -- 32
			}, -- 31
			{ -- 33
				pos = Vector(-629, 774, 1), -- 33
				job = TEAM_PRIVATE -- 34
			}, -- 33
			{ -- 35
				pos = Vector(551, 168, 137), -- 35
				job = TEAM_PRIVATE -- 36
			}, -- 35
			{ -- 37
				pos = Vector(385, 423, 1), -- 37
				job = TEAM_PRIVATE -- 38
			}, -- 37
			{ -- 39
				pos = Vector(-773, -417, 129), -- 39
				job = TEAM_SANITAR -- 40
			}, -- 39
			{ -- 41
				pos = Vector(-773, -446, 1), -- 41
				job = TEAM_SANITAR -- 42
			} -- 41
		}, -- 22
		["rp_district_slums_v2"] = { -- 44
			{ -- 44
				pos = Vector(3414, 1980, 193), -- 44
				job = TEAM_PRIVATE -- 45
			}, -- 44
			{ -- 46
				pos = Vector(4923, 5067, 161), -- 46
				job = TEAM_PRIVATE -- 47
			}, -- 46
			{ -- 48
				pos = Vector(8573, -1276, 177), -- 48
				job = TEAM_PRIVATE -- 49
			}, -- 48
			{ -- 50
				pos = Vector(7629, 2628, 193), -- 50
				job = TEAM_PRIVATE -- 51
			} -- 50
		}, -- 43
		["rp_beta17"] = { -- 53
			{ -- 53
				pos = Vector(-3172, -406, 17), -- 53
				job = TEAM_PRIVATE -- 54
			}, -- 53
			{ -- 55
				pos = Vector(-92, -179, 1), -- 55
				job = TEAM_PRIVATE -- 56
			}, -- 55
			{ -- 57
				pos = Vector(-92, -273, 1), -- 57
				job = TEAM_PRIVATE -- 58
			} -- 57
		}, -- 52
		["rp_central17_v4"] = { -- 60
			{ -- 60
				pos = Vector(-1182, 859, -1064), -- 60
				job = TEAM_PRIVATE -- 61
			} -- 60
		}, -- 59
		["rp_liverfailure_kidneydagger"] = { -- 63
			{ -- 63
				pos = Vector(5724, 1175, 256), -- 63
				job = TEAM_EMPEROR -- 64
			}, -- 63
			{ -- 65
				pos = Vector(3768, 4313, 100), -- 65
				job = TEAM_PRIVATE -- 66
			}, -- 65
			{ -- 67
				pos = Vector(3555, 2199, 100), -- 67
				job = TEAM_PRIVATE -- 68
			}, -- 67
			{ -- 69
				pos = Vector(-386, 1735, 100), -- 69
				job = TEAM_PRIVATE -- 70
			}, -- 69
			{ -- 71
				pos = Vector(2182, 909, 40), -- 71
				job = TEAM_PRIVATE -- 72
			}, -- 71
			{ -- 73
				pos = Vector(4398, 383, 100), -- 73
				job = TEAM_PRIVATE -- 74
			}, -- 73
			{ -- 75
				pos = Vector(5818, 3053, 100), -- 75
				job = TEAM_PRIVATE -- 76
			}, -- 75
			{ -- 77
				pos = Vector(295, -498, 100), -- 77
				job = TEAM_PRIVATE -- 78
			}, -- 77
			{ -- 79
				pos = Vector(2918, 464, 360), -- 79
				job = TEAM_PRIVATE -- 80
			}, -- 79
			{ -- 81
				pos = Vector(1100, -474, 100), -- 81
				job = TEAM_PRIVATE -- 82
			}, -- 81
			{ -- 83
				pos = Vector(3442, 2813, 100), -- 83
				job = TEAM_PRIVATE -- 84
			}, -- 83
			{ -- 85
				pos = Vector(5975, 2071, 65), -- 85
				job = TEAM_PRIVATE -- 86
			}, -- 85
			{ -- 87
				pos = Vector(4353, 2742, 100), -- 87
				job = TEAM_SANITAR -- 88
			}, -- 87
			{ -- 89
				pos = Vector(4851, 340, 100), -- 89
				job = TEAM_SANITAR -- 90
			}, -- 89
			{ -- 91
				pos = Vector(4479, 1016, 105), -- 91
				job = TEAM_SANITAR -- 92
			}, -- 91
			{ -- 93
				pos = Vector(4597, 1219, 369), -- 93
				job = TEAM_SANITAR -- 94
			}, -- 93
			{ -- 95
				pos = Vector(2517, 1668, 321), -- 95
				job = TEAM_SANITAR -- 96
			}, -- 95
			{ -- 97
				pos = Vector(-1302, 1944, -100), -- 97
				job = TEAM_KORPSMAN -- 98
			}, -- 97
			{ -- 99
				pos = Vector(2848, 2097, 150), -- 99
				job = TEAM_KORPSMAN -- 100
			}, -- 99
			{ -- 101
				pos = Vector(5568, 1969, 264), -- 101
				job = TEAM_KORPSMAN -- 102
			} -- 101
		} -- 62
	} -- 2
	local _list_0 = ents.FindByClass("portal/spawn") -- 105
	for _index_0 = 1, #_list_0 do -- 105
		local portal = _list_0[_index_0] -- 105
		portal:Remove() -- 106
	end -- 106
	MsgC(Color(200, 200, 0), "Preparing to create spawnpoints.\n") -- 107
	local map = game.GetMap() -- 108
	if EVIL_SPAWN_POSITIONS[map] then -- 109
		local _list_1 = EVIL_SPAWN_POSITIONS[map] -- 110
		for _index_0 = 1, #_list_1 do -- 110
			local v = _list_1[_index_0] -- 110
			local sp = ents.Create(v.cls or "portal/spawn") -- 111
			sp:SetPos(v.pos) -- 113
			sp:SetFate(v.job) -- 114
			sp:Spawn() -- 115
			sp:Activate() -- 116
			sp:GetPhysicsObject():EnableMotion(false) -- 117
			MsgC(Color(0, 200, 0), tostring(sp) .. " created for '", Color(200, 200, 200), RPExtraTeams[v.job].name, Color(0, 200, 0), "'.\n") -- 118
		end -- 123
	end -- 109
	return -- 124
end -- 1
return hook.Add("InitPostEntity", "evilrp_create_spawnpoints", create_spawnpoints) -- 126
