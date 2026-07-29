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
			elseif TEAM_CONSCRIPT == _exp_0 then -- 336
				text = "United in blood." -- 337
			elseif TEAM_GHOST == _exp_0 then -- 338
				text = "Definitely stupid." -- 339
			elseif TEAM_BONEHEAD == _exp_0 then -- 340
				text = "HAHAHAH." -- 341
			end -- 341
		end -- 341
		return { -- 342
			text = text, -- 342
			font = "Spleen_Label_Small" -- 342
		}, false -- 342
	end, -- 321
	first_names = { -- 343
		"Fodder", -- 343
		"Meatshield", -- 343
		"Grunt", -- 343
		"Drone", -- 343
		"Conscript", -- 343
		"Meatbag" -- 343
	}, -- 343
	GenerateName = function(self, ply) -- 344
		local unit_id = math.random(1, 99) -- 345
		if unit_id < 10 then -- 346
			unit_id = "0" .. tostring(unit_id) -- 347
		else -- 349
			unit_id = tostring(unit_id) -- 349
		end -- 346
		return self.first_names[math.random(1, #self.first_names)] .. " #" .. unit_id -- 350
	end, -- 344
	special_name = "private parts", -- 351
	special_name_chance = 1000, -- 352
	ShowSpare1 = open_player_menu, -- 353
	ShowSpare2 = open_action_menu, -- 354
	PlayerLoadout = function(ply) -- 355
		ply:ClearOddities() -- 356
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 357
		for slot, val in pairs({ -- 360
			[0] = 0, -- 360
			[2] = 0, -- 362
			[3] = { -- 364
				7, -- 364
				8 -- 364
			}, -- 364
			[4] = { -- 366
				0, -- 366
				4 -- 366
			}, -- 366
			[5] = 0, -- 368
			[6] = 0, -- 370
			[7] = 1 -- 372
		}) do -- 373
			set_bodygroup(ply, slot, val) -- 358
		end -- 358
		ply:SetArmor(25) -- 374
		return false -- 375
	end -- 355
}) -- 304
TEAM_SANITAR = DarkRP.createJob("Dragoon", { -- 378
	color = Color(25, 170, 0), -- 378
	model = "models/vel/evilwar/royalist.mdl", -- 379
	description = "The right hand of the Emperor.\nRespected by his peers,\nfeared by his enemies.", -- 380
	weapons = { -- 381
		"evilrp_weapon/hope", -- 381
		"evilrp_melee/sabre" -- 381
	}, -- 381
	command = "ss", -- 382
	salary = 1, -- 383
	max = 6, -- 384
	cost = 3, -- 385
	hasLicense = true, -- 386
	use_machines = false, -- 387
	ammo = { -- 389
		pistol = 60 -- 389
	}, -- 388
	category = "Royalists", -- 390
	speech_sounds = (function() -- 391
		local _accum_0 = { } -- 391
		local _len_0 = 1 -- 391
		for i = 1, 15 do -- 391
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 391
			_len_0 = _len_0 + 1 -- 391
		end -- 391
		return _accum_0 -- 391
	end)(), -- 391
	hurt_sounds = (function() -- 392
		local _accum_0 = { } -- 392
		local _len_0 = 1 -- 392
		for i = 1, 4 do -- 392
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 392
			_len_0 = _len_0 + 1 -- 392
		end -- 392
		return _accum_0 -- 392
	end)(), -- 392
	become_sounds = (function() -- 393
		local _accum_0 = { } -- 393
		local _len_0 = 1 -- 393
		for i = 1, 15 do -- 393
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 393
			_len_0 = _len_0 + 1 -- 393
		end -- 393
		return _accum_0 -- 393
	end)(), -- 393
	crosstext = function(ply) -- 394
		local text = "Don't panic." -- 395
		do -- 396
			local _exp_0 = lp:Team() -- 396
			if TEAM_PRIVATE == _exp_0 then -- 397
				text = "A Lymphomian legend!" -- 398
			elseif TEAM_STALKER == _exp_0 then -- 399
				text = "Fight or run?!" -- 400
			elseif TEAM_SANITAR == _exp_0 then -- 401
				text = "Finally...\nSomeone competent." -- 402
			elseif TEAM_KORPSMAN == _exp_0 then -- 403
				text = "Is that enemy blood?\nNo of course not." -- 404
			elseif TEAM_DEALER == _exp_0 then -- 405
				text = "A follower of mine." -- 406
			elseif TEAM_EMPEROR == _exp_0 then -- 407
				text = "A tentacle of mine." -- 408
			elseif TEAM_GHOST == _exp_0 then -- 409
				text = "Evil, stupid,\n maybe both." -- 410
			elseif TEAM_BONEHEAD == _exp_0 then -- 411
				text = "DANGER." -- 412
			end -- 412
		end -- 412
		return { -- 413
			text = text, -- 413
			font = "Spleen_Label_Small" -- 413
		}, true -- 413
	end, -- 394
	first_names = { -- 414
		"Subjugator", -- 414
		"Dragoner", -- 414
		"Persecuter", -- 414
		"Draconarius", -- 414
		"Volontaire" -- 414
	}, -- 414
	last_names = { -- 415
		"of Die Augen", -- 415
		"of Knochen", -- 415
		"of Sehne", -- 415
		"of Knorpel", -- 415
		"of Bauchspeicheldrüse" -- 415
	}, -- 415
	arms_model = "models/weapons/c_arms_refugee.mdl", -- 416
	ShowSpare1 = open_player_menu, -- 417
	ShowSpare2 = open_action_menu, -- 418
	bar_names = { -- 420
		health = "resolve" -- 420
	}, -- 419
	PlayerLoadout = function(ply) -- 421
		ply:ClearOddities() -- 422
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 423
		for slot, val in pairs({ -- 426
			[0] = 1, -- 426
			[1] = 1, -- 428
			[2] = 1, -- 430
			[3] = 2, -- 432
			[4] = 3, -- 434
			[5] = 0 -- 436
		}) do -- 437
			set_bodygroup(ply, slot, val) -- 424
		end -- 424
		ply:SetArmor(40) -- 438
		return false -- 439
	end -- 421
}) -- 377
TEAM_DEALER = DarkRP.createJob("Quartermaster", { -- 442
	color = Color(255, 140, 0), -- 442
	model = "models/vel/evilwar/royalist.mdl", -- 443
	description = "The left hand of the Emperor.\nManage the goods and keep your men armed.", -- 444
	weapons = { }, -- 445
	command = "dealer", -- 446
	salary = 1, -- 447
	max = 1, -- 448
	cost = 3, -- 449
	hasLicense = false, -- 450
	use_machines = false, -- 451
	category = "Royalists", -- 452
	speech_sounds = (function() -- 453
		local _accum_0 = { } -- 453
		local _len_0 = 1 -- 453
		for i = 1, 3 do -- 453
			_accum_0[_len_0] = "placenta/speech/dealer" .. tostring(i) .. ".wav" -- 453
			_len_0 = _len_0 + 1 -- 453
		end -- 453
		return _accum_0 -- 453
	end)(), -- 453
	hurt_sounds = (function() -- 454
		local _accum_0 = { } -- 454
		local _len_0 = 1 -- 454
		for i = 1, 4 do -- 454
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 454
			_len_0 = _len_0 + 1 -- 454
		end -- 454
		return _accum_0 -- 454
	end)(), -- 454
	become_sounds = (function() -- 455
		local _accum_0 = { } -- 455
		local _len_0 = 1 -- 455
		for i = 1, 15 do -- 455
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 455
			_len_0 = _len_0 + 1 -- 455
		end -- 455
		return _accum_0 -- 455
	end)(), -- 455
	crosstext = function(ply) -- 456
		local text = "Don't panic." -- 457
		do -- 458
			local _exp_0 = lp:Team() -- 458
			if TEAM_PRIVATE == _exp_0 then -- 459
				text = "This guy handles the guns." -- 460
			elseif TEAM_STALKER == _exp_0 then -- 461
				text = "Captain of the goods." -- 462
			elseif TEAM_SANITAR == _exp_0 then -- 463
				text = "The oldest living Dragoon.\nRespect. Honor." -- 464
			elseif TEAM_KORPSMAN == _exp_0 then -- 465
				text = "A reminder of the power of Kapitalism." -- 466
			elseif TEAM_DEALER == _exp_0 then -- 467
				text = "I'm seeing double!" -- 468
			elseif TEAM_EMPEROR == _exp_0 then -- 469
				text = "My brother in arms.\nIf he fails, I'll cut his off." -- 470
			elseif TEAM_GHOST == _exp_0 then -- 471
				text = "Glorified accountant." -- 472
			elseif TEAM_BONEHEAD == _exp_0 then -- 473
				text = "BONES ARE HIS DOLLARS." -- 474
			end -- 474
		end -- 474
		return { -- 475
			text = text, -- 475
			font = "Spleen_Label_Small" -- 475
		}, true -- 475
	end, -- 456
	first_names = { -- 476
		"Quartermaster", -- 476
		"Quartiermeister" -- 476
	}, -- 476
	last_names = { -- 477
		"Kommissariatsdienst" -- 477
	}, -- 477
	special_name = "Trusty", -- 478
	special_name_chance = 1000, -- 479
	ShowSpare1 = open_player_menu, -- 480
	ShowSpare2 = open_action_menu, -- 481
	bar_names = { -- 483
		health = "insurance" -- 483
	}, -- 482
	PlayerLoadout = function(ply) -- 484
		ply:ClearOddities() -- 485
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 486
		for slot, val in pairs({ -- 489
			[0] = 1, -- 489
			[1] = 1, -- 491
			[2] = 1, -- 493
			[3] = 1, -- 495
			[4] = 3, -- 497
			[5] = 0 -- 499
		}) do -- 500
			set_bodygroup(ply, slot, val) -- 487
		end -- 487
		return false -- 501
	end -- 484
}) -- 441
TEAM_KORPSMAN = DarkRP.createJob("Sanitäter", { -- 504
	color = Color(79, 150, 150), -- 504
	model = "models/vel/evilwar/royalist.mdl", -- 505
	description = "You keep people alive in this terrible place.\nFill the blood and empty the rust.", -- 506
	weapons = { -- 507
		"evilrp/medkit" -- 507
	}, -- 507
	command = "medic", -- 508
	salary = 1, -- 509
	max = 2, -- 510
	cost = 2, -- 511
	hasLicense = false, -- 512
	medic = true, -- 513
	use_machines = false, -- 514
	category = "Royalists", -- 515
	speech_sounds = (function() -- 516
		local _accum_0 = { } -- 516
		local _len_0 = 1 -- 516
		for i = 1, 4 do -- 516
			_accum_0[_len_0] = "placenta/speech/korps" .. tostring(i) .. ".wav" -- 516
			_len_0 = _len_0 + 1 -- 516
		end -- 516
		return _accum_0 -- 516
	end)(), -- 516
	hurt_sounds = (function() -- 517
		local _accum_0 = { } -- 517
		local _len_0 = 1 -- 517
		for i = 1, 4 do -- 517
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 517
			_len_0 = _len_0 + 1 -- 517
		end -- 517
		return _accum_0 -- 517
	end)(), -- 517
	become_sounds = { -- 518
		"items/suitchargeok1.wav" -- 518
	}, -- 518
	crosstext = function(ply) -- 519
		local text = "Don't panic." -- 520
		do -- 521
			local _exp_0 = lp:Team() -- 521
			if TEAM_PRIVATE == _exp_0 then -- 522
				text = "I forgot what\nto call these guys." -- 523
			elseif TEAM_STALKER == _exp_0 then -- 524
				text = "A walking blood bag." -- 525
			elseif TEAM_SANITAR == _exp_0 then -- 526
				text = "Better remember\nwho lets them live." -- 527
			elseif TEAM_KORPSMAN == _exp_0 then -- 528
				text = "Something to\nbe happy about." -- 529
			elseif TEAM_DEALER == _exp_0 then -- 530
				text = "Keep them busy.\nWe need their blood and sweat." -- 531
			elseif TEAM_EMPEROR == _exp_0 then -- 532
				text = "What a strange,\nselfless thing." -- 533
			elseif TEAM_GHOST == _exp_0 then -- 534
				text = "A respectable mortal." -- 535
			elseif TEAM_BONEHEAD == _exp_0 then -- 536
				text = "CONFUSING." -- 537
			end -- 537
		end -- 537
		return { -- 538
			text = text, -- 538
			font = "Spleen_Label_Small" -- 538
		}, true -- 538
	end, -- 519
	first_names = { -- 539
		"Dissector", -- 539
		"Retractor", -- 539
		"Suture", -- 539
		"Femur", -- 539
		"Cystic", -- 539
		"Rasp", -- 539
		"Ferrum", -- 539
		"Fascia", -- 539
		"Marrow", -- 539
		"Lienis", -- 539
		"Aorta", -- 539
		"Tunica", -- 539
		"Maxilla", -- 539
		"Sacrum", -- 539
		"Leach" -- 539
	}, -- 539
	last_names = { -- 540
		"Forceps", -- 540
		"Scalpel", -- 540
		"Curette", -- 540
		"Rongeur", -- 540
		"Trocar", -- 540
		"Babcock", -- 540
		"Duval", -- 540
		"Hemostat", -- 540
		"Ossis", -- 540
		"Caro", -- 540
		"Cadaver", -- 540
		"Sanguis", -- 540
		"Bilis", -- 540
		"Viscera", -- 540
		"Jugular", -- 540
		"Clavius" -- 540
	}, -- 540
	special_name = "Corpseman", -- 541
	special_name_chance = 1000, -- 542
	ShowSpare1 = open_player_menu, -- 543
	ShowSpare2 = open_action_menu, -- 544
	bar_names = { -- 546
		health = "Bio-reserves" -- 546
	}, -- 545
	PlayerLoadout = function(ply) -- 547
		ply:ClearOddities() -- 548
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 549
		ply:SetSkin(4) -- 550
		for slot, val in pairs({ -- 553
			[0] = 0, -- 553
			[1] = 0, -- 555
			[2] = 2, -- 557
			[3] = 3, -- 559
			[4] = 1, -- 561
			[5] = 0 -- 563
		}) do -- 564
			set_bodygroup(ply, slot, val) -- 551
		end -- 551
		return false -- 565
	end -- 547
}) -- 503
TEAM_EMPEROR = DarkRP.createJob("Emperor", { -- 568
	color = Color(150, 20, 20), -- 568
	model = "models/vel/evilwar/royalist.mdl", -- 569
	description = "Rule with an iron fist.", -- 570
	command = "emperor", -- 571
	salary = 1, -- 572
	weapons = { -- 573
		"evilrp_weapon/novoluger" -- 573
	}, -- 573
	max = 1, -- 574
	cost = 5, -- 575
	weapons = { }, -- 576
	hasLicense = true, -- 577
	mayor = true, -- 578
	use_machines = false, -- 579
	category = "Royalists", -- 580
	speech_sounds = (function() -- 581
		local _accum_0 = { } -- 581
		local _len_0 = 1 -- 581
		for i = 1, 15 do -- 581
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 581
			_len_0 = _len_0 + 1 -- 581
		end -- 581
		return _accum_0 -- 581
	end)(), -- 581
	become_sounds = { -- 582
		"kidneydagger/broadcast1.wav" -- 582
	}, -- 582
	crosstext = function(ply) -- 583
		local text = "Don't panic." -- 584
		do -- 585
			local _exp_0 = lp:Team() -- 585
			if TEAM_PRIVATE == _exp_0 then -- 586
				text = "Listen carefully." -- 587
			elseif TEAM_STALKER == _exp_0 then -- 588
				text = "Oh, your majesty!" -- 589
			elseif TEAM_SANITAR == _exp_0 then -- 590
				text = "Hail, hail!" -- 591
			elseif TEAM_KORPSMAN == _exp_0 then -- 592
				text = "Is he feeling okay?" -- 593
			elseif TEAM_DEALER == _exp_0 then -- 594
				text = "Glorious leader.\nI'm nothing without him." -- 595
			elseif TEAM_EMPEROR == _exp_0 then -- 596
				text = "Our strength\nshall prevail." -- 597
			elseif TEAM_GHOST == _exp_0 then -- 598
				text = "So full of lies." -- 599
			elseif TEAM_BONEHEAD == _exp_0 then -- 600
				text = "THERE HE IS!!" -- 601
			end -- 601
		end -- 601
		return { -- 602
			text = text, -- 602
			font = "Spleen_Label_Small" -- 602
		}, true -- 602
	end, -- 583
	first_names = { -- 604
		"Basileus", -- 604
		"Agrippa", -- 604
		"Gnaeus", -- 604
		"Gaius" -- 604
	}, -- 604
	last_names = { -- 605
		"Imperator Lymphoma", -- 605
		"Kaiser Lymphoma", -- 605
		"Rex Lymphoma", -- 605
		"Lymphoma Magnus" -- 605
	}, -- 605
	special_name = "Which Kaiser", -- 606
	special_name_chance = 1000, -- 607
	ShowSpare1 = open_player_menu, -- 608
	ShowSpare2 = open_action_menu, -- 609
	bar_names = { -- 611
		health = "PRIDE" -- 611
	}, -- 610
	PlayerLoadout = function(ply) -- 612
		ply:ClearOddities() -- 613
		local oddities -- 614
		do -- 614
			local _accum_0 = { } -- 614
			local _len_0 = 1 -- 614
			for k, v in pairs(ODDITY.list) do -- 614
				if v ~= ODDITY_ILLITERACY then -- 614
					_accum_0[_len_0] = v -- 614
					_len_0 = _len_0 + 1 -- 614
				end -- 614
			end -- 614
			oddities = _accum_0 -- 614
		end -- 614
		ply:AddOddity(oddities[math.random(#oddities)]) -- 615
		for slot, val in pairs({ -- 618
			[0] = 1, -- 618
			[1] = 2, -- 620
			[2] = 0, -- 622
			[3] = 1, -- 624
			[4] = 2, -- 626
			[5] = 0 -- 628
		}) do -- 629
			set_bodygroup(ply, slot, val) -- 616
		end -- 616
		ply:SetNWInt("evilrp_gasmask", 4) -- 630
		ply:Give("evilrp_weapon/novoluger") -- 631
		ply:SetArmor(65) -- 632
		return false -- 633
	end -- 612
}) -- 567
GAMEMODE.CivilProtection = { -- 636
	[TEAM_PRIVATE] = true, -- 636
	[TEAM_SANITAR] = true, -- 637
	[TEAM_EMPEROR] = true -- 638
} -- 635
GAMEMODE.DefaultTeam = TEAM_GHOST -- 640
