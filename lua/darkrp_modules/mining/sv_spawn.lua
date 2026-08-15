-- [yue]: darkrp_modules\mining\sv_spawn.yue
EVIL_NEXT_BOULDER = 0 -- 1
local EVIL_BOULDER_DELAY = 15 -- 2
local EVIL_BOULDER_MAX = 64 -- 3
local EVIL_SCRAP_MAX = 3 -- 4
local EVIL_SCRAP_POSITIONS = { -- 6
	["rp_lymphoma"] = { -- 7
		Vector(-1584, 2217, 265) -- 7
	} -- 6
} -- 5
local EVIL_BOULDER_POSITIONS = { -- 12
	["rp_lymphoma"] = { -- 13
		Vector(-1207, -1976, -643), -- 13
		Vector(-1554, -1991, -625), -- 14
		Vector(-1442, -2370, -625), -- 15
		Vector(-1512, -2561, -637), -- 16
		Vector(-1482, -2747, -618), -- 17
		Vector(-1283, -2744, -657), -- 18
		Vector(-952, -1844, -620) -- 19
	}, -- 12
	["rp_sorelane"] = { -- 22
		Vector(3585, 4741, 487), -- 22
		Vector(2610, 3874, 333), -- 23
		Vector(2030, 5385, 316), -- 24
		Vector(3789, 3758, 382), -- 25
		Vector(3392, 4128, 422), -- 26
		Vector(3357, 5306, 741), -- 27
		Vector(3804, 5650, 695), -- 28
		Vector(1842, 3925, 504) -- 29
	}, -- 21
	["rp_genova_redux_v1"] = { -- 32
		Vector(-14565, 14534, -560), -- 32
		Vector(-14850, 14285, -527), -- 33
		Vector(-13795, 14575, -561), -- 34
		Vector(-14022, 14122, -567), -- 35
		Vector(-14344, 14061, -600) -- 36
	}, -- 31
	["rp_slumtown"] = { -- 39
		Vector(-505, 2242, 810), -- 39
		Vector(-461, 2356, 789), -- 40
		Vector(-324, 2639, 789), -- 41
		Vector(-103, 2644, 810), -- 42
		Vector(160, 2612, 804), -- 43
		Vector(144, 2430, 810), -- 44
		Vector(80, 1825, 810), -- 45
		Vector(-256, 1939, 810), -- 46
		Vector(-375, 1990, 810), -- 47
		Vector(-521, 2068, 800), -- 48
		Vector(-610, 2179, 792), -- 49
		Vector(-706, 2151, 785), -- 50
		Vector(-705, 2029, 810), -- 51
		Vector(-528, 1910, 811), -- 52
		Vector(-366, 2119, 810), -- 53
		Vector(-166, 2077, 803), -- 54
		Vector(-528, 1910, 811), -- 55
		Vector(-521, 2068, 800) -- 56
	}, -- 38
	["rp_district_slums_v2"] = { -- 59
		Vector(9269, -307, 65), -- 59
		Vector(7907, -540, 177), -- 60
		Vector(7873, -267, 177), -- 61
		Vector(7753, -441, 178), -- 62
		Vector(8168, -459, 181), -- 63
		Vector(9075, -378, 190), -- 64
		Vector(9479, -390, 195), -- 65
		Vector(9563, -604, 196), -- 66
		Vector(9234, -89, 183), -- 67
		Vector(8161, 7711, 230), -- 68
		Vector(8293, 7153, 253), -- 69
		Vector(8060, 6601, 262), -- 70
		Vector(8990, 7042, 736) -- 71
	}, -- 58
	["rp_liverfailure_kidneydagger"] = { -- 74
		Vector(1103, -916, 83), -- 74
		Vector(1030, -874, 83), -- 75
		Vector(934, -890, 89), -- 76
		Vector(836, -829, 95), -- 77
		Vector(615, -854, 97), -- 78
		Vector(777, -885, 98), -- 79
		Vector(4494, -1075, 95), -- 80
		Vector(4432, -1087, 87), -- 81
		Vector(4398, -1143, 104), -- 82
		Vector(4313, -1146, 99), -- 83
		Vector(4340, -1042, 101), -- 84
		Vector(4284, -1077, 97), -- 85
		Vector(4143, 3549, 405), -- 86
		Vector(3976, 3234, 407), -- 87
		Vector(3660, 3359, 395), -- 88
		Vector(3876, 3646, 386), -- 89
		Vector(3276, 3546, 395), -- 90
		Vector(3367, 3173, 384) -- 91
	} -- 73
} -- 11
return hook.Add("Think", "evilrp_boulder_spawner", function() -- 95
	if CurTime() >= EVIL_NEXT_BOULDER then -- 96
		EVIL_NEXT_BOULDER = CurTime() + EVIL_BOULDER_DELAY + math.random(EVIL_BOULDER_DELAY) -- 97
		local boulders = ents.FindByClass("boulder") -- 98
		if #boulders < EVIL_BOULDER_MAX then -- 99
			local positions = EVIL_BOULDER_POSITIONS[game.GetMap()] -- 100
			local pos = positions[math.random(#positions)] -- 101
			local boulder = ents.Create("boulder") -- 102
			boulder:SetPos(pos) -- 104
			boulder:SetAngles(Angle(math.random(360), math.random(360), math.random(360))) -- 105
			boulder:Spawn() -- 106
			boulder:Activate() -- 107
			SafeRemoveEntityDelayed(boulder, 900) -- 109
		end -- 99
		local scraps = ents.FindByClass("scrap") -- 111
		if #scraps < EVIL_SCRAP_MAX then -- 112
			local positions = EVIL_SCRAP_POSITIONS[game.GetMap()] -- 113
			local pos = positions[math.random(#positions)] -- 114
			local scrap = ents.Create("scrap") -- 115
			scrap:SetPos(pos) -- 117
			scrap:SetAngles(Angle(math.random(360), math.random(360), math.random(360))) -- 118
			scrap:Spawn() -- 119
			scrap:Activate() -- 120
			scrap:EmitSound("ambient/machines/teleport3.wav", 100, 60 + math.random(20)) -- 121
			SafeRemoveEntityDelayed(scrap, 900) -- 122
		end -- 112
	end -- 96
	return -- 125
end) -- 125
