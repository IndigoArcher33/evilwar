-- [yue]: darkrp_modules\mining\sv_spawn.yue
EVIL_NEXT_BOULDER = 0 -- 1
local EVIL_BOULDER_DELAY = 15 -- 2
local EVIL_BOULDER_MAX = 64 -- 3
local EVIL_BOULDER_POSITIONS = { -- 5
	["rp_lymphoma"] = { -- 6
		Vector(-1207, -1976, -643), -- 6
		Vector(-1554, -1991, -625), -- 7
		Vector(-1442, -2370, -625), -- 8
		Vector(-1512, -2561, -637), -- 9
		Vector(-1482, -2747, -618), -- 10
		Vector(-1283, -2744, -657), -- 11
		Vector(-952, -1844, -620) -- 12
	}, -- 5
	["rp_sorelane"] = { -- 15
		Vector(3585, 4741, 487), -- 15
		Vector(2610, 3874, 333), -- 16
		Vector(2030, 5385, 316), -- 17
		Vector(3789, 3758, 382), -- 18
		Vector(3392, 4128, 422), -- 19
		Vector(3357, 5306, 741), -- 20
		Vector(3804, 5650, 695), -- 21
		Vector(1842, 3925, 504) -- 22
	}, -- 14
	["rp_genova_redux_v1"] = { -- 25
		Vector(-14565, 14534, -560), -- 25
		Vector(-14850, 14285, -527), -- 26
		Vector(-13795, 14575, -561), -- 27
		Vector(-14022, 14122, -567), -- 28
		Vector(-14344, 14061, -600) -- 29
	}, -- 24
	["rp_slumtown"] = { -- 32
		Vector(-505, 2242, 810), -- 32
		Vector(-461, 2356, 789), -- 33
		Vector(-324, 2639, 789), -- 34
		Vector(-103, 2644, 810), -- 35
		Vector(160, 2612, 804), -- 36
		Vector(144, 2430, 810), -- 37
		Vector(80, 1825, 810), -- 38
		Vector(-256, 1939, 810), -- 39
		Vector(-375, 1990, 810), -- 40
		Vector(-521, 2068, 800), -- 41
		Vector(-610, 2179, 792), -- 42
		Vector(-706, 2151, 785), -- 43
		Vector(-705, 2029, 810), -- 44
		Vector(-528, 1910, 811), -- 45
		Vector(-366, 2119, 810), -- 46
		Vector(-166, 2077, 803), -- 47
		Vector(-528, 1910, 811), -- 48
		Vector(-521, 2068, 800) -- 49
	}, -- 31
	["rp_district_slums_v2"] = { -- 52
		Vector(9269, -307, 65), -- 52
		Vector(7907, -540, 177), -- 53
		Vector(7873, -267, 177), -- 54
		Vector(7753, -441, 178), -- 55
		Vector(8168, -459, 181), -- 56
		Vector(9075, -378, 190), -- 57
		Vector(9479, -390, 195), -- 58
		Vector(9563, -604, 196), -- 59
		Vector(9234, -89, 183), -- 60
		Vector(8161, 7711, 230), -- 61
		Vector(8293, 7153, 253), -- 62
		Vector(8060, 6601, 262), -- 63
		Vector(8990, 7042, 736) -- 64
	}, -- 51
	["rp_liverfailure_kidneydagger"] = { -- 67
		Vector(1103, -916, 83), -- 67
		Vector(1030, -874, 83), -- 68
		Vector(934, -890, 89), -- 69
		Vector(836, -829, 95), -- 70
		Vector(615, -854, 97), -- 71
		Vector(777, -885, 98), -- 72
		Vector(4494, -1075, 95), -- 73
		Vector(4432, -1087, 87), -- 74
		Vector(4398, -1143, 104), -- 75
		Vector(4313, -1146, 99), -- 76
		Vector(4340, -1042, 101), -- 77
		Vector(4284, -1077, 97), -- 78
		Vector(4143, 3549, 405), -- 79
		Vector(3976, 3234, 407), -- 80
		Vector(3660, 3359, 395), -- 81
		Vector(3876, 3646, 386), -- 82
		Vector(3276, 3546, 395), -- 83
		Vector(3367, 3173, 384) -- 84
	} -- 66
} -- 4
return hook.Add("Think", "evilrp_boulder_spawner", function() -- 88
	if CurTime() >= EVIL_NEXT_BOULDER then -- 89
		EVIL_NEXT_BOULDER = CurTime() + EVIL_BOULDER_DELAY + math.random(EVIL_BOULDER_DELAY) -- 90
		local boulders = ents.FindByClass("boulder") -- 91
		if #boulders < EVIL_BOULDER_MAX then -- 92
			local positions = EVIL_BOULDER_POSITIONS[game.GetMap()] -- 93
			local pos = positions[math.random(#positions)] -- 94
			local boulder = ents.Create("boulder") -- 95
			boulder:SetPos(pos) -- 97
			boulder:SetAngles(Angle(math.random(360), math.random(360), math.random(360))) -- 98
			boulder:Spawn() -- 99
			boulder:Activate() -- 100
			SafeRemoveEntityDelayed(boulder, 900) -- 102
		end -- 92
	end -- 89
	return -- 104
end) -- 104
