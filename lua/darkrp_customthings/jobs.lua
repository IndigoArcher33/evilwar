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
			end -- 43
		end -- 43
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
		end -- 58
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
			elseif TEAM_KOMMANDANT == _exp_0 then -- 119
				text = "He might be of use to me." -- 120
			elseif TEAM_GHOST == _exp_0 then -- 121
				text = "He has a noble pursuit." -- 122
			elseif TEAM_BONEHEAD == _exp_0 then -- 123
				text = "SEEN HIM BEFORE!!" -- 124
			end -- 108
		end -- 108
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
		for slot, val in pairs({ -- 138
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
		}) do -- 137
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
		sound = "placenta/bonehead_aggrod4.wav", -- 164
		pitch = { -- 165
			200, -- 165
			250 -- 165
		} -- 165
	} -- 163
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 163
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 163
			_base_0[_key_0] = _val_0 -- 163
		end -- 163
	end -- 163
	if _base_0.__index == nil then -- 163
		_base_0.__index = _base_0 -- 163
	end -- 163
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
end -- 163
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
			elseif TEAM_KOMMANDANT == _exp_0 then -- 191
				text = "Ha. It happened again." -- 192
			elseif TEAM_GHOST == _exp_0 then -- 193
				text = "Lookin' good." -- 194
			elseif TEAM_BONEHEAD == _exp_0 then -- 195
				text = "THERE'S ANOTHER ONE." -- 196
			end -- 182
		end -- 182
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
			elseif TEAM_KOMMANDANT == _exp_0 then -- 266
				text = "Is he working hard enough?" -- 267
			elseif TEAM_GHOST == _exp_0 then -- 268
				text = "Sad, but funny." -- 269
			elseif TEAM_BONEHEAD == _exp_0 then -- 270
				text = "SKIN...!" -- 271
			end -- 255
		end -- 255
		return { -- 272
			text = text, -- 272
			font = "Spleen_Label_Small" -- 272
		}, false -- 272
	end, -- 253
	first_names = { -- 273
		"Private", -- 273
		"PVT.", -- 273
		"Recruit" -- 273
	}, -- 273
	GenerateName = function(self, ply) -- 274
		local unit_id = math.random(100, 999) -- 275
		if unit_id < 10 then -- 276
			unit_id = "00" .. tostring(unit_id) -- 277
		elseif unit_id < 100 then -- 278
			unit_id = "0" .. tostring(unit_id) -- 279
		else -- 281
			unit_id = tostring(unit_id) -- 281
		end -- 276
		return self.first_names[math.random(1, #self.first_names)] .. " #" .. unit_id -- 282
	end, -- 274
	special_name = "private parts", -- 283
	special_name_chance = 1000, -- 284
	ShowSpare1 = open_player_menu, -- 285
	ShowSpare2 = open_action_menu, -- 286
	PlayerLoadout = function(ply) -- 287
		ply:ClearOddities() -- 288
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 289
		for slot, val in pairs({ -- 291
			[0] = 0, -- 292
			[1] = 0, -- 294
			[2] = 0, -- 296
			[3] = 0, -- 298
			[4] = 0, -- 300
			[5] = 0 -- 302
		}) do -- 290
			set_bodygroup(ply, slot, val) -- 290
		end -- 290
		return false -- 304
	end -- 287
}) -- 237
TEAM_SANITAR = DarkRP.createJob("Dragoon", { -- 307
	color = Color(25, 170, 0), -- 307
	model = "models/vel/evilwar/royalist.mdl", -- 308
	description = "The right hand of the Kommandant.\nRespected by his peers,\nfeared by his enemies.", -- 309
	weapons = { -- 310
		"evilrp_weapon/hope", -- 310
		"evilrp_melee/sabre" -- 310
	}, -- 310
	command = "ss", -- 311
	salary = 1, -- 312
	max = 6, -- 313
	cost = 3, -- 314
	hasLicense = true, -- 315
	use_machines = false, -- 316
	ammo = { -- 318
		pistol = 60 -- 318
	}, -- 317
	category = "Royalists", -- 319
	speech_sounds = (function() -- 320
		local _accum_0 = { } -- 320
		local _len_0 = 1 -- 320
		for i = 1, 15 do -- 320
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 320
			_len_0 = _len_0 + 1 -- 320
		end -- 320
		return _accum_0 -- 320
	end)(), -- 320
	hurt_sounds = (function() -- 321
		local _accum_0 = { } -- 321
		local _len_0 = 1 -- 321
		for i = 1, 4 do -- 321
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 321
			_len_0 = _len_0 + 1 -- 321
		end -- 321
		return _accum_0 -- 321
	end)(), -- 321
	become_sounds = (function() -- 322
		local _accum_0 = { } -- 322
		local _len_0 = 1 -- 322
		for i = 1, 15 do -- 322
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 322
			_len_0 = _len_0 + 1 -- 322
		end -- 322
		return _accum_0 -- 322
	end)(), -- 322
	crosstext = function(ply) -- 323
		local text = "Don't panic." -- 324
		do -- 325
			local _exp_0 = lp:Team() -- 325
			if TEAM_PRIVATE == _exp_0 then -- 326
				text = "A Lymphomian legend!" -- 327
			elseif TEAM_STALKER == _exp_0 then -- 328
				text = "Fight or run?!" -- 329
			elseif TEAM_SANITAR == _exp_0 then -- 330
				text = "Finally...\nSomeone competent." -- 331
			elseif TEAM_KORPSMAN == _exp_0 then -- 332
				text = "Is that enemy blood?\nNo of course not." -- 333
			elseif TEAM_DEALER == _exp_0 then -- 334
				text = "A follower of mine." -- 335
			elseif TEAM_KOMMANDANT == _exp_0 then -- 336
				text = "A tentacle of mine." -- 337
			elseif TEAM_GHOST == _exp_0 then -- 338
				text = "Evil, stupid,\n maybe both." -- 339
			elseif TEAM_BONEHEAD == _exp_0 then -- 340
				text = "DANGER." -- 341
			end -- 325
		end -- 325
		return { -- 342
			text = text, -- 342
			font = "Spleen_Label_Small" -- 342
		}, true -- 342
	end, -- 323
	first_names = { -- 343
		"Subjugator", -- 343
		"Dragoner", -- 343
		"Persecuter", -- 343
		"Draconarius", -- 343
		"Volontaire" -- 343
	}, -- 343
	last_names = { -- 344
		"of Die Augen", -- 344
		"of Knochen", -- 344
		"of Sehne", -- 344
		"of Knorpel", -- 344
		"of Bauchspeicheldrüse" -- 344
	}, -- 344
	arms_model = "models/weapons/c_arms_refugee.mdl", -- 345
	ShowSpare1 = open_player_menu, -- 346
	ShowSpare2 = open_action_menu, -- 347
	bar_names = { -- 349
		health = "resolve" -- 349
	}, -- 348
	PlayerLoadout = function(ply) -- 350
		ply:ClearOddities() -- 351
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 352
		for slot, val in pairs({ -- 354
			[0] = 1, -- 355
			[1] = 1, -- 357
			[2] = 1, -- 359
			[3] = 2, -- 361
			[4] = 3, -- 363
			[5] = 0 -- 365
		}) do -- 353
			set_bodygroup(ply, slot, val) -- 353
		end -- 353
		return false -- 367
	end -- 350
}) -- 306
TEAM_DEALER = DarkRP.createJob("Quartermaster", { -- 370
	color = Color(255, 140, 0), -- 370
	model = "models/vel/evilwar/royalist.mdl", -- 371
	description = "The left hand of the Kommandant.\nManage the goods and keep your men armed.", -- 372
	weapons = { }, -- 373
	command = "dealer", -- 374
	salary = 1, -- 375
	max = 1, -- 376
	cost = 3, -- 377
	hasLicense = false, -- 378
	use_machines = false, -- 379
	category = "Royalists", -- 380
	speech_sounds = (function() -- 381
		local _accum_0 = { } -- 381
		local _len_0 = 1 -- 381
		for i = 1, 3 do -- 381
			_accum_0[_len_0] = "placenta/speech/dealer" .. tostring(i) .. ".wav" -- 381
			_len_0 = _len_0 + 1 -- 381
		end -- 381
		return _accum_0 -- 381
	end)(), -- 381
	hurt_sounds = (function() -- 382
		local _accum_0 = { } -- 382
		local _len_0 = 1 -- 382
		for i = 1, 4 do -- 382
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 382
			_len_0 = _len_0 + 1 -- 382
		end -- 382
		return _accum_0 -- 382
	end)(), -- 382
	become_sounds = (function() -- 383
		local _accum_0 = { } -- 383
		local _len_0 = 1 -- 383
		for i = 1, 15 do -- 383
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 383
			_len_0 = _len_0 + 1 -- 383
		end -- 383
		return _accum_0 -- 383
	end)(), -- 383
	crosstext = function(ply) -- 384
		local text = "Don't panic." -- 385
		do -- 386
			local _exp_0 = lp:Team() -- 386
			if TEAM_PRIVATE == _exp_0 then -- 387
				text = "This guy handles the guns." -- 388
			elseif TEAM_STALKER == _exp_0 then -- 389
				text = "Captain of the goods." -- 390
			elseif TEAM_SANITAR == _exp_0 then -- 391
				text = "The oldest living Dragoon.\nRespect. Honor." -- 392
			elseif TEAM_KORPSMAN == _exp_0 then -- 393
				text = "A reminder of the power of\nKapitalism." -- 394
			elseif TEAM_DEALER == _exp_0 then -- 395
				text = "I'm seeing double!" -- 396
			elseif TEAM_KOMMANDANT == _exp_0 then -- 397
				text = "My brother in arms.\nIf he fails, I'll cut his off." -- 398
			elseif TEAM_GHOST == _exp_0 then -- 399
				text = "Glorified accountant." -- 400
			elseif TEAM_BONEHEAD == _exp_0 then -- 401
				text = "BONES ARE HIS DOLLARS." -- 402
			end -- 386
		end -- 386
		return { -- 403
			text = text, -- 403
			font = "Spleen_Label_Small" -- 403
		}, true -- 403
	end, -- 384
	first_names = { -- 404
		"Quartermaster", -- 404
		"Quartiermeister" -- 404
	}, -- 404
	last_names = { -- 405
		"Kommissariatsdienst" -- 405
	}, -- 405
	special_name = "Kwartiermeester", -- 406
	special_name_chance = 1000, -- 407
	ShowSpare1 = open_player_menu, -- 408
	ShowSpare2 = open_action_menu, -- 409
	bar_names = { -- 411
		health = "insurance" -- 411
	}, -- 410
	PlayerLoadout = function(ply) -- 412
		ply:ClearOddities() -- 413
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 414
		for slot, val in pairs({ -- 416
			[0] = 1, -- 417
			[1] = 1, -- 419
			[2] = 1, -- 421
			[3] = 1, -- 423
			[4] = 3, -- 425
			[5] = 0 -- 427
		}) do -- 415
			set_bodygroup(ply, slot, val) -- 415
		end -- 415
		return false -- 429
	end -- 412
}) -- 369
TEAM_KORPSMAN = DarkRP.createJob("Sanitäter", { -- 432
	color = Color(79, 150, 150), -- 432
	model = "models/vel/evilwar/royalist.mdl", -- 433
	description = "You keep people alive in this terrible place.\nFill the blood and empty the rust.", -- 434
	weapons = { -- 435
		"evilrp/medkit" -- 435
	}, -- 435
	command = "medic", -- 436
	salary = 1, -- 437
	max = 2, -- 438
	cost = 2, -- 439
	hasLicense = false, -- 440
	medic = true, -- 441
	use_machines = false, -- 442
	category = "Royalists", -- 443
	speech_sounds = (function() -- 444
		local _accum_0 = { } -- 444
		local _len_0 = 1 -- 444
		for i = 1, 4 do -- 444
			_accum_0[_len_0] = "placenta/speech/korps" .. tostring(i) .. ".wav" -- 444
			_len_0 = _len_0 + 1 -- 444
		end -- 444
		return _accum_0 -- 444
	end)(), -- 444
	hurt_sounds = (function() -- 445
		local _accum_0 = { } -- 445
		local _len_0 = 1 -- 445
		for i = 1, 4 do -- 445
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 445
			_len_0 = _len_0 + 1 -- 445
		end -- 445
		return _accum_0 -- 445
	end)(), -- 445
	become_sounds = { -- 446
		"items/suitchargeok1.wav" -- 446
	}, -- 446
	crosstext = function(ply) -- 447
		local text = "Don't panic." -- 448
		do -- 449
			local _exp_0 = lp:Team() -- 449
			if TEAM_PRIVATE == _exp_0 then -- 450
				text = "I forgot what\nto call these guys." -- 451
			elseif TEAM_STALKER == _exp_0 then -- 452
				text = "A walking blood bag." -- 453
			elseif TEAM_SANITAR == _exp_0 then -- 454
				text = "Better remember\nwho lets them live." -- 455
			elseif TEAM_KORPSMAN == _exp_0 then -- 456
				text = "Something to\nbe happy about." -- 457
			elseif TEAM_DEALER == _exp_0 then -- 458
				text = "Keep them busy.\nWe need their blood and sweat." -- 459
			elseif TEAM_KOMMANDANT == _exp_0 then -- 460
				text = "What a strange,\nselfless thing." -- 461
			elseif TEAM_GHOST == _exp_0 then -- 462
				text = "A respectable mortal." -- 463
			elseif TEAM_BONEHEAD == _exp_0 then -- 464
				text = "CONFUSING." -- 465
			end -- 449
		end -- 449
		return { -- 466
			text = text, -- 466
			font = "Spleen_Label_Small" -- 466
		}, true -- 466
	end, -- 447
	first_names = { -- 467
		"Dissector", -- 467
		"Retractor", -- 467
		"Suture", -- 467
		"Femur", -- 467
		"Cystic", -- 467
		"Rasp", -- 467
		"Ferrum", -- 467
		"Fascia", -- 467
		"Marrow", -- 467
		"Lienis", -- 467
		"Aorta", -- 467
		"Tunica", -- 467
		"Maxilla", -- 467
		"Sacrum", -- 467
		"Leach" -- 467
	}, -- 467
	last_names = { -- 468
		"Forceps", -- 468
		"Scalpel", -- 468
		"Curette", -- 468
		"Rongeur", -- 468
		"Trocar", -- 468
		"Babcock", -- 468
		"Duval", -- 468
		"Hemostat", -- 468
		"Ossis", -- 468
		"Caro", -- 468
		"Cadaver", -- 468
		"Sanguis", -- 468
		"Bilis", -- 468
		"Viscera", -- 468
		"Jugular", -- 468
		"Clavius" -- 468
	}, -- 468
	special_name = "Corpseman", -- 469
	special_name_chance = 1000, -- 470
	ShowSpare1 = open_player_menu, -- 471
	ShowSpare2 = open_action_menu, -- 472
	bar_names = { -- 474
		health = "Bio-reserves" -- 474
	}, -- 473
	PlayerLoadout = function(ply) -- 475
		ply:ClearOddities() -- 476
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 477
		ply:SetSkin(4) -- 478
		for slot, val in pairs({ -- 480
			[0] = 0, -- 481
			[1] = 0, -- 483
			[2] = 2, -- 485
			[3] = 3, -- 487
			[4] = 1, -- 489
			[5] = 0 -- 491
		}) do -- 479
			set_bodygroup(ply, slot, val) -- 479
		end -- 479
		return false -- 493
	end -- 475
}) -- 431
TEAM_KOMMANDANT = DarkRP.createJob("Kommandant", { -- 496
	color = Color(150, 20, 20), -- 496
	model = "models/vel/evilwar/royalist.mdl", -- 497
	description = "Rule with an iron fist.", -- 498
	command = "kommandant", -- 499
	salary = 1, -- 500
	weapons = { -- 501
		"evilrp_weapon/novoluger" -- 501
	}, -- 501
	max = 1, -- 502
	cost = 5, -- 503
	weapons = { }, -- 504
	hasLicense = true, -- 505
	mayor = true, -- 506
	use_machines = false, -- 507
	category = "Royalists", -- 508
	speech_sounds = (function() -- 509
		local _accum_0 = { } -- 509
		local _len_0 = 1 -- 509
		for i = 1, 15 do -- 509
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 509
			_len_0 = _len_0 + 1 -- 509
		end -- 509
		return _accum_0 -- 509
	end)(), -- 509
	become_sounds = { -- 510
		"kidneydagger/broadcast1.wav" -- 510
	}, -- 510
	crosstext = function(ply) -- 511
		local text = "Don't panic." -- 512
		do -- 513
			local _exp_0 = lp:Team() -- 513
			if TEAM_PRIVATE == _exp_0 then -- 514
				text = "Listen carefully." -- 515
			elseif TEAM_STALKER == _exp_0 then -- 516
				text = "Oh your magesty!" -- 517
			elseif TEAM_SANITAR == _exp_0 then -- 518
				text = "Hail, hail!" -- 519
			elseif TEAM_KORPSMAN == _exp_0 then -- 520
				text = "Is he feeling okay?" -- 521
			elseif TEAM_DEALER == _exp_0 then -- 522
				text = "Glorious leader.\nI'm nothing without him." -- 523
			elseif TEAM_KOMMANDANT == _exp_0 then -- 524
				text = "Our strength\nshall prevail." -- 525
			elseif TEAM_GHOST == _exp_0 then -- 526
				text = "So full of lies." -- 527
			elseif TEAM_BONEHEAD == _exp_0 then -- 528
				text = "THERE HE IS!!" -- 529
			end -- 513
		end -- 513
		return { -- 530
			text = text, -- 530
			font = "Spleen_Label_Small" -- 530
		}, true -- 530
	end, -- 511
	first_names = ("Kommandant"), -- 531
	special_name = "Kamdonot", -- 532
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
		for slot, val in pairs({ -- 543
			[0] = 1, -- 544
			[1] = 2, -- 546
			[2] = 0, -- 548
			[3] = 1, -- 550
			[4] = 2, -- 552
			[5] = 0 -- 554
		}) do -- 542
			set_bodygroup(ply, slot, val) -- 542
		end -- 542
		ply:SetNWInt("evilrp_gasmask", 4) -- 556
		ply:Give("evilrp_weapon/novoluger") -- 557
		return false -- 558
	end -- 538
}) -- 495
GAMEMODE.CivilProtection = { -- 561
	[TEAM_PRIVATE] = true, -- 561
	[TEAM_SANITAR] = true, -- 562
	[TEAM_KOMMANDANT] = true -- 563
} -- 560
GAMEMODE.DefaultTeam = TEAM_GHOST -- 565
