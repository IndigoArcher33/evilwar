-- [yue]: darkrp_modules\flesh\sv_spawn.yue
EVIL_NEXT_CAPSULE = 0 -- 2
local EVIL_CAPSULE_DELAY = 15 -- 3
local EVIL_CAPSULE_MAX = 64 -- 4
local EVIL_CAPSULE_POSITIONS = { -- 6
	["rp_lymphoma"] = { -- 7
		Vector(398, 1289, 305), -- 7
		Vector(242, 1263, 270), -- 8
		Vector(-667, 1225, 341), -- 9
		Vector(-487, 1303, 354), -- 10
		Vector(-372, 1268, 478), -- 11
		Vector(-31, 1330, 528), -- 12
		Vector(-8, 3302, 114), -- 13
		Vector(-834, 3188, 189) -- 14
	}, -- 6
	["rp_sorelane"] = { -- 18
		Vector(3585, 4741, 487), -- 18
		Vector(2610, 3874, 333), -- 19
		Vector(2030, 5385, 316), -- 20
		Vector(3789, 3758, 382), -- 21
		Vector(3392, 4128, 422), -- 22
		Vector(3357, 5306, 741), -- 23
		Vector(3804, 5650, 695), -- 24
		Vector(1842, 3925, 504) -- 25
	}, -- 17
	["rp_genova_redux_v1"] = { -- 28
		Vector(-14565, 14534, -560), -- 28
		Vector(-14850, 14285, -527), -- 29
		Vector(-13795, 14575, -561), -- 30
		Vector(-14022, 14122, -567), -- 31
		Vector(-14344, 14061, -600) -- 32
	}, -- 27
	["rp_slumtown"] = { -- 35
		Vector(-505, 2242, 810), -- 35
		Vector(-461, 2356, 789), -- 36
		Vector(-324, 2639, 789), -- 37
		Vector(-103, 2644, 810), -- 38
		Vector(160, 2612, 804), -- 39
		Vector(144, 2430, 810), -- 40
		Vector(80, 1825, 810), -- 41
		Vector(-256, 1939, 810), -- 42
		Vector(-375, 1990, 810), -- 43
		Vector(-521, 2068, 800), -- 44
		Vector(-610, 2179, 792), -- 45
		Vector(-706, 2151, 785), -- 46
		Vector(-705, 2029, 810), -- 47
		Vector(-528, 1910, 811), -- 48
		Vector(-366, 2119, 810), -- 49
		Vector(-166, 2077, 803), -- 50
		Vector(-528, 1910, 811), -- 51
		Vector(-521, 2068, 800) -- 52
	}, -- 34
	["rp_district_slums_v2"] = { -- 55
		Vector(9269, -307, 65), -- 55
		Vector(7907, -540, 177), -- 56
		Vector(7873, -267, 177), -- 57
		Vector(7753, -441, 178), -- 58
		Vector(8168, -459, 181), -- 59
		Vector(9075, -378, 190), -- 60
		Vector(9479, -390, 195), -- 61
		Vector(9563, -604, 196), -- 62
		Vector(9234, -89, 183), -- 63
		Vector(8161, 7711, 230), -- 64
		Vector(8293, 7153, 253), -- 65
		Vector(8060, 6601, 262), -- 66
		Vector(8990, 7042, 736) -- 67
	}, -- 54
	["rp_liverfailure_kidneydagger"] = { -- 70
		Vector(4979, 1398, 452), -- 70
		Vector(4791, 1449, 430), -- 71
		Vector(4451, 1446, 421), -- 72
		Vector(4117, 1411, 393), -- 73
		Vector(3913, 1337, 460), -- 74
		Vector(3877, 1014, 458), -- 75
		Vector(4101, 971, 445), -- 76
		Vector(4313, 907, 407), -- 77
		Vector(4623, 882, 389), -- 78
		Vector(4898, 880, 349), -- 79
		Vector(5137, 970, 478) -- 80
	} -- 69
} -- 5
return hook.Add("Think", "evilrp_capsule_spawner", function() -- 84
	if CurTime() >= EVIL_NEXT_CAPSULE then -- 85
		EVIL_NEXT_CAPSULE = CurTime() + EVIL_CAPSULE_DELAY + math.random(EVIL_CAPSULE_DELAY) -- 86
		local capsules = ents.FindByClass("fleshcapsule") -- 87
		if #capsules < EVIL_CAPSULE_MAX then -- 88
			local positions = EVIL_CAPSULE_POSITIONS[game.GetMap()] -- 89
			local pos = positions[math.random(#positions)] -- 90
			local fleshcapsule = ents.Create("fleshcapsule") -- 91
			fleshcapsule:SetPos(pos) -- 93
			fleshcapsule:SetAngles(Angle(math.random(360), math.random(360), math.random(360))) -- 94
			fleshcapsule:Spawn() -- 95
			fleshcapsule:Activate() -- 96
			SafeRemoveEntityDelayed(fleshcapsule, 900) -- 98
		end -- 88
	end -- 85
	return -- 100
end) -- 100
