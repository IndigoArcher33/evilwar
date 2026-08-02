-- [yue]: darkrp_customthings\jobs.yue
local Config = GAMEMODE.Config -- 4
local set_bodygroup -- 10
set_bodygroup = function(ply, slot, val) -- 10
	if type(val) == "table" then -- 11
		val = val[math.random(1, #val)] -- 13
	end -- 11
	return ply:SetBodygroup(slot, val) -- 14
end -- 10
local open_player_menu -- 16
open_player_menu = function(ply) -- 16
	if not CLIENT then -- 17
		return -- 17
	end -- 17
	if lp:Alive() then -- 18
		return GAMEMODE:CreatePlayerMenu() -- 19
	end -- 18
end -- 16
local open_action_menu -- 21
open_action_menu = function(ply) -- 21
	if not CLIENT then -- 22
		return -- 22
	end -- 22
	local tr = GAMEMODE:GetHandTrace(ply, 80) -- 23
	return GAMEMODE:OpenActionMenu(tr.HitPos, tr.Entity) -- 24
end -- 21
TEAM_GHOST = DarkRP.createJob("Ghost", { -- 27
	color = Color(150, 150, 150), -- 27
	model = "models/player/skeleton.mdl", -- 28
	description = "A lost soul.", -- 29
	instant_respawn = true, -- 30
	weapons = { }, -- 31
	command = "ghost", -- 32
	salary = 1, -- 33
	max = 0, -- 34
	cost = 0, -- 35
	use_machines = false, -- 36
	speech_sounds = { -- 37
		"ambient/voices/squeal1.wav" -- 37
	}, -- 37
	crosstext = function(ply) -- 38
		local text = "OH SOTLA,\nTHE HORROR." -- 40
		do -- 41
			local _exp_0 = lp:Team() -- 41
			if TEAM_KORPSMAN == _exp_0 then -- 42
				text = "Evil spirits wander!\n<wiggle>Not on my shift." -- 43
			elseif TEAM_GHOST == _exp_0 then -- 44
				text = "We're the same,\nyou and I." -- 45
			end -- 45
		end -- 45
		return { -- 46
			text = text, -- 46
			font = "Spleen_Label_Small" -- 46
		} -- 46
	end, -- 38
	first_names = { -- 47
		"Suffering", -- 47
		"Fear", -- 47
		"Agony", -- 47
		"Malice", -- 47
		"Hatred", -- 47
		"Grief", -- 47
		"Pain", -- 47
		"Despair", -- 47
		"Rage" -- 47
	}, -- 47
	ShowSpare1 = function(ply) -- 50
		if CLIENT then -- 51
			return ply:Notify("<c=0,200,0>YOU HAVE " .. tostring(ply:GetStemCells()) .. " STEM CELLS.") -- 52
		end -- 51
	end, -- 50
	ShowSpare2 = function(ply) -- 53
		local nearby = ents.FindInSphere(ply:GetPos(), 16) -- 54
		local found -- 55
		for _index_0 = 1, #nearby do -- 56
			local ent = nearby[_index_0] -- 56
			if ent:GetClass():find("portal/spawn") then -- 57
				found = ent -- 58
				break -- 59
			end -- 57
		end -- 59
		if not (found and IsValid(found)) then -- 60
			if CLIENT then -- 61
				return GAMEMODE:Frighten() -- 62
			else -- 64
				return ply:Notify("<c=200,0,0>There is no purpose in life near me.") -- 64
			end -- 61
		elseif SERVER then -- 65
			return found:Use(ply) -- 66
		end -- 60
	end, -- 53
	PlayerLoadout = function(ply) -- 67
		ply:ClearOddities() -- 69
		ply:SetNWInt("evilrp_gasmask", 0) -- 70
		return true -- 71
	end, -- 67
	ColorMod = function(ply) -- 72
		local abs, cos, sin = math.abs, math.cos, math.sin -- 73
		local ct = CurTime() -- 74
		local tab = { -- 76
			["$pp_colour_addr"] = 0, -- 76
			["$pp_colour_addg"] = 0, -- 77
			["$pp_colour_addb"] = 0, -- 78
			["$pp_colour_brightness"] = 0 + (-0.01 * cos(ct)), -- 79
			["$pp_colour_contrast"] = 0.6 + (abs(sin(ct * 0.166)) * 0.5), -- 80
			["$pp_colour_colour"] = 0, -- 81
			["$pp_colour_mulr"] = 0 + abs(sin(ct * 0.789)), -- 82
			["$pp_colour_mulg"] = 0, -- 83
			["$pp_colour_mulb"] = 0 -- 84
		} -- 75
		return tab -- 85
	end -- 72
}) -- 26
TEAM_STALKER = DarkRP.createJob("Stalker", { -- 88
	color = Color(71, 22, 0), -- 88
	model = "models/liver_failure/wastelander/wastelander.mdl", -- 89
	description = "A soul with no allegiance, destined to plunder the wasteland.", -- 90
	weapons = { -- 91
		"evilrp_weapon/whisper", -- 91
		"evilrp_melee/knife" -- 91
	}, -- 91
	category = "Wasteland", -- 92
	command = "stalker", -- 93
	use_machines = true, -- 94
	salary = 1, -- 95
	max = 3, -- 96
	cost = 4, -- 97
	can_build = true, -- 98
	hasLicense = false, -- 99
	candemote = false, -- 100
	use_machines = false, -- 101
	speech_sounds = (function() -- 102
		local _accum_0 = { } -- 102
		local _len_0 = 1 -- 102
		for i = 1, 9 do -- 102
			_accum_0[_len_0] = "placenta/cultspawn" .. tostring(i) .. ".wav" -- 102
			_len_0 = _len_0 + 1 -- 102
		end -- 102
		return _accum_0 -- 102
	end)(), -- 102
	hurt_sounds = (function() -- 103
		local _accum_0 = { } -- 103
		local _len_0 = 1 -- 103
		for i = 1, 6 do -- 103
			_accum_0[_len_0] = "placenta/pain/cult" .. tostring(i) .. ".wav" -- 103
			_len_0 = _len_0 + 1 -- 103
		end -- 103
		return _accum_0 -- 103
	end)(), -- 103
	become_sounds = (function() -- 104
		local _accum_0 = { } -- 104
		local _len_0 = 1 -- 104
		for i = 1, 3 do -- 104
			_accum_0[_len_0] = "npc/zombie/zombie_alert" .. tostring(i) .. ".wav" -- 104
			_len_0 = _len_0 + 1 -- 104
		end -- 104
		return _accum_0 -- 104
	end)(), -- 104
	death_sounds = (function() -- 105
		local _accum_0 = { } -- 105
		local _len_0 = 1 -- 105
		for i = 1, 4 do -- 105
			_accum_0[_len_0] = "placenta/death/cult" .. tostring(i) .. ".wav" -- 105
			_len_0 = _len_0 + 1 -- 105
		end -- 105
		return _accum_0 -- 105
	end)(), -- 105
	crosstext = function(ply) -- 106
		local text = "Don't panic." -- 107
		do -- 108
			local _exp_0 = lp:Team() -- 108
			if TEAM_PRIVATE == _exp_0 then -- 109
				text = "He doesn't look like me." -- 110
			elseif TEAM_STALKER == _exp_0 then -- 111
				text = "A fellow plunderer." -- 112
			elseif TEAM_SANITAR == _exp_0 then -- 113
				text = "Despicable." -- 114
			elseif TEAM_KORPSMAN == _exp_0 then -- 115
				text = "Why is he here?" -- 116
			elseif TEAM_DEALER == _exp_0 then -- 117
				text = "Keep the armaments locked up." -- 118
			elseif TEAM_EMPEROR == _exp_0 then -- 119
				text = "He might be of use to me." -- 120
			elseif TEAM_GHOST == _exp_0 then -- 121
				text = "He has a noble pursuit." -- 122
			elseif TEAM_BONEHEAD == _exp_0 then -- 123
				text = "SEEN HIM BEFORE!!" -- 124
			end -- 124
		end -- 124
		return { -- 125
			text = text, -- 125
			font = "Spleen_Label_Small" -- 125
		}, false -- 125
	end, -- 106
	first_names = { -- 126
		"Wasted", -- 126
		"Decrepit", -- 126
		"Rotten" -- 126
	}, -- 126
	last_names = { -- 127
		"Soul", -- 127
		"Plunderer", -- 127
		"Traitor", -- 127
		"Wanderer" -- 127
	}, -- 127
	bar_names = { -- 129
		health = "regret" -- 129
	}, -- 128
	special_name = "Waste", -- 130
	special_name_chance = 1000, -- 131
	ShowSpare1 = open_player_menu, -- 132
	ShowSpare2 = open_action_menu, -- 133
	Reflect = function(ply) -- 134
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I am a Stalker, an unpatriotic wastelander. I pawn off the Wasteland's treasures to the highest bidder. Unlike everyone else, I am talented at digging through trash.") -- 135
	end, -- 134
	PlayerLoadout = function(ply) -- 136
		ply:ClearOddities() -- 137
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 138
		for slot, val in pairs({ -- 141
			[0] = 0, -- 141
			[1] = 2, -- 143
			[2] = { -- 145
				2, -- 145
				3, -- 145
				8, -- 145
				6 -- 145
			}, -- 145
			[3] = { -- 147
				19, -- 147
				20 -- 147
			}, -- 147
			[4] = 0, -- 149
			[5] = 0, -- 151
			[6] = { -- 153
				0, -- 153
				1, -- 153
				2, -- 153
				3 -- 153
			}, -- 153
			[7] = 0, -- 155
			[8] = 0, -- 157
			[9] = { -- 159
				0, -- 159
				1 -- 159
			} -- 159
		}) do -- 160
			set_bodygroup(ply, slot, val) -- 139
		end -- 139
		local skins = { -- 161
			4, -- 161
			6, -- 161
			7 -- 161
		} -- 161
		ply:SetSkin(skins[math.random(1, #skins)]) -- 162
		return false -- 163
	end -- 136
}) -- 87
do -- 165
	local _class_0 -- 165
	local _parent_0 = SOUND -- 165
	local _base_0 = { -- 165
		sound = "placenta/bonehead_aggrod4.wav", -- 167
		pitch = { -- 167
			200, -- 167
			250 -- 167
		} -- 165
	} -- 165
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 167
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 165
			_base_0[_key_0] = _val_0 -- 165
		end -- 165
	end -- 167
	if _base_0.__index == nil then -- 165
		_base_0.__index = _base_0 -- 165
	end -- 167
	setmetatable(_base_0, _parent_0.__base) -- 165
	_class_0 = setmetatable({ -- 165
		__init = function(self, ...) -- 165
			return _class_0.__parent.__init(self, ...) -- 165
		end, -- 165
		__base = _base_0, -- 165
		__name = "SpeechBonehead", -- 165
		__parent = _parent_0 -- 165
	}, { -- 165
		__index = function(cls, name) -- 165
			local val = rawget(_base_0, name) -- 165
			if val == nil then -- 165
				local parent = rawget(cls, "__parent") -- 165
				if parent then -- 165
					return parent[name] -- 165
				end -- 165
			else -- 165
				return val -- 165
			end -- 165
		end, -- 165
		__call = function(cls, ...) -- 165
			local _self_0 = setmetatable({ }, _base_0) -- 165
			cls.__init(_self_0, ...) -- 165
			return _self_0 -- 165
		end -- 165
	}) -- 165
	_base_0.__class = _class_0 -- 165
	if _parent_0.__inherited then -- 165
		_parent_0.__inherited(_parent_0, _class_0) -- 165
	end -- 165
	SpeechBonehead = _class_0 -- 165
end -- 167
TEAM_BONEHEAD = DarkRP.createJob("Bonehead", { -- 170
	color = Color(150, 150, 150), -- 170
	model = "models/player/zombie_fast.mdl", -- 171
	description = "evil fucker.", -- 172
	instant_respawn = true, -- 173
	command = "bonehead", -- 174
	salary = 1, -- 175
	max = 0, -- 176
	cost = 1, -- 177
	use_machines = false, -- 178
	speech_sounds = "SpeechBonehead", -- 179
	hurt_sounds = (function() -- 180
		local _accum_0 = { } -- 180
		local _len_0 = 1 -- 180
		for i = 1, 2 do -- 180
			_accum_0[_len_0] = "placenta/bonehead_slice" .. tostring(i) .. ".wav" -- 180
			_len_0 = _len_0 + 1 -- 180
		end -- 180
		return _accum_0 -- 180
	end)(), -- 180
	become_sounds = (function() -- 181
		local _accum_0 = { } -- 181
		local _len_0 = 1 -- 181
		for i = 1, 4 do -- 181
			_accum_0[_len_0] = "placenta/bonehead_aggrod" .. tostring(i) .. ".wav" -- 181
			_len_0 = _len_0 + 1 -- 181
		end -- 181
		return _accum_0 -- 181
	end)(), -- 181
	crosstext = function(ply) -- 182
		local text = "Don't panic." -- 183
		do -- 184
			local _exp_0 = lp:Team() -- 184
			if TEAM_PRIVATE == _exp_0 then -- 185
				text = "Oh no! He's real!" -- 186
			elseif TEAM_SANITAR == _exp_0 then -- 187
				text = "Oh boy." -- 188
			elseif TEAM_KORPSMAN == _exp_0 then -- 189
				text = "Oh no! It happened again!" -- 190
			elseif TEAM_DEALER == _exp_0 then -- 191
				text = "Free ribs to feed the troops." -- 192
			elseif TEAM_EMPEROR == _exp_0 then -- 193
				text = "Ha. It happened again." -- 194
			elseif TEAM_GHOST == _exp_0 then -- 195
				text = "Lookin' good." -- 196
			elseif TEAM_BONEHEAD == _exp_0 then -- 197
				text = "THERE'S ANOTHER ONE." -- 198
			end -- 198
		end -- 198
		return { -- 199
			text = text, -- 199
			font = "Spleen_Label_Small" -- 199
		}, false -- 199
	end, -- 182
	first_names = { -- 200
		"Evil" -- 200
	}, -- 200
	last_names = { -- 201
		"Fucker" -- 201
	}, -- 201
	no_needs = true, -- 202
	hint = "You are a truly pissed off skeleton. Go get 'em!", -- 203
	bar_names = { -- 205
		health = "EVIL FUCKER POWER" -- 205
	}, -- 204
	bar_colors = { -- 207
		health = Color(200, 0, 0) -- 207
	}, -- 206
	RenderScreenspaceEffects = function(ply) -- 208
		local ct = CurTime() -- 209
		DrawMotionBlur(0.25, 0.2, 0.3) -- 210
		return DrawSharpen(1 * math.sin(ct), 2 * math.random(0.8, 1.2)) -- 211
	end, -- 208
	ColorMod = function(ply) -- 212
		local abs, cos, sin = math.abs, math.cos, math.sin -- 213
		local ct = CurTime() -- 214
		local tab = { -- 216
			["$pp_colour_addr"] = 0.1, -- 216
			["$pp_colour_addg"] = 0, -- 217
			["$pp_colour_addb"] = 0, -- 218
			["$pp_colour_brightness"] = 0 + (-0.01 * cos(ct)), -- 219
			["$pp_colour_contrast"] = 1.6 + (abs(sin(ct * 0.166)) * 0.5), -- 220
			["$pp_colour_colour"] = 0, -- 221
			["$pp_colour_mulr"] = 0 + abs(sin(ct * 0.789)), -- 222
			["$pp_colour_mulg"] = 0, -- 223
			["$pp_colour_mulb"] = 0 -- 224
		} -- 215
		return tab -- 225
	end, -- 212
	ShowSpare1 = function() -- 226
		if CLIENT then -- 227
			return GAMEMODE:Frighten() -- 228
		end -- 227
	end, -- 226
	ShowSpare2 = function() -- 229
		if CLIENT then -- 230
			return GAMEMODE:Frighten() -- 231
		end -- 230
	end, -- 229
	Reflect = function(ply) -- 232
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=210,0,0>ARRRRGHH, I MUST KILL THEM ALL AND TAKE THEIR SKIN!!!") -- 233
	end, -- 232
	PlayerLoadout = function(ply) -- 234
		ply:SetNWInt("evilrp_gasmask", 0) -- 235
		ply:Give("evilrp_melee/hands/boneclaws") -- 236
		return true -- 237
	end, -- 234
	HandleRagdoll = function(rag, ply) -- 238
		return rag:SetNWInt("decomp_stage", DSTAGE_BONES) -- 239
	end -- 238
}) -- 169
TEAM_PRIVATE = DarkRP.createJob("Private", { -- 242
	color = Color(20, 150, 20), -- 242
	model = "models/vel/evilwar/royalist.mdl", -- 243
	description = "A new recruit that hasn't gone through training yet.", -- 244
	command = "proletariat", -- 245
	salary = 1, -- 246
	max = 0, -- 247
	cost = 0, -- 248
	hasLicense = true, -- 249
	candemote = false, -- 250
	use_machines = true, -- 251
	category = "Royalists", -- 252
	speech_sounds = (function() -- 253
		local _accum_0 = { } -- 253
		local _len_0 = 1 -- 253
		for i = 1, 3 do -- 253
			_accum_0[_len_0] = "placenta/speech/prole" .. tostring(i) .. ".wav" -- 253
			_len_0 = _len_0 + 1 -- 253
		end -- 253
		return _accum_0 -- 253
	end)(), -- 253
	hurt_sounds = (function() -- 254
		local _accum_0 = { } -- 254
		local _len_0 = 1 -- 254
		for i = 1, 5 do -- 254
			_accum_0[_len_0] = "placenta/pain/prole" .. tostring(i) .. ".wav" -- 254
			_len_0 = _len_0 + 1 -- 254
		end -- 254
		return _accum_0 -- 254
	end)(), -- 254
	become_sounds = (function() -- 255
		local _accum_0 = { } -- 255
		local _len_0 = 1 -- 255
		for i = 1, 3 do -- 255
			_accum_0[_len_0] = "npc/zombie/zombie_alert" .. tostring(i) .. ".wav" -- 255
			_len_0 = _len_0 + 1 -- 255
		end -- 255
		return _accum_0 -- 255
	end)(), -- 255
	death_sounds = (function() -- 256
		local _accum_0 = { } -- 256
		local _len_0 = 1 -- 256
		for i = 1, 3 do -- 256
			_accum_0[_len_0] = "placenta/death/prole" .. tostring(i) .. ".wav" -- 256
			_len_0 = _len_0 + 1 -- 256
		end -- 256
		return _accum_0 -- 256
	end)(), -- 256
	crosstext = function(ply) -- 257
		local text = "Don't panic." -- 258
		do -- 259
			local _exp_0 = lp:Team() -- 259
			if TEAM_PRIVATE == _exp_0 then -- 260
				text = "United in rank?" -- 261
			elseif TEAM_STALKER == _exp_0 then -- 262
				text = "A soldier from Lymphoma." -- 263
			elseif TEAM_SANITAR == _exp_0 then -- 264
				text = "These soldiers need guidance.\nPut the fear in their hearts." -- 265
			elseif TEAM_KORPSMAN == _exp_0 then -- 266
				text = "Smelly and stupid." -- 267
			elseif TEAM_DEALER == _exp_0 then -- 268
				text = "Prove your place, worm.\nOnly then will you be decorated." -- 269
			elseif TEAM_EMPEROR == _exp_0 then -- 270
				text = "Is he working hard enough?" -- 271
			elseif TEAM_GHOST == _exp_0 then -- 272
				text = "Sad, but funny." -- 273
			elseif TEAM_BONEHEAD == _exp_0 then -- 274
				text = "SKIN...!" -- 275
			end -- 275
		end -- 275
		return { -- 276
			text = text, -- 276
			font = "Spleen_Label_Small" -- 276
		}, false -- 276
	end, -- 257
	first_names = { -- 277
		"Private", -- 277
		"PVT.", -- 277
		"Recruit", -- 277
		"Enlistee", -- 277
		"Grunt", -- 277
		"Fodder", -- 277
		"Cadet", -- 277
		"CDT.", -- 277
		"Rookie" -- 277
	}, -- 277
	GenerateName = function(self, ply) -- 278
		local unit_id = math.random(1, 99) -- 279
		if unit_id < 10 then -- 280
			unit_id = "0" .. tostring(unit_id) -- 281
		else -- 283
			unit_id = tostring(unit_id) -- 283
		end -- 280
		return self.first_names[math.random(1, #self.first_names)] .. " #" .. unit_id -- 284
	end, -- 278
	special_name = "private parts", -- 285
	special_name_chance = 1000, -- 286
	ShowSpare1 = open_player_menu, -- 287
	ShowSpare2 = open_action_menu, -- 288
	Reflect = function(ply) -- 289
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I am a patriotic Lymphoman resident, a laborer and combatant. I must remain productive, my body should be used for the greater good. <c=0,210,0> I can be conscripted by the EMPEROR.") -- 290
	end, -- 289
	PlayerLoadout = function(ply) -- 291
		ply:ClearOddities() -- 292
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 293
		for slot, val in pairs({ -- 296
			[0] = 0, -- 296
			[1] = 0, -- 298
			[3] = { -- 300
				0, -- 300
				6, -- 300
				7, -- 300
				8 -- 300
			}, -- 300
			[4] = { -- 302
				0, -- 302
				4 -- 302
			}, -- 302
			[5] = 0, -- 304
			[6] = 0 -- 306
		}) do -- 307
			set_bodygroup(ply, slot, val) -- 294
		end -- 294
		return false -- 308
	end -- 291
}) -- 241
TEAM_CONSCRIPT = DarkRP.createJob("Conscript", { -- 311
	color = Color(19, 51, 45), -- 311
	model = "models/vel/evilwar/royalist.mdl", -- 312
	description = "The fate of those who don't make the cut.", -- 313
	weapons = { -- 314
		"evilrp_weapon/obrez", -- 314
		"evilrp_melee/pipe" -- 314
	}, -- 314
	command = "conscript", -- 315
	salary = 1, -- 316
	max = 5, -- 317
	cost = 1, -- 318
	hasLicense = true, -- 319
	use_machines = false, -- 320
	ammo = { -- 322
		pistol = 60 -- 322
	}, -- 321
	category = "Royalists", -- 323
	speech_sounds = (function() -- 324
		local _accum_0 = { } -- 324
		local _len_0 = 1 -- 324
		for i = 1, 15 do -- 324
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 324
			_len_0 = _len_0 + 1 -- 324
		end -- 324
		return _accum_0 -- 324
	end)(), -- 324
	hurt_sounds = (function() -- 325
		local _accum_0 = { } -- 325
		local _len_0 = 1 -- 325
		for i = 1, 4 do -- 325
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 325
			_len_0 = _len_0 + 1 -- 325
		end -- 325
		return _accum_0 -- 325
	end)(), -- 325
	become_sounds = (function() -- 326
		local _accum_0 = { } -- 326
		local _len_0 = 1 -- 326
		for i = 1, 15 do -- 326
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 326
			_len_0 = _len_0 + 1 -- 326
		end -- 326
		return _accum_0 -- 326
	end)(), -- 326
	crosstext = function(ply) -- 327
		local text = "Don't panic." -- 328
		do -- 329
			local _exp_0 = lp:Team() -- 329
			if TEAM_PRIVATE == _exp_0 then -- 330
				text = "I could be like him!" -- 331
			elseif TEAM_STALKER == _exp_0 then -- 332
				text = "Poor bastard." -- 333
			elseif TEAM_SANITAR == _exp_0 then -- 334
				text = "A fine meat shield." -- 335
			elseif TEAM_KORPSMAN == _exp_0 then -- 336
				text = "Fodder, made to die\n Unless..." -- 337
			elseif TEAM_DEALER == _exp_0 then -- 338
				text = "A follower of mine." -- 339
			elseif TEAM_EMPEROR == _exp_0 then -- 340
				text = "Cannon fodder, splendid." -- 341
			elseif TEAM_CONSCRIPT == _exp_0 then -- 342
				text = "United in blood." -- 343
			elseif TEAM_GHOST == _exp_0 then -- 344
				text = "Definitely stupid." -- 345
			elseif TEAM_BONEHEAD == _exp_0 then -- 346
				text = "HAHAHAH." -- 347
			end -- 347
		end -- 347
		return { -- 348
			text = text, -- 348
			font = "Spleen_Label_Small" -- 348
		}, false -- 348
	end, -- 327
	first_names = { -- 349
		"Fodder", -- 349
		"Meatshield", -- 349
		"Grunt", -- 349
		"Drone", -- 349
		"Conscript", -- 349
		"Meatbag" -- 349
	}, -- 349
	GenerateName = function(self, ply) -- 350
		local unit_id = math.random(1, 99) -- 351
		if unit_id < 10 then -- 352
			unit_id = "0" .. tostring(unit_id) -- 353
		else -- 355
			unit_id = tostring(unit_id) -- 355
		end -- 352
		return self.first_names[math.random(1, #self.first_names)] .. " #" .. unit_id -- 356
	end, -- 350
	special_name = "private parts", -- 357
	special_name_chance = 1000, -- 358
	ShowSpare1 = open_player_menu, -- 359
	ShowSpare2 = open_action_menu, -- 360
	Reflect = function(ply) -- 361
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I have been conscripted by the EMPEROR himself. I must patrol the Wasteland and prevent the entry of foreign invaders, and risk my life for the Emperor. This role holds responsibility.<c=210,0,0> I must not purposely cause the deaths of your comrades.") -- 362
	end, -- 361
	PlayerLoadout = function(ply) -- 363
		for slot, val in pairs({ -- 366
			[0] = 0, -- 366
			[2] = 0, -- 368
			[3] = { -- 370
				7, -- 370
				8 -- 370
			}, -- 370
			[4] = { -- 372
				0, -- 372
				4 -- 372
			}, -- 372
			[5] = 0, -- 374
			[6] = 0, -- 376
			[7] = 1 -- 378
		}) do -- 379
			set_bodygroup(ply, slot, val) -- 364
		end -- 364
		ply:SetArmor(25) -- 380
		return false -- 381
	end -- 363
}) -- 310
TEAM_SANITAR = DarkRP.createJob("Dragoon", { -- 384
	color = Color(0, 25, 93), -- 384
	model = "models/vel/evilwar/royalist.mdl", -- 385
	description = "The right hand of the Emperor.\nRespected by his peers,\nfeared by his enemies.", -- 386
	weapons = { -- 387
		"evilrp_weapon/hope", -- 387
		"evilrp_melee/sabre" -- 387
	}, -- 387
	command = "ss", -- 388
	salary = 1, -- 389
	max = 6, -- 390
	cost = 3, -- 391
	hasLicense = true, -- 392
	use_machines = false, -- 393
	ammo = { -- 395
		pistol = 60 -- 395
	}, -- 394
	category = "Royalists", -- 396
	speech_sounds = (function() -- 397
		local _accum_0 = { } -- 397
		local _len_0 = 1 -- 397
		for i = 1, 15 do -- 397
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 397
			_len_0 = _len_0 + 1 -- 397
		end -- 397
		return _accum_0 -- 397
	end)(), -- 397
	hurt_sounds = (function() -- 398
		local _accum_0 = { } -- 398
		local _len_0 = 1 -- 398
		for i = 1, 4 do -- 398
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 398
			_len_0 = _len_0 + 1 -- 398
		end -- 398
		return _accum_0 -- 398
	end)(), -- 398
	become_sounds = (function() -- 399
		local _accum_0 = { } -- 399
		local _len_0 = 1 -- 399
		for i = 1, 15 do -- 399
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 399
			_len_0 = _len_0 + 1 -- 399
		end -- 399
		return _accum_0 -- 399
	end)(), -- 399
	crosstext = function(ply) -- 400
		local text = "Don't panic." -- 401
		do -- 402
			local _exp_0 = lp:Team() -- 402
			if TEAM_PRIVATE == _exp_0 then -- 403
				text = "A Lymphomian legend!" -- 404
			elseif TEAM_STALKER == _exp_0 then -- 405
				text = "Fight or run?!" -- 406
			elseif TEAM_SANITAR == _exp_0 then -- 407
				text = "Finally...\nSomeone competent." -- 408
			elseif TEAM_KORPSMAN == _exp_0 then -- 409
				text = "Is that enemy blood?\nNo of course not." -- 410
			elseif TEAM_DEALER == _exp_0 then -- 411
				text = "A follower of mine." -- 412
			elseif TEAM_EMPEROR == _exp_0 then -- 413
				text = "A tentacle of mine." -- 414
			elseif TEAM_GHOST == _exp_0 then -- 415
				text = "Evil, stupid,\n maybe both." -- 416
			elseif TEAM_BONEHEAD == _exp_0 then -- 417
				text = "DANGER." -- 418
			end -- 418
		end -- 418
		return { -- 419
			text = text, -- 419
			font = "Spleen_Label_Small" -- 419
		}, true -- 419
	end, -- 400
	first_names = { -- 420
		"Subjugator", -- 420
		"Dragoner", -- 420
		"Persecuter", -- 420
		"Draconarius", -- 420
		"Volontaire" -- 420
	}, -- 420
	last_names = { -- 421
		"of Die Augen", -- 421
		"of Knochen", -- 421
		"of Sehne", -- 421
		"of Knorpel", -- 421
		"of Bauchspeicheldrüse" -- 421
	}, -- 421
	arms_model = "models/weapons/c_arms_refugee.mdl", -- 422
	ShowSpare1 = open_player_menu, -- 423
	ShowSpare2 = open_action_menu, -- 424
	bar_names = { -- 426
		health = "resolve" -- 426
	}, -- 425
	Reflect = function(ply) -- 427
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I am part of the EMPEROR's finest soldiers. The Privates, Conscripts, and Sanitaters are my subordinates, whilst the EMPEROR and the Quartermaster are my superiors. <c=0,210,0>I must keep order within the city, and the machines tidy") -- 428
	end, -- 427
	PlayerLoadout = function(ply) -- 429
		ply:ClearOddities() -- 430
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 431
		for slot, val in pairs({ -- 434
			[0] = 1, -- 434
			[1] = 1, -- 436
			[2] = 1, -- 438
			[3] = 2, -- 440
			[4] = 3, -- 442
			[5] = 0 -- 444
		}) do -- 445
			set_bodygroup(ply, slot, val) -- 432
		end -- 432
		ply:SetArmor(40) -- 446
		return false -- 447
	end -- 429
}) -- 383
TEAM_DEALER = DarkRP.createJob("Quartermaster", { -- 450
	color = Color(255, 140, 0), -- 450
	model = "models/vel/evilwar/royalist.mdl", -- 451
	description = "The left hand of the Emperor.\nManage the goods and keep your men armed.", -- 452
	weapons = { }, -- 453
	command = "dealer", -- 454
	salary = 1, -- 455
	max = 1, -- 456
	cost = 3, -- 457
	hasLicense = false, -- 458
	use_machines = false, -- 459
	category = "Royalists", -- 460
	speech_sounds = (function() -- 461
		local _accum_0 = { } -- 461
		local _len_0 = 1 -- 461
		for i = 1, 3 do -- 461
			_accum_0[_len_0] = "placenta/speech/dealer" .. tostring(i) .. ".wav" -- 461
			_len_0 = _len_0 + 1 -- 461
		end -- 461
		return _accum_0 -- 461
	end)(), -- 461
	hurt_sounds = (function() -- 462
		local _accum_0 = { } -- 462
		local _len_0 = 1 -- 462
		for i = 1, 4 do -- 462
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 462
			_len_0 = _len_0 + 1 -- 462
		end -- 462
		return _accum_0 -- 462
	end)(), -- 462
	become_sounds = (function() -- 463
		local _accum_0 = { } -- 463
		local _len_0 = 1 -- 463
		for i = 1, 15 do -- 463
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 463
			_len_0 = _len_0 + 1 -- 463
		end -- 463
		return _accum_0 -- 463
	end)(), -- 463
	crosstext = function(ply) -- 464
		local text = "Don't panic." -- 465
		do -- 466
			local _exp_0 = lp:Team() -- 466
			if TEAM_PRIVATE == _exp_0 then -- 467
				text = "This guy handles the guns." -- 468
			elseif TEAM_STALKER == _exp_0 then -- 469
				text = "Captain of the goods." -- 470
			elseif TEAM_SANITAR == _exp_0 then -- 471
				text = "The oldest living Dragoon.\nRespect. Honor." -- 472
			elseif TEAM_KORPSMAN == _exp_0 then -- 473
				text = "A reminder of the power of Kapitalism." -- 474
			elseif TEAM_DEALER == _exp_0 then -- 475
				text = "I'm seeing double!" -- 476
			elseif TEAM_EMPEROR == _exp_0 then -- 477
				text = "My brother in arms.\nIf he fails, I'll cut his off." -- 478
			elseif TEAM_GHOST == _exp_0 then -- 479
				text = "Glorified accountant." -- 480
			elseif TEAM_BONEHEAD == _exp_0 then -- 481
				text = "BONES ARE HIS DOLLARS." -- 482
			end -- 482
		end -- 482
		return { -- 483
			text = text, -- 483
			font = "Spleen_Label_Small" -- 483
		}, true -- 483
	end, -- 464
	first_names = { -- 484
		"Quartermaster", -- 484
		"Quartiermeister" -- 484
	}, -- 484
	last_names = { -- 485
		"Kommissariatsdienst" -- 485
	}, -- 485
	special_name = "Trusty", -- 486
	special_name_chance = 1000, -- 487
	ShowSpare1 = open_player_menu, -- 488
	ShowSpare2 = open_action_menu, -- 489
	bar_names = { -- 491
		health = "insurance" -- 491
	}, -- 490
	PlayerLoadout = function(ply) -- 492
		ply:ClearOddities() -- 493
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 494
		for slot, val in pairs({ -- 497
			[0] = 1, -- 497
			[1] = 1, -- 499
			[2] = 1, -- 501
			[3] = 1, -- 503
			[4] = 3, -- 505
			[5] = 0 -- 507
		}) do -- 508
			set_bodygroup(ply, slot, val) -- 495
		end -- 495
		return false -- 509
	end -- 492
}) -- 449
TEAM_KORPSMAN = DarkRP.createJob("Sanitäter", { -- 512
	color = Color(79, 150, 150), -- 512
	model = "models/vel/evilwar/royalist.mdl", -- 513
	description = "You keep people alive in this terrible place.\nFill the blood and empty the rust.", -- 514
	weapons = { -- 515
		"evilrp/medkit" -- 515
	}, -- 515
	command = "medic", -- 516
	salary = 1, -- 517
	max = 2, -- 518
	cost = 2, -- 519
	hasLicense = false, -- 520
	medic = true, -- 521
	use_machines = false, -- 522
	category = "Royalists", -- 523
	speech_sounds = (function() -- 524
		local _accum_0 = { } -- 524
		local _len_0 = 1 -- 524
		for i = 1, 4 do -- 524
			_accum_0[_len_0] = "placenta/speech/korps" .. tostring(i) .. ".wav" -- 524
			_len_0 = _len_0 + 1 -- 524
		end -- 524
		return _accum_0 -- 524
	end)(), -- 524
	hurt_sounds = (function() -- 525
		local _accum_0 = { } -- 525
		local _len_0 = 1 -- 525
		for i = 1, 4 do -- 525
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 525
			_len_0 = _len_0 + 1 -- 525
		end -- 525
		return _accum_0 -- 525
	end)(), -- 525
	become_sounds = { -- 526
		"items/suitchargeok1.wav" -- 526
	}, -- 526
	crosstext = function(ply) -- 527
		local text = "Don't panic." -- 528
		do -- 529
			local _exp_0 = lp:Team() -- 529
			if TEAM_PRIVATE == _exp_0 then -- 530
				text = "I forgot what\nto call these guys." -- 531
			elseif TEAM_STALKER == _exp_0 then -- 532
				text = "A walking blood bag." -- 533
			elseif TEAM_SANITAR == _exp_0 then -- 534
				text = "Better remember\nwho lets them live." -- 535
			elseif TEAM_KORPSMAN == _exp_0 then -- 536
				text = "Something to\nbe happy about." -- 537
			elseif TEAM_DEALER == _exp_0 then -- 538
				text = "Keep them busy.\nWe need their blood and sweat." -- 539
			elseif TEAM_EMPEROR == _exp_0 then -- 540
				text = "What a strange,\nselfless thing." -- 541
			elseif TEAM_GHOST == _exp_0 then -- 542
				text = "A respectable mortal." -- 543
			elseif TEAM_BONEHEAD == _exp_0 then -- 544
				text = "CONFUSING." -- 545
			end -- 545
		end -- 545
		return { -- 546
			text = text, -- 546
			font = "Spleen_Label_Small" -- 546
		}, true -- 546
	end, -- 527
	first_names = { -- 547
		"Dissector", -- 547
		"Retractor", -- 547
		"Suture", -- 547
		"Femur", -- 547
		"Cystic", -- 547
		"Rasp", -- 547
		"Ferrum", -- 547
		"Fascia", -- 547
		"Marrow", -- 547
		"Lienis", -- 547
		"Aorta", -- 547
		"Tunica", -- 547
		"Maxilla", -- 547
		"Sacrum", -- 547
		"Leach" -- 547
	}, -- 547
	last_names = { -- 548
		"Forceps", -- 548
		"Scalpel", -- 548
		"Curette", -- 548
		"Rongeur", -- 548
		"Trocar", -- 548
		"Babcock", -- 548
		"Duval", -- 548
		"Hemostat", -- 548
		"Ossis", -- 548
		"Caro", -- 548
		"Cadaver", -- 548
		"Sanguis", -- 548
		"Bilis", -- 548
		"Viscera", -- 548
		"Jugular", -- 548
		"Clavius" -- 548
	}, -- 548
	special_name = "Corpseman", -- 549
	special_name_chance = 1000, -- 550
	ShowSpare1 = open_player_menu, -- 551
	ShowSpare2 = open_action_menu, -- 552
	bar_names = { -- 554
		health = "Bio-reserves" -- 554
	}, -- 553
	PlayerLoadout = function(ply) -- 555
		ply:ClearOddities() -- 556
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 557
		ply:SetSkin(4) -- 558
		for slot, val in pairs({ -- 561
			[0] = 0, -- 561
			[1] = 0, -- 563
			[2] = 2, -- 565
			[3] = 3, -- 567
			[4] = 1, -- 569
			[5] = 0 -- 571
		}) do -- 572
			set_bodygroup(ply, slot, val) -- 559
		end -- 559
		return false -- 573
	end -- 555
}) -- 511
TEAM_EMPEROR = DarkRP.createJob("Emperor", { -- 576
	color = Color(150, 20, 20), -- 576
	model = "models/vel/evilwar/royalist.mdl", -- 577
	description = "Rule with an iron fist.", -- 578
	command = "emperor", -- 579
	salary = 1, -- 580
	weapons = { -- 581
		"evilrp_weapon/novoluger" -- 581
	}, -- 581
	max = 1, -- 582
	cost = 5, -- 583
	weapons = { }, -- 584
	hasLicense = true, -- 585
	mayor = true, -- 586
	use_machines = false, -- 587
	category = "Royalists", -- 588
	speech_sounds = (function() -- 589
		local _accum_0 = { } -- 589
		local _len_0 = 1 -- 589
		for i = 1, 15 do -- 589
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 589
			_len_0 = _len_0 + 1 -- 589
		end -- 589
		return _accum_0 -- 589
	end)(), -- 589
	become_sounds = { -- 590
		"kidneydagger/broadcast1.wav" -- 590
	}, -- 590
	crosstext = function(ply) -- 591
		local text = "Don't panic." -- 592
		do -- 593
			local _exp_0 = lp:Team() -- 593
			if TEAM_PRIVATE == _exp_0 then -- 594
				text = "Listen carefully." -- 595
			elseif TEAM_STALKER == _exp_0 then -- 596
				text = "Oh, your majesty!" -- 597
			elseif TEAM_SANITAR == _exp_0 then -- 598
				text = "Hail, hail!" -- 599
			elseif TEAM_KORPSMAN == _exp_0 then -- 600
				text = "Is he feeling okay?" -- 601
			elseif TEAM_DEALER == _exp_0 then -- 602
				text = "Glorious leader.\nI'm nothing without him." -- 603
			elseif TEAM_EMPEROR == _exp_0 then -- 604
				text = "Our strength\nshall prevail." -- 605
			elseif TEAM_GHOST == _exp_0 then -- 606
				text = "So full of lies." -- 607
			elseif TEAM_BONEHEAD == _exp_0 then -- 608
				text = "THERE HE IS!!" -- 609
			end -- 609
		end -- 609
		return { -- 610
			text = text, -- 610
			font = "Spleen_Label_Small" -- 610
		}, true -- 610
	end, -- 591
	first_names = { -- 612
		"Basileus", -- 612
		"Agrippa", -- 612
		"Gnaeus", -- 612
		"Gaius" -- 612
	}, -- 612
	last_names = { -- 613
		"Imperator Lymphoma", -- 613
		"Kaiser Lymphoma", -- 613
		"Rex Lymphoma", -- 613
		"Lymphoma Magnus" -- 613
	}, -- 613
	special_name = "Which Kaiser", -- 614
	special_name_chance = 1000, -- 615
	ShowSpare1 = open_player_menu, -- 616
	ShowSpare2 = open_action_menu, -- 617
	bar_names = { -- 619
		health = "PRIDE" -- 619
	}, -- 618
	Reflect = function(ply) -- 620
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I am the EMPEROR of Lymphoma. I am the supreme ruler of this city and its people. I decide who lives and who dies. <c=0,210,0>I can use my terminal to administrate our internal affairs.") -- 621
	end, -- 620
	PlayerLoadout = function(ply) -- 622
		ply:ClearOddities() -- 623
		local oddities -- 624
		do -- 624
			local _accum_0 = { } -- 624
			local _len_0 = 1 -- 624
			for k, v in pairs(ODDITY.list) do -- 624
				if v ~= ODDITY_ILLITERACY then -- 624
					_accum_0[_len_0] = v -- 624
					_len_0 = _len_0 + 1 -- 624
				end -- 624
			end -- 624
			oddities = _accum_0 -- 624
		end -- 624
		ply:AddOddity(oddities[math.random(#oddities)]) -- 625
		for slot, val in pairs({ -- 628
			[0] = 1, -- 628
			[1] = 2, -- 630
			[2] = 0, -- 632
			[3] = 1, -- 634
			[4] = 2, -- 636
			[5] = 0 -- 638
		}) do -- 639
			set_bodygroup(ply, slot, val) -- 626
		end -- 626
		ply:SetNWInt("evilrp_gasmask", 4) -- 640
		ply:Give("evilrp_weapon/novoluger") -- 641
		ply:SetArmor(65) -- 642
		return false -- 643
	end -- 622
}) -- 575
GAMEMODE.CivilProtection = { -- 646
	[TEAM_PRIVATE] = true, -- 646
	[TEAM_SANITAR] = true, -- 647
	[TEAM_EMPEROR] = true -- 648
} -- 645
GAMEMODE.DefaultTeam = TEAM_GHOST -- 650
