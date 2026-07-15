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
		Vector(-31, 1330, 528) -- 12
	}, -- 6
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
		Vector(4979, 1398, 452), -- 67
		Vector(4791, 1449, 430), -- 68
		Vector(4451, 1446, 421), -- 69
		Vector(4117, 1411, 393), -- 70
		Vector(3913, 1337, 460), -- 71
		Vector(3877, 1014, 458), -- 72
		Vector(4101, 971, 445), -- 73
		Vector(4313, 907, 407), -- 74
		Vector(4623, 882, 389), -- 75
		Vector(4898, 880, 349), -- 76
		Vector(5137, 970, 478) -- 77
	} -- 66
} -- 5
return hook.Add("Think", "evilrp_capsule_spawner", function() -- 81
	if CurTime() >= EVIL_NEXT_CAPSULE then -- 82
		EVIL_NEXT_CAPSULE = CurTime() + EVIL_CAPSULE_DELAY + math.random(EVIL_CAPSULE_DELAY) -- 83
		local capsules = ents.FindByClass("fleshcapsule") -- 84
		if #capsules < EVIL_CAPSULE_MAX then -- 85
			local positions = EVIL_CAPSULE_POSITIONS[game.GetMap()] -- 86
			local pos = positions[math.random(#positions)] -- 87
			local fleshcapsule = ents.Create("fleshcapsule") -- 88
			fleshcapsule:SetPos(pos) -- 90
			fleshcapsule:SetAngles(Angle(math.random(360), math.random(360), math.random(360))) -- 91
			fleshcapsule:Spawn() -- 92
			fleshcapsule:Activate() -- 93
			SafeRemoveEntityDelayed(fleshcapsule, 900) -- 95
		end -- 85
	end -- 82
	return -- 97
end) -- 97
