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
	else -- 21
		return GAMEMODE:Frighten() -- 21
	end -- 18
end -- 16
local open_action_menu -- 23
open_action_menu = function(ply) -- 23
	if not CLIENT then -- 24
		return -- 24
	end -- 24
	local tr = GAMEMODE:GetHandTrace(ply, 80) -- 25
	return GAMEMODE:OpenActionMenu(tr.HitPos, tr.Entity) -- 26
end -- 23
TEAM_GHOST = DarkRP.createJob("Ghost", { -- 29
	color = Color(150, 150, 150), -- 29
	model = "models/player/skeleton.mdl", -- 30
	description = "A lost soul.", -- 31
	instant_respawn = true, -- 32
	weapons = { }, -- 33
	command = "ghost", -- 34
	salary = 1, -- 35
	max = 0, -- 36
	cost = 0, -- 37
	use_machines = false, -- 38
	speech_sounds = { -- 39
		"ambient/voices/squeal1.wav" -- 39
	}, -- 39
	crosstext = function(ply) -- 40
		local text = "OH SOTLA,\nTHE HORROR." -- 42
		do -- 43
			local _exp_0 = lp:Team() -- 43
			if TEAM_KORPSMAN == _exp_0 then -- 44
				text = "Evil spirits wander!\n<wiggle>Not on my shift." -- 45
			elseif TEAM_GHOST == _exp_0 then -- 46
				text = "We're the same,\nyou and I." -- 47
			end -- 47
		end -- 47
		return { -- 48
			text = text, -- 48
			font = "Spleen_Label_Small" -- 48
		} -- 48
	end, -- 40
	first_names = { -- 49
		"Suffering", -- 49
		"Fear", -- 49
		"Agony", -- 49
		"Malice", -- 49
		"Hatred", -- 49
		"Grief", -- 49
		"Pain", -- 49
		"Despair", -- 49
		"Rage" -- 49
	}, -- 49
	ShowSpare1 = function(ply) -- 52
		if CLIENT then -- 53
			return GAMEMODE:Frighten() -- 54
		end -- 53
	end, -- 52
	ShowSpare2 = function(ply) -- 55
		local nearby = ents.FindInSphere(ply:GetPos(), 16) -- 56
		local found -- 57
		for _index_0 = 1, #nearby do -- 58
			local ent = nearby[_index_0] -- 58
			if ent:GetClass():find("portal/spawn") then -- 59
				found = ent -- 60
				break -- 61
			end -- 59
		end -- 61
		if not (found and IsValid(found)) then -- 62
			if CLIENT then -- 63
				return GAMEMODE:Frighten() -- 64
			else -- 66
				return ply:Notify("<c=200,0,0>There is no purpose in life near me.") -- 66
			end -- 63
		elseif SERVER then -- 67
			return found:Use(ply) -- 68
		end -- 62
	end, -- 55
	PlayerLoadout = function(ply) -- 69
		ply:ClearOddities() -- 71
		ply:SetNWInt("evilrp_gasmask", 0) -- 72
		return true -- 73
	end, -- 69
	ColorMod = function(ply) -- 74
		local abs, cos, sin = math.abs, math.cos, math.sin -- 75
		local ct = CurTime() -- 76
		local tab = { -- 78
			["$pp_colour_addr"] = 0, -- 78
			["$pp_colour_addg"] = 0, -- 79
			["$pp_colour_addb"] = 0, -- 80
			["$pp_colour_brightness"] = 0 + (-0.01 * cos(ct)), -- 81
			["$pp_colour_contrast"] = 0.6 + (abs(sin(ct * 0.166)) * 0.5), -- 82
			["$pp_colour_colour"] = 0, -- 83
			["$pp_colour_mulr"] = 0 + abs(sin(ct * 0.789)), -- 84
			["$pp_colour_mulg"] = 0, -- 85
			["$pp_colour_mulb"] = 0 -- 86
		} -- 77
		return tab -- 87
	end -- 74
}) -- 28
TEAM_STALKER = DarkRP.createJob("Stalker", { -- 90
	color = Color(20, 150, 20), -- 90
	model = "models/liver_failure/wastelander/wastelander.mdl", -- 91
	description = "A soul with no allegiance, destined to plunder the wasteland.", -- 92
	weapons = { -- 93
		"evilrp_weapon/whisper", -- 93
		"evilrp_melee/axe" -- 93
	}, -- 93
	category = "Wasteland", -- 94
	command = "stalker", -- 95
	salary = 1, -- 96
	max = 3, -- 97
	cost = 4, -- 98
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
	PlayerLoadout = function(ply) -- 134
		ply:ClearOddities() -- 135
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 136
		for slot, val in pairs({ -- 139
			[0] = 0, -- 139
			[1] = 2, -- 141
			[2] = { -- 143
				2, -- 143
				3, -- 143
				8, -- 143
				6 -- 143
			}, -- 143
			[3] = { -- 145
				19, -- 145
				20 -- 145
			}, -- 145
			[4] = 0, -- 147
			[5] = 0, -- 149
			[6] = { -- 151
				0, -- 151
				1, -- 151
				2, -- 151
				3 -- 151
			}, -- 151
			[7] = 0, -- 153
			[8] = 0, -- 155
			[9] = { -- 157
				0, -- 157
				1 -- 157
			} -- 157
		}) do -- 158
			set_bodygroup(ply, slot, val) -- 137
		end -- 137
		local skins = { -- 159
			4, -- 159
			6, -- 159
			7 -- 159
		} -- 159
		ply:SetSkin(skins[math.random(1, #skins)]) -- 160
		return false -- 161
	end -- 134
}) -- 89
do -- 163
	local _class_0 -- 163
	local _parent_0 = SOUND -- 163
	local _base_0 = { -- 163
		sound = "placenta/bonehead_aggrod4.wav", -- 165
		pitch = { -- 165
			200, -- 165
			250 -- 165
		} -- 163
	} -- 163
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 165
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 163
			_base_0[_key_0] = _val_0 -- 163
		end -- 163
	end -- 165
	if _base_0.__index == nil then -- 163
		_base_0.__index = _base_0 -- 163
	end -- 165
	setmetatable(_base_0, _parent_0.__base) -- 163
	_class_0 = setmetatable({ -- 163
		__init = function(self, ...) -- 163
			return _class_0.__parent.__init(self, ...) -- 163
		end, -- 163
		__base = _base_0, -- 163
		__name = "SpeechBonehead", -- 163
		__parent = _parent_0 -- 163
	}, { -- 163
		__index = function(cls, name) -- 163
			local val = rawget(_base_0, name) -- 163
			if val == nil then -- 163
				local parent = rawget(cls, "__parent") -- 163
				if parent then -- 163
					return parent[name] -- 163
				end -- 163
			else -- 163
				return val -- 163
			end -- 163
		end, -- 163
		__call = function(cls, ...) -- 163
			local _self_0 = setmetatable({ }, _base_0) -- 163
			cls.__init(_self_0, ...) -- 163
			return _self_0 -- 163
		end -- 163
	}) -- 163
	_base_0.__class = _class_0 -- 163
	if _parent_0.__inherited then -- 163
		_parent_0.__inherited(_parent_0, _class_0) -- 163
	end -- 163
	SpeechBonehead = _class_0 -- 163
end -- 165
TEAM_BONEHEAD = DarkRP.createJob("Bonehead", { -- 168
	color = Color(150, 150, 150), -- 168
	model = "models/player/zombie_fast.mdl", -- 169
	description = "evil fucker.", -- 170
	instant_respawn = true, -- 171
	command = "bonehead", -- 172
	salary = 1, -- 173
	max = 0, -- 174
	cost = 1, -- 175
	use_machines = false, -- 176
	speech_sounds = "SpeechBonehead", -- 177
	hurt_sounds = (function() -- 178
		local _accum_0 = { } -- 178
		local _len_0 = 1 -- 178
		for i = 1, 2 do -- 178
			_accum_0[_len_0] = "placenta/bonehead_slice" .. tostring(i) .. ".wav" -- 178
			_len_0 = _len_0 + 1 -- 178
		end -- 178
		return _accum_0 -- 178
	end)(), -- 178
	become_sounds = (function() -- 179
		local _accum_0 = { } -- 179
		local _len_0 = 1 -- 179
		for i = 1, 4 do -- 179
			_accum_0[_len_0] = "placenta/bonehead_aggrod" .. tostring(i) .. ".wav" -- 179
			_len_0 = _len_0 + 1 -- 179
		end -- 179
		return _accum_0 -- 179
	end)(), -- 179
	crosstext = function(ply) -- 180
		local text = "Don't panic." -- 181
		do -- 182
			local _exp_0 = lp:Team() -- 182
			if TEAM_PRIVATE == _exp_0 then -- 183
				text = "Oh no! He's real!" -- 184
			elseif TEAM_SANITAR == _exp_0 then -- 185
				text = "Oh boy." -- 186
			elseif TEAM_KORPSMAN == _exp_0 then -- 187
				text = "Oh no! It happened again!" -- 188
			elseif TEAM_DEALER == _exp_0 then -- 189
				text = "Free ribs to feed the troops." -- 190
			elseif TEAM_EMPEROR == _exp_0 then -- 191
				text = "Ha. It happened again." -- 192
			elseif TEAM_GHOST == _exp_0 then -- 193
				text = "Lookin' good." -- 194
			elseif TEAM_BONEHEAD == _exp_0 then -- 195
				text = "THERE'S ANOTHER ONE." -- 196
			end -- 196
		end -- 196
		return { -- 197
			text = text, -- 197
			font = "Spleen_Label_Small" -- 197
		}, false -- 197
	end, -- 180
	first_names = { -- 198
		"Evil" -- 198
	}, -- 198
	last_names = { -- 199
		"Fucker" -- 199
	}, -- 199
	no_needs = true, -- 200
	hint = "You are a truly pissed off skeleton. Go get 'em!", -- 201
	bar_names = { -- 203
		health = "EVIL FUCKER POWER" -- 203
	}, -- 202
	bar_colors = { -- 205
		health = Color(200, 0, 0) -- 205
	}, -- 204
	RenderScreenspaceEffects = function(ply) -- 206
		local ct = CurTime() -- 207
		DrawMotionBlur(0.25, 0.2, 0.3) -- 208
		return DrawSharpen(1 * math.sin(ct), 2 * math.random(0.8, 1.2)) -- 209
	end, -- 206
	ColorMod = function(ply) -- 210
		local abs, cos, sin = math.abs, math.cos, math.sin -- 211
		local ct = CurTime() -- 212
		local tab = { -- 214
			["$pp_colour_addr"] = 0.1, -- 214
			["$pp_colour_addg"] = 0, -- 215
			["$pp_colour_addb"] = 0, -- 216
			["$pp_colour_brightness"] = 0 + (-0.01 * cos(ct)), -- 217
			["$pp_colour_contrast"] = 1.6 + (abs(sin(ct * 0.166)) * 0.5), -- 218
			["$pp_colour_colour"] = 0, -- 219
			["$pp_colour_mulr"] = 0 + abs(sin(ct * 0.789)), -- 220
			["$pp_colour_mulg"] = 0, -- 221
			["$pp_colour_mulb"] = 0 -- 222
		} -- 213
		return tab -- 223
	end, -- 210
	ShowSpare1 = function() -- 224
		if CLIENT then -- 225
			return GAMEMODE:Frighten() -- 226
		end -- 225
	end, -- 224
	ShowSpare2 = function() -- 227
		if CLIENT then -- 228
			return GAMEMODE:Frighten() -- 229
		end -- 228
	end, -- 227
	PlayerLoadout = function(ply) -- 230
		ply:SetNWInt("evilrp_gasmask", 0) -- 231
		ply:Give("evilrp_melee/hands/boneclaws") -- 232
		return true -- 233
	end, -- 230
	HandleRagdoll = function(rag, ply) -- 234
		return rag:SetNWInt("decomp_stage", DSTAGE_BONES) -- 235
	end -- 234
}) -- 167
TEAM_PRIVATE = DarkRP.createJob("Private", { -- 238
	color = Color(20, 150, 20), -- 238
	model = "models/vel/evilwar/royalist.mdl", -- 239
	description = "A new recruit that hasn't gone through training yet.", -- 240
	command = "proletariat", -- 241
	salary = 1, -- 242
	max = 0, -- 243
	cost = 0, -- 244
	hasLicense = true, -- 245
	candemote = false, -- 246
	use_machines = true, -- 247
	category = "Royalists", -- 248
	speech_sounds = (function() -- 249
		local _accum_0 = { } -- 249
		local _len_0 = 1 -- 249
		for i = 1, 3 do -- 249
			_accum_0[_len_0] = "placenta/speech/prole" .. tostring(i) .. ".wav" -- 249
			_len_0 = _len_0 + 1 -- 249
		end -- 249
		return _accum_0 -- 249
	end)(), -- 249
	hurt_sounds = (function() -- 250
		local _accum_0 = { } -- 250
		local _len_0 = 1 -- 250
		for i = 1, 5 do -- 250
			_accum_0[_len_0] = "placenta/pain/prole" .. tostring(i) .. ".wav" -- 250
			_len_0 = _len_0 + 1 -- 250
		end -- 250
		return _accum_0 -- 250
	end)(), -- 250
	become_sounds = (function() -- 251
		local _accum_0 = { } -- 251
		local _len_0 = 1 -- 251
		for i = 1, 3 do -- 251
			_accum_0[_len_0] = "npc/zombie/zombie_alert" .. tostring(i) .. ".wav" -- 251
			_len_0 = _len_0 + 1 -- 251
		end -- 251
		return _accum_0 -- 251
	end)(), -- 251
	death_sounds = (function() -- 252
		local _accum_0 = { } -- 252
		local _len_0 = 1 -- 252
		for i = 1, 3 do -- 252
			_accum_0[_len_0] = "placenta/death/prole" .. tostring(i) .. ".wav" -- 252
			_len_0 = _len_0 + 1 -- 252
		end -- 252
		return _accum_0 -- 252
	end)(), -- 252
	crosstext = function(ply) -- 253
		local text = "Don't panic." -- 254
		do -- 255
			local _exp_0 = lp:Team() -- 255
			if TEAM_PRIVATE == _exp_0 then -- 256
				text = "United in rank?" -- 257
			elseif TEAM_STALKER == _exp_0 then -- 258
				text = "A soldier from Lymphoma." -- 259
			elseif TEAM_SANITAR == _exp_0 then -- 260
				text = "These soldiers need guidance.\nPut the fear in their hearts." -- 261
			elseif TEAM_KORPSMAN == _exp_0 then -- 262
				text = "Smelly and stupid." -- 263
			elseif TEAM_DEALER == _exp_0 then -- 264
				text = "Prove your place, worm.\nOnly then will you be decorated." -- 265
			elseif TEAM_EMPEROR == _exp_0 then -- 266
				text = "Is he working hard enough?" -- 267
			elseif TEAM_GHOST == _exp_0 then -- 268
				text = "Sad, but funny." -- 269
			elseif TEAM_BONEHEAD == _exp_0 then -- 270
				text = "SKIN...!" -- 271
			end -- 271
		end -- 271
		return { -- 272
			text = text, -- 272
			font = "Spleen_Label_Small" -- 272
		}, false -- 272
	end, -- 253
	first_names = { -- 273
		"Private", -- 273
		"PVT.", -- 273
		"Recruit", -- 273
		"Enlistee", -- 273
		"Grunt", -- 273
		"Fodder", -- 273
		"Cadet", -- 273
		"CDT.", -- 273
		"Rookie" -- 273
	}, -- 273
	GenerateName = function(self, ply) -- 274
		local unit_id = math.random(1, 99) -- 275
		if unit_id < 10 then -- 276
			unit_id = "0" .. tostring(unit_id) -- 277
		else -- 279
			unit_id = tostring(unit_id) -- 279
		end -- 276
		return self.first_names[math.random(1, #self.first_names)] .. " #" .. unit_id -- 280
	end, -- 274
	special_name = "private parts", -- 281
	special_name_chance = 1000, -- 282
	ShowSpare1 = open_player_menu, -- 283
	ShowSpare2 = open_action_menu, -- 284
	PlayerLoadout = function(ply) -- 285
		ply:ClearOddities() -- 286
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 287
		for slot, val in pairs({ -- 290
			[0] = 0, -- 290
			[1] = 0, -- 292
			[3] = { -- 294
				0, -- 294
				6, -- 294
				7, -- 294
				8 -- 294
			}, -- 294
			[4] = { -- 296
				0, -- 296
				4 -- 296
			}, -- 296
			[5] = 0, -- 298
			[6] = 0 -- 300
		}) do -- 301
			set_bodygroup(ply, slot, val) -- 288
		end -- 288
		return false -- 302
	end -- 285
}) -- 237
TEAM_CONSCRIPT = DarkRP.createJob("Conscript", { -- 305
	color = Color(25, 170, 0), -- 305
	model = "models/vel/evilwar/royalist.mdl", -- 306
	description = "The fate of those who don't make the cut.", -- 307
	weapons = { -- 308
		"evilrp_weapon/obrez", -- 308
		"evilrp_melee/pipe" -- 308
	}, -- 308
	command = "conscript", -- 309
	salary = 1, -- 310
	max = 5, -- 311
	cost = 1, -- 312
	hasLicense = true, -- 313
	use_machines = false, -- 314
	ammo = { -- 316
		pistol = 60 -- 316
	}, -- 315
	category = "Royalists", -- 317
	speech_sounds = (function() -- 318
		local _accum_0 = { } -- 318
		local _len_0 = 1 -- 318
		for i = 1, 15 do -- 318
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 318
			_len_0 = _len_0 + 1 -- 318
		end -- 318
		return _accum_0 -- 318
	end)(), -- 318
	hurt_sounds = (function() -- 319
		local _accum_0 = { } -- 319
		local _len_0 = 1 -- 319
		for i = 1, 4 do -- 319
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 319
			_len_0 = _len_0 + 1 -- 319
		end -- 319
		return _accum_0 -- 319
	end)(), -- 319
	become_sounds = (function() -- 320
		local _accum_0 = { } -- 320
		local _len_0 = 1 -- 320
		for i = 1, 15 do -- 320
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 320
			_len_0 = _len_0 + 1 -- 320
		end -- 320
		return _accum_0 -- 320
	end)(), -- 320
	crosstext = function(ply) -- 321
		local text = "Don't panic." -- 322
		do -- 323
			local _exp_0 = lp:Team() -- 323
			if TEAM_PRIVATE == _exp_0 then -- 324
				text = "I could be like him!" -- 325
			elseif TEAM_STALKER == _exp_0 then -- 326
				text = "Poor bastard." -- 327
			elseif TEAM_SANITAR == _exp_0 then -- 328
				text = "A fine meat shield." -- 329
			elseif TEAM_KORPSMAN == _exp_0 then -- 330
				text = "Fodder, made to die\n Unless..." -- 331
			elseif TEAM_DEALER == _exp_0 then -- 332
				text = "A follower of mine." -- 333
			elseif TEAM_EMPEROR == _exp_0 then -- 334
				text = "Cannon fodder, splendid." -- 335
			elseif TEAM_GHOST == _exp_0 then -- 336
				text = "Definitely stupid." -- 337
			elseif TEAM_BONEHEAD == _exp_0 then -- 338
				text = "HAHAHAH." -- 339
			end -- 339
		end -- 339
		return { -- 340
			text = text, -- 340
			font = "Spleen_Label_Small" -- 340
		}, false -- 340
	end, -- 321
	first_names = { -- 341
		"Fodder", -- 341
		"Meatshield", -- 341
		"Grunt", -- 341
		"Drone", -- 341
		"Conscript", -- 341
		"Meatbag" -- 341
	}, -- 341
	GenerateName = function(self, ply) -- 342
		local unit_id = math.random(1, 99) -- 343
		if unit_id < 10 then -- 344
			unit_id = "0" .. tostring(unit_id) -- 345
		else -- 347
			unit_id = tostring(unit_id) -- 347
		end -- 344
		return self.first_names[math.random(1, #self.first_names)] .. " #" .. unit_id -- 348
	end, -- 342
	special_name = "private parts", -- 349
	special_name_chance = 1000, -- 350
	ShowSpare1 = open_player_menu, -- 351
	ShowSpare2 = open_action_menu, -- 352
	PlayerLoadout = function(ply) -- 353
		ply:ClearOddities() -- 354
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 355
		for slot, val in pairs({ -- 358
			[0] = 0, -- 358
			[1] = 1, -- 360
			[3] = { -- 362
				0, -- 362
				7, -- 362
				8 -- 362
			}, -- 362
			[4] = { -- 364
				0, -- 364
				4 -- 364
			}, -- 364
			[5] = 0, -- 366
			[6] = 0, -- 368
			[7] = 1 -- 370
		}) do -- 371
			set_bodygroup(ply, slot, val) -- 356
		end -- 356
		return false -- 372
	end -- 353
}) -- 304
TEAM_SANITAR = DarkRP.createJob("Dragoon", { -- 375
	color = Color(25, 170, 0), -- 375
	model = "models/vel/evilwar/royalist.mdl", -- 376
	description = "The right hand of the Emperor.\nRespected by his peers,\nfeared by his enemies.", -- 377
	weapons = { -- 378
		"evilrp_weapon/hope", -- 378
		"evilrp_melee/sabre" -- 378
	}, -- 378
	command = "ss", -- 379
	salary = 1, -- 380
	max = 6, -- 381
	cost = 3, -- 382
	hasLicense = true, -- 383
	use_machines = false, -- 384
	ammo = { -- 386
		pistol = 60 -- 386
	}, -- 385
	category = "Royalists", -- 387
	speech_sounds = (function() -- 388
		local _accum_0 = { } -- 388
		local _len_0 = 1 -- 388
		for i = 1, 15 do -- 388
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 388
			_len_0 = _len_0 + 1 -- 388
		end -- 388
		return _accum_0 -- 388
	end)(), -- 388
	hurt_sounds = (function() -- 389
		local _accum_0 = { } -- 389
		local _len_0 = 1 -- 389
		for i = 1, 4 do -- 389
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 389
			_len_0 = _len_0 + 1 -- 389
		end -- 389
		return _accum_0 -- 389
	end)(), -- 389
	become_sounds = (function() -- 390
		local _accum_0 = { } -- 390
		local _len_0 = 1 -- 390
		for i = 1, 15 do -- 390
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 390
			_len_0 = _len_0 + 1 -- 390
		end -- 390
		return _accum_0 -- 390
	end)(), -- 390
	crosstext = function(ply) -- 391
		local text = "Don't panic." -- 392
		do -- 393
			local _exp_0 = lp:Team() -- 393
			if TEAM_PRIVATE == _exp_0 then -- 394
				text = "A Lymphomian legend!" -- 395
			elseif TEAM_STALKER == _exp_0 then -- 396
				text = "Fight or run?!" -- 397
			elseif TEAM_SANITAR == _exp_0 then -- 398
				text = "Finally...\nSomeone competent." -- 399
			elseif TEAM_KORPSMAN == _exp_0 then -- 400
				text = "Is that enemy blood?\nNo of course not." -- 401
			elseif TEAM_DEALER == _exp_0 then -- 402
				text = "A follower of mine." -- 403
			elseif TEAM_EMPEROR == _exp_0 then -- 404
				text = "A tentacle of mine." -- 405
			elseif TEAM_GHOST == _exp_0 then -- 406
				text = "Evil, stupid,\n maybe both." -- 407
			elseif TEAM_BONEHEAD == _exp_0 then -- 408
				text = "DANGER." -- 409
			end -- 409
		end -- 409
		return { -- 410
			text = text, -- 410
			font = "Spleen_Label_Small" -- 410
		}, true -- 410
	end, -- 391
	first_names = { -- 411
		"Subjugator", -- 411
		"Dragoner", -- 411
		"Persecuter", -- 411
		"Draconarius", -- 411
		"Volontaire" -- 411
	}, -- 411
	last_names = { -- 412
		"of Die Augen", -- 412
		"of Knochen", -- 412
		"of Sehne", -- 412
		"of Knorpel", -- 412
		"of Bauchspeicheldrüse" -- 412
	}, -- 412
	arms_model = "models/weapons/c_arms_refugee.mdl", -- 413
	ShowSpare1 = open_player_menu, -- 414
	ShowSpare2 = open_action_menu, -- 415
	bar_names = { -- 417
		health = "resolve" -- 417
	}, -- 416
	PlayerLoadout = function(ply) -- 418
		ply:ClearOddities() -- 419
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 420
		for slot, val in pairs({ -- 423
			[0] = 1, -- 423
			[1] = 1, -- 425
			[2] = 1, -- 427
			[3] = 2, -- 429
			[4] = 3, -- 431
			[5] = 0 -- 433
		}) do -- 434
			set_bodygroup(ply, slot, val) -- 421
		end -- 421
		return false -- 435
	end -- 418
}) -- 374
TEAM_DEALER = DarkRP.createJob("Quartermaster", { -- 438
	color = Color(255, 140, 0), -- 438
	model = "models/vel/evilwar/royalist.mdl", -- 439
	description = "The left hand of the Emperor.\nManage the goods and keep your men armed.", -- 440
	weapons = { }, -- 441
	command = "dealer", -- 442
	salary = 1, -- 443
	max = 1, -- 444
	cost = 3, -- 445
	hasLicense = false, -- 446
	use_machines = false, -- 447
	category = "Royalists", -- 448
	speech_sounds = (function() -- 449
		local _accum_0 = { } -- 449
		local _len_0 = 1 -- 449
		for i = 1, 3 do -- 449
			_accum_0[_len_0] = "placenta/speech/dealer" .. tostring(i) .. ".wav" -- 449
			_len_0 = _len_0 + 1 -- 449
		end -- 449
		return _accum_0 -- 449
	end)(), -- 449
	hurt_sounds = (function() -- 450
		local _accum_0 = { } -- 450
		local _len_0 = 1 -- 450
		for i = 1, 4 do -- 450
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 450
			_len_0 = _len_0 + 1 -- 450
		end -- 450
		return _accum_0 -- 450
	end)(), -- 450
	become_sounds = (function() -- 451
		local _accum_0 = { } -- 451
		local _len_0 = 1 -- 451
		for i = 1, 15 do -- 451
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 451
			_len_0 = _len_0 + 1 -- 451
		end -- 451
		return _accum_0 -- 451
	end)(), -- 451
	crosstext = function(ply) -- 452
		local text = "Don't panic." -- 453
		do -- 454
			local _exp_0 = lp:Team() -- 454
			if TEAM_PRIVATE == _exp_0 then -- 455
				text = "This guy handles the guns." -- 456
			elseif TEAM_STALKER == _exp_0 then -- 457
				text = "Captain of the goods." -- 458
			elseif TEAM_SANITAR == _exp_0 then -- 459
				text = "The oldest living Dragoon.\nRespect. Honor." -- 460
			elseif TEAM_KORPSMAN == _exp_0 then -- 461
				text = "A reminder of the power of\nKapitalism." -- 462
			elseif TEAM_DEALER == _exp_0 then -- 463
				text = "I'm seeing double!" -- 464
			elseif TEAM_EMPEROR == _exp_0 then -- 465
				text = "My brother in arms.\nIf he fails, I'll cut his off." -- 466
			elseif TEAM_GHOST == _exp_0 then -- 467
				text = "Glorified accountant." -- 468
			elseif TEAM_BONEHEAD == _exp_0 then -- 469
				text = "BONES ARE HIS DOLLARS." -- 470
			end -- 470
		end -- 470
		return { -- 471
			text = text, -- 471
			font = "Spleen_Label_Small" -- 471
		}, true -- 471
	end, -- 452
	first_names = { -- 472
		"Quartermaster", -- 472
		"Quartiermeister" -- 472
	}, -- 472
	last_names = { -- 473
		"Kommissariatsdienst" -- 473
	}, -- 473
	special_name = "Kwartiermeester", -- 474
	special_name_chance = 1000, -- 475
	ShowSpare1 = open_player_menu, -- 476
	ShowSpare2 = open_action_menu, -- 477
	bar_names = { -- 479
		health = "insurance" -- 479
	}, -- 478
	PlayerLoadout = function(ply) -- 480
		ply:ClearOddities() -- 481
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 482
		for slot, val in pairs({ -- 485
			[0] = 1, -- 485
			[1] = 1, -- 487
			[2] = 1, -- 489
			[3] = 1, -- 491
			[4] = 3, -- 493
			[5] = 0 -- 495
		}) do -- 496
			set_bodygroup(ply, slot, val) -- 483
		end -- 483
		return false -- 497
	end -- 480
}) -- 437
TEAM_KORPSMAN = DarkRP.createJob("Sanitäter", { -- 500
	color = Color(79, 150, 150), -- 500
	model = "models/vel/evilwar/royalist.mdl", -- 501
	description = "You keep people alive in this terrible place.\nFill the blood and empty the rust.", -- 502
	weapons = { -- 503
		"evilrp/medkit" -- 503
	}, -- 503
	command = "medic", -- 504
	salary = 1, -- 505
	max = 2, -- 506
	cost = 2, -- 507
	hasLicense = false, -- 508
	medic = true, -- 509
	use_machines = false, -- 510
	category = "Royalists", -- 511
	speech_sounds = (function() -- 512
		local _accum_0 = { } -- 512
		local _len_0 = 1 -- 512
		for i = 1, 4 do -- 512
			_accum_0[_len_0] = "placenta/speech/korps" .. tostring(i) .. ".wav" -- 512
			_len_0 = _len_0 + 1 -- 512
		end -- 512
		return _accum_0 -- 512
	end)(), -- 512
	hurt_sounds = (function() -- 513
		local _accum_0 = { } -- 513
		local _len_0 = 1 -- 513
		for i = 1, 4 do -- 513
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 513
			_len_0 = _len_0 + 1 -- 513
		end -- 513
		return _accum_0 -- 513
	end)(), -- 513
	become_sounds = { -- 514
		"items/suitchargeok1.wav" -- 514
	}, -- 514
	crosstext = function(ply) -- 515
		local text = "Don't panic." -- 516
		do -- 517
			local _exp_0 = lp:Team() -- 517
			if TEAM_PRIVATE == _exp_0 then -- 518
				text = "I forgot what\nto call these guys." -- 519
			elseif TEAM_STALKER == _exp_0 then -- 520
				text = "A walking blood bag." -- 521
			elseif TEAM_SANITAR == _exp_0 then -- 522
				text = "Better remember\nwho lets them live." -- 523
			elseif TEAM_KORPSMAN == _exp_0 then -- 524
				text = "Something to\nbe happy about." -- 525
			elseif TEAM_DEALER == _exp_0 then -- 526
				text = "Keep them busy.\nWe need their blood and sweat." -- 527
			elseif TEAM_EMPEROR == _exp_0 then -- 528
				text = "What a strange,\nselfless thing." -- 529
			elseif TEAM_GHOST == _exp_0 then -- 530
				text = "A respectable mortal." -- 531
			elseif TEAM_BONEHEAD == _exp_0 then -- 532
				text = "CONFUSING." -- 533
			end -- 533
		end -- 533
		return { -- 534
			text = text, -- 534
			font = "Spleen_Label_Small" -- 534
		}, true -- 534
	end, -- 515
	first_names = { -- 535
		"Dissector", -- 535
		"Retractor", -- 535
		"Suture", -- 535
		"Femur", -- 535
		"Cystic", -- 535
		"Rasp", -- 535
		"Ferrum", -- 535
		"Fascia", -- 535
		"Marrow", -- 535
		"Lienis", -- 535
		"Aorta", -- 535
		"Tunica", -- 535
		"Maxilla", -- 535
		"Sacrum", -- 535
		"Leach" -- 535
	}, -- 535
	last_names = { -- 536
		"Forceps", -- 536
		"Scalpel", -- 536
		"Curette", -- 536
		"Rongeur", -- 536
		"Trocar", -- 536
		"Babcock", -- 536
		"Duval", -- 536
		"Hemostat", -- 536
		"Ossis", -- 536
		"Caro", -- 536
		"Cadaver", -- 536
		"Sanguis", -- 536
		"Bilis", -- 536
		"Viscera", -- 536
		"Jugular", -- 536
		"Clavius" -- 536
	}, -- 536
	special_name = "Corpseman", -- 537
	special_name_chance = 1000, -- 538
	ShowSpare1 = open_player_menu, -- 539
	ShowSpare2 = open_action_menu, -- 540
	bar_names = { -- 542
		health = "Bio-reserves" -- 542
	}, -- 541
	PlayerLoadout = function(ply) -- 543
		ply:ClearOddities() -- 544
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 545
		ply:SetSkin(4) -- 546
		for slot, val in pairs({ -- 549
			[0] = 0, -- 549
			[1] = 0, -- 551
			[2] = 2, -- 553
			[3] = 3, -- 555
			[4] = 1, -- 557
			[5] = 0 -- 559
		}) do -- 560
			set_bodygroup(ply, slot, val) -- 547
		end -- 547
		return false -- 561
	end -- 543
}) -- 499
TEAM_EMPEROR = DarkRP.createJob("Emperor", { -- 564
	color = Color(150, 20, 20), -- 564
	model = "models/vel/evilwar/royalist.mdl", -- 565
	description = "Rule with an iron fist.", -- 566
	command = "emperor", -- 567
	salary = 1, -- 568
	weapons = { -- 569
		"evilrp_weapon/novoluger" -- 569
	}, -- 569
	max = 1, -- 570
	cost = 5, -- 571
	weapons = { }, -- 572
	hasLicense = true, -- 573
	mayor = true, -- 574
	use_machines = false, -- 575
	category = "Royalists", -- 576
	speech_sounds = (function() -- 577
		local _accum_0 = { } -- 577
		local _len_0 = 1 -- 577
		for i = 1, 15 do -- 577
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 577
			_len_0 = _len_0 + 1 -- 577
		end -- 577
		return _accum_0 -- 577
	end)(), -- 577
	become_sounds = { -- 578
		"kidneydagger/broadcast1.wav" -- 578
	}, -- 578
	crosstext = function(ply) -- 579
		local text = "Don't panic." -- 580
		do -- 581
			local _exp_0 = lp:Team() -- 581
			if TEAM_PRIVATE == _exp_0 then -- 582
				text = "Listen carefully." -- 583
			elseif TEAM_STALKER == _exp_0 then -- 584
				text = "Oh, your majesty!" -- 585
			elseif TEAM_SANITAR == _exp_0 then -- 586
				text = "Hail, hail!" -- 587
			elseif TEAM_KORPSMAN == _exp_0 then -- 588
				text = "Is he feeling okay?" -- 589
			elseif TEAM_DEALER == _exp_0 then -- 590
				text = "Glorious leader.\nI'm nothing without him." -- 591
			elseif TEAM_EMPEROR == _exp_0 then -- 592
				text = "Our strength\nshall prevail." -- 593
			elseif TEAM_GHOST == _exp_0 then -- 594
				text = "So full of lies." -- 595
			elseif TEAM_BONEHEAD == _exp_0 then -- 596
				text = "THERE HE IS!!" -- 597
			end -- 597
		end -- 597
		return { -- 598
			text = text, -- 598
			font = "Spleen_Label_Small" -- 598
		}, true -- 598
	end, -- 579
	first_names = { -- 600
		"Basileus", -- 600
		"Agrippa", -- 600
		"Gnaeus", -- 600
		"Gaius" -- 600
	}, -- 600
	last_names = { -- 601
		"Imperator Lymphoma", -- 601
		"Kaiser Lymphoma", -- 601
		"Rex Lymphoma", -- 601
		"Lymphoma Magnus" -- 601
	}, -- 601
	special_name = "Which Kaiser", -- 602
	special_name_chance = 1000, -- 603
	ShowSpare1 = open_player_menu, -- 604
	ShowSpare2 = open_action_menu, -- 605
	bar_names = { -- 607
		health = "PRIDE" -- 607
	}, -- 606
	PlayerLoadout = function(ply) -- 608
		ply:ClearOddities() -- 609
		local oddities -- 610
		do -- 610
			local _accum_0 = { } -- 610
			local _len_0 = 1 -- 610
			for k, v in pairs(ODDITY.list) do -- 610
				if v ~= ODDITY_ILLITERACY then -- 610
					_accum_0[_len_0] = v -- 610
					_len_0 = _len_0 + 1 -- 610
				end -- 610
			end -- 610
			oddities = _accum_0 -- 610
		end -- 610
		ply:AddOddity(oddities[math.random(#oddities)]) -- 611
		for slot, val in pairs({ -- 614
			[0] = 1, -- 614
			[1] = 2, -- 616
			[2] = 0, -- 618
			[3] = 1, -- 620
			[4] = 2, -- 622
			[5] = 0 -- 624
		}) do -- 625
			set_bodygroup(ply, slot, val) -- 612
		end -- 612
		ply:SetNWInt("evilrp_gasmask", 4) -- 626
		ply:Give("evilrp_weapon/novoluger") -- 627
		return false -- 628
	end -- 608
}) -- 563
GAMEMODE.CivilProtection = { -- 631
	[TEAM_PRIVATE] = true, -- 631
	[TEAM_SANITAR] = true, -- 632
	[TEAM_EMPEROR] = true -- 633
} -- 630
GAMEMODE.DefaultTeam = TEAM_GHOST -- 635
