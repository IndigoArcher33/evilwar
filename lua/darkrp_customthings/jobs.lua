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
		return false -- 374
	end -- 355
}) -- 304
TEAM_SANITAR = DarkRP.createJob("Dragoon", { -- 377
	color = Color(25, 170, 0), -- 377
	model = "models/vel/evilwar/royalist.mdl", -- 378
	description = "The right hand of the Emperor.\nRespected by his peers,\nfeared by his enemies.", -- 379
	weapons = { -- 380
		"evilrp_weapon/hope", -- 380
		"evilrp_melee/sabre" -- 380
	}, -- 380
	command = "ss", -- 381
	salary = 1, -- 382
	max = 6, -- 383
	cost = 3, -- 384
	hasLicense = true, -- 385
	use_machines = false, -- 386
	ammo = { -- 388
		pistol = 60 -- 388
	}, -- 387
	category = "Royalists", -- 389
	speech_sounds = (function() -- 390
		local _accum_0 = { } -- 390
		local _len_0 = 1 -- 390
		for i = 1, 15 do -- 390
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 390
			_len_0 = _len_0 + 1 -- 390
		end -- 390
		return _accum_0 -- 390
	end)(), -- 390
	hurt_sounds = (function() -- 391
		local _accum_0 = { } -- 391
		local _len_0 = 1 -- 391
		for i = 1, 4 do -- 391
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 391
			_len_0 = _len_0 + 1 -- 391
		end -- 391
		return _accum_0 -- 391
	end)(), -- 391
	become_sounds = (function() -- 392
		local _accum_0 = { } -- 392
		local _len_0 = 1 -- 392
		for i = 1, 15 do -- 392
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 392
			_len_0 = _len_0 + 1 -- 392
		end -- 392
		return _accum_0 -- 392
	end)(), -- 392
	crosstext = function(ply) -- 393
		local text = "Don't panic." -- 394
		do -- 395
			local _exp_0 = lp:Team() -- 395
			if TEAM_PRIVATE == _exp_0 then -- 396
				text = "A Lymphomian legend!" -- 397
			elseif TEAM_STALKER == _exp_0 then -- 398
				text = "Fight or run?!" -- 399
			elseif TEAM_SANITAR == _exp_0 then -- 400
				text = "Finally...\nSomeone competent." -- 401
			elseif TEAM_KORPSMAN == _exp_0 then -- 402
				text = "Is that enemy blood?\nNo of course not." -- 403
			elseif TEAM_DEALER == _exp_0 then -- 404
				text = "A follower of mine." -- 405
			elseif TEAM_EMPEROR == _exp_0 then -- 406
				text = "A tentacle of mine." -- 407
			elseif TEAM_GHOST == _exp_0 then -- 408
				text = "Evil, stupid,\n maybe both." -- 409
			elseif TEAM_BONEHEAD == _exp_0 then -- 410
				text = "DANGER." -- 411
			end -- 411
		end -- 411
		return { -- 412
			text = text, -- 412
			font = "Spleen_Label_Small" -- 412
		}, true -- 412
	end, -- 393
	first_names = { -- 413
		"Subjugator", -- 413
		"Dragoner", -- 413
		"Persecuter", -- 413
		"Draconarius", -- 413
		"Volontaire" -- 413
	}, -- 413
	last_names = { -- 414
		"of Die Augen", -- 414
		"of Knochen", -- 414
		"of Sehne", -- 414
		"of Knorpel", -- 414
		"of Bauchspeicheldrüse" -- 414
	}, -- 414
	arms_model = "models/weapons/c_arms_refugee.mdl", -- 415
	ShowSpare1 = open_player_menu, -- 416
	ShowSpare2 = open_action_menu, -- 417
	bar_names = { -- 419
		health = "resolve" -- 419
	}, -- 418
	PlayerLoadout = function(ply) -- 420
		ply:ClearOddities() -- 421
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 422
		for slot, val in pairs({ -- 425
			[0] = 1, -- 425
			[1] = 1, -- 427
			[2] = 1, -- 429
			[3] = 2, -- 431
			[4] = 3, -- 433
			[5] = 0 -- 435
		}) do -- 436
			set_bodygroup(ply, slot, val) -- 423
		end -- 423
		return false -- 437
	end -- 420
}) -- 376
TEAM_DEALER = DarkRP.createJob("Quartermaster", { -- 440
	color = Color(255, 140, 0), -- 440
	model = "models/vel/evilwar/royalist.mdl", -- 441
	description = "The left hand of the Emperor.\nManage the goods and keep your men armed.", -- 442
	weapons = { }, -- 443
	command = "dealer", -- 444
	salary = 1, -- 445
	max = 1, -- 446
	cost = 3, -- 447
	hasLicense = false, -- 448
	use_machines = false, -- 449
	category = "Royalists", -- 450
	speech_sounds = (function() -- 451
		local _accum_0 = { } -- 451
		local _len_0 = 1 -- 451
		for i = 1, 3 do -- 451
			_accum_0[_len_0] = "placenta/speech/dealer" .. tostring(i) .. ".wav" -- 451
			_len_0 = _len_0 + 1 -- 451
		end -- 451
		return _accum_0 -- 451
	end)(), -- 451
	hurt_sounds = (function() -- 452
		local _accum_0 = { } -- 452
		local _len_0 = 1 -- 452
		for i = 1, 4 do -- 452
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 452
			_len_0 = _len_0 + 1 -- 452
		end -- 452
		return _accum_0 -- 452
	end)(), -- 452
	become_sounds = (function() -- 453
		local _accum_0 = { } -- 453
		local _len_0 = 1 -- 453
		for i = 1, 15 do -- 453
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 453
			_len_0 = _len_0 + 1 -- 453
		end -- 453
		return _accum_0 -- 453
	end)(), -- 453
	crosstext = function(ply) -- 454
		local text = "Don't panic." -- 455
		do -- 456
			local _exp_0 = lp:Team() -- 456
			if TEAM_PRIVATE == _exp_0 then -- 457
				text = "This guy handles the guns." -- 458
			elseif TEAM_STALKER == _exp_0 then -- 459
				text = "Captain of the goods." -- 460
			elseif TEAM_SANITAR == _exp_0 then -- 461
				text = "The oldest living Dragoon.\nRespect. Honor." -- 462
			elseif TEAM_KORPSMAN == _exp_0 then -- 463
				text = "A reminder of the power of\nKapitalism." -- 464
			elseif TEAM_DEALER == _exp_0 then -- 465
				text = "I'm seeing double!" -- 466
			elseif TEAM_EMPEROR == _exp_0 then -- 467
				text = "My brother in arms.\nIf he fails, I'll cut his off." -- 468
			elseif TEAM_GHOST == _exp_0 then -- 469
				text = "Glorified accountant." -- 470
			elseif TEAM_BONEHEAD == _exp_0 then -- 471
				text = "BONES ARE HIS DOLLARS." -- 472
			end -- 472
		end -- 472
		return { -- 473
			text = text, -- 473
			font = "Spleen_Label_Small" -- 473
		}, true -- 473
	end, -- 454
	first_names = { -- 474
		"Quartermaster", -- 474
		"Quartiermeister" -- 474
	}, -- 474
	last_names = { -- 475
		"Kommissariatsdienst" -- 475
	}, -- 475
	special_name = "Kwartiermeester", -- 476
	special_name_chance = 1000, -- 477
	ShowSpare1 = open_player_menu, -- 478
	ShowSpare2 = open_action_menu, -- 479
	bar_names = { -- 481
		health = "insurance" -- 481
	}, -- 480
	PlayerLoadout = function(ply) -- 482
		ply:ClearOddities() -- 483
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 484
		for slot, val in pairs({ -- 487
			[0] = 1, -- 487
			[1] = 1, -- 489
			[2] = 1, -- 491
			[3] = 1, -- 493
			[4] = 3, -- 495
			[5] = 0 -- 497
		}) do -- 498
			set_bodygroup(ply, slot, val) -- 485
		end -- 485
		return false -- 499
	end -- 482
}) -- 439
TEAM_KORPSMAN = DarkRP.createJob("Sanitäter", { -- 502
	color = Color(79, 150, 150), -- 502
	model = "models/vel/evilwar/royalist.mdl", -- 503
	description = "You keep people alive in this terrible place.\nFill the blood and empty the rust.", -- 504
	weapons = { -- 505
		"evilrp/medkit" -- 505
	}, -- 505
	command = "medic", -- 506
	salary = 1, -- 507
	max = 2, -- 508
	cost = 2, -- 509
	hasLicense = false, -- 510
	medic = true, -- 511
	use_machines = false, -- 512
	category = "Royalists", -- 513
	speech_sounds = (function() -- 514
		local _accum_0 = { } -- 514
		local _len_0 = 1 -- 514
		for i = 1, 4 do -- 514
			_accum_0[_len_0] = "placenta/speech/korps" .. tostring(i) .. ".wav" -- 514
			_len_0 = _len_0 + 1 -- 514
		end -- 514
		return _accum_0 -- 514
	end)(), -- 514
	hurt_sounds = (function() -- 515
		local _accum_0 = { } -- 515
		local _len_0 = 1 -- 515
		for i = 1, 4 do -- 515
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 515
			_len_0 = _len_0 + 1 -- 515
		end -- 515
		return _accum_0 -- 515
	end)(), -- 515
	become_sounds = { -- 516
		"items/suitchargeok1.wav" -- 516
	}, -- 516
	crosstext = function(ply) -- 517
		local text = "Don't panic." -- 518
		do -- 519
			local _exp_0 = lp:Team() -- 519
			if TEAM_PRIVATE == _exp_0 then -- 520
				text = "I forgot what\nto call these guys." -- 521
			elseif TEAM_STALKER == _exp_0 then -- 522
				text = "A walking blood bag." -- 523
			elseif TEAM_SANITAR == _exp_0 then -- 524
				text = "Better remember\nwho lets them live." -- 525
			elseif TEAM_KORPSMAN == _exp_0 then -- 526
				text = "Something to\nbe happy about." -- 527
			elseif TEAM_DEALER == _exp_0 then -- 528
				text = "Keep them busy.\nWe need their blood and sweat." -- 529
			elseif TEAM_EMPEROR == _exp_0 then -- 530
				text = "What a strange,\nselfless thing." -- 531
			elseif TEAM_GHOST == _exp_0 then -- 532
				text = "A respectable mortal." -- 533
			elseif TEAM_BONEHEAD == _exp_0 then -- 534
				text = "CONFUSING." -- 535
			end -- 535
		end -- 535
		return { -- 536
			text = text, -- 536
			font = "Spleen_Label_Small" -- 536
		}, true -- 536
	end, -- 517
	first_names = { -- 537
		"Dissector", -- 537
		"Retractor", -- 537
		"Suture", -- 537
		"Femur", -- 537
		"Cystic", -- 537
		"Rasp", -- 537
		"Ferrum", -- 537
		"Fascia", -- 537
		"Marrow", -- 537
		"Lienis", -- 537
		"Aorta", -- 537
		"Tunica", -- 537
		"Maxilla", -- 537
		"Sacrum", -- 537
		"Leach" -- 537
	}, -- 537
	last_names = { -- 538
		"Forceps", -- 538
		"Scalpel", -- 538
		"Curette", -- 538
		"Rongeur", -- 538
		"Trocar", -- 538
		"Babcock", -- 538
		"Duval", -- 538
		"Hemostat", -- 538
		"Ossis", -- 538
		"Caro", -- 538
		"Cadaver", -- 538
		"Sanguis", -- 538
		"Bilis", -- 538
		"Viscera", -- 538
		"Jugular", -- 538
		"Clavius" -- 538
	}, -- 538
	special_name = "Corpseman", -- 539
	special_name_chance = 1000, -- 540
	ShowSpare1 = open_player_menu, -- 541
	ShowSpare2 = open_action_menu, -- 542
	bar_names = { -- 544
		health = "Bio-reserves" -- 544
	}, -- 543
	PlayerLoadout = function(ply) -- 545
		ply:ClearOddities() -- 546
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 547
		ply:SetSkin(4) -- 548
		for slot, val in pairs({ -- 551
			[0] = 0, -- 551
			[1] = 0, -- 553
			[2] = 2, -- 555
			[3] = 3, -- 557
			[4] = 1, -- 559
			[5] = 0 -- 561
		}) do -- 562
			set_bodygroup(ply, slot, val) -- 549
		end -- 549
		return false -- 563
	end -- 545
}) -- 501
TEAM_EMPEROR = DarkRP.createJob("Emperor", { -- 566
	color = Color(150, 20, 20), -- 566
	model = "models/vel/evilwar/royalist.mdl", -- 567
	description = "Rule with an iron fist.", -- 568
	command = "emperor", -- 569
	salary = 1, -- 570
	weapons = { -- 571
		"evilrp_weapon/novoluger" -- 571
	}, -- 571
	max = 1, -- 572
	cost = 5, -- 573
	weapons = { }, -- 574
	hasLicense = true, -- 575
	mayor = true, -- 576
	use_machines = false, -- 577
	category = "Royalists", -- 578
	speech_sounds = (function() -- 579
		local _accum_0 = { } -- 579
		local _len_0 = 1 -- 579
		for i = 1, 15 do -- 579
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 579
			_len_0 = _len_0 + 1 -- 579
		end -- 579
		return _accum_0 -- 579
	end)(), -- 579
	become_sounds = { -- 580
		"kidneydagger/broadcast1.wav" -- 580
	}, -- 580
	crosstext = function(ply) -- 581
		local text = "Don't panic." -- 582
		do -- 583
			local _exp_0 = lp:Team() -- 583
			if TEAM_PRIVATE == _exp_0 then -- 584
				text = "Listen carefully." -- 585
			elseif TEAM_STALKER == _exp_0 then -- 586
				text = "Oh, your majesty!" -- 587
			elseif TEAM_SANITAR == _exp_0 then -- 588
				text = "Hail, hail!" -- 589
			elseif TEAM_KORPSMAN == _exp_0 then -- 590
				text = "Is he feeling okay?" -- 591
			elseif TEAM_DEALER == _exp_0 then -- 592
				text = "Glorious leader.\nI'm nothing without him." -- 593
			elseif TEAM_EMPEROR == _exp_0 then -- 594
				text = "Our strength\nshall prevail." -- 595
			elseif TEAM_GHOST == _exp_0 then -- 596
				text = "So full of lies." -- 597
			elseif TEAM_BONEHEAD == _exp_0 then -- 598
				text = "THERE HE IS!!" -- 599
			end -- 599
		end -- 599
		return { -- 600
			text = text, -- 600
			font = "Spleen_Label_Small" -- 600
		}, true -- 600
	end, -- 581
	first_names = { -- 602
		"Basileus", -- 602
		"Agrippa", -- 602
		"Gnaeus", -- 602
		"Gaius" -- 602
	}, -- 602
	last_names = { -- 603
		"Imperator Lymphoma", -- 603
		"Kaiser Lymphoma", -- 603
		"Rex Lymphoma", -- 603
		"Lymphoma Magnus" -- 603
	}, -- 603
	special_name = "Which Kaiser", -- 604
	special_name_chance = 1000, -- 605
	ShowSpare1 = open_player_menu, -- 606
	ShowSpare2 = open_action_menu, -- 607
	bar_names = { -- 609
		health = "PRIDE" -- 609
	}, -- 608
	PlayerLoadout = function(ply) -- 610
		ply:ClearOddities() -- 611
		local oddities -- 612
		do -- 612
			local _accum_0 = { } -- 612
			local _len_0 = 1 -- 612
			for k, v in pairs(ODDITY.list) do -- 612
				if v ~= ODDITY_ILLITERACY then -- 612
					_accum_0[_len_0] = v -- 612
					_len_0 = _len_0 + 1 -- 612
				end -- 612
			end -- 612
			oddities = _accum_0 -- 612
		end -- 612
		ply:AddOddity(oddities[math.random(#oddities)]) -- 613
		for slot, val in pairs({ -- 616
			[0] = 1, -- 616
			[1] = 2, -- 618
			[2] = 0, -- 620
			[3] = 1, -- 622
			[4] = 2, -- 624
			[5] = 0 -- 626
		}) do -- 627
			set_bodygroup(ply, slot, val) -- 614
		end -- 614
		ply:SetNWInt("evilrp_gasmask", 4) -- 628
		ply:Give("evilrp_weapon/novoluger") -- 629
		return false -- 630
	end -- 610
}) -- 565
GAMEMODE.CivilProtection = { -- 633
	[TEAM_PRIVATE] = true, -- 633
	[TEAM_SANITAR] = true, -- 634
	[TEAM_EMPEROR] = true -- 635
} -- 632
GAMEMODE.DefaultTeam = TEAM_GHOST -- 637
