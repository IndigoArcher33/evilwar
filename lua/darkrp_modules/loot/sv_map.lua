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
			pos = Vector(-1369.443237, 791.270508, 18.443558), -- 42
			ang = Angle(-0, -45, 0), -- 43
			cls = "lootable/crate" -- 44
		}, -- 42
		{ -- 45
			pos = Vector(-1379.369263, 908.375488, 18.443558), -- 45
			ang = Angle(-0, 45, 0), -- 46
			cls = "lootable/crate" -- 47
		} -- 45
	} -- 26
} -- 25
local EVIL_LOOT_REPLACEMENTS = { -- 51
	["rp_liverfailure_kidneydagger"] = { -- 52
		["models/props_junk/trashdumpster01a.mdl"] = "lootable/dumpster" -- 52
	} -- 51
} -- 50
local create_loot -- 55
create_loot = function() -- 55
	local map = game.GetMap() -- 56
	local _list_0 = ents.FindByClass("lootable/*") -- 57
	for _index_0 = 1, #_list_0 do -- 57
		local lootable = _list_0[_index_0] -- 57
		if not lootable.leave_alone then -- 58
			lootable:Remove() -- 58
		end -- 58
	end -- 58
	if EVIL_LOOT_POSITIONS[map] then -- 59
		local _list_1 = EVIL_LOOT_POSITIONS[map] -- 60
		for _index_0 = 1, #_list_1 do -- 60
			local v = _list_1[_index_0] -- 60
			local sp = ents.Create(v.cls) -- 61
			sp:SetPos(v.pos) -- 63
			sp:SetAngles(v.ang) -- 64
			sp:Spawn() -- 65
			sp:Activate() -- 66
			sp:GetPhysicsObject():EnableMotion(false) -- 67
		end -- 67
	end -- 59
	if EVIL_LOOT_REPLACEMENTS[map] then -- 68
		local _list_1 = ents.FindByClass("prop_dynamic") -- 69
		for _index_0 = 1, #_list_1 do -- 69
			local e = _list_1[_index_0] -- 69
			local replacement = EVIL_LOOT_REPLACEMENTS[map][e:GetModel()] -- 70
			if replacement then -- 71
				local sp = ents.Create(replacement) -- 72
				sp:SetPos(e:GetPos()) -- 74
				sp:SetAngles(e:GetAngles()) -- 75
				e:Remove() -- 76
				sp:Spawn() -- 77
				sp:Activate() -- 78
				sp:GetPhysicsObject():EnableMotion(false) -- 79
				sp.leave_alone = true -- 80
			end -- 71
		end -- 80
	end -- 68
	return -- 81
end -- 55
return hook.Add("InitPostEntity", "evilrp_create_loot", create_loot) -- 83
