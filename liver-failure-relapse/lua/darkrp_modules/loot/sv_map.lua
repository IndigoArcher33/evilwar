-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/loot/sv_map.yue
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
local EVIL_LOOT_REPLACEMENTS = { -- 27
	["rp_liverfailure_kidneydagger"] = { -- 28
		["models/props_junk/trashdumpster01a.mdl"] = "lootable/dumpster" -- 28
	} -- 27
} -- 26
local create_loot -- 31
create_loot = function() -- 31
	local map = game.GetMap() -- 32
	local _list_0 = ents.FindByClass("lootable/*") -- 33
	for _index_0 = 1, #_list_0 do -- 33
		local lootable = _list_0[_index_0] -- 33
		if not lootable.leave_alone then -- 34
			lootable:Remove() -- 34
		end -- 34
	end -- 34
	if EVIL_LOOT_POSITIONS[map] then -- 35
		local _list_1 = EVIL_LOOT_POSITIONS[map] -- 36
		for _index_0 = 1, #_list_1 do -- 36
			local v = _list_1[_index_0] -- 36
			local sp = ents.Create(v.cls) -- 37
			sp:SetPos(v.pos) -- 39
			sp:SetAngles(v.ang) -- 40
			sp:Spawn() -- 41
			sp:Activate() -- 42
			sp:GetPhysicsObject():EnableMotion(false) -- 43
		end -- 43
	end -- 35
	if EVIL_LOOT_REPLACEMENTS[map] then -- 44
		local _list_1 = ents.FindByClass("prop_dynamic") -- 45
		for _index_0 = 1, #_list_1 do -- 45
			local e = _list_1[_index_0] -- 45
			local replacement = EVIL_LOOT_REPLACEMENTS[map][e:GetModel()] -- 46
			if replacement then -- 47
				local sp = ents.Create(replacement) -- 48
				sp:SetPos(e:GetPos()) -- 50
				sp:SetAngles(e:GetAngles()) -- 51
				e:Remove() -- 52
				sp:Spawn() -- 53
				sp:Activate() -- 54
				sp:GetPhysicsObject():EnableMotion(false) -- 55
				sp.leave_alone = true -- 56
			end -- 47
		end -- 56
	end -- 44
	return -- 57
end -- 31
return hook.Add("InitPostEntity", "evilrp_create_loot", create_loot) -- 59
