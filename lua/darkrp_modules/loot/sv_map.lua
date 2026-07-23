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
			ang = Angle(-0, -90, 0), -- 37
			cls = "lootable/locker" -- 38
		} -- 36
	} -- 26
} -- 25
local EVIL_LOOT_REPLACEMENTS = { -- 42
	["rp_liverfailure_kidneydagger"] = { -- 43
		["models/props_junk/trashdumpster01a.mdl"] = "lootable/dumpster" -- 43
	} -- 42
} -- 41
local create_loot -- 46
create_loot = function() -- 46
	local map = game.GetMap() -- 47
	local _list_0 = ents.FindByClass("lootable/*") -- 48
	for _index_0 = 1, #_list_0 do -- 48
		local lootable = _list_0[_index_0] -- 48
		if not lootable.leave_alone then -- 49
			lootable:Remove() -- 49
		end -- 49
	end -- 49
	if EVIL_LOOT_POSITIONS[map] then -- 50
		local _list_1 = EVIL_LOOT_POSITIONS[map] -- 51
		for _index_0 = 1, #_list_1 do -- 51
			local v = _list_1[_index_0] -- 51
			local sp = ents.Create(v.cls) -- 52
			sp:SetPos(v.pos) -- 54
			sp:SetAngles(v.ang) -- 55
			sp:Spawn() -- 56
			sp:Activate() -- 57
			sp:GetPhysicsObject():EnableMotion(false) -- 58
		end -- 58
	end -- 50
	if EVIL_LOOT_REPLACEMENTS[map] then -- 59
		local _list_1 = ents.FindByClass("prop_dynamic") -- 60
		for _index_0 = 1, #_list_1 do -- 60
			local e = _list_1[_index_0] -- 60
			local replacement = EVIL_LOOT_REPLACEMENTS[map][e:GetModel()] -- 61
			if replacement then -- 62
				local sp = ents.Create(replacement) -- 63
				sp:SetPos(e:GetPos()) -- 65
				sp:SetAngles(e:GetAngles()) -- 66
				e:Remove() -- 67
				sp:Spawn() -- 68
				sp:Activate() -- 69
				sp:GetPhysicsObject():EnableMotion(false) -- 70
				sp.leave_alone = true -- 71
			end -- 62
		end -- 71
	end -- 59
	return -- 72
end -- 46
return hook.Add("InitPostEntity", "evilrp_create_loot", create_loot) -- 74
