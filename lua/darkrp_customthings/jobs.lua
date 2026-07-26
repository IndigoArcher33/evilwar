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
			[2] = 0, -- 294
			[3] = 0, -- 296
			[4] = 0, -- 298
			[5] = 0 -- 300
		}) do -- 301
			set_bodygroup(ply, slot, val) -- 288
		end -- 288
		return false -- 302
	end -- 285
}) -- 237
TEAM_SANITAR = DarkRP.createJob("Dragoon", { -- 305
	color = Color(25, 170, 0), -- 305
	model = "models/vel/evilwar/royalist.mdl", -- 306
	description = "The right hand of the Emperor.\nRespected by his peers,\nfeared by his enemies.", -- 307
	weapons = { -- 308
		"evilrp_weapon/hope", -- 308
		"evilrp_melee/sabre" -- 308
	}, -- 308
	command = "ss", -- 309
	salary = 1, -- 310
	max = 6, -- 311
	cost = 3, -- 312
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
				text = "A Lymphomian legend!" -- 325
			elseif TEAM_STALKER == _exp_0 then -- 326
				text = "Fight or run?!" -- 327
			elseif TEAM_SANITAR == _exp_0 then -- 328
				text = "Finally...\nSomeone competent." -- 329
			elseif TEAM_KORPSMAN == _exp_0 then -- 330
				text = "Is that enemy blood?\nNo of course not." -- 331
			elseif TEAM_DEALER == _exp_0 then -- 332
				text = "A follower of mine." -- 333
			elseif TEAM_EMPEROR == _exp_0 then -- 334
				text = "A tentacle of mine." -- 335
			elseif TEAM_GHOST == _exp_0 then -- 336
				text = "Evil, stupid,\n maybe both." -- 337
			elseif TEAM_BONEHEAD == _exp_0 then -- 338
				text = "DANGER." -- 339
			end -- 339
		end -- 339
		return { -- 340
			text = text, -- 340
			font = "Spleen_Label_Small" -- 340
		}, true -- 340
	end, -- 321
	first_names = { -- 341
		"Subjugator", -- 341
		"Dragoner", -- 341
		"Persecuter", -- 341
		"Draconarius", -- 341
		"Volontaire" -- 341
	}, -- 341
	last_names = { -- 342
		"of Die Augen", -- 342
		"of Knochen", -- 342
		"of Sehne", -- 342
		"of Knorpel", -- 342
		"of Bauchspeicheldrüse" -- 342
	}, -- 342
	arms_model = "models/weapons/c_arms_refugee.mdl", -- 343
	ShowSpare1 = open_player_menu, -- 344
	ShowSpare2 = open_action_menu, -- 345
	bar_names = { -- 347
		health = "resolve" -- 347
	}, -- 346
	PlayerLoadout = function(ply) -- 348
		ply:ClearOddities() -- 349
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 350
		for slot, val in pairs({ -- 353
			[0] = 1, -- 353
			[1] = 1, -- 355
			[2] = 1, -- 357
			[3] = 2, -- 359
			[4] = 3, -- 361
			[5] = 0 -- 363
		}) do -- 364
			set_bodygroup(ply, slot, val) -- 351
		end -- 351
		return false -- 365
	end -- 348
}) -- 304
TEAM_DEALER = DarkRP.createJob("Quartermaster", { -- 368
	color = Color(255, 140, 0), -- 368
	model = "models/vel/evilwar/royalist.mdl", -- 369
	description = "The left hand of the Emperor.\nManage the goods and keep your men armed.", -- 370
	weapons = { }, -- 371
	command = "dealer", -- 372
	salary = 1, -- 373
	max = 1, -- 374
	cost = 3, -- 375
	hasLicense = false, -- 376
	use_machines = false, -- 377
	category = "Royalists", -- 378
	speech_sounds = (function() -- 379
		local _accum_0 = { } -- 379
		local _len_0 = 1 -- 379
		for i = 1, 3 do -- 379
			_accum_0[_len_0] = "placenta/speech/dealer" .. tostring(i) .. ".wav" -- 379
			_len_0 = _len_0 + 1 -- 379
		end -- 379
		return _accum_0 -- 379
	end)(), -- 379
	hurt_sounds = (function() -- 380
		local _accum_0 = { } -- 380
		local _len_0 = 1 -- 380
		for i = 1, 4 do -- 380
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 380
			_len_0 = _len_0 + 1 -- 380
		end -- 380
		return _accum_0 -- 380
	end)(), -- 380
	become_sounds = (function() -- 381
		local _accum_0 = { } -- 381
		local _len_0 = 1 -- 381
		for i = 1, 15 do -- 381
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 381
			_len_0 = _len_0 + 1 -- 381
		end -- 381
		return _accum_0 -- 381
	end)(), -- 381
	crosstext = function(ply) -- 382
		local text = "Don't panic." -- 383
		do -- 384
			local _exp_0 = lp:Team() -- 384
			if TEAM_PRIVATE == _exp_0 then -- 385
				text = "This guy handles the guns." -- 386
			elseif TEAM_STALKER == _exp_0 then -- 387
				text = "Captain of the goods." -- 388
			elseif TEAM_SANITAR == _exp_0 then -- 389
				text = "The oldest living Dragoon.\nRespect. Honor." -- 390
			elseif TEAM_KORPSMAN == _exp_0 then -- 391
				text = "A reminder of the power of\nKapitalism." -- 392
			elseif TEAM_DEALER == _exp_0 then -- 393
				text = "I'm seeing double!" -- 394
			elseif TEAM_EMPEROR == _exp_0 then -- 395
				text = "My brother in arms.\nIf he fails, I'll cut his off." -- 396
			elseif TEAM_GHOST == _exp_0 then -- 397
				text = "Glorified accountant." -- 398
			elseif TEAM_BONEHEAD == _exp_0 then -- 399
				text = "BONES ARE HIS DOLLARS." -- 400
			end -- 400
		end -- 400
		return { -- 401
			text = text, -- 401
			font = "Spleen_Label_Small" -- 401
		}, true -- 401
	end, -- 382
	first_names = { -- 402
		"Quartermaster", -- 402
		"Quartiermeister" -- 402
	}, -- 402
	last_names = { -- 403
		"Kommissariatsdienst" -- 403
	}, -- 403
	special_name = "Kwartiermeester", -- 404
	special_name_chance = 1000, -- 405
	ShowSpare1 = open_player_menu, -- 406
	ShowSpare2 = open_action_menu, -- 407
	bar_names = { -- 409
		health = "insurance" -- 409
	}, -- 408
	PlayerLoadout = function(ply) -- 410
		ply:ClearOddities() -- 411
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 412
		for slot, val in pairs({ -- 415
			[0] = 1, -- 415
			[1] = 1, -- 417
			[2] = 1, -- 419
			[3] = 1, -- 421
			[4] = 3, -- 423
			[5] = 0 -- 425
		}) do -- 426
			set_bodygroup(ply, slot, val) -- 413
		end -- 413
		return false -- 427
	end -- 410
}) -- 367
TEAM_KORPSMAN = DarkRP.createJob("Sanitäter", { -- 430
	color = Color(79, 150, 150), -- 430
	model = "models/vel/evilwar/royalist.mdl", -- 431
	description = "You keep people alive in this terrible place.\nFill the blood and empty the rust.", -- 432
	weapons = { -- 433
		"evilrp/medkit" -- 433
	}, -- 433
	command = "medic", -- 434
	salary = 1, -- 435
	max = 2, -- 436
	cost = 2, -- 437
	hasLicense = false, -- 438
	medic = true, -- 439
	use_machines = false, -- 440
	category = "Royalists", -- 441
	speech_sounds = (function() -- 442
		local _accum_0 = { } -- 442
		local _len_0 = 1 -- 442
		for i = 1, 4 do -- 442
			_accum_0[_len_0] = "placenta/speech/korps" .. tostring(i) .. ".wav" -- 442
			_len_0 = _len_0 + 1 -- 442
		end -- 442
		return _accum_0 -- 442
	end)(), -- 442
	hurt_sounds = (function() -- 443
		local _accum_0 = { } -- 443
		local _len_0 = 1 -- 443
		for i = 1, 4 do -- 443
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 443
			_len_0 = _len_0 + 1 -- 443
		end -- 443
		return _accum_0 -- 443
	end)(), -- 443
	become_sounds = { -- 444
		"items/suitchargeok1.wav" -- 444
	}, -- 444
	crosstext = function(ply) -- 445
		local text = "Don't panic." -- 446
		do -- 447
			local _exp_0 = lp:Team() -- 447
			if TEAM_PRIVATE == _exp_0 then -- 448
				text = "I forgot what\nto call these guys." -- 449
			elseif TEAM_STALKER == _exp_0 then -- 450
				text = "A walking blood bag." -- 451
			elseif TEAM_SANITAR == _exp_0 then -- 452
				text = "Better remember\nwho lets them live." -- 453
			elseif TEAM_KORPSMAN == _exp_0 then -- 454
				text = "Something to\nbe happy about." -- 455
			elseif TEAM_DEALER == _exp_0 then -- 456
				text = "Keep them busy.\nWe need their blood and sweat." -- 457
			elseif TEAM_EMPEROR == _exp_0 then -- 458
				text = "What a strange,\nselfless thing." -- 459
			elseif TEAM_GHOST == _exp_0 then -- 460
				text = "A respectable mortal." -- 461
			elseif TEAM_BONEHEAD == _exp_0 then -- 462
				text = "CONFUSING." -- 463
			end -- 463
		end -- 463
		return { -- 464
			text = text, -- 464
			font = "Spleen_Label_Small" -- 464
		}, true -- 464
	end, -- 445
	first_names = { -- 465
		"Dissector", -- 465
		"Retractor", -- 465
		"Suture", -- 465
		"Femur", -- 465
		"Cystic", -- 465
		"Rasp", -- 465
		"Ferrum", -- 465
		"Fascia", -- 465
		"Marrow", -- 465
		"Lienis", -- 465
		"Aorta", -- 465
		"Tunica", -- 465
		"Maxilla", -- 465
		"Sacrum", -- 465
		"Leach" -- 465
	}, -- 465
	last_names = { -- 466
		"Forceps", -- 466
		"Scalpel", -- 466
		"Curette", -- 466
		"Rongeur", -- 466
		"Trocar", -- 466
		"Babcock", -- 466
		"Duval", -- 466
		"Hemostat", -- 466
		"Ossis", -- 466
		"Caro", -- 466
		"Cadaver", -- 466
		"Sanguis", -- 466
		"Bilis", -- 466
		"Viscera", -- 466
		"Jugular", -- 466
		"Clavius" -- 466
	}, -- 466
	special_name = "Corpseman", -- 467
	special_name_chance = 1000, -- 468
	ShowSpare1 = open_player_menu, -- 469
	ShowSpare2 = open_action_menu, -- 470
	bar_names = { -- 472
		health = "Bio-reserves" -- 472
	}, -- 471
	PlayerLoadout = function(ply) -- 473
		ply:ClearOddities() -- 474
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 475
		ply:SetSkin(4) -- 476
		for slot, val in pairs({ -- 479
			[0] = 0, -- 479
			[1] = 0, -- 481
			[2] = 2, -- 483
			[3] = 3, -- 485
			[4] = 1, -- 487
			[5] = 0 -- 489
		}) do -- 490
			set_bodygroup(ply, slot, val) -- 477
		end -- 477
		return false -- 491
	end -- 473
}) -- 429
TEAM_EMPEROR = DarkRP.createJob("Emperor", { -- 494
	color = Color(150, 20, 20), -- 494
	model = "models/vel/evilwar/royalist.mdl", -- 495
	description = "Rule with an iron fist.", -- 496
	command = "emperor", -- 497
	salary = 1, -- 498
	weapons = { -- 499
		"evilrp_weapon/novoluger" -- 499
	}, -- 499
	max = 1, -- 500
	cost = 5, -- 501
	weapons = { }, -- 502
	hasLicense = true, -- 503
	mayor = true, -- 504
	use_machines = false, -- 505
	category = "Royalists", -- 506
	speech_sounds = (function() -- 507
		local _accum_0 = { } -- 507
		local _len_0 = 1 -- 507
		for i = 1, 15 do -- 507
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 507
			_len_0 = _len_0 + 1 -- 507
		end -- 507
		return _accum_0 -- 507
	end)(), -- 507
	become_sounds = { -- 508
		"kidneydagger/broadcast1.wav" -- 508
	}, -- 508
	crosstext = function(ply) -- 509
		local text = "Don't panic." -- 510
		do -- 511
			local _exp_0 = lp:Team() -- 511
			if TEAM_PRIVATE == _exp_0 then -- 512
				text = "Listen carefully." -- 513
			elseif TEAM_STALKER == _exp_0 then -- 514
				text = "Oh, your majesty!" -- 515
			elseif TEAM_SANITAR == _exp_0 then -- 516
				text = "Hail, hail!" -- 517
			elseif TEAM_KORPSMAN == _exp_0 then -- 518
				text = "Is he feeling okay?" -- 519
			elseif TEAM_DEALER == _exp_0 then -- 520
				text = "Glorious leader.\nI'm nothing without him." -- 521
			elseif TEAM_EMPEROR == _exp_0 then -- 522
				text = "Our strength\nshall prevail." -- 523
			elseif TEAM_GHOST == _exp_0 then -- 524
				text = "So full of lies." -- 525
			elseif TEAM_BONEHEAD == _exp_0 then -- 526
				text = "THERE HE IS!!" -- 527
			end -- 527
		end -- 527
		return { -- 528
			text = text, -- 528
			font = "Spleen_Label_Small" -- 528
		}, true -- 528
	end, -- 509
	first_names = { -- 530
		"Basileus", -- 530
		"Agrippa", -- 530
		"Gnaeus", -- 530
		"Gaius" -- 530
	}, -- 530
	last_names = { -- 531
		"", -- 531
		"Imperator Lymphoma", -- 531
		"Pater Patriae", -- 531
		"Rex Lymphoma", -- 531
		"Lymphoma Magnus" -- 531
	}, -- 531
	special_name = "Which Kaiser", -- 532
	special_name_chance = 1000, -- 533
	ShowSpare1 = open_player_menu, -- 534
	ShowSpare2 = open_action_menu, -- 535
	bar_names = { -- 537
		health = "PRIDE" -- 537
	}, -- 536
	PlayerLoadout = function(ply) -- 538
		ply:ClearOddities() -- 539
		local oddities -- 540
		do -- 540
			local _accum_0 = { } -- 540
			local _len_0 = 1 -- 540
			for k, v in pairs(ODDITY.list) do -- 540
				if v ~= ODDITY_ILLITERACY then -- 540
					_accum_0[_len_0] = v -- 540
					_len_0 = _len_0 + 1 -- 540
				end -- 540
			end -- 540
			oddities = _accum_0 -- 540
		end -- 540
		ply:AddOddity(oddities[math.random(#oddities)]) -- 541
		for slot, val in pairs({ -- 544
			[0] = 1, -- 544
			[1] = 2, -- 546
			[2] = 0, -- 548
			[3] = 1, -- 550
			[4] = 2, -- 552
			[5] = 0 -- 554
		}) do -- 555
			set_bodygroup(ply, slot, val) -- 542
		end -- 542
		ply:SetNWInt("evilrp_gasmask", 4) -- 556
		ply:Give("evilrp_weapon/novoluger") -- 557
		return false -- 558
	end -- 538
}) -- 493
GAMEMODE.CivilProtection = { -- 561
	[TEAM_PRIVATE] = true, -- 561
	[TEAM_SANITAR] = true, -- 562
	[TEAM_EMPEROR] = true -- 563
} -- 560
GAMEMODE.DefaultTeam = TEAM_GHOST -- 565
