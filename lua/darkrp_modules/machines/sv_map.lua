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
			}, -- 101
			{ -- 104
				pos = Vector(-575, 538, 48), -- 104
				ang = Angle(0, 0, 0), -- 105
				cls = "cooker" -- 106
			}, -- 104
			{ -- 107
				pos = Vector(-575, 494, 48), -- 107
				ang = Angle(0, 0, 0), -- 108
				cls = "cooker" -- 109
			}, -- 107
			{ -- 110
				pos = Vector(573.55, -3365, 23, -815), -- 110
				ang = Angle(0, -180, 0), -- 111
				cls = "cooker" -- 112
			} -- 110
		} -- 61
	} -- 60
	local map = game.GetMap() -- 114
	local _list_0 = ents.FindByClass("generator") -- 115
	for _index_0 = 1, #_list_0 do -- 115
		local gen = _list_0[_index_0] -- 115
		gen:Remove() -- 116
	end -- 116
	if EVIL_GENERATOR_POSITIONS[map] then -- 117
		local _list_1 = EVIL_GENERATOR_POSITIONS[map] -- 118
		for _index_0 = 1, #_list_1 do -- 118
			local v = _list_1[_index_0] -- 118
			local sp = ents.Create("generator") -- 119
			sp:SetPos(v.pos) -- 121
			sp:SetAngles(v.ang) -- 122
			sp:SetFactoryIdentifier(v.id) -- 123
			sp:Spawn() -- 124
			sp:Activate() -- 125
			sp:GetPhysicsObject():EnableMotion(false) -- 126
			MsgC(Color(0, 200, 0), tostring(sp) .. " spawned with factory identifier '", Color(200, 200, 200), v.id, Color(0, 200, 0), "'.\n") -- 127
		end -- 132
		local _list_2 = ents.FindByClass("machine/*") -- 138
		for _index_0 = 1, #_list_2 do -- 138
			local mach = _list_2[_index_0] -- 138
			mach:Remove() -- 139
		end -- 139
		local _list_3 = ents.FindByClass("refinery") -- 140
		for _index_0 = 1, #_list_3 do -- 140
			local ref = _list_3[_index_0] -- 140
			ref:Remove() -- 141
		end -- 141
		return timer.Simple(1, function() -- 142
			if EVIL_MACHINE_POSITIONS[map] then -- 143
				local _list_4 = EVIL_MACHINE_POSITIONS[map] -- 144
				for _index_0 = 1, #_list_4 do -- 144
					local v = _list_4[_index_0] -- 144
					local sp = ents.Create(v.cls) -- 145
					do -- 146
						sp:SetPos(v.pos) -- 147
						sp:SetAngles(v.ang) -- 148
						sp:Spawn() -- 149
						sp:Activate() -- 150
						local phys = sp:GetPhysicsObject() -- 151
						if IsValid(phys) then -- 152
							phys:EnableMotion(false) -- 152
						end -- 152
						MsgC(Color(0, 200, 0), tostring(sp) .. " spawned.\n") -- 153
					end -- 146
				end -- 154
			end -- 143
			if EVIL_MACHINE_POSITIONS_CURSED[map] then -- 155
				local sp = ents.Create("machine/evil") -- 156
				do -- 157
					sp:Spawn() -- 158
					sp:Activate() -- 159
					local phys = sp:GetPhysicsObject() -- 160
					if IsValid(phys) then -- 161
						phys:EnableMotion(false) -- 161
					end -- 161
					MsgC(Color(200, 0, 0), tostring(sp) .. " SPAWNED.\n") -- 162
					sp:Shift() -- 164
				end -- 157
			end -- 155
			return -- 165
		end) -- 165
	end -- 117
end -- 41
return hook.Add("InitPostEntity", "evilrp_create_machines_and_otherwise", create_machines_and_otherwise) -- 167
