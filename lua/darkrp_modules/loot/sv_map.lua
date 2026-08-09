-- [yue]: darkrp_modules\loot\sv_map.yue
local EVIL_LOOT_POSITIONS = { -- 2
	["rp_district_slums_v2"] = { -- 3
		{ -- 3
			pos = Vector(5534, 4085, 186), -- 3
			ang = Angle(0, -82, 0), -- 4
			cls = "lootable/dumpster" -- 5
		}, -- 3
		{ -- 6
			pos = Vector(3971, 1367, 217), -- 6
			ang = Angle(0, -6, 0), -- 7
			cls = "lootable/dumpster" -- 8
		}, -- 6
		{ -- 9
			pos = Vector(2524, 2740, 218), -- 9
			ang = Angle(0, -35, 0), -- 10
			cls = "lootable/dumpster" -- 11
		}, -- 9
		{ -- 12
			pos = Vector(1980, 5123, -70), -- 12
			ang = Angle(0, -163, 0), -- 13
			cls = "lootable/dumpster" -- 14
		}, -- 12
		{ -- 15
			pos = Vector(4674, 4520, 175), -- 15
			ang = Angle(0, -124, 0), -- 16
			cls = "lootable/dumpster" -- 17
		}, -- 15
		{ -- 18
			pos = Vector(6499, 7699, 186), -- 18
			ang = Angle(0, -19, 0), -- 19
			cls = "lootable/dumpster" -- 20
		}, -- 18
		{ -- 21
			pos = Vector(6926, 806, 218), -- 21
			ang = Angle(0, 93, 0), -- 22
			cls = "lootable/dumpster" -- 23
		} -- 21
	} -- 2
} -- 1
EVIL_LOOT_POSITIONS = { -- 26
	["rp_lymphoma"] = { -- 27
		{ -- 27
			pos = Vector(722.944885, -4596.397949, -162.945358), -- 27
			ang = Angle(-0, -90, 0), -- 28
			cls = "lootable/dumpster" -- 29
		}, -- 27
		{ -- 30
			pos = Vector(-729.105530, -4660.556641, -196.339752), -- 30
			ang = Angle(-0, 120, 0), -- 31
			cls = "lootable/dumpster" -- 32
		}, -- 30
		{ -- 33
			pos = Vector(-208.764374, 844.963379, 23.443558), -- 33
			ang = Angle(-0, 0, 0), -- 34
			cls = "lootable/dumpster" -- 35
		}, -- 33
		{ -- 36
			pos = Vector(1132.062622, -2930.228516, -29.531338), -- 36
			ang = Angle(-0, -90, 0), -- 37
			cls = "lootable/locker" -- 38
		}, -- 36
		{ -- 39
			pos = Vector(-1341.062622, -3766.904541, -748.007935), -- 39
			ang = Angle(-0, 90, 0), -- 40
			cls = "lootable/locker" -- 41
		}, -- 39
		{ -- 42
			pos = Vector(-96, 311, -764.007935), -- 42
			ang = Angle(-0, -90, 0), -- 43
			cls = "lootable/locker" -- 44
		}, -- 42
		{ -- 45
			pos = Vector(-40.7, 97.68, -799.5), -- 45
			ang = Angle(-0, 180, 0), -- 46
			cls = "lootable/cache" -- 47
		}, -- 45
		{ -- 48
			pos = Vector(622.469421, -3962.344727, -59.953209), -- 48
			ang = Angle(-19.168, 52.573, 4.997), -- 49
			cls = "lootable/cache" -- 50
		}, -- 48
		{ -- 51
			pos = Vector(4446.111328, -7647.172852, 288.464569), -- 51
			ang = Angle(-0, 90, 0), -- 52
			cls = "lootable/cache" -- 53
		}, -- 51
		{ -- 54
			pos = Vector(5280.500977, -8395.403320, -0.110292), -- 54
			ang = Angle(3, 25, 0.3), -- 55
			cls = "lootable/cache" -- 56
		}, -- 54
		{ -- 57
			pos = Vector(1596.841919, -7464.700684, 241.077469), -- 57
			ang = Angle(-0, 90, 0), -- 58
			cls = "lootable/cache" -- 59
		}, -- 57
		{ -- 60
			pos = Vector(-540.29, -2113.26, -995.44), -- 60
			ang = Angle(-0, 0, 0), -- 61
			cls = "lootable/chest" -- 62
		}, -- 60
		{ -- 63
			pos = Vector(489.881622, -3148.358887, -803.429688), -- 63
			ang = Angle(-0, -90, 0), -- 64
			cls = "lootable/chest" -- 65
		}, -- 63
		{ -- 66
			pos = Vector(-981.443359, -5135.492188, 73.638565), -- 66
			ang = Angle(-15.135, -136.930, 2.269), -- 67
			cls = "lootable/chest" -- 68
		}, -- 66
		{ -- 69
			pos = Vector(-1369.443237, 791.270508, 18.443558), -- 69
			ang = Angle(-0, -45, 0), -- 70
			cls = "lootable/crate" -- 71
		}, -- 69
		{ -- 72
			pos = Vector(-1379.369263, 908.375488, 18.443558), -- 72
			ang = Angle(-0, 45, 0), -- 73
			cls = "lootable/crate" -- 74
		} -- 72
	} -- 26
} -- 25
local EVIL_LOOT_REPLACEMENTS = { -- 78
	["rp_liverfailure_kidneydagger"] = { -- 79
		["models/props_junk/trashdumpster01a.mdl"] = "lootable/dumpster" -- 79
	} -- 78
} -- 77
local create_loot -- 82
create_loot = function() -- 82
	local map = game.GetMap() -- 83
	local _list_0 = ents.FindByClass("lootable/*") -- 84
	for _index_0 = 1, #_list_0 do -- 84
		local lootable = _list_0[_index_0] -- 84
		if not lootable.leave_alone then -- 85
			lootable:Remove() -- 85
		end -- 85
	end -- 85
	if EVIL_LOOT_POSITIONS[map] then -- 86
		local _list_1 = EVIL_LOOT_POSITIONS[map] -- 87
		for _index_0 = 1, #_list_1 do -- 87
			local v = _list_1[_index_0] -- 87
			local sp = ents.Create(v.cls) -- 88
			sp:SetPos(v.pos) -- 90
			sp:SetAngles(v.ang) -- 91
			sp:Spawn() -- 92
			sp:Activate() -- 93
			sp:GetPhysicsObject():EnableMotion(false) -- 94
		end -- 94
	end -- 86
	if EVIL_LOOT_REPLACEMENTS[map] then -- 95
		local _list_1 = ents.FindByClass("prop_dynamic") -- 96
		for _index_0 = 1, #_list_1 do -- 96
			local e = _list_1[_index_0] -- 96
			local replacement = EVIL_LOOT_REPLACEMENTS[map][e:GetModel()] -- 97
			if replacement then -- 98
				local sp = ents.Create(replacement) -- 99
				sp:SetPos(e:GetPos()) -- 101
				sp:SetAngles(e:GetAngles()) -- 102
				e:Remove() -- 103
				sp:Spawn() -- 104
				sp:Activate() -- 105
				sp:GetPhysicsObject():EnableMotion(false) -- 106
				sp.leave_alone = true -- 107
			end -- 98
		end -- 107
	end -- 95
	return -- 108
end -- 82
return hook.Add("InitPostEntity", "evilrp_create_loot", create_loot) -- 110
