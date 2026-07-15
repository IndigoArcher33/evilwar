-- [yue]: darkrp_modules\machines\sv_map.yue
EVIL_MACHINE_POSITIONS_CURSED = { -- 2
	["rp_liverfailure_kidneydagger"] = { -- 3
		{ -- 3
			machine = { -- 4
				pos = Vector(3958, 393, 100), -- 4
				ang = Angle(0, 94, 0) -- 5
			}, -- 3
			generator = { -- 7
				pos = Vector(3864, 513, 65), -- 7
				ang = Angle(0, 19, 0) -- 8
			} -- 6
		}, -- 3
		{ -- 9
			machine = { -- 10
				pos = Vector(3986, 4822, 101), -- 10
				ang = Angle(0, -176, 0) -- 11
			}, -- 9
			generator = { -- 13
				pos = Vector(3965, 4708, 66), -- 13
				ang = Angle(0, -104, 0) -- 14
			} -- 12
		}, -- 9
		{ -- 15
			machine = { -- 16
				pos = Vector(2412, 3078, 148), -- 16
				ang = Angle(0, -90, 0) -- 17
			}, -- 15
			generator = { -- 19
				pos = Vector(2307, 2830, 113), -- 19
				ang = Angle(-0, 135, 0) -- 20
			} -- 18
		}, -- 15
		{ -- 21
			machine = { -- 22
				pos = Vector(-142, 1584, 365), -- 22
				ang = Angle(-0, -91, 1) -- 23
			}, -- 21
			generator = { -- 25
				pos = Vector(-14, 1617, 329), -- 25
				ang = Angle(-0, -6, -0) -- 26
			} -- 24
		}, -- 21
		{ -- 27
			machine = { -- 28
				pos = Vector(3584, 795, -364), -- 28
				ang = Angle(-0, 180, -0) -- 29
			}, -- 27
			generator = { -- 31
				pos = Vector(3586, 843, -399), -- 31
				ang = Angle(-0, -18, 1) -- 32
			} -- 30
		}, -- 27
		{ -- 33
			machine = { -- 34
				pos = Vector(1977, -380, 100), -- 34
				ang = Angle(-0, -1, 1) -- 35
			}, -- 33
			generator = { -- 37
				pos = Vector(2251, -374, 65), -- 37
				ang = Angle(-0, 117, -0) -- 38
			} -- 36
		} -- 33
	} -- 2
} -- 1
local create_machines_and_otherwise -- 41
create_machines_and_otherwise = function() -- 41
	local EVIL_GENERATOR_POSITIONS = { -- 43
		["rp_lymphoma"] = { -- 44
			{ -- 44
				pos = Vector(-972, 1153, 1), -- 44
				ang = Angle(-0, 0, -0), -- 45
				id = "tools" -- 46
			}, -- 44
			{ -- 47
				pos = Vector(209, 2618, 1), -- 47
				ang = Angle(-0, -47, -0), -- 48
				id = "food" -- 49
			}, -- 47
			{ -- 50
				pos = Vector(256, 289, 193), -- 50
				ang = Angle(-0, 90, 0), -- 51
				id = "weapons" -- 52
			}, -- 50
			{ -- 53
				pos = Vector(1529, 769, 1), -- 53
				ang = Angle(-0, -0, 0), -- 54
				id = "medicine" -- 55
			}, -- 53
			{ -- 56
				pos = Vector(3041, 1784, -103), -- 56
				ang = Angle(8, 126, 0), -- 57
				id = "evil" -- 58
			} -- 56
		} -- 43
	} -- 42
	local EVIL_MACHINE_POSITIONS = { -- 61
		["rp_lymphoma"] = { -- 62
			{ -- 62
				pos = Vector(-1104, 1264, 36), -- 62
				ang = Angle(-0, -180, 0), -- 63
				cls = "machine/tools" -- 64
			}, -- 62
			{ -- 65
				pos = Vector(-1104, 1461, 36), -- 65
				ang = Angle(-0, -180, 0), -- 66
				cls = "machine/tools" -- 67
			}, -- 65
			{ -- 68
				pos = Vector(-277, 2704, 36), -- 68
				ang = Angle(-0, -90, 0), -- 69
				cls = "machine/food" -- 70
			}, -- 68
			{ -- 71
				pos = Vector(-146, 2704, 36), -- 71
				ang = Angle(-0, -90, 0), -- 72
				cls = "machine/food" -- 73
			}, -- 71
			{ -- 74
				pos = Vector(-10, 2705, 37), -- 74
				ang = Angle(-0, -90, 0), -- 75
				cls = "machine/food" -- 76
			}, -- 74
			{ -- 77
				pos = Vector(592, 275, 228), -- 77
				ang = Angle(-0, -180, -0), -- 78
				cls = "machine/weapons" -- 79
			}, -- 77
			{ -- 80
				pos = Vector(592, 400, 228), -- 80
				ang = Angle(-0, -180, -0), -- 81
				cls = "machine/weapons" -- 82
			}, -- 80
			{ -- 83
				pos = Vector(1712, 736, 36), -- 83
				ang = Angle(-0, -180, 0), -- 84
				cls = "machine/medicine" -- 85
			}, -- 83
			{ -- 86
				pos = Vector(1712, 548, 36), -- 86
				ang = Angle(-0, -180, 0), -- 87
				cls = "machine/medicine" -- 88
			}, -- 86
			{ -- 89
				pos = Vector(3003, 1774, -103), -- 89
				ang = Angle(19, 173, 0), -- 90
				cls = "machine/evil" -- 91
			}, -- 89
			{ -- 92
				pos = Vector(323, 2401, 28), -- 92
				ang = Angle(-0, 90, 0), -- 93
				cls = "refinery" -- 94
			}, -- 92
			{ -- 95
				pos = Vector(323, 2147, 28), -- 95
				ang = Angle(0, 90, -0), -- 96
				cls = "refinery" -- 97
			}, -- 95
			{ -- 98
				pos = Vector(-354, 2399, 28), -- 98
				ang = Angle(-0, -90, -0), -- 99
				cls = "refinery" -- 100
			}, -- 98
			{ -- 101
				pos = Vector(-1292, 1508, 28), -- 101
				ang = Angle(0, 180, -0), -- 102
				cls = "refinery" -- 103
			} -- 101
		} -- 61
	} -- 60
	local map = game.GetMap() -- 105
	local _list_0 = ents.FindByClass("generator") -- 106
	for _index_0 = 1, #_list_0 do -- 106
		local gen = _list_0[_index_0] -- 106
		gen:Remove() -- 107
	end -- 107
	if EVIL_GENERATOR_POSITIONS[map] then -- 108
		local _list_1 = EVIL_GENERATOR_POSITIONS[map] -- 109
		for _index_0 = 1, #_list_1 do -- 109
			local v = _list_1[_index_0] -- 109
			local sp = ents.Create("generator") -- 110
			sp:SetPos(v.pos) -- 112
			sp:SetAngles(v.ang) -- 113
			sp:SetFactoryIdentifier(v.id) -- 114
			sp:Spawn() -- 115
			sp:Activate() -- 116
			sp:GetPhysicsObject():EnableMotion(false) -- 117
			MsgC(Color(0, 200, 0), tostring(sp) .. " spawned with factory identifier '", Color(200, 200, 200), v.id, Color(0, 200, 0), "'.\n") -- 118
		end -- 123
		local _list_2 = ents.FindByClass("machine/*") -- 129
		for _index_0 = 1, #_list_2 do -- 129
			local mach = _list_2[_index_0] -- 129
			mach:Remove() -- 130
		end -- 130
		local _list_3 = ents.FindByClass("refinery") -- 131
		for _index_0 = 1, #_list_3 do -- 131
			local ref = _list_3[_index_0] -- 131
			ref:Remove() -- 132
		end -- 132
		return timer.Simple(1, function() -- 133
			if EVIL_MACHINE_POSITIONS[map] then -- 134
				local _list_4 = EVIL_MACHINE_POSITIONS[map] -- 135
				for _index_0 = 1, #_list_4 do -- 135
					local v = _list_4[_index_0] -- 135
					local sp = ents.Create(v.cls) -- 136
					do -- 137
						sp:SetPos(v.pos) -- 138
						sp:SetAngles(v.ang) -- 139
						sp:Spawn() -- 140
						sp:Activate() -- 141
						local phys = sp:GetPhysicsObject() -- 142
						if IsValid(phys) then -- 143
							phys:EnableMotion(false) -- 143
						end -- 143
						MsgC(Color(0, 200, 0), tostring(sp) .. " spawned.\n") -- 144
					end -- 137
				end -- 145
			end -- 134
			if EVIL_MACHINE_POSITIONS_CURSED[map] then -- 146
				local sp = ents.Create("machine/evil") -- 147
				do -- 148
					sp:Spawn() -- 149
					sp:Activate() -- 150
					local phys = sp:GetPhysicsObject() -- 151
					if IsValid(phys) then -- 152
						phys:EnableMotion(false) -- 152
					end -- 152
					MsgC(Color(200, 0, 0), tostring(sp) .. " SPAWNED.\n") -- 153
					sp:Shift() -- 155
				end -- 148
			end -- 146
			return -- 156
		end) -- 156
	end -- 108
end -- 41
return hook.Add("InitPostEntity", "evilrp_create_machines_and_otherwise", create_machines_and_otherwise) -- 158
