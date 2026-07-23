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
		"evilrp_weapon/prettyboy", -- 93
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
		for i = 1, 8 do -- 102
			_accum_0[_len_0] = "placenta/speech/cult" .. tostring(i) .. ".wav" -- 102
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
		for i = 1, 9 do -- 104
			_accum_0[_len_0] = "placenta/cultspawn" .. tostring(i) .. ".wav" -- 104
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
			elseif TEAM_KOMMANDANT == _exp_0 then -- 117
				text = "He might be of use to me." -- 118
			elseif TEAM_GHOST == _exp_0 then -- 119
				text = "He has a noble pursuit." -- 120
			elseif TEAM_BONEHEAD == _exp_0 then -- 121
				text = "SEEN HIM BEFORE!!" -- 122
			end -- 122
		end -- 122
		return { -- 123
			text = text, -- 123
			font = "Spleen_Label_Small" -- 123
		}, false -- 123
	end, -- 106
	first_names = { -- 124
		"Wasted", -- 124
		"Decrepit", -- 124
		"Rotten" -- 124
	}, -- 124
	last_names = { -- 125
		"Soul", -- 125
		"Plunderer", -- 125
		"Traitor", -- 125
		"Wanderer" -- 125
	}, -- 125
	bar_names = { -- 127
		health = "regret" -- 127
	}, -- 126
	special_name = "Waste", -- 128
	special_name_chance = 1000, -- 129
	ShowSpare1 = open_player_menu, -- 130
	ShowSpare2 = open_action_menu, -- 131
	PlayerLoadout = function(ply) -- 132
		ply:ClearOddities() -- 133
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 134
		for slot, val in pairs({ -- 137
			[0] = 0, -- 137
			[1] = 2, -- 139
			[2] = { -- 141
				2, -- 141
				3, -- 141
				8, -- 141
				6 -- 141
			}, -- 141
			[3] = { -- 143
				19, -- 143
				20 -- 143
			}, -- 143
			[4] = 0, -- 145
			[5] = 0, -- 147
			[6] = { -- 149
				0, -- 149
				1, -- 149
				2, -- 149
				3 -- 149
			}, -- 149
			[7] = 0, -- 151
			[8] = 0, -- 153
			[9] = { -- 155
				0, -- 155
				1 -- 155
			} -- 155
		}) do -- 156
			set_bodygroup(ply, slot, val) -- 135
		end -- 135
		local skins = { -- 157
			4, -- 157
			6, -- 157
			7 -- 157
		} -- 157
		ply:SetSkin(skins[math.random(1, #skins)]) -- 158
		return false -- 159
	end -- 132
}) -- 89
do -- 161
	local _class_0 -- 161
	local _parent_0 = SOUND -- 161
	local _base_0 = { -- 161
		sound = "placenta/bonehead_aggrod4.wav", -- 163
		pitch = { -- 163
			200, -- 163
			250 -- 163
		} -- 161
	} -- 161
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 163
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 161
			_base_0[_key_0] = _val_0 -- 161
		end -- 161
	end -- 163
	if _base_0.__index == nil then -- 161
		_base_0.__index = _base_0 -- 161
	end -- 163
	setmetatable(_base_0, _parent_0.__base) -- 161
	_class_0 = setmetatable({ -- 161
		__init = function(self, ...) -- 161
			return _class_0.__parent.__init(self, ...) -- 161
		end, -- 161
		__base = _base_0, -- 161
		__name = "SpeechBonehead", -- 161
		__parent = _parent_0 -- 161
	}, { -- 161
		__index = function(cls, name) -- 161
			local val = rawget(_base_0, name) -- 161
			if val == nil then -- 161
				local parent = rawget(cls, "__parent") -- 161
				if parent then -- 161
					return parent[name] -- 161
				end -- 161
			else -- 161
				return val -- 161
			end -- 161
		end, -- 161
		__call = function(cls, ...) -- 161
			local _self_0 = setmetatable({ }, _base_0) -- 161
			cls.__init(_self_0, ...) -- 161
			return _self_0 -- 161
		end -- 161
	}) -- 161
	_base_0.__class = _class_0 -- 161
	if _parent_0.__inherited then -- 161
		_parent_0.__inherited(_parent_0, _class_0) -- 161
	end -- 161
	SpeechBonehead = _class_0 -- 161
end -- 163
TEAM_BONEHEAD = DarkRP.createJob("Bonehead", { -- 166
	color = Color(150, 150, 150), -- 166
	model = "models/player/zombie_fast.mdl", -- 167
	description = "evil fucker.", -- 168
	instant_respawn = true, -- 169
	command = "bonehead", -- 170
	salary = 1, -- 171
	max = 0, -- 172
	cost = 1, -- 173
	use_machines = false, -- 174
	speech_sounds = "SpeechBonehead", -- 175
	hurt_sounds = (function() -- 176
		local _accum_0 = { } -- 176
		local _len_0 = 1 -- 176
		for i = 1, 2 do -- 176
			_accum_0[_len_0] = "placenta/bonehead_slice" .. tostring(i) .. ".wav" -- 176
			_len_0 = _len_0 + 1 -- 176
		end -- 176
		return _accum_0 -- 176
	end)(), -- 176
	become_sounds = (function() -- 177
		local _accum_0 = { } -- 177
		local _len_0 = 1 -- 177
		for i = 1, 4 do -- 177
			_accum_0[_len_0] = "placenta/bonehead_aggrod" .. tostring(i) .. ".wav" -- 177
			_len_0 = _len_0 + 1 -- 177
		end -- 177
		return _accum_0 -- 177
	end)(), -- 177
	crosstext = function(ply) -- 178
		local text = "Don't panic." -- 179
		do -- 180
			local _exp_0 = lp:Team() -- 180
			if TEAM_PRIVATE == _exp_0 then -- 181
				text = "Oh no! He's real!" -- 182
			elseif TEAM_SANITAR == _exp_0 then -- 183
				text = "Oh boy." -- 184
			elseif TEAM_KORPSMAN == _exp_0 then -- 185
				text = "Oh no! It happened again!" -- 186
			elseif TEAM_KOMMANDANT == _exp_0 then -- 187
				text = "Ha. It happened again." -- 188
			elseif TEAM_GHOST == _exp_0 then -- 189
				text = "Lookin' good." -- 190
			elseif TEAM_BONEHEAD == _exp_0 then -- 191
				text = "THERE'S ANOTHER ONE." -- 192
			end -- 192
		end -- 192
		return { -- 193
			text = text, -- 193
			font = "Spleen_Label_Small" -- 193
		}, false -- 193
	end, -- 178
	first_names = { -- 194
		"Evil" -- 194
	}, -- 194
	last_names = { -- 195
		"Fucker" -- 195
	}, -- 195
	no_needs = true, -- 196
	hint = "You are a truly pissed off skeleton. Go get 'em!", -- 197
	bar_names = { -- 199
		health = "EVIL FUCKER POWER" -- 199
	}, -- 198
	bar_colors = { -- 201
		health = Color(200, 0, 0) -- 201
	}, -- 200
	RenderScreenspaceEffects = function(ply) -- 202
		local ct = CurTime() -- 203
		DrawMotionBlur(0.25, 0.2, 0.3) -- 204
		return DrawSharpen(1 * math.sin(ct), 2 * math.random(0.8, 1.2)) -- 205
	end, -- 202
	ColorMod = function(ply) -- 206
		local abs, cos, sin = math.abs, math.cos, math.sin -- 207
		local ct = CurTime() -- 208
		local tab = { -- 210
			["$pp_colour_addr"] = 0.1, -- 210
			["$pp_colour_addg"] = 0, -- 211
			["$pp_colour_addb"] = 0, -- 212
			["$pp_colour_brightness"] = 0 + (-0.01 * cos(ct)), -- 213
			["$pp_colour_contrast"] = 1.6 + (abs(sin(ct * 0.166)) * 0.5), -- 214
			["$pp_colour_colour"] = 0, -- 215
			["$pp_colour_mulr"] = 0 + abs(sin(ct * 0.789)), -- 216
			["$pp_colour_mulg"] = 0, -- 217
			["$pp_colour_mulb"] = 0 -- 218
		} -- 209
		return tab -- 219
	end, -- 206
	ShowSpare1 = function() -- 220
		if CLIENT then -- 221
			return GAMEMODE:Frighten() -- 222
		end -- 221
	end, -- 220
	ShowSpare2 = function() -- 223
		if CLIENT then -- 224
			return GAMEMODE:Frighten() -- 225
		end -- 224
	end, -- 223
	PlayerLoadout = function(ply) -- 226
		ply:SetNWInt("evilrp_gasmask", 0) -- 227
		ply:Give("evilrp_melee/hands/boneclaws") -- 228
		return true -- 229
	end, -- 226
	HandleRagdoll = function(rag, ply) -- 230
		return rag:SetNWInt("decomp_stage", DSTAGE_BONES) -- 231
	end -- 230
}) -- 165
TEAM_PRIVATE = DarkRP.createJob("Private", { -- 234
	color = Color(20, 150, 20), -- 234
	model = "models/vel/evilwar/royalist.mdl", -- 235
	description = "A new recruit that hasn't gone through training yet.", -- 236
	command = "proletariat", -- 237
	salary = 1, -- 238
	max = 0, -- 239
	cost = 0, -- 240
	hasLicense = true, -- 241
	candemote = false, -- 242
	use_machines = true, -- 243
	category = "Royalists", -- 244
	speech_sounds = (function() -- 245
		local _accum_0 = { } -- 245
		local _len_0 = 1 -- 245
		for i = 1, 3 do -- 245
			_accum_0[_len_0] = "placenta/speech/prole" .. tostring(i) .. ".wav" -- 245
			_len_0 = _len_0 + 1 -- 245
		end -- 245
		return _accum_0 -- 245
	end)(), -- 245
	hurt_sounds = (function() -- 246
		local _accum_0 = { } -- 246
		local _len_0 = 1 -- 246
		for i = 1, 5 do -- 246
			_accum_0[_len_0] = "placenta/pain/prole" .. tostring(i) .. ".wav" -- 246
			_len_0 = _len_0 + 1 -- 246
		end -- 246
		return _accum_0 -- 246
	end)(), -- 246
	become_sounds = (function() -- 247
		local _accum_0 = { } -- 247
		local _len_0 = 1 -- 247
		for i = 1, 3 do -- 247
			_accum_0[_len_0] = "npc/zombie/zombie_alert" .. tostring(i) .. ".wav" -- 247
			_len_0 = _len_0 + 1 -- 247
		end -- 247
		return _accum_0 -- 247
	end)(), -- 247
	death_sounds = (function() -- 248
		local _accum_0 = { } -- 248
		local _len_0 = 1 -- 248
		for i = 1, 3 do -- 248
			_accum_0[_len_0] = "placenta/death/prole" .. tostring(i) .. ".wav" -- 248
			_len_0 = _len_0 + 1 -- 248
		end -- 248
		return _accum_0 -- 248
	end)(), -- 248
	crosstext = function(ply) -- 249
		local text = "Don't panic." -- 250
		do -- 251
			local _exp_0 = lp:Team() -- 251
			if TEAM_PRIVATE == _exp_0 then -- 252
				text = "United in rank?" -- 253
			elseif TEAM_STALKER == _exp_0 then -- 254
				text = "A soldier from Lymphoma." -- 255
			elseif TEAM_SANITAR == _exp_0 then -- 256
				text = "These soldiers need guidance.\nPut the fear in their hearts." -- 257
			elseif TEAM_KORPSMAN == _exp_0 then -- 258
				text = "Smelly and stupid." -- 259
			elseif TEAM_KOMMANDANT == _exp_0 then -- 260
				text = "Is he working hard enough?" -- 261
			elseif TEAM_GHOST == _exp_0 then -- 262
				text = "Sad, but funny." -- 263
			elseif TEAM_BONEHEAD == _exp_0 then -- 264
				text = "SKIN...!" -- 265
			end -- 265
		end -- 265
		return { -- 266
			text = text, -- 266
			font = "Spleen_Label_Small" -- 266
		}, false -- 266
	end, -- 249
	first_names = { -- 267
		"Private", -- 267
		"PVT.", -- 267
		"Recruit" -- 267
	}, -- 267
	GenerateName = function(self, ply) -- 268
		local unit_id = math.random(100, 999) -- 269
		if unit_id < 10 then -- 270
			unit_id = "00" .. tostring(unit_id) -- 271
		elseif unit_id < 100 then -- 272
			unit_id = "0" .. tostring(unit_id) -- 273
		else -- 275
			unit_id = tostring(unit_id) -- 275
		end -- 270
		return self.first_names[math.random(1, #self.first_names)] .. " #" .. unit_id -- 276
	end, -- 268
	special_name = "private parts", -- 277
	special_name_chance = 1000, -- 278
	ShowSpare1 = open_player_menu, -- 279
	ShowSpare2 = open_action_menu, -- 280
	PlayerLoadout = function(ply) -- 281
		ply:ClearOddities() -- 282
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 283
		for slot, val in pairs({ -- 286
			[0] = 0, -- 286
			[1] = 0, -- 288
			[2] = 0, -- 290
			[3] = 0, -- 292
			[4] = 0, -- 294
			[5] = 0 -- 296
		}) do -- 297
			set_bodygroup(ply, slot, val) -- 284
		end -- 284
		return false -- 298
	end -- 281
}) -- 233
TEAM_SANITAR = DarkRP.createJob("Dragoon", { -- 301
	color = Color(25, 170, 0), -- 301
	model = "models/vel/evilwar/royalist.mdl", -- 302
	description = "The right hand of the Kommandant.\nRespected by his peers,\nfeared by his enemies.", -- 303
	weapons = { -- 304
		"evilrp_weapon/pacifier", -- 304
		"simple_hl2_stunstick" -- 304
	}, -- 304
	command = "ss", -- 305
	salary = 1, -- 306
	max = 6, -- 307
	cost = 3, -- 308
	hasLicense = true, -- 309
	use_machines = false, -- 310
	ammo = { -- 312
		pistol = 60 -- 312
	}, -- 311
	category = "Royalists", -- 313
	speech_sounds = (function() -- 314
		local _accum_0 = { } -- 314
		local _len_0 = 1 -- 314
		for i = 1, 6 do -- 314
			_accum_0[_len_0] = "placenta/speech/kapitan" .. tostring(i) .. ".ogg" -- 314
			_len_0 = _len_0 + 1 -- 314
		end -- 314
		return _accum_0 -- 314
	end)(), -- 314
	hurt_sounds = (function() -- 315
		local _accum_0 = { } -- 315
		local _len_0 = 1 -- 315
		for i = 1, 4 do -- 315
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 315
			_len_0 = _len_0 + 1 -- 315
		end -- 315
		return _accum_0 -- 315
	end)(), -- 315
	become_sounds = (function() -- 316
		local _accum_0 = { } -- 316
		local _len_0 = 1 -- 316
		for i = 1, 15 do -- 316
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 316
			_len_0 = _len_0 + 1 -- 316
		end -- 316
		return _accum_0 -- 316
	end)(), -- 316
	crosstext = function(ply) -- 317
		local text = "Don't panic." -- 318
		do -- 319
			local _exp_0 = lp:Team() -- 319
			if TEAM_PRIVATE == _exp_0 then -- 320
				text = "A Lymphomian legend!" -- 321
			elseif TEAM_STALKER == _exp_0 then -- 322
				text = "Fight or run?!" -- 323
			elseif TEAM_SANITAR == _exp_0 then -- 324
				text = "Finally...\nSomeone competent." -- 325
			elseif TEAM_KORPSMAN == _exp_0 then -- 326
				text = "Is that enemy blood?\nNo of course not." -- 327
			elseif TEAM_KOMMANDANT == _exp_0 then -- 328
				text = "A tentacle of mine." -- 329
			elseif TEAM_GHOST == _exp_0 then -- 330
				text = "Evil, stupid,\n maybe both." -- 331
			elseif TEAM_BONEHEAD == _exp_0 then -- 332
				text = "DANGER." -- 333
			end -- 333
		end -- 333
		return { -- 334
			text = text, -- 334
			font = "Spleen_Label_Small" -- 334
		}, true -- 334
	end, -- 317
	first_names = { -- 335
		"Subjugator", -- 335
		"Dragoner", -- 335
		"Persecuter", -- 335
		"Draconarius", -- 335
		"Volontaire" -- 335
	}, -- 335
	last_names = { -- 336
		"of Die Augen", -- 336
		"of Knochen", -- 336
		"of Sehne", -- 336
		"of Knorpel", -- 336
		"of Bauchspeicheldrüse" -- 336
	}, -- 336
	arms_model = "models/weapons/c_arms_refugee.mdl", -- 337
	ShowSpare1 = open_player_menu, -- 338
	ShowSpare2 = open_action_menu, -- 339
	bar_names = { -- 341
		health = "resolve" -- 341
	}, -- 340
	PlayerLoadout = function(ply) -- 342
		ply:ClearOddities() -- 343
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 344
		for slot, val in pairs({ -- 347
			[0] = 1, -- 347
			[1] = 1, -- 349
			[2] = 1, -- 351
			[3] = 2, -- 353
			[4] = 3, -- 355
			[5] = 0 -- 357
		}) do -- 358
			set_bodygroup(ply, slot, val) -- 345
		end -- 345
		return false -- 359
	end -- 342
}) -- 300
TEAM_DEALER = DarkRP.createJob("Quartermaster", { -- 362
	color = Color(255, 140, 0), -- 362
	model = { -- 363
		"models/liver_failure/liverish/liverish.mdl", -- 363
		"models/liver_failure/kidneystani/kidneystani.mdl", -- 364
		"models/liver_failure/arrythmian/arrythmian.mdl" -- 365
	}, -- 363
	description = "The left hand of the Kommandant.\nManage the goods and keep your men armed.", -- 366
	weapons = { }, -- 367
	command = "dealer", -- 368
	salary = 1, -- 369
	max = 1, -- 370
	cost = 3, -- 371
	hasLicense = false, -- 372
	use_machines = false, -- 373
	category = "Royalists", -- 374
	speech_sounds = (function() -- 375
		local _accum_0 = { } -- 375
		local _len_0 = 1 -- 375
		for i = 1, 3 do -- 375
			_accum_0[_len_0] = "placenta/speech/dealer" .. tostring(i) .. ".wav" -- 375
			_len_0 = _len_0 + 1 -- 375
		end -- 375
		return _accum_0 -- 375
	end)(), -- 375
	first_names = { -- 376
		"Kanan", -- 376
		"Merce", -- 376
		"Ameel", -- 376
		"Otis", -- 376
		"Cedric", -- 376
		"Edwin", -- 376
		"Floy", -- 376
		"Benjamin", -- 376
		"Fortune", -- 376
		"William", -- 376
		"Thomas", -- 376
		"Dean", -- 376
		"Aurum", -- 376
		"Klep" -- 376
	}, -- 376
	last_names = { -- 377
		"Chapman", -- 377
		"Merchant", -- 377
		"Cash", -- 377
		"Keeper", -- 377
		"Bones", -- 377
		"Ryker", -- 377
		"Plutarch", -- 377
		"Nasir", -- 377
		"Greenback", -- 377
		"Grocer", -- 377
		"Flanders", -- 377
		"Hooper", -- 377
		"Watto", -- 377
		"Loman", -- 377
		"Stehlen", -- 377
		"Reichmann", -- 377
		"Kaufmann" -- 377
	}, -- 377
	special_name = "Unfortunate Shopkeep", -- 378
	special_name_chance = 1000, -- 379
	ShowSpare1 = open_player_menu, -- 380
	ShowSpare2 = open_action_menu, -- 381
	bar_names = { -- 383
		health = "insurance" -- 383
	}, -- 382
	PlayerLoadout = function(ply) -- 384
		ply:ClearOddities() -- 385
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 386
		for slot, val in pairs({ -- 389
			[0] = 0, -- 389
			[1] = 0, -- 391
			[2] = { -- 393
				3, -- 393
				5, -- 393
				16 -- 393
			}, -- 393
			[3] = 22, -- 395
			[4] = 0, -- 397
			[5] = 0, -- 399
			[6] = 1, -- 401
			[7] = 0, -- 403
			[8] = { -- 405
				0, -- 405
				1, -- 405
				2, -- 405
				3, -- 405
				4, -- 405
				5 -- 405
			}, -- 405
			[9] = 0 -- 407
		}) do -- 408
			set_bodygroup(ply, slot, val) -- 387
		end -- 387
		local skins = { -- 409
			2, -- 409
			4, -- 409
			5, -- 409
			6, -- 409
			7, -- 409
			8, -- 409
			9, -- 409
			10, -- 409
			11, -- 409
			12, -- 409
			13, -- 409
			14, -- 409
			15 -- 409
		} -- 409
		ply:SetSkin(skins[math.random(1, #skins)]) -- 410
		return false -- 411
	end -- 384
}) -- 361
TEAM_KORPSMAN = DarkRP.createJob("Sanitäter", { -- 414
	color = Color(79, 150, 150), -- 414
	model = "models/vel/evilwar/royalist.mdl", -- 415
	description = "You keep people alive in this terrible place.\nFill the blood and empty the rust.", -- 416
	weapons = { -- 417
		"evilrp/medkit" -- 417
	}, -- 417
	command = "medic", -- 418
	salary = 1, -- 419
	max = 2, -- 420
	cost = 2, -- 421
	hasLicense = false, -- 422
	medic = true, -- 423
	use_machines = false, -- 424
	category = "Royalists", -- 425
	speech_sounds = (function() -- 426
		local _accum_0 = { } -- 426
		local _len_0 = 1 -- 426
		for i = 1, 4 do -- 426
			_accum_0[_len_0] = "placenta/speech/korps" .. tostring(i) .. ".wav" -- 426
			_len_0 = _len_0 + 1 -- 426
		end -- 426
		return _accum_0 -- 426
	end)(), -- 426
	hurt_sounds = (function() -- 427
		local _accum_0 = { } -- 427
		local _len_0 = 1 -- 427
		for i = 1, 4 do -- 427
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 427
			_len_0 = _len_0 + 1 -- 427
		end -- 427
		return _accum_0 -- 427
	end)(), -- 427
	become_sounds = { -- 428
		"items/suitchargeok1.wav" -- 428
	}, -- 428
	crosstext = function(ply) -- 429
		local text = "Don't panic." -- 430
		do -- 431
			local _exp_0 = lp:Team() -- 431
			if TEAM_PRIVATE == _exp_0 then -- 432
				text = "I forgot what\nto call these guys." -- 433
			elseif TEAM_STALKER == _exp_0 then -- 434
				text = "A walking blood bag." -- 435
			elseif TEAM_SANITAR == _exp_0 then -- 436
				text = "Better remember\nwho lets them live." -- 437
			elseif TEAM_KORPSMAN == _exp_0 then -- 438
				text = "Something to\nbe happy about." -- 439
			elseif TEAM_KOMMANDANT == _exp_0 then -- 440
				text = "What a strange,\nselfless thing." -- 441
			elseif TEAM_GHOST == _exp_0 then -- 442
				text = "A respectable mortal." -- 443
			elseif TEAM_BONEHEAD == _exp_0 then -- 444
				text = "CONFUSING." -- 445
			end -- 445
		end -- 445
		return { -- 446
			text = text, -- 446
			font = "Spleen_Label_Small" -- 446
		}, true -- 446
	end, -- 429
	first_names = { -- 447
		"Dissector", -- 447
		"Retractor", -- 447
		"Suture", -- 447
		"Femur", -- 447
		"Cystic", -- 447
		"Rasp", -- 447
		"Ferrum", -- 447
		"Fascia", -- 447
		"Marrow", -- 447
		"Lienis", -- 447
		"Aorta", -- 447
		"Tunica", -- 447
		"Maxilla", -- 447
		"Sacrum", -- 447
		"Leach" -- 447
	}, -- 447
	last_names = { -- 448
		"Forceps", -- 448
		"Scalpel", -- 448
		"Curette", -- 448
		"Rongeur", -- 448
		"Trocar", -- 448
		"Babcock", -- 448
		"Duval", -- 448
		"Hemostat", -- 448
		"Ossis", -- 448
		"Caro", -- 448
		"Cadaver", -- 448
		"Sanguis", -- 448
		"Bilis", -- 448
		"Viscera", -- 448
		"Jugular", -- 448
		"Clavius" -- 448
	}, -- 448
	special_name = "Corpseman", -- 449
	special_name_chance = 1000, -- 450
	ShowSpare1 = open_player_menu, -- 451
	ShowSpare2 = open_action_menu, -- 452
	bar_names = { -- 454
		health = "Bio-reserves" -- 454
	}, -- 453
	PlayerLoadout = function(ply) -- 455
		ply:ClearOddities() -- 456
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 457
		ply:SetSkin(4) -- 458
		for slot, val in pairs({ -- 461
			[0] = 0, -- 461
			[1] = 0, -- 463
			[2] = 2, -- 465
			[3] = 3, -- 467
			[4] = 1, -- 469
			[5] = 0 -- 471
		}) do -- 472
			set_bodygroup(ply, slot, val) -- 459
		end -- 459
		return false -- 473
	end -- 455
}) -- 413
TEAM_KOMMANDANT = DarkRP.createJob("Kommandant", { -- 476
	color = Color(150, 20, 20), -- 476
	model = "models/vel/evilwar/royalist.mdl", -- 477
	description = "Rule with an iron fist.", -- 478
	command = "kommandant", -- 479
	salary = 1, -- 480
	weapons = { -- 481
		"evilrp_weapon/novoluger" -- 481
	}, -- 481
	max = 1, -- 482
	cost = 5, -- 483
	weapons = { }, -- 484
	hasLicense = true, -- 485
	mayor = true, -- 486
	use_machines = false, -- 487
	category = "Royalists", -- 488
	speech_sounds = (function() -- 489
		local _accum_0 = { } -- 489
		local _len_0 = 1 -- 489
		for i = 1, 6 do -- 489
			_accum_0[_len_0] = "placenta/speech/kaiser" .. tostring(i) .. ".wav" -- 489
			_len_0 = _len_0 + 1 -- 489
		end -- 489
		return _accum_0 -- 489
	end)(), -- 489
	become_sounds = { -- 490
		"kidneydagger/broadcast1.wav" -- 490
	}, -- 490
	crosstext = function(ply) -- 491
		local text = "Don't panic." -- 492
		do -- 493
			local _exp_0 = lp:Team() -- 493
			if TEAM_PRIVATE == _exp_0 then -- 494
				text = "Listen carefully." -- 495
			elseif TEAM_STALKER == _exp_0 then -- 496
				text = "Oh your magesty!" -- 497
			elseif TEAM_SANITAR == _exp_0 then -- 498
				text = "Hail, hail!" -- 499
			elseif TEAM_KORPSMAN == _exp_0 then -- 500
				text = "Is he feeling okay?" -- 501
			elseif TEAM_KOMMANDANT == _exp_0 then -- 502
				text = "Our strength\nshall prevail." -- 503
			elseif TEAM_GHOST == _exp_0 then -- 504
				text = "So full of lies." -- 505
			elseif TEAM_BONEHEAD == _exp_0 then -- 506
				text = "THERE HE IS!!" -- 507
			end -- 507
		end -- 507
		return { -- 508
			text = text, -- 508
			font = "Spleen_Label_Small" -- 508
		}, true -- 508
	end, -- 491
	first_names = ("Kommandant"), -- 509
	special_name = "Kamdonot", -- 510
	special_name_chance = 1000, -- 511
	ShowSpare1 = open_player_menu, -- 512
	ShowSpare2 = open_action_menu, -- 513
	bar_names = { -- 515
		health = "PRIDE" -- 515
	}, -- 514
	PlayerLoadout = function(ply) -- 516
		ply:ClearOddities() -- 517
		local oddities -- 518
		do -- 518
			local _accum_0 = { } -- 518
			local _len_0 = 1 -- 518
			for k, v in pairs(ODDITY.list) do -- 518
				if v ~= ODDITY_ILLITERACY then -- 518
					_accum_0[_len_0] = v -- 518
					_len_0 = _len_0 + 1 -- 518
				end -- 518
			end -- 518
			oddities = _accum_0 -- 518
		end -- 518
		ply:AddOddity(oddities[math.random(#oddities)]) -- 519
		for slot, val in pairs({ -- 522
			[0] = 1, -- 522
			[1] = 2, -- 524
			[2] = 0, -- 526
			[3] = 1, -- 528
			[4] = 2, -- 530
			[5] = 0 -- 532
		}) do -- 533
			set_bodygroup(ply, slot, val) -- 520
		end -- 520
		ply:SetNWInt("evilrp_gasmask", 4) -- 534
		ply:Give("evilrp_weapon/novoluger") -- 535
		return false -- 536
	end -- 516
}) -- 475
GAMEMODE.CivilProtection = { -- 539
	[TEAM_PRIVATE] = true, -- 539
	[TEAM_SANITAR] = true, -- 540
	[TEAM_KOMMANDANT] = true -- 541
} -- 538
GAMEMODE.DefaultTeam = TEAM_GHOST -- 543
