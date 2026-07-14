EVIL_NEXT_BOULDER = 0
local EVIL_BOULDER_DELAY = 15
local EVIL_BOULDER_MAX = 64
local EVIL_BOULDER_POSITIONS = {
	["rp_lymphoma"] = {
		Vector(-1207, -1976, -643),
		Vector(-1554, -1991, -625),
		Vector(-1442, -2370, -625),
		Vector(-1512, -2561, -637),
		Vector(-1482, -2747, -618),
		Vector(-1283, -2744, -657),
		Vector(-952, -1844, -620)
	},
	["rp_sorelane"] = {
		Vector(3585, 4741, 487),
		Vector(2610, 3874, 333),
		Vector(2030, 5385, 316),
		Vector(3789, 3758, 382),
		Vector(3392, 4128, 422),
		Vector(3357, 5306, 741),
		Vector(3804, 5650, 695),
		Vector(1842, 3925, 504)
	},
	["rp_genova_redux_v1"] = {
		Vector(-14565, 14534, -560),
		Vector(-14850, 14285, -527),
		Vector(-13795, 14575, -561),
		Vector(-14022, 14122, -567),
		Vector(-14344, 14061, -600)
	},
	["rp_slumtown"] = {
		Vector(-505, 2242, 810),
		Vector(-461, 2356, 789),
		Vector(-324, 2639, 789),
		Vector(-103, 2644, 810),
		Vector(160, 2612, 804),
		Vector(144, 2430, 810),
		Vector(80, 1825, 810),
		Vector(-256, 1939, 810),
		Vector(-375, 1990, 810),
		Vector(-521, 2068, 800),
		Vector(-610, 2179, 792),
		Vector(-706, 2151, 785),
		Vector(-705, 2029, 810),
		Vector(-528, 1910, 811),
		Vector(-366, 2119, 810),
		Vector(-166, 2077, 803),
		Vector(-528, 1910, 811),
		Vector(-521, 2068, 800)
	},
	["rp_district_slums_v2"] = {
		Vector(9269, -307, 65),
		Vector(7907, -540, 177),
		Vector(7873, -267, 177),
		Vector(7753, -441, 178),
		Vector(8168, -459, 181),
		Vector(9075, -378, 190),
		Vector(9479, -390, 195),
		Vector(9563, -604, 196),
		Vector(9234, -89, 183),
		Vector(8161, 7711, 230),
		Vector(8293, 7153, 253),
		Vector(8060, 6601, 262),
		Vector(8990, 7042, 736)
	},
	["rp_liverfailure_kidneydagger"] = {
		Vector(1103, -916, 83),
		Vector(1030, -874, 83),
		Vector(934, -890, 89),
		Vector(836, -829, 95),
		Vector(615, -854, 97),
		Vector(777, -885, 98),
		Vector(4494, -1075, 95),
		Vector(4432, -1087, 87),
		Vector(4398, -1143, 104),
		Vector(4313, -1146, 99),
		Vector(4340, -1042, 101),
		Vector(4284, -1077, 97),
		Vector(4143, 3549, 405),
		Vector(3976, 3234, 407),
		Vector(3660, 3359, 395),
		Vector(3876, 3646, 386),
		Vector(3276, 3546, 395),
		Vector(3367, 3173, 384)
	}
}
return hook.Add("Think", "evilrp_boulder_spawner", function()
	if CurTime() >= EVIL_NEXT_BOULDER then
		EVIL_NEXT_BOULDER = CurTime() + EVIL_BOULDER_DELAY + math.random(EVIL_BOULDER_DELAY)
		local boulders = ents.FindByClass("boulder")
		if #boulders < EVIL_BOULDER_MAX then
			local positions = EVIL_BOULDER_POSITIONS[game.GetMap()]
			local pos = positions[math.random(#positions)]
			local boulder = ents.Create("boulder")
			boulder:SetPos(pos)
			boulder:SetAngles(Angle(math.random(360), math.random(360), math.random(360)))
			boulder:Spawn()
			boulder:Activate()
			SafeRemoveEntityDelayed(boulder, 900)
		end
	end
	return
end)
