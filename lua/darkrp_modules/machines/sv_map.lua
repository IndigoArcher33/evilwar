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
	}, -- 2
	["rp_lymphoma"] = { -- 40
		{ -- 40
			machine = { -- 41
				pos = Vector(-101, -4665, -780.5), -- 41
				ang = Angle(0, 0, 0) -- 42
			}, -- 40
			generator = { -- 44
				pos = Vector(-46, -4589, -815.7), -- 44
				ang = Angle(0, 9, 0) -- 45
			} -- 43
		}, -- 40
		{ -- 46
			machine = { -- 47
				pos = Vector(287, -6748, -860), -- 47
				ang = Angle(0, -90, 0) -- 48
			}, -- 46
			generator = { -- 50
				pos = Vector(202, -6837, -895), -- 50
				ang = Angle(0, 67, 0) -- 51
			} -- 49
		}, -- 46
		{ -- 52
			machine = { -- 53
				pos = Vector(1516, -3269, -27), -- 53
				ang = Angle(0, -90, 0) -- 54
			}, -- 52
			generator = { -- 56
				pos = Vector(1405, -3296, -63), -- 56
				ang = Angle(0, 45, 0) -- 57
			} -- 55
		} -- 52
	} -- 39
} -- 1
local create_machines_and_otherwise -- 60
create_machines_and_otherwise = function() -- 60
	local EVIL_GENERATOR_POSITIONS = { -- 62
		["rp_lymphoma"] = { -- 63
			{ -- 63
				pos = Vector(-972, 1153, 1), -- 63
				ang = Angle(-0, 0, -0), -- 64
				id = "tools" -- 65
			}, -- 63
			{ -- 66
				pos = Vector(-204, 2206, -63), -- 66
				ang = Angle(-0, -155, -0), -- 67
				id = "food" -- 68
			}, -- 66
			{ -- 69
				pos = Vector(256, 289, 193), -- 69
				ang = Angle(-0, 90, 0), -- 70
				id = "weapons" -- 71
			}, -- 69
			{ -- 72
				pos = Vector(1529, 769, 1), -- 72
				ang = Angle(-0, -0, 0), -- 73
				id = "medicine" -- 74
			}, -- 72
			{ -- 75
				pos = Vector(3041, 1784, -103), -- 75
				ang = Angle(8, 126, 0), -- 76
				id = "evil" -- 77
			} -- 75
		} -- 62
	} -- 61
	local EVIL_MACHINE_POSITIONS = { -- 80
		["rp_lymphoma"] = { -- 81
			{ -- 81
				pos = Vector(-1104, 1264, 36), -- 81
				ang = Angle(-0, -180, 0), -- 82
				cls = "machine/tools" -- 83
			}, -- 81
			{ -- 84
				pos = Vector(-1104, 1461, 36), -- 84
				ang = Angle(-0, -180, 0), -- 85
				cls = "machine/tools" -- 86
			}, -- 84
			{ -- 87
				pos = Vector(-367, 2386, -28), -- 87
				ang = Angle(-0, -0, 0), -- 88
				cls = "machine/food" -- 89
			}, -- 87
			{ -- 90
				pos = Vector(-367, 2242, -28), -- 90
				ang = Angle(-0, -0, 0), -- 91
				cls = "machine/food" -- 92
			}, -- 90
			{ -- 93
				pos = Vector(-367, 2529, -28), -- 93
				ang = Angle(-0, -0, 0), -- 94
				cls = "machine/food" -- 95
			}, -- 93
			{ -- 96
				pos = Vector(592, 275, 228), -- 96
				ang = Angle(-0, -180, -0), -- 97
				cls = "machine/weapons" -- 98
			}, -- 96
			{ -- 99
				pos = Vector(592, 400, 228), -- 99
				ang = Angle(-0, -180, -0), -- 100
				cls = "machine/weapons" -- 101
			}, -- 99
			{ -- 102
				pos = Vector(1712, 736, 36), -- 102
				ang = Angle(-0, -180, 0), -- 103
				cls = "machine/medicine" -- 104
			}, -- 102
			{ -- 105
				pos = Vector(1712, 548, 36), -- 105
				ang = Angle(-0, -180, 0), -- 106
				cls = "machine/medicine" -- 107
			}, -- 105
			{ -- 108
				pos = Vector(3003, 1774, -103), -- 108
				ang = Angle(19, 173, 0), -- 109
				cls = "machine/evil" -- 110
			}, -- 108
			{ -- 111
				pos = Vector(-99, 2253, -36), -- 111
				ang = Angle(-0, -90, 0), -- 112
				cls = "refinery" -- 113
			}, -- 111
			{ -- 114
				pos = Vector(323, 2147, -36.5), -- 114
				ang = Angle(0, 90, -0), -- 115
				cls = "refinery" -- 116
			}, -- 114
			{ -- 117
				pos = Vector(-1292, 1508, 28), -- 117
				ang = Angle(0, 180, -0), -- 118
				cls = "refinery" -- 119
			}, -- 117
			{ -- 120
				pos = Vector(-575, 538, 48), -- 120
				ang = Angle(0, 0, 0), -- 121
				cls = "cooker" -- 122
			}, -- 120
			{ -- 123
				pos = Vector(-575, 494, 48), -- 123
				ang = Angle(0, 0, 0), -- 124
				cls = "cooker" -- 125
			}, -- 123
			{ -- 126
				pos = Vector(573.55, -3365.23, -815), -- 126
				ang = Angle(0, -180, 0), -- 127
				cls = "cooker" -- 128
			}, -- 126
			{ -- 129
				pos = Vector(-154, 2429, -63), -- 129
				ang = Angle(0, -180, 0), -- 130
				cls = "cooker" -- 131
			} -- 129
		} -- 80
	} -- 79
	local map = game.GetMap() -- 133
	local _list_0 = ents.FindByClass("generator") -- 134
	for _index_0 = 1, #_list_0 do -- 134
		local gen = _list_0[_index_0] -- 134
		gen:Remove() -- 135
	end -- 135
	if EVIL_GENERATOR_POSITIONS[map] then -- 136
		local _list_1 = EVIL_GENERATOR_POSITIONS[map] -- 137
		for _index_0 = 1, #_list_1 do -- 137
			local v = _list_1[_index_0] -- 137
			local sp = ents.Create("generator") -- 138
			sp:SetPos(v.pos) -- 140
			sp:SetAngles(v.ang) -- 141
			sp:SetFactoryIdentifier(v.id) -- 142
			sp:Spawn() -- 143
			sp:Activate() -- 144
			sp:GetPhysicsObject():EnableMotion(false) -- 145
			MsgC(Color(0, 200, 0), tostring(sp) .. " spawned with factory identifier '", Color(200, 200, 200), v.id, Color(0, 200, 0), "'.\n") -- 146
		end -- 151
		local _list_2 = ents.FindByClass("machine/*") -- 157
		for _index_0 = 1, #_list_2 do -- 157
			local mach = _list_2[_index_0] -- 157
			mach:Remove() -- 158
		end -- 158
		local _list_3 = ents.FindByClass("refinery") -- 159
		for _index_0 = 1, #_list_3 do -- 159
			local ref = _list_3[_index_0] -- 159
			ref:Remove() -- 160
		end -- 160
		return timer.Simple(1, function() -- 161
			if EVIL_MACHINE_POSITIONS[map] then -- 162
				local _list_4 = EVIL_MACHINE_POSITIONS[map] -- 163
				for _index_0 = 1, #_list_4 do -- 163
					local v = _list_4[_index_0] -- 163
					local sp = ents.Create(v.cls) -- 164
					do -- 165
						sp:SetPos(v.pos) -- 166
						sp:SetAngles(v.ang) -- 167
						sp:Spawn() -- 168
						sp:Activate() -- 169
						local phys = sp:GetPhysicsObject() -- 170
						if IsValid(phys) then -- 171
							phys:EnableMotion(false) -- 171
						end -- 171
						MsgC(Color(0, 200, 0), tostring(sp) .. " spawned.\n") -- 172
					end -- 165
				end -- 173
			end -- 162
			if EVIL_MACHINE_POSITIONS_CURSED[map] then -- 174
				local sp = ents.Create("machine/evil") -- 175
				do -- 176
					sp:Spawn() -- 177
					sp:Activate() -- 178
					local phys = sp:GetPhysicsObject() -- 179
					if IsValid(phys) then -- 180
						phys:EnableMotion(false) -- 180
					end -- 180
					MsgC(Color(200, 0, 0), tostring(sp) .. " SPAWNED.\n") -- 181
					sp:Shift() -- 183
				end -- 176
			end -- 174
			return -- 184
		end) -- 184
	end -- 136
end -- 60
return hook.Add("InitPostEntity", "evilrp_create_machines_and_otherwise", create_machines_and_otherwise) -- 186
