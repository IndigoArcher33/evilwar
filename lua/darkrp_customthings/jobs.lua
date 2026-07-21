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
	speech_sounds = { -- 38
		"ambient/voices/squeal1.wav" -- 38
	}, -- 38
	crosstext = function(ply) -- 39
		local text = "OH SOTLA,\nTHE HORROR." -- 41
		do -- 42
			local _exp_0 = lp:Team() -- 42
			if TEAM_KORPSMAN == _exp_0 then -- 43
				text = "Evil spirits wander!\n<wiggle>Not on my shift." -- 44
			elseif TEAM_GHOST == _exp_0 then -- 45
				text = "We're the same,\nyou and I." -- 46
			end -- 46
		end -- 46
		return { -- 47
			text = text, -- 47
			font = "Spleen_Label_Small" -- 47
		} -- 47
	end, -- 39
	first_names = { -- 48
		"Suffering", -- 48
		"Fear", -- 48
		"Agony", -- 48
		"Malice", -- 48
		"Hatred", -- 48
		"Grief", -- 48
		"Pain", -- 48
		"Despair", -- 48
		"Rage" -- 48
	}, -- 48
	ShowSpare1 = function(ply) -- 51
		if CLIENT then -- 52
			return GAMEMODE:Frighten() -- 53
		end -- 52
	end, -- 51
	ShowSpare2 = function(ply) -- 54
		local nearby = ents.FindInSphere(ply:GetPos(), 16) -- 55
		local found -- 56
		for _index_0 = 1, #nearby do -- 57
			local ent = nearby[_index_0] -- 57
			if ent:GetClass():find("portal/spawn") then -- 58
				found = ent -- 59
				break -- 60
			end -- 58
		end -- 60
		if not (found and IsValid(found)) then -- 61
			if CLIENT then -- 62
				return GAMEMODE:Frighten() -- 63
			else -- 65
				return ply:Notify("<c=200,0,0>There is no purpose in life near me.") -- 65
			end -- 62
		elseif SERVER then -- 66
			return found:Use(ply) -- 67
		end -- 61
	end, -- 54
	PlayerLoadout = function(ply) -- 68
		ply:ClearOddities() -- 70
		ply:SetNWInt("evilrp_gasmask", 0) -- 71
		return true -- 72
	end, -- 68
	ColorMod = function(ply) -- 73
		local abs, cos, sin = math.abs, math.cos, math.sin -- 74
		local ct = CurTime() -- 75
		local tab = { -- 77
			["$pp_colour_addr"] = 0, -- 77
			["$pp_colour_addg"] = 0, -- 78
			["$pp_colour_addb"] = 0, -- 79
			["$pp_colour_brightness"] = 0 + (-0.01 * cos(ct)), -- 80
			["$pp_colour_contrast"] = 0.6 + (abs(sin(ct * 0.166)) * 0.5), -- 81
			["$pp_colour_colour"] = 0, -- 82
			["$pp_colour_mulr"] = 0 + abs(sin(ct * 0.789)), -- 83
			["$pp_colour_mulg"] = 0, -- 84
			["$pp_colour_mulb"] = 0 -- 85
		} -- 76
		return tab -- 86
	end -- 73
}) -- 28
TEAM_STALKER = DarkRP.createJob("Stalker", { -- 89
	color = Color(20, 150, 20), -- 89
	model = "models/liver_failure/wastelander/wastelander.mdl", -- 90
	description = "A soul with no allegiance, destined to plunder the wasteland.", -- 91
	weapons = { -- 92
		"evilrp_weapon/brainpaster", -- 92
		"evilrp_melee/axe" -- 92
	}, -- 92
	category = "Wasteland", -- 93
	command = "stalker", -- 94
	salary = 1, -- 95
	max = 3, -- 96
	cost = 4, -- 97
	hasLicense = false, -- 98
	candemote = false, -- 99
	speech_sounds = (function() -- 100
		local _accum_0 = { } -- 100
		local _len_0 = 1 -- 100
		for i = 1, 9 do -- 100
			_accum_0[_len_0] = "placenta/cultspawn" .. tostring(i) .. ".wav" -- 100
			_len_0 = _len_0 + 1 -- 100
		end -- 100
		return _accum_0 -- 100
	end)(), -- 100
	hurt_sounds = (function() -- 101
		local _accum_0 = { } -- 101
		local _len_0 = 1 -- 101
		for i = 1, 6 do -- 101
			_accum_0[_len_0] = "placenta/pain/cult" .. tostring(i) .. ".wav" -- 101
			_len_0 = _len_0 + 1 -- 101
		end -- 101
		return _accum_0 -- 101
	end)(), -- 101
	become_sounds = (function() -- 102
		local _accum_0 = { } -- 102
		local _len_0 = 1 -- 102
		for i = 1, 3 do -- 102
			_accum_0[_len_0] = "npc/zombie/zombie_alert" .. tostring(i) .. ".wav" -- 102
			_len_0 = _len_0 + 1 -- 102
		end -- 102
		return _accum_0 -- 102
	end)(), -- 102
	death_sounds = (function() -- 103
		local _accum_0 = { } -- 103
		local _len_0 = 1 -- 103
		for i = 1, 4 do -- 103
			_accum_0[_len_0] = "placenta/death/cult" .. tostring(i) .. ".wav" -- 103
			_len_0 = _len_0 + 1 -- 103
		end -- 103
		return _accum_0 -- 103
	end)(), -- 103
	crosstext = function(ply) -- 104
		local text = "Don't panic." -- 105
		do -- 106
			local _exp_0 = lp:Team() -- 106
			if TEAM_PRIVATE == _exp_0 then -- 107
				text = "He doesn't look like me." -- 108
			elseif TEAM_STALKER == _exp_0 then -- 109
				text = "A fellow plunderer." -- 110
			elseif TEAM_SANITAR == _exp_0 then -- 111
				text = "Despicable." -- 112
			elseif TEAM_KORPSMAN == _exp_0 then -- 113
				text = "Why is he here?" -- 114
			elseif TEAM_KOMMANDANT == _exp_0 then -- 115
				text = "He might be of use to me." -- 116
			elseif TEAM_GHOST == _exp_0 then -- 117
				text = "He has a noble pursuit." -- 118
			elseif TEAM_BONEHEAD == _exp_0 then -- 119
				text = "SEEN HIM BEFORE!!" -- 120
			end -- 120
		end -- 120
		return { -- 121
			text = text, -- 121
			font = "Spleen_Label_Small" -- 121
		}, false -- 121
	end, -- 104
	first_names = { -- 122
		"Wasted", -- 122
		"Decrepit", -- 122
		"Rotten" -- 122
	}, -- 122
	last_names = { -- 123
		"Soul", -- 123
		"Plunderer", -- 123
		"Traitor", -- 123
		"Wanderer" -- 123
	}, -- 123
	bar_names = { -- 125
		health = "regret" -- 125
	}, -- 124
	special_name = "Waste", -- 126
	special_name_chance = 1000, -- 127
	ShowSpare1 = open_player_menu, -- 128
	ShowSpare2 = open_action_menu, -- 129
	PlayerLoadout = function(ply) -- 130
		ply:ClearOddities() -- 131
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 132
		for slot, val in pairs({ -- 135
			[0] = 0, -- 135
			[1] = 2, -- 137
			[2] = { -- 139
				2, -- 139
				3, -- 139
				8, -- 139
				6 -- 139
			}, -- 139
			[3] = { -- 141
				19, -- 141
				20 -- 141
			}, -- 141
			[4] = 0, -- 143
			[5] = 0, -- 145
			[6] = { -- 147
				0, -- 147
				1, -- 147
				2, -- 147
				3 -- 147
			}, -- 147
			[7] = 0, -- 149
			[8] = 0, -- 151
			[9] = { -- 153
				0, -- 153
				1 -- 153
			} -- 153
		}) do -- 154
			set_bodygroup(ply, slot, val) -- 133
		end -- 133
		local skins = { -- 155
			4, -- 155
			6, -- 155
			7 -- 155
		} -- 155
		ply:SetSkin(skins[math.random(1, #skins)]) -- 156
		return false -- 157
	end -- 130
}) -- 88
do -- 159
	local _class_0 -- 159
	local _parent_0 = SOUND -- 159
	local _base_0 = { -- 159
		sound = "placenta/bonehead_aggrod4.wav", -- 161
		pitch = { -- 161
			200, -- 161
			250 -- 161
		} -- 159
	} -- 159
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 161
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 159
			_base_0[_key_0] = _val_0 -- 159
		end -- 159
	end -- 161
	if _base_0.__index == nil then -- 159
		_base_0.__index = _base_0 -- 159
	end -- 161
	setmetatable(_base_0, _parent_0.__base) -- 159
	_class_0 = setmetatable({ -- 159
		__init = function(self, ...) -- 159
			return _class_0.__parent.__init(self, ...) -- 159
		end, -- 159
		__base = _base_0, -- 159
		__name = "SpeechBonehead", -- 159
		__parent = _parent_0 -- 159
	}, { -- 159
		__index = function(cls, name) -- 159
			local val = rawget(_base_0, name) -- 159
			if val == nil then -- 159
				local parent = rawget(cls, "__parent") -- 159
				if parent then -- 159
					return parent[name] -- 159
				end -- 159
			else -- 159
				return val -- 159
			end -- 159
		end, -- 159
		__call = function(cls, ...) -- 159
			local _self_0 = setmetatable({ }, _base_0) -- 159
			cls.__init(_self_0, ...) -- 159
			return _self_0 -- 159
		end -- 159
	}) -- 159
	_base_0.__class = _class_0 -- 159
	if _parent_0.__inherited then -- 159
		_parent_0.__inherited(_parent_0, _class_0) -- 159
	end -- 159
	SpeechBonehead = _class_0 -- 159
end -- 161
TEAM_BONEHEAD = DarkRP.createJob("Bonehead", { -- 164
	color = Color(150, 150, 150), -- 164
	model = "models/player/zombie_fast.mdl", -- 165
	description = "evil fucker.", -- 166
	instant_respawn = true, -- 167
	command = "bonehead", -- 168
	salary = 1, -- 169
	max = 0, -- 170
	cost = 1, -- 171
	speech_sounds = "SpeechBonehead", -- 172
	hurt_sounds = (function() -- 173
		local _accum_0 = { } -- 173
		local _len_0 = 1 -- 173
		for i = 1, 2 do -- 173
			_accum_0[_len_0] = "placenta/bonehead_slice" .. tostring(i) .. ".wav" -- 173
			_len_0 = _len_0 + 1 -- 173
		end -- 173
		return _accum_0 -- 173
	end)(), -- 173
	become_sounds = (function() -- 174
		local _accum_0 = { } -- 174
		local _len_0 = 1 -- 174
		for i = 1, 4 do -- 174
			_accum_0[_len_0] = "placenta/bonehead_aggrod" .. tostring(i) .. ".wav" -- 174
			_len_0 = _len_0 + 1 -- 174
		end -- 174
		return _accum_0 -- 174
	end)(), -- 174
	crosstext = function(ply) -- 175
		local text = "Don't panic." -- 176
		do -- 177
			local _exp_0 = lp:Team() -- 177
			if TEAM_PRIVATE == _exp_0 then -- 178
				text = "Oh no! He's real!" -- 179
			elseif TEAM_SANITAR == _exp_0 then -- 180
				text = "Oh boy." -- 181
			elseif TEAM_KORPSMAN == _exp_0 then -- 182
				text = "Oh no! It happened again!" -- 183
			elseif TEAM_KOMMANDANT == _exp_0 then -- 184
				text = "Ha. It happened again." -- 185
			elseif TEAM_GHOST == _exp_0 then -- 186
				text = "Lookin' good." -- 187
			elseif TEAM_BONEHEAD == _exp_0 then -- 188
				text = "THERE'S ANOTHER ONE." -- 189
			end -- 189
		end -- 189
		return { -- 190
			text = text, -- 190
			font = "Spleen_Label_Small" -- 190
		}, false -- 190
	end, -- 175
	first_names = { -- 191
		"Evil" -- 191
	}, -- 191
	last_names = { -- 192
		"Fucker" -- 192
	}, -- 192
	no_needs = true, -- 193
	hint = "You are a truly pissed off skeleton. Go get 'em!", -- 194
	bar_names = { -- 196
		health = "EVIL FUCKER POWER" -- 196
	}, -- 195
	bar_colors = { -- 198
		health = Color(200, 0, 0) -- 198
	}, -- 197
	RenderScreenspaceEffects = function(ply) -- 199
		local ct = CurTime() -- 200
		DrawMotionBlur(0.25, 0.2, 0.3) -- 201
		return DrawSharpen(1 * math.sin(ct), 2 * math.random(0.8, 1.2)) -- 202
	end, -- 199
	ColorMod = function(ply) -- 203
		local abs, cos, sin = math.abs, math.cos, math.sin -- 204
		local ct = CurTime() -- 205
		local tab = { -- 207
			["$pp_colour_addr"] = 0.1, -- 207
			["$pp_colour_addg"] = 0, -- 208
			["$pp_colour_addb"] = 0, -- 209
			["$pp_colour_brightness"] = 0 + (-0.01 * cos(ct)), -- 210
			["$pp_colour_contrast"] = 1.6 + (abs(sin(ct * 0.166)) * 0.5), -- 211
			["$pp_colour_colour"] = 0, -- 212
			["$pp_colour_mulr"] = 0 + abs(sin(ct * 0.789)), -- 213
			["$pp_colour_mulg"] = 0, -- 214
			["$pp_colour_mulb"] = 0 -- 215
		} -- 206
		return tab -- 216
	end, -- 203
	ShowSpare1 = function() -- 217
		if CLIENT then -- 218
			return GAMEMODE:Frighten() -- 219
		end -- 218
	end, -- 217
	ShowSpare2 = function() -- 220
		if CLIENT then -- 221
			return GAMEMODE:Frighten() -- 222
		end -- 221
	end, -- 220
	PlayerLoadout = function(ply) -- 223
		ply:SetNWInt("evilrp_gasmask", 0) -- 224
		ply:Give("evilrp_melee/hands/boneclaws") -- 225
		return true -- 226
	end, -- 223
	HandleRagdoll = function(rag, ply) -- 227
		return rag:SetNWInt("decomp_stage", DSTAGE_BONES) -- 228
	end -- 227
}) -- 163
TEAM_PRIVATE = DarkRP.createJob("Private", { -- 231
	color = Color(20, 150, 20), -- 231
	model = "models/vel/evilwar/royalist.mdl", -- 232
	description = "A new recruit that hasn't gone through training yet.", -- 233
	command = "proletariat", -- 234
	salary = 1, -- 235
	max = 0, -- 236
	cost = 0, -- 237
	hasLicense = true, -- 238
	candemote = false, -- 239
	category = "Royalists", -- 240
	speech_sounds = (function() -- 241
		local _accum_0 = { } -- 241
		local _len_0 = 1 -- 241
		for i = 1, 3 do -- 241
			_accum_0[_len_0] = "placenta/speech/prole" .. tostring(i) .. ".wav" -- 241
			_len_0 = _len_0 + 1 -- 241
		end -- 241
		return _accum_0 -- 241
	end)(), -- 241
	hurt_sounds = (function() -- 242
		local _accum_0 = { } -- 242
		local _len_0 = 1 -- 242
		for i = 1, 5 do -- 242
			_accum_0[_len_0] = "placenta/pain/prole" .. tostring(i) .. ".wav" -- 242
			_len_0 = _len_0 + 1 -- 242
		end -- 242
		return _accum_0 -- 242
	end)(), -- 242
	become_sounds = (function() -- 243
		local _accum_0 = { } -- 243
		local _len_0 = 1 -- 243
		for i = 1, 3 do -- 243
			_accum_0[_len_0] = "npc/zombie/zombie_alert" .. tostring(i) .. ".wav" -- 243
			_len_0 = _len_0 + 1 -- 243
		end -- 243
		return _accum_0 -- 243
	end)(), -- 243
	death_sounds = (function() -- 244
		local _accum_0 = { } -- 244
		local _len_0 = 1 -- 244
		for i = 1, 3 do -- 244
			_accum_0[_len_0] = "placenta/death/prole" .. tostring(i) .. ".wav" -- 244
			_len_0 = _len_0 + 1 -- 244
		end -- 244
		return _accum_0 -- 244
	end)(), -- 244
	crosstext = function(ply) -- 245
		local text = "Don't panic." -- 246
		do -- 247
			local _exp_0 = lp:Team() -- 247
			if TEAM_PRIVATE == _exp_0 then -- 248
				text = "United in rank?" -- 249
			elseif TEAM_STALKER == _exp_0 then -- 250
				text = "A soldier from Lymphoma." -- 251
			elseif TEAM_SANITAR == _exp_0 then -- 252
				text = "These soldiers need guidance.\nPut the fear in their hearts." -- 253
			elseif TEAM_KORPSMAN == _exp_0 then -- 254
				text = "Smelly and stupid." -- 255
			elseif TEAM_KOMMANDANT == _exp_0 then -- 256
				text = "Is he working hard enough?" -- 257
			elseif TEAM_GHOST == _exp_0 then -- 258
				text = "Sad, but funny." -- 259
			elseif TEAM_BONEHEAD == _exp_0 then -- 260
				text = "SKIN...!" -- 261
			end -- 261
		end -- 261
		return { -- 262
			text = text, -- 262
			font = "Spleen_Label_Small" -- 262
		}, false -- 262
	end, -- 245
	first_names = { -- 263
		"Private", -- 263
		"PVT.", -- 263
		"Recruit" -- 263
	}, -- 263
	GenerateName = function(self, ply) -- 264
		local unit_id = math.random(100, 999) -- 265
		if unit_id < 10 then -- 266
			unit_id = "00" .. tostring(unit_id) -- 267
		elseif unit_id < 100 then -- 268
			unit_id = "0" .. tostring(unit_id) -- 269
		else -- 271
			unit_id = tostring(unit_id) -- 271
		end -- 266
		return self.first_names[math.random(1, #self.first_names)] .. " #" .. unit_id -- 272
	end, -- 264
	special_name = "private parts", -- 273
	special_name_chance = 1000, -- 274
	ShowSpare1 = open_player_menu, -- 275
	ShowSpare2 = open_action_menu, -- 276
	PlayerLoadout = function(ply) -- 277
		ply:ClearOddities() -- 278
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 279
		for slot, val in pairs({ -- 282
			[0] = 0, -- 282
			[1] = 0, -- 284
			[2] = 0, -- 286
			[3] = 0, -- 288
			[4] = 0, -- 290
			[5] = 0 -- 292
		}) do -- 293
			set_bodygroup(ply, slot, val) -- 280
		end -- 280
		return false -- 294
	end -- 277
}) -- 230
TEAM_SANITAR = DarkRP.createJob("Dragoon", { -- 297
	color = Color(25, 170, 0), -- 297
	model = "models/vel/evilwar/royalist.mdl", -- 298
	description = "The right hand of the Kommandant.\nRespected by his peers,\nfeared by his enemies.", -- 299
	weapons = { -- 300
		"evilrp_weapon/pacifier", -- 300
		"simple_hl2_stunstick" -- 300
	}, -- 300
	command = "ss", -- 301
	salary = 1, -- 302
	max = 6, -- 303
	cost = 3, -- 304
	hasLicense = true, -- 305
	ammo = { -- 307
		pistol = 60 -- 307
	}, -- 306
	category = "Royalists", -- 308
	speech_sounds = (function() -- 309
		local _accum_0 = { } -- 309
		local _len_0 = 1 -- 309
		for i = 1, 15 do -- 309
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 309
			_len_0 = _len_0 + 1 -- 309
		end -- 309
		return _accum_0 -- 309
	end)(), -- 309
	hurt_sounds = (function() -- 310
		local _accum_0 = { } -- 310
		local _len_0 = 1 -- 310
		for i = 1, 4 do -- 310
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 310
			_len_0 = _len_0 + 1 -- 310
		end -- 310
		return _accum_0 -- 310
	end)(), -- 310
	become_sounds = (function() -- 311
		local _accum_0 = { } -- 311
		local _len_0 = 1 -- 311
		for i = 1, 15 do -- 311
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 311
			_len_0 = _len_0 + 1 -- 311
		end -- 311
		return _accum_0 -- 311
	end)(), -- 311
	crosstext = function(ply) -- 312
		local text = "Don't panic." -- 313
		do -- 314
			local _exp_0 = lp:Team() -- 314
			if TEAM_PRIVATE == _exp_0 then -- 315
				text = "A Lymphomian legend!" -- 316
			elseif TEAM_STALKER == _exp_0 then -- 317
				text = "Fight or run?!" -- 318
			elseif TEAM_SANITAR == _exp_0 then -- 319
				text = "Finally...\nSomeone competent." -- 320
			elseif TEAM_KORPSMAN == _exp_0 then -- 321
				text = "Is that enemy blood?\nNo of course not." -- 322
			elseif TEAM_KOMMANDANT == _exp_0 then -- 323
				text = "A tentacle of mine." -- 324
			elseif TEAM_GHOST == _exp_0 then -- 325
				text = "Evil, stupid,\n maybe both." -- 326
			elseif TEAM_BONEHEAD == _exp_0 then -- 327
				text = "DANGER." -- 328
			end -- 328
		end -- 328
		return { -- 329
			text = text, -- 329
			font = "Spleen_Label_Small" -- 329
		}, true -- 329
	end, -- 312
	first_names = { -- 330
		"Subjugator", -- 330
		"Dragoner", -- 330
		"Persecuter", -- 330
		"Draconarius", -- 330
		"Volontaire" -- 330
	}, -- 330
	last_names = { -- 331
		"of Die Augen", -- 331
		"of Knochen", -- 331
		"of Sehne", -- 331
		"of Knorpel", -- 331
		"of Bauchspeicheldrüse" -- 331
	}, -- 331
	arms_model = "models/weapons/c_arms_refugee.mdl", -- 332
	ShowSpare1 = open_player_menu, -- 333
	ShowSpare2 = open_action_menu, -- 334
	bar_names = { -- 336
		health = "resolve" -- 336
	}, -- 335
	PlayerLoadout = function(ply) -- 337
		ply:ClearOddities() -- 338
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 339
		for slot, val in pairs({ -- 342
			[0] = 1, -- 342
			[1] = 1, -- 344
			[2] = 1, -- 346
			[3] = 2, -- 348
			[4] = 3, -- 350
			[5] = 0 -- 352
		}) do -- 353
			set_bodygroup(ply, slot, val) -- 340
		end -- 340
		return false -- 354
	end -- 337
}) -- 296
TEAM_DEALER = DarkRP.createJob("Quartermaster", { -- 357
	color = Color(255, 140, 0), -- 357
	model = { -- 358
		"models/liver_failure/liverish/liverish.mdl", -- 358
		"models/liver_failure/kidneystani/kidneystani.mdl", -- 359
		"models/liver_failure/arrythmian/arrythmian.mdl" -- 360
	}, -- 358
	description = "The left hand of the Kommandant.\nManage the goods and keep your men armed.", -- 361
	weapons = { }, -- 362
	command = "dealer", -- 363
	salary = 1, -- 364
	max = 1, -- 365
	cost = 3, -- 366
	hasLicense = false, -- 367
	category = "Royalists", -- 368
	speech_sounds = (function() -- 369
		local _accum_0 = { } -- 369
		local _len_0 = 1 -- 369
		for i = 1, 3 do -- 369
			_accum_0[_len_0] = "placenta/speech/dealer" .. tostring(i) .. ".wav" -- 369
			_len_0 = _len_0 + 1 -- 369
		end -- 369
		return _accum_0 -- 369
	end)(), -- 369
	first_names = { -- 370
		"Kanan", -- 370
		"Merce", -- 370
		"Ameel", -- 370
		"Otis", -- 370
		"Cedric", -- 370
		"Edwin", -- 370
		"Floy", -- 370
		"Benjamin", -- 370
		"Fortune", -- 370
		"William", -- 370
		"Thomas", -- 370
		"Dean", -- 370
		"Aurum", -- 370
		"Klep" -- 370
	}, -- 370
	last_names = { -- 371
		"Chapman", -- 371
		"Merchant", -- 371
		"Cash", -- 371
		"Keeper", -- 371
		"Bones", -- 371
		"Ryker", -- 371
		"Plutarch", -- 371
		"Nasir", -- 371
		"Greenback", -- 371
		"Grocer", -- 371
		"Flanders", -- 371
		"Hooper", -- 371
		"Watto", -- 371
		"Loman", -- 371
		"Stehlen", -- 371
		"Reichmann", -- 371
		"Kaufmann" -- 371
	}, -- 371
	special_name = "Unfortunate Shopkeep", -- 372
	special_name_chance = 1000, -- 373
	ShowSpare1 = open_player_menu, -- 374
	ShowSpare2 = open_action_menu, -- 375
	bar_names = { -- 377
		health = "insurance" -- 377
	}, -- 376
	PlayerLoadout = function(ply) -- 378
		ply:ClearOddities() -- 379
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 380
		for slot, val in pairs({ -- 383
			[0] = 0, -- 383
			[1] = 0, -- 385
			[2] = { -- 387
				3, -- 387
				5, -- 387
				16 -- 387
			}, -- 387
			[3] = 22, -- 389
			[4] = 0, -- 391
			[5] = 0, -- 393
			[6] = 1, -- 395
			[7] = 0, -- 397
			[8] = { -- 399
				0, -- 399
				1, -- 399
				2, -- 399
				3, -- 399
				4, -- 399
				5 -- 399
			}, -- 399
			[9] = 0 -- 401
		}) do -- 402
			set_bodygroup(ply, slot, val) -- 381
		end -- 381
		local skins = { -- 403
			2, -- 403
			4, -- 403
			5, -- 403
			6, -- 403
			7, -- 403
			8, -- 403
			9, -- 403
			10, -- 403
			11, -- 403
			12, -- 403
			13, -- 403
			14, -- 403
			15 -- 403
		} -- 403
		ply:SetSkin(skins[math.random(1, #skins)]) -- 404
		return false -- 405
	end -- 378
}) -- 356
TEAM_KORPSMAN = DarkRP.createJob("Sanitäter", { -- 408
	color = Color(79, 150, 150), -- 408
	model = "models/vel/evilwar/royalist.mdl", -- 409
	description = "You keep people alive in this terrible place.\nFill the blood and empty the rust.", -- 410
	weapons = { -- 411
		"evilrp/medkit" -- 411
	}, -- 411
	command = "medic", -- 412
	salary = 1, -- 413
	max = 2, -- 414
	cost = 2, -- 415
	hasLicense = false, -- 416
	medic = true, -- 417
	category = "Royalists", -- 418
	speech_sounds = (function() -- 419
		local _accum_0 = { } -- 419
		local _len_0 = 1 -- 419
		for i = 1, 4 do -- 419
			_accum_0[_len_0] = "placenta/speech/korps" .. tostring(i) .. ".wav" -- 419
			_len_0 = _len_0 + 1 -- 419
		end -- 419
		return _accum_0 -- 419
	end)(), -- 419
	hurt_sounds = (function() -- 420
		local _accum_0 = { } -- 420
		local _len_0 = 1 -- 420
		for i = 1, 4 do -- 420
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 420
			_len_0 = _len_0 + 1 -- 420
		end -- 420
		return _accum_0 -- 420
	end)(), -- 420
	become_sounds = { -- 421
		"items/suitchargeok1.wav" -- 421
	}, -- 421
	crosstext = function(ply) -- 422
		local text = "Don't panic." -- 423
		do -- 424
			local _exp_0 = lp:Team() -- 424
			if TEAM_PRIVATE == _exp_0 then -- 425
				text = "I forgot what\nto call these guys." -- 426
			elseif TEAM_STALKER == _exp_0 then -- 427
				text = "A walking blood bag." -- 428
			elseif TEAM_SANITAR == _exp_0 then -- 429
				text = "Better remember\nwho lets them live." -- 430
			elseif TEAM_KORPSMAN == _exp_0 then -- 431
				text = "Something to\nbe happy about." -- 432
			elseif TEAM_KOMMANDANT == _exp_0 then -- 433
				text = "What a strange,\nselfless thing." -- 434
			elseif TEAM_GHOST == _exp_0 then -- 435
				text = "A respectable mortal." -- 436
			elseif TEAM_BONEHEAD == _exp_0 then -- 437
				text = "CONFUSING." -- 438
			end -- 438
		end -- 438
		return { -- 439
			text = text, -- 439
			font = "Spleen_Label_Small" -- 439
		}, true -- 439
	end, -- 422
	first_names = { -- 440
		"Dissector", -- 440
		"Retractor", -- 440
		"Suture", -- 440
		"Femur", -- 440
		"Cystic", -- 440
		"Rasp", -- 440
		"Ferrum", -- 440
		"Fascia", -- 440
		"Marrow", -- 440
		"Lienis", -- 440
		"Aorta", -- 440
		"Tunica", -- 440
		"Maxilla", -- 440
		"Sacrum", -- 440
		"Leach" -- 440
	}, -- 440
	last_names = { -- 441
		"Forceps", -- 441
		"Scalpel", -- 441
		"Curette", -- 441
		"Rongeur", -- 441
		"Trocar", -- 441
		"Babcock", -- 441
		"Duval", -- 441
		"Hemostat", -- 441
		"Ossis", -- 441
		"Caro", -- 441
		"Cadaver", -- 441
		"Sanguis", -- 441
		"Bilis", -- 441
		"Viscera", -- 441
		"Jugular", -- 441
		"Clavius" -- 441
	}, -- 441
	special_name = "Corpseman", -- 442
	special_name_chance = 1000, -- 443
	ShowSpare1 = open_player_menu, -- 444
	ShowSpare2 = open_action_menu, -- 445
	bar_names = { -- 447
		health = "Bio-reserves" -- 447
	}, -- 446
	PlayerLoadout = function(ply) -- 448
		ply:ClearOddities() -- 449
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 450
		ply:SetSkin(4) -- 451
		for slot, val in pairs({ -- 454
			[0] = 0, -- 454
			[1] = 0, -- 456
			[2] = 2, -- 458
			[3] = 3, -- 460
			[4] = 1, -- 462
			[5] = 0 -- 464
		}) do -- 465
			set_bodygroup(ply, slot, val) -- 452
		end -- 452
		return false -- 466
	end -- 448
}) -- 407
TEAM_KOMMANDANT = DarkRP.createJob("Kommandant", { -- 469
	color = Color(150, 20, 20), -- 469
	model = "models/vel/evilwar/royalist.mdl", -- 470
	description = "Rule with an iron fist.", -- 471
	command = "kommandant", -- 472
	salary = 1, -- 473
	weapons = { -- 474
		"evilrp_weapon/novoluger" -- 474
	}, -- 474
	max = 1, -- 475
	cost = 5, -- 476
	weapons = { }, -- 477
	hasLicense = true, -- 478
	mayor = true, -- 479
	category = "Royalists", -- 480
	speech_sounds = (function() -- 481
		local _accum_0 = { } -- 481
		local _len_0 = 1 -- 481
		for i = 1, 15 do -- 481
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 481
			_len_0 = _len_0 + 1 -- 481
		end -- 481
		return _accum_0 -- 481
	end)(), -- 481
	become_sounds = { -- 482
		"kidneydagger/broadcast1.wav" -- 482
	}, -- 482
	crosstext = function(ply) -- 483
		local text = "Don't panic." -- 484
		do -- 485
			local _exp_0 = lp:Team() -- 485
			if TEAM_PRIVATE == _exp_0 then -- 486
				text = "Listen carefully." -- 487
			elseif TEAM_STALKER == _exp_0 then -- 488
				text = "Oh your magesty!" -- 489
			elseif TEAM_SANITAR == _exp_0 then -- 490
				text = "Hail, hail!" -- 491
			elseif TEAM_KORPSMAN == _exp_0 then -- 492
				text = "Is he feeling okay?" -- 493
			elseif TEAM_KOMMANDANT == _exp_0 then -- 494
				text = "Our strength\nshall prevail." -- 495
			elseif TEAM_GHOST == _exp_0 then -- 496
				text = "So full of lies." -- 497
			elseif TEAM_BONEHEAD == _exp_0 then -- 498
				text = "THERE HE IS!!" -- 499
			end -- 499
		end -- 499
		return { -- 500
			text = text, -- 500
			font = "Spleen_Label_Small" -- 500
		}, true -- 500
	end, -- 483
	first_names = ("Kommandant"), -- 501
	special_name = "Kamdonot", -- 502
	special_name_chance = 1000, -- 503
	ShowSpare1 = open_player_menu, -- 504
	ShowSpare2 = open_action_menu, -- 505
	bar_names = { -- 507
		health = "PRIDE" -- 507
	}, -- 506
	PlayerLoadout = function(ply) -- 508
		ply:ClearOddities() -- 509
		local oddities -- 510
		do -- 510
			local _accum_0 = { } -- 510
			local _len_0 = 1 -- 510
			for k, v in pairs(ODDITY.list) do -- 510
				if v ~= ODDITY_ILLITERACY then -- 510
					_accum_0[_len_0] = v -- 510
					_len_0 = _len_0 + 1 -- 510
				end -- 510
			end -- 510
			oddities = _accum_0 -- 510
		end -- 510
		ply:AddOddity(oddities[math.random(#oddities)]) -- 511
		for slot, val in pairs({ -- 514
			[0] = 1, -- 514
			[1] = 2, -- 516
			[2] = 0, -- 518
			[3] = 1, -- 520
			[4] = 2, -- 522
			[5] = 0 -- 524
		}) do -- 525
			set_bodygroup(ply, slot, val) -- 512
		end -- 512
		ply:SetNWInt("evilrp_gasmask", 4) -- 526
		ply:Give("evilrp_weapon/novoluger") -- 527
		return false -- 528
	end -- 508
}) -- 468
GAMEMODE.CivilProtection = { -- 531
	[TEAM_PRIVATE] = true, -- 531
	[TEAM_SANITAR] = true, -- 532
	[TEAM_KOMMANDANT] = true -- 533
} -- 530
GAMEMODE.DefaultTeam = TEAM_GHOST -- 535
