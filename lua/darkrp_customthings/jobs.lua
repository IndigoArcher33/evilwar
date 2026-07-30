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
	color = Color(71, 22, 0), -- 90
	model = "models/liver_failure/wastelander/wastelander.mdl", -- 91
	description = "A soul with no allegiance, destined to plunder the wasteland.", -- 92
	weapons = { -- 93
		"evilrp_weapon/whisper", -- 93
		"evilrp_melee/axe" -- 93
	}, -- 93
	category = "Wasteland", -- 94
	command = "stalker", -- 95
	use_machines = true, -- 96
	salary = 1, -- 97
	max = 3, -- 98
	cost = 4, -- 99
	hasLicense = false, -- 100
	candemote = false, -- 101
	use_machines = false, -- 102
	speech_sounds = (function() -- 103
		local _accum_0 = { } -- 103
		local _len_0 = 1 -- 103
		for i = 1, 9 do -- 103
			_accum_0[_len_0] = "placenta/cultspawn" .. tostring(i) .. ".wav" -- 103
			_len_0 = _len_0 + 1 -- 103
		end -- 103
		return _accum_0 -- 103
	end)(), -- 103
	hurt_sounds = (function() -- 104
		local _accum_0 = { } -- 104
		local _len_0 = 1 -- 104
		for i = 1, 6 do -- 104
			_accum_0[_len_0] = "placenta/pain/cult" .. tostring(i) .. ".wav" -- 104
			_len_0 = _len_0 + 1 -- 104
		end -- 104
		return _accum_0 -- 104
	end)(), -- 104
	become_sounds = (function() -- 105
		local _accum_0 = { } -- 105
		local _len_0 = 1 -- 105
		for i = 1, 3 do -- 105
			_accum_0[_len_0] = "npc/zombie/zombie_alert" .. tostring(i) .. ".wav" -- 105
			_len_0 = _len_0 + 1 -- 105
		end -- 105
		return _accum_0 -- 105
	end)(), -- 105
	death_sounds = (function() -- 106
		local _accum_0 = { } -- 106
		local _len_0 = 1 -- 106
		for i = 1, 4 do -- 106
			_accum_0[_len_0] = "placenta/death/cult" .. tostring(i) .. ".wav" -- 106
			_len_0 = _len_0 + 1 -- 106
		end -- 106
		return _accum_0 -- 106
	end)(), -- 106
	crosstext = function(ply) -- 107
		local text = "Don't panic." -- 108
		do -- 109
			local _exp_0 = lp:Team() -- 109
			if TEAM_PRIVATE == _exp_0 then -- 110
				text = "He doesn't look like me." -- 111
			elseif TEAM_STALKER == _exp_0 then -- 112
				text = "A fellow plunderer." -- 113
			elseif TEAM_SANITAR == _exp_0 then -- 114
				text = "Despicable." -- 115
			elseif TEAM_KORPSMAN == _exp_0 then -- 116
				text = "Why is he here?" -- 117
			elseif TEAM_DEALER == _exp_0 then -- 118
				text = "Keep the armaments locked up." -- 119
			elseif TEAM_EMPEROR == _exp_0 then -- 120
				text = "He might be of use to me." -- 121
			elseif TEAM_GHOST == _exp_0 then -- 122
				text = "He has a noble pursuit." -- 123
			elseif TEAM_BONEHEAD == _exp_0 then -- 124
				text = "SEEN HIM BEFORE!!" -- 125
			end -- 125
		end -- 125
		return { -- 126
			text = text, -- 126
			font = "Spleen_Label_Small" -- 126
		}, false -- 126
	end, -- 107
	first_names = { -- 127
		"Wasted", -- 127
		"Decrepit", -- 127
		"Rotten" -- 127
	}, -- 127
	last_names = { -- 128
		"Soul", -- 128
		"Plunderer", -- 128
		"Traitor", -- 128
		"Wanderer" -- 128
	}, -- 128
	bar_names = { -- 130
		health = "regret" -- 130
	}, -- 129
	special_name = "Waste", -- 131
	special_name_chance = 1000, -- 132
	ShowSpare1 = open_player_menu, -- 133
	ShowSpare2 = open_action_menu, -- 134
	PlayerLoadout = function(ply) -- 135
		ply:ClearOddities() -- 136
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 137
		for slot, val in pairs({ -- 140
			[0] = 0, -- 140
			[1] = 2, -- 142
			[2] = { -- 144
				2, -- 144
				3, -- 144
				8, -- 144
				6 -- 144
			}, -- 144
			[3] = { -- 146
				19, -- 146
				20 -- 146
			}, -- 146
			[4] = 0, -- 148
			[5] = 0, -- 150
			[6] = { -- 152
				0, -- 152
				1, -- 152
				2, -- 152
				3 -- 152
			}, -- 152
			[7] = 0, -- 154
			[8] = 0, -- 156
			[9] = { -- 158
				0, -- 158
				1 -- 158
			} -- 158
		}) do -- 159
			set_bodygroup(ply, slot, val) -- 138
		end -- 138
		local skins = { -- 160
			4, -- 160
			6, -- 160
			7 -- 160
		} -- 160
		ply:SetSkin(skins[math.random(1, #skins)]) -- 161
		return false -- 162
	end -- 135
}) -- 89
do -- 164
	local _class_0 -- 164
	local _parent_0 = SOUND -- 164
	local _base_0 = { -- 164
		sound = "placenta/bonehead_aggrod4.wav", -- 166
		pitch = { -- 166
			200, -- 166
			250 -- 166
		} -- 164
	} -- 164
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 166
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 164
			_base_0[_key_0] = _val_0 -- 164
		end -- 164
	end -- 166
	if _base_0.__index == nil then -- 164
		_base_0.__index = _base_0 -- 164
	end -- 166
	setmetatable(_base_0, _parent_0.__base) -- 164
	_class_0 = setmetatable({ -- 164
		__init = function(self, ...) -- 164
			return _class_0.__parent.__init(self, ...) -- 164
		end, -- 164
		__base = _base_0, -- 164
		__name = "SpeechBonehead", -- 164
		__parent = _parent_0 -- 164
	}, { -- 164
		__index = function(cls, name) -- 164
			local val = rawget(_base_0, name) -- 164
			if val == nil then -- 164
				local parent = rawget(cls, "__parent") -- 164
				if parent then -- 164
					return parent[name] -- 164
				end -- 164
			else -- 164
				return val -- 164
			end -- 164
		end, -- 164
		__call = function(cls, ...) -- 164
			local _self_0 = setmetatable({ }, _base_0) -- 164
			cls.__init(_self_0, ...) -- 164
			return _self_0 -- 164
		end -- 164
	}) -- 164
	_base_0.__class = _class_0 -- 164
	if _parent_0.__inherited then -- 164
		_parent_0.__inherited(_parent_0, _class_0) -- 164
	end -- 164
	SpeechBonehead = _class_0 -- 164
end -- 166
TEAM_BONEHEAD = DarkRP.createJob("Bonehead", { -- 169
	color = Color(150, 150, 150), -- 169
	model = "models/player/zombie_fast.mdl", -- 170
	description = "evil fucker.", -- 171
	instant_respawn = true, -- 172
	command = "bonehead", -- 173
	salary = 1, -- 174
	max = 0, -- 175
	cost = 1, -- 176
	use_machines = false, -- 177
	speech_sounds = "SpeechBonehead", -- 178
	hurt_sounds = (function() -- 179
		local _accum_0 = { } -- 179
		local _len_0 = 1 -- 179
		for i = 1, 2 do -- 179
			_accum_0[_len_0] = "placenta/bonehead_slice" .. tostring(i) .. ".wav" -- 179
			_len_0 = _len_0 + 1 -- 179
		end -- 179
		return _accum_0 -- 179
	end)(), -- 179
	become_sounds = (function() -- 180
		local _accum_0 = { } -- 180
		local _len_0 = 1 -- 180
		for i = 1, 4 do -- 180
			_accum_0[_len_0] = "placenta/bonehead_aggrod" .. tostring(i) .. ".wav" -- 180
			_len_0 = _len_0 + 1 -- 180
		end -- 180
		return _accum_0 -- 180
	end)(), -- 180
	crosstext = function(ply) -- 181
		local text = "Don't panic." -- 182
		do -- 183
			local _exp_0 = lp:Team() -- 183
			if TEAM_PRIVATE == _exp_0 then -- 184
				text = "Oh no! He's real!" -- 185
			elseif TEAM_SANITAR == _exp_0 then -- 186
				text = "Oh boy." -- 187
			elseif TEAM_KORPSMAN == _exp_0 then -- 188
				text = "Oh no! It happened again!" -- 189
			elseif TEAM_DEALER == _exp_0 then -- 190
				text = "Free ribs to feed the troops." -- 191
			elseif TEAM_EMPEROR == _exp_0 then -- 192
				text = "Ha. It happened again." -- 193
			elseif TEAM_GHOST == _exp_0 then -- 194
				text = "Lookin' good." -- 195
			elseif TEAM_BONEHEAD == _exp_0 then -- 196
				text = "THERE'S ANOTHER ONE." -- 197
			end -- 197
		end -- 197
		return { -- 198
			text = text, -- 198
			font = "Spleen_Label_Small" -- 198
		}, false -- 198
	end, -- 181
	first_names = { -- 199
		"Evil" -- 199
	}, -- 199
	last_names = { -- 200
		"Fucker" -- 200
	}, -- 200
	no_needs = true, -- 201
	hint = "You are a truly pissed off skeleton. Go get 'em!", -- 202
	bar_names = { -- 204
		health = "EVIL FUCKER POWER" -- 204
	}, -- 203
	bar_colors = { -- 206
		health = Color(200, 0, 0) -- 206
	}, -- 205
	RenderScreenspaceEffects = function(ply) -- 207
		local ct = CurTime() -- 208
		DrawMotionBlur(0.25, 0.2, 0.3) -- 209
		return DrawSharpen(1 * math.sin(ct), 2 * math.random(0.8, 1.2)) -- 210
	end, -- 207
	ColorMod = function(ply) -- 211
		local abs, cos, sin = math.abs, math.cos, math.sin -- 212
		local ct = CurTime() -- 213
		local tab = { -- 215
			["$pp_colour_addr"] = 0.1, -- 215
			["$pp_colour_addg"] = 0, -- 216
			["$pp_colour_addb"] = 0, -- 217
			["$pp_colour_brightness"] = 0 + (-0.01 * cos(ct)), -- 218
			["$pp_colour_contrast"] = 1.6 + (abs(sin(ct * 0.166)) * 0.5), -- 219
			["$pp_colour_colour"] = 0, -- 220
			["$pp_colour_mulr"] = 0 + abs(sin(ct * 0.789)), -- 221
			["$pp_colour_mulg"] = 0, -- 222
			["$pp_colour_mulb"] = 0 -- 223
		} -- 214
		return tab -- 224
	end, -- 211
	ShowSpare1 = function() -- 225
		if CLIENT then -- 226
			return GAMEMODE:Frighten() -- 227
		end -- 226
	end, -- 225
	ShowSpare2 = function() -- 228
		if CLIENT then -- 229
			return GAMEMODE:Frighten() -- 230
		end -- 229
	end, -- 228
	PlayerLoadout = function(ply) -- 231
		ply:SetNWInt("evilrp_gasmask", 0) -- 232
		ply:Give("evilrp_melee/hands/boneclaws") -- 233
		return true -- 234
	end, -- 231
	HandleRagdoll = function(rag, ply) -- 235
		return rag:SetNWInt("decomp_stage", DSTAGE_BONES) -- 236
	end -- 235
}) -- 168
TEAM_PRIVATE = DarkRP.createJob("Private", { -- 239
	color = Color(20, 150, 20), -- 239
	model = "models/vel/evilwar/royalist.mdl", -- 240
	description = "A new recruit that hasn't gone through training yet.", -- 241
	command = "proletariat", -- 242
	salary = 1, -- 243
	max = 0, -- 244
	cost = 0, -- 245
	hasLicense = true, -- 246
	candemote = false, -- 247
	use_machines = true, -- 248
	category = "Royalists", -- 249
	speech_sounds = (function() -- 250
		local _accum_0 = { } -- 250
		local _len_0 = 1 -- 250
		for i = 1, 3 do -- 250
			_accum_0[_len_0] = "placenta/speech/prole" .. tostring(i) .. ".wav" -- 250
			_len_0 = _len_0 + 1 -- 250
		end -- 250
		return _accum_0 -- 250
	end)(), -- 250
	hurt_sounds = (function() -- 251
		local _accum_0 = { } -- 251
		local _len_0 = 1 -- 251
		for i = 1, 5 do -- 251
			_accum_0[_len_0] = "placenta/pain/prole" .. tostring(i) .. ".wav" -- 251
			_len_0 = _len_0 + 1 -- 251
		end -- 251
		return _accum_0 -- 251
	end)(), -- 251
	become_sounds = (function() -- 252
		local _accum_0 = { } -- 252
		local _len_0 = 1 -- 252
		for i = 1, 3 do -- 252
			_accum_0[_len_0] = "npc/zombie/zombie_alert" .. tostring(i) .. ".wav" -- 252
			_len_0 = _len_0 + 1 -- 252
		end -- 252
		return _accum_0 -- 252
	end)(), -- 252
	death_sounds = (function() -- 253
		local _accum_0 = { } -- 253
		local _len_0 = 1 -- 253
		for i = 1, 3 do -- 253
			_accum_0[_len_0] = "placenta/death/prole" .. tostring(i) .. ".wav" -- 253
			_len_0 = _len_0 + 1 -- 253
		end -- 253
		return _accum_0 -- 253
	end)(), -- 253
	crosstext = function(ply) -- 254
		local text = "Don't panic." -- 255
		do -- 256
			local _exp_0 = lp:Team() -- 256
			if TEAM_PRIVATE == _exp_0 then -- 257
				text = "United in rank?" -- 258
			elseif TEAM_STALKER == _exp_0 then -- 259
				text = "A soldier from Lymphoma." -- 260
			elseif TEAM_SANITAR == _exp_0 then -- 261
				text = "These soldiers need guidance.\nPut the fear in their hearts." -- 262
			elseif TEAM_KORPSMAN == _exp_0 then -- 263
				text = "Smelly and stupid." -- 264
			elseif TEAM_DEALER == _exp_0 then -- 265
				text = "Prove your place, worm.\nOnly then will you be decorated." -- 266
			elseif TEAM_EMPEROR == _exp_0 then -- 267
				text = "Is he working hard enough?" -- 268
			elseif TEAM_GHOST == _exp_0 then -- 269
				text = "Sad, but funny." -- 270
			elseif TEAM_BONEHEAD == _exp_0 then -- 271
				text = "SKIN...!" -- 272
			end -- 272
		end -- 272
		return { -- 273
			text = text, -- 273
			font = "Spleen_Label_Small" -- 273
		}, false -- 273
	end, -- 254
	first_names = { -- 274
		"Private", -- 274
		"PVT.", -- 274
		"Recruit", -- 274
		"Enlistee", -- 274
		"Grunt", -- 274
		"Fodder", -- 274
		"Cadet", -- 274
		"CDT.", -- 274
		"Rookie" -- 274
	}, -- 274
	GenerateName = function(self, ply) -- 275
		local unit_id = math.random(1, 99) -- 276
		if unit_id < 10 then -- 277
			unit_id = "0" .. tostring(unit_id) -- 278
		else -- 280
			unit_id = tostring(unit_id) -- 280
		end -- 277
		return self.first_names[math.random(1, #self.first_names)] .. " #" .. unit_id -- 281
	end, -- 275
	special_name = "private parts", -- 282
	special_name_chance = 1000, -- 283
	ShowSpare1 = open_player_menu, -- 284
	ShowSpare2 = open_action_menu, -- 285
	PlayerLoadout = function(ply) -- 286
		ply:ClearOddities() -- 287
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 288
		for slot, val in pairs({ -- 291
			[0] = 0, -- 291
			[1] = 0, -- 293
			[3] = { -- 295
				0, -- 295
				6, -- 295
				7, -- 295
				8 -- 295
			}, -- 295
			[4] = { -- 297
				0, -- 297
				4 -- 297
			}, -- 297
			[5] = 0, -- 299
			[6] = 0 -- 301
		}) do -- 302
			set_bodygroup(ply, slot, val) -- 289
		end -- 289
		return false -- 303
	end -- 286
}) -- 238
TEAM_CONSCRIPT = DarkRP.createJob("Conscript", { -- 306
	color = Color(19, 51, 45), -- 306
	model = "models/vel/evilwar/royalist.mdl", -- 307
	description = "The fate of those who don't make the cut.", -- 308
	weapons = { -- 309
		"evilrp_weapon/obrez", -- 309
		"evilrp_melee/pipe" -- 309
	}, -- 309
	command = "conscript", -- 310
	salary = 1, -- 311
	max = 5, -- 312
	cost = 1, -- 313
	hasLicense = true, -- 314
	use_machines = false, -- 315
	ammo = { -- 317
		pistol = 60 -- 317
	}, -- 316
	category = "Royalists", -- 318
	speech_sounds = (function() -- 319
		local _accum_0 = { } -- 319
		local _len_0 = 1 -- 319
		for i = 1, 15 do -- 319
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 319
			_len_0 = _len_0 + 1 -- 319
		end -- 319
		return _accum_0 -- 319
	end)(), -- 319
	hurt_sounds = (function() -- 320
		local _accum_0 = { } -- 320
		local _len_0 = 1 -- 320
		for i = 1, 4 do -- 320
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 320
			_len_0 = _len_0 + 1 -- 320
		end -- 320
		return _accum_0 -- 320
	end)(), -- 320
	become_sounds = (function() -- 321
		local _accum_0 = { } -- 321
		local _len_0 = 1 -- 321
		for i = 1, 15 do -- 321
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 321
			_len_0 = _len_0 + 1 -- 321
		end -- 321
		return _accum_0 -- 321
	end)(), -- 321
	crosstext = function(ply) -- 322
		local text = "Don't panic." -- 323
		do -- 324
			local _exp_0 = lp:Team() -- 324
			if TEAM_PRIVATE == _exp_0 then -- 325
				text = "I could be like him!" -- 326
			elseif TEAM_STALKER == _exp_0 then -- 327
				text = "Poor bastard." -- 328
			elseif TEAM_SANITAR == _exp_0 then -- 329
				text = "A fine meat shield." -- 330
			elseif TEAM_KORPSMAN == _exp_0 then -- 331
				text = "Fodder, made to die\n Unless..." -- 332
			elseif TEAM_DEALER == _exp_0 then -- 333
				text = "A follower of mine." -- 334
			elseif TEAM_EMPEROR == _exp_0 then -- 335
				text = "Cannon fodder, splendid." -- 336
			elseif TEAM_CONSCRIPT == _exp_0 then -- 337
				text = "United in blood." -- 338
			elseif TEAM_GHOST == _exp_0 then -- 339
				text = "Definitely stupid." -- 340
			elseif TEAM_BONEHEAD == _exp_0 then -- 341
				text = "HAHAHAH." -- 342
			end -- 342
		end -- 342
		return { -- 343
			text = text, -- 343
			font = "Spleen_Label_Small" -- 343
		}, false -- 343
	end, -- 322
	first_names = { -- 344
		"Fodder", -- 344
		"Meatshield", -- 344
		"Grunt", -- 344
		"Drone", -- 344
		"Conscript", -- 344
		"Meatbag" -- 344
	}, -- 344
	GenerateName = function(self, ply) -- 345
		local unit_id = math.random(1, 99) -- 346
		if unit_id < 10 then -- 347
			unit_id = "0" .. tostring(unit_id) -- 348
		else -- 350
			unit_id = tostring(unit_id) -- 350
		end -- 347
		return self.first_names[math.random(1, #self.first_names)] .. " #" .. unit_id -- 351
	end, -- 345
	special_name = "private parts", -- 352
	special_name_chance = 1000, -- 353
	ShowSpare1 = open_player_menu, -- 354
	ShowSpare2 = open_action_menu, -- 355
	PlayerLoadout = function(ply) -- 356
		ply:ClearOddities() -- 357
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 358
		for slot, val in pairs({ -- 361
			[0] = 0, -- 361
			[2] = 0, -- 363
			[3] = { -- 365
				7, -- 365
				8 -- 365
			}, -- 365
			[4] = { -- 367
				0, -- 367
				4 -- 367
			}, -- 367
			[5] = 0, -- 369
			[6] = 0, -- 371
			[7] = 1 -- 373
		}) do -- 374
			set_bodygroup(ply, slot, val) -- 359
		end -- 359
		ply:SetArmor(25) -- 375
		return false -- 376
	end -- 356
}) -- 305
TEAM_SANITAR = DarkRP.createJob("Dragoon", { -- 379
	color = Color(0, 25, 93), -- 379
	model = "models/vel/evilwar/royalist.mdl", -- 380
	description = "The right hand of the Emperor.\nRespected by his peers,\nfeared by his enemies.", -- 381
	weapons = { -- 382
		"evilrp_weapon/hope", -- 382
		"evilrp_melee/sabre" -- 382
	}, -- 382
	command = "ss", -- 383
	salary = 1, -- 384
	max = 6, -- 385
	cost = 3, -- 386
	hasLicense = true, -- 387
	use_machines = false, -- 388
	ammo = { -- 390
		pistol = 60 -- 390
	}, -- 389
	category = "Royalists", -- 391
	speech_sounds = (function() -- 392
		local _accum_0 = { } -- 392
		local _len_0 = 1 -- 392
		for i = 1, 15 do -- 392
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 392
			_len_0 = _len_0 + 1 -- 392
		end -- 392
		return _accum_0 -- 392
	end)(), -- 392
	hurt_sounds = (function() -- 393
		local _accum_0 = { } -- 393
		local _len_0 = 1 -- 393
		for i = 1, 4 do -- 393
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 393
			_len_0 = _len_0 + 1 -- 393
		end -- 393
		return _accum_0 -- 393
	end)(), -- 393
	become_sounds = (function() -- 394
		local _accum_0 = { } -- 394
		local _len_0 = 1 -- 394
		for i = 1, 15 do -- 394
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 394
			_len_0 = _len_0 + 1 -- 394
		end -- 394
		return _accum_0 -- 394
	end)(), -- 394
	crosstext = function(ply) -- 395
		local text = "Don't panic." -- 396
		do -- 397
			local _exp_0 = lp:Team() -- 397
			if TEAM_PRIVATE == _exp_0 then -- 398
				text = "A Lymphomian legend!" -- 399
			elseif TEAM_STALKER == _exp_0 then -- 400
				text = "Fight or run?!" -- 401
			elseif TEAM_SANITAR == _exp_0 then -- 402
				text = "Finally...\nSomeone competent." -- 403
			elseif TEAM_KORPSMAN == _exp_0 then -- 404
				text = "Is that enemy blood?\nNo of course not." -- 405
			elseif TEAM_DEALER == _exp_0 then -- 406
				text = "A follower of mine." -- 407
			elseif TEAM_EMPEROR == _exp_0 then -- 408
				text = "A tentacle of mine." -- 409
			elseif TEAM_GHOST == _exp_0 then -- 410
				text = "Evil, stupid,\n maybe both." -- 411
			elseif TEAM_BONEHEAD == _exp_0 then -- 412
				text = "DANGER." -- 413
			end -- 413
		end -- 413
		return { -- 414
			text = text, -- 414
			font = "Spleen_Label_Small" -- 414
		}, true -- 414
	end, -- 395
	first_names = { -- 415
		"Subjugator", -- 415
		"Dragoner", -- 415
		"Persecuter", -- 415
		"Draconarius", -- 415
		"Volontaire" -- 415
	}, -- 415
	last_names = { -- 416
		"of Die Augen", -- 416
		"of Knochen", -- 416
		"of Sehne", -- 416
		"of Knorpel", -- 416
		"of Bauchspeicheldrüse" -- 416
	}, -- 416
	arms_model = "models/weapons/c_arms_refugee.mdl", -- 417
	ShowSpare1 = open_player_menu, -- 418
	ShowSpare2 = open_action_menu, -- 419
	bar_names = { -- 421
		health = "resolve" -- 421
	}, -- 420
	PlayerLoadout = function(ply) -- 422
		ply:ClearOddities() -- 423
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 424
		for slot, val in pairs({ -- 427
			[0] = 1, -- 427
			[1] = 1, -- 429
			[2] = 1, -- 431
			[3] = 2, -- 433
			[4] = 3, -- 435
			[5] = 0 -- 437
		}) do -- 438
			set_bodygroup(ply, slot, val) -- 425
		end -- 425
		ply:SetArmor(40) -- 439
		return false -- 440
	end -- 422
}) -- 378
TEAM_DEALER = DarkRP.createJob("Quartermaster", { -- 443
	color = Color(255, 140, 0), -- 443
	model = "models/vel/evilwar/royalist.mdl", -- 444
	description = "The left hand of the Emperor.\nManage the goods and keep your men armed.", -- 445
	weapons = { }, -- 446
	command = "dealer", -- 447
	salary = 1, -- 448
	max = 1, -- 449
	cost = 3, -- 450
	hasLicense = false, -- 451
	use_machines = false, -- 452
	category = "Royalists", -- 453
	speech_sounds = (function() -- 454
		local _accum_0 = { } -- 454
		local _len_0 = 1 -- 454
		for i = 1, 3 do -- 454
			_accum_0[_len_0] = "placenta/speech/dealer" .. tostring(i) .. ".wav" -- 454
			_len_0 = _len_0 + 1 -- 454
		end -- 454
		return _accum_0 -- 454
	end)(), -- 454
	hurt_sounds = (function() -- 455
		local _accum_0 = { } -- 455
		local _len_0 = 1 -- 455
		for i = 1, 4 do -- 455
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 455
			_len_0 = _len_0 + 1 -- 455
		end -- 455
		return _accum_0 -- 455
	end)(), -- 455
	become_sounds = (function() -- 456
		local _accum_0 = { } -- 456
		local _len_0 = 1 -- 456
		for i = 1, 15 do -- 456
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 456
			_len_0 = _len_0 + 1 -- 456
		end -- 456
		return _accum_0 -- 456
	end)(), -- 456
	crosstext = function(ply) -- 457
		local text = "Don't panic." -- 458
		do -- 459
			local _exp_0 = lp:Team() -- 459
			if TEAM_PRIVATE == _exp_0 then -- 460
				text = "This guy handles the guns." -- 461
			elseif TEAM_STALKER == _exp_0 then -- 462
				text = "Captain of the goods." -- 463
			elseif TEAM_SANITAR == _exp_0 then -- 464
				text = "The oldest living Dragoon.\nRespect. Honor." -- 465
			elseif TEAM_KORPSMAN == _exp_0 then -- 466
				text = "A reminder of the power of Kapitalism." -- 467
			elseif TEAM_DEALER == _exp_0 then -- 468
				text = "I'm seeing double!" -- 469
			elseif TEAM_EMPEROR == _exp_0 then -- 470
				text = "My brother in arms.\nIf he fails, I'll cut his off." -- 471
			elseif TEAM_GHOST == _exp_0 then -- 472
				text = "Glorified accountant." -- 473
			elseif TEAM_BONEHEAD == _exp_0 then -- 474
				text = "BONES ARE HIS DOLLARS." -- 475
			end -- 475
		end -- 475
		return { -- 476
			text = text, -- 476
			font = "Spleen_Label_Small" -- 476
		}, true -- 476
	end, -- 457
	first_names = { -- 477
		"Quartermaster", -- 477
		"Quartiermeister" -- 477
	}, -- 477
	last_names = { -- 478
		"Kommissariatsdienst" -- 478
	}, -- 478
	special_name = "Trusty", -- 479
	special_name_chance = 1000, -- 480
	ShowSpare1 = open_player_menu, -- 481
	ShowSpare2 = open_action_menu, -- 482
	bar_names = { -- 484
		health = "insurance" -- 484
	}, -- 483
	PlayerLoadout = function(ply) -- 485
		ply:ClearOddities() -- 486
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 487
		for slot, val in pairs({ -- 490
			[0] = 1, -- 490
			[1] = 1, -- 492
			[2] = 1, -- 494
			[3] = 1, -- 496
			[4] = 3, -- 498
			[5] = 0 -- 500
		}) do -- 501
			set_bodygroup(ply, slot, val) -- 488
		end -- 488
		return false -- 502
	end -- 485
}) -- 442
TEAM_KORPSMAN = DarkRP.createJob("Sanitäter", { -- 505
	color = Color(79, 150, 150), -- 505
	model = "models/vel/evilwar/royalist.mdl", -- 506
	description = "You keep people alive in this terrible place.\nFill the blood and empty the rust.", -- 507
	weapons = { -- 508
		"evilrp/medkit" -- 508
	}, -- 508
	command = "medic", -- 509
	salary = 1, -- 510
	max = 2, -- 511
	cost = 2, -- 512
	hasLicense = false, -- 513
	medic = true, -- 514
	use_machines = false, -- 515
	category = "Royalists", -- 516
	speech_sounds = (function() -- 517
		local _accum_0 = { } -- 517
		local _len_0 = 1 -- 517
		for i = 1, 4 do -- 517
			_accum_0[_len_0] = "placenta/speech/korps" .. tostring(i) .. ".wav" -- 517
			_len_0 = _len_0 + 1 -- 517
		end -- 517
		return _accum_0 -- 517
	end)(), -- 517
	hurt_sounds = (function() -- 518
		local _accum_0 = { } -- 518
		local _len_0 = 1 -- 518
		for i = 1, 4 do -- 518
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 518
			_len_0 = _len_0 + 1 -- 518
		end -- 518
		return _accum_0 -- 518
	end)(), -- 518
	become_sounds = { -- 519
		"items/suitchargeok1.wav" -- 519
	}, -- 519
	crosstext = function(ply) -- 520
		local text = "Don't panic." -- 521
		do -- 522
			local _exp_0 = lp:Team() -- 522
			if TEAM_PRIVATE == _exp_0 then -- 523
				text = "I forgot what\nto call these guys." -- 524
			elseif TEAM_STALKER == _exp_0 then -- 525
				text = "A walking blood bag." -- 526
			elseif TEAM_SANITAR == _exp_0 then -- 527
				text = "Better remember\nwho lets them live." -- 528
			elseif TEAM_KORPSMAN == _exp_0 then -- 529
				text = "Something to\nbe happy about." -- 530
			elseif TEAM_DEALER == _exp_0 then -- 531
				text = "Keep them busy.\nWe need their blood and sweat." -- 532
			elseif TEAM_EMPEROR == _exp_0 then -- 533
				text = "What a strange,\nselfless thing." -- 534
			elseif TEAM_GHOST == _exp_0 then -- 535
				text = "A respectable mortal." -- 536
			elseif TEAM_BONEHEAD == _exp_0 then -- 537
				text = "CONFUSING." -- 538
			end -- 538
		end -- 538
		return { -- 539
			text = text, -- 539
			font = "Spleen_Label_Small" -- 539
		}, true -- 539
	end, -- 520
	first_names = { -- 540
		"Dissector", -- 540
		"Retractor", -- 540
		"Suture", -- 540
		"Femur", -- 540
		"Cystic", -- 540
		"Rasp", -- 540
		"Ferrum", -- 540
		"Fascia", -- 540
		"Marrow", -- 540
		"Lienis", -- 540
		"Aorta", -- 540
		"Tunica", -- 540
		"Maxilla", -- 540
		"Sacrum", -- 540
		"Leach" -- 540
	}, -- 540
	last_names = { -- 541
		"Forceps", -- 541
		"Scalpel", -- 541
		"Curette", -- 541
		"Rongeur", -- 541
		"Trocar", -- 541
		"Babcock", -- 541
		"Duval", -- 541
		"Hemostat", -- 541
		"Ossis", -- 541
		"Caro", -- 541
		"Cadaver", -- 541
		"Sanguis", -- 541
		"Bilis", -- 541
		"Viscera", -- 541
		"Jugular", -- 541
		"Clavius" -- 541
	}, -- 541
	special_name = "Corpseman", -- 542
	special_name_chance = 1000, -- 543
	ShowSpare1 = open_player_menu, -- 544
	ShowSpare2 = open_action_menu, -- 545
	bar_names = { -- 547
		health = "Bio-reserves" -- 547
	}, -- 546
	PlayerLoadout = function(ply) -- 548
		ply:ClearOddities() -- 549
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 550
		ply:SetSkin(4) -- 551
		for slot, val in pairs({ -- 554
			[0] = 0, -- 554
			[1] = 0, -- 556
			[2] = 2, -- 558
			[3] = 3, -- 560
			[4] = 1, -- 562
			[5] = 0 -- 564
		}) do -- 565
			set_bodygroup(ply, slot, val) -- 552
		end -- 552
		return false -- 566
	end -- 548
}) -- 504
TEAM_EMPEROR = DarkRP.createJob("Emperor", { -- 569
	color = Color(150, 20, 20), -- 569
	model = "models/vel/evilwar/royalist.mdl", -- 570
	description = "Rule with an iron fist.", -- 571
	command = "emperor", -- 572
	salary = 1, -- 573
	weapons = { -- 574
		"evilrp_weapon/novoluger" -- 574
	}, -- 574
	max = 1, -- 575
	cost = 5, -- 576
	weapons = { }, -- 577
	hasLicense = true, -- 578
	mayor = true, -- 579
	use_machines = false, -- 580
	category = "Royalists", -- 581
	speech_sounds = (function() -- 582
		local _accum_0 = { } -- 582
		local _len_0 = 1 -- 582
		for i = 1, 15 do -- 582
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 582
			_len_0 = _len_0 + 1 -- 582
		end -- 582
		return _accum_0 -- 582
	end)(), -- 582
	become_sounds = { -- 583
		"kidneydagger/broadcast1.wav" -- 583
	}, -- 583
	crosstext = function(ply) -- 584
		local text = "Don't panic." -- 585
		do -- 586
			local _exp_0 = lp:Team() -- 586
			if TEAM_PRIVATE == _exp_0 then -- 587
				text = "Listen carefully." -- 588
			elseif TEAM_STALKER == _exp_0 then -- 589
				text = "Oh, your majesty!" -- 590
			elseif TEAM_SANITAR == _exp_0 then -- 591
				text = "Hail, hail!" -- 592
			elseif TEAM_KORPSMAN == _exp_0 then -- 593
				text = "Is he feeling okay?" -- 594
			elseif TEAM_DEALER == _exp_0 then -- 595
				text = "Glorious leader.\nI'm nothing without him." -- 596
			elseif TEAM_EMPEROR == _exp_0 then -- 597
				text = "Our strength\nshall prevail." -- 598
			elseif TEAM_GHOST == _exp_0 then -- 599
				text = "So full of lies." -- 600
			elseif TEAM_BONEHEAD == _exp_0 then -- 601
				text = "THERE HE IS!!" -- 602
			end -- 602
		end -- 602
		return { -- 603
			text = text, -- 603
			font = "Spleen_Label_Small" -- 603
		}, true -- 603
	end, -- 584
	first_names = { -- 605
		"Basileus", -- 605
		"Agrippa", -- 605
		"Gnaeus", -- 605
		"Gaius" -- 605
	}, -- 605
	last_names = { -- 606
		"Imperator Lymphoma", -- 606
		"Kaiser Lymphoma", -- 606
		"Rex Lymphoma", -- 606
		"Lymphoma Magnus" -- 606
	}, -- 606
	special_name = "Which Kaiser", -- 607
	special_name_chance = 1000, -- 608
	ShowSpare1 = open_player_menu, -- 609
	ShowSpare2 = open_action_menu, -- 610
	bar_names = { -- 612
		health = "PRIDE" -- 612
	}, -- 611
	PlayerLoadout = function(ply) -- 613
		ply:ClearOddities() -- 614
		local oddities -- 615
		do -- 615
			local _accum_0 = { } -- 615
			local _len_0 = 1 -- 615
			for k, v in pairs(ODDITY.list) do -- 615
				if v ~= ODDITY_ILLITERACY then -- 615
					_accum_0[_len_0] = v -- 615
					_len_0 = _len_0 + 1 -- 615
				end -- 615
			end -- 615
			oddities = _accum_0 -- 615
		end -- 615
		ply:AddOddity(oddities[math.random(#oddities)]) -- 616
		for slot, val in pairs({ -- 619
			[0] = 1, -- 619
			[1] = 2, -- 621
			[2] = 0, -- 623
			[3] = 1, -- 625
			[4] = 2, -- 627
			[5] = 0 -- 629
		}) do -- 630
			set_bodygroup(ply, slot, val) -- 617
		end -- 617
		ply:SetNWInt("evilrp_gasmask", 4) -- 631
		ply:Give("evilrp_weapon/novoluger") -- 632
		ply:SetArmor(65) -- 633
		return false -- 634
	end -- 613
}) -- 568
GAMEMODE.CivilProtection = { -- 637
	[TEAM_PRIVATE] = true, -- 637
	[TEAM_SANITAR] = true, -- 638
	[TEAM_EMPEROR] = true -- 639
} -- 636
GAMEMODE.DefaultTeam = TEAM_GHOST -- 641
