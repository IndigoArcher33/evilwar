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
			pos = Vector(1132.062622, -2930.228516, -29.531338), -- 33
			ang = Angle(-0, -90, 0), -- 34
			cls = "lootable/locker" -- 35
		}, -- 33
		{ -- 36
			pos = Vector(-1341.062622, -3766.904541, -748.007935), -- 36
			ang = Angle(-0, 90, 0), -- 37
			cls = "lootable/locker" -- 38
		}, -- 36
		{ -- 39
			pos = Vector(-96, 311, -764.007935), -- 39
			ang = Angle(-0, -0, 0), -- 40
			cls = "lootable/locker" -- 41
		}, -- 39
		{ -- 42
			pos = Vector(-40.7, 97.68, -799.5), -- 42
			ang = Angle(-0, 180, 0), -- 43
			cls = "lootable/cache" -- 44
		}, -- 42
		{ -- 45
			pos = Vector(622.469421, -3962.344727, -59.953209), -- 45
			ang = Angle(-19.168, 52.573, 4.997), -- 46
			cls = "lootable/cache" -- 47
		}, -- 45
		{ -- 48
			pos = Vector(-540.29, -2113.26, -995.44), -- 48
			ang = Angle(-0, 0, 0), -- 49
			cls = "lootable/chest" -- 50
		}, -- 48
		{ -- 51
			pos = Vector(489.881622, -3148.358887, -803.429688), -- 51
			ang = Angle(-0, -90, 0), -- 52
			cls = "lootable/chest" -- 53
		}, -- 51
		{ -- 54
			pos = Vector(-981.443359, -5135.492188, 73.638565), -- 54
			ang = Angle(-15.135, -136.930, 2.269), -- 55
			cls = "lootable/chest" -- 56
		} -- 54
	} -- 26
} -- 25
local EVIL_LOOT_REPLACEMENTS = { -- 60
	["rp_liverfailure_kidneydagger"] = { -- 61
		["models/props_junk/trashdumpster01a.mdl"] = "lootable/dumpster" -- 61
	} -- 60
} -- 59
local create_loot -- 64
create_loot = function() -- 64
	local map = game.GetMap() -- 65
	local _list_0 = ents.FindByClass("lootable/*") -- 66
	for _index_0 = 1, #_list_0 do -- 66
		local lootable = _list_0[_index_0] -- 66
		if not lootable.leave_alone then -- 67
			lootable:Remove() -- 67
		end -- 67
	end -- 67
	if EVIL_LOOT_POSITIONS[map] then -- 68
		local _list_1 = EVIL_LOOT_POSITIONS[map] -- 69
		for _index_0 = 1, #_list_1 do -- 69
			local v = _list_1[_index_0] -- 69
			local sp = ents.Create(v.cls) -- 70
			sp:SetPos(v.pos) -- 72
			sp:SetAngles(v.ang) -- 73
			sp:Spawn() -- 74
			sp:Activate() -- 75
			sp:GetPhysicsObject():EnableMotion(false) -- 76
		end -- 76
	end -- 68
	if EVIL_LOOT_REPLACEMENTS[map] then -- 77
		local _list_1 = ents.FindByClass("prop_dynamic") -- 78
		for _index_0 = 1, #_list_1 do -- 78
			local e = _list_1[_index_0] -- 78
			local replacement = EVIL_LOOT_REPLACEMENTS[map][e:GetModel()] -- 79
			if replacement then -- 80
				local sp = ents.Create(replacement) -- 81
				sp:SetPos(e:GetPos()) -- 83
				sp:SetAngles(e:GetAngles()) -- 84
				e:Remove() -- 85
				sp:Spawn() -- 86
				sp:Activate() -- 87
				sp:GetPhysicsObject():EnableMotion(false) -- 88
				sp.leave_alone = true -- 89
			end -- 80
		end -- 89
	end -- 77
	return -- 90
end -- 64
return hook.Add("InitPostEntity", "evilrp_create_loot", create_loot) -- 92
