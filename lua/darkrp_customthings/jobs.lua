-- [yue]: jobs.yue
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
			return GAMEMODE:Frighten() -- 52
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
}) -- 28
TEAM_STALKER = DarkRP.createJob("Stalker", { -- 88
	color = Color(20, 150, 20), -- 88
	model = "models/liver_failure/wastelander/wastelander.mdl", -- 89
	description = "A soul with no allegiance, destined to plunder the wasteland.", -- 90
	weapons = { -- 91
		"evilrp_weapon/brainpaster", -- 91
		"evilrp_melee/axe" -- 91
	}, -- 91
	category = "Scum of Liver Failure", -- 92
	command = "stalker", -- 93
	salary = 1, -- 94
	max = 0, -- 95
	hasLicense = false, -- 96
	candemote = false, -- 97
	speech_sounds = (function() -- 98
		local _accum_0 = { } -- 98
		local _len_0 = 1 -- 98
		for i = 1, 3 do -- 98
			_accum_0[_len_0] = "placenta/speech/prole" .. tostring(i) .. ".wav" -- 98
			_len_0 = _len_0 + 1 -- 98
		end -- 98
		return _accum_0 -- 98
	end)(), -- 98
	hurt_sounds = (function() -- 99
		local _accum_0 = { } -- 99
		local _len_0 = 1 -- 99
		for i = 1, 5 do -- 99
			_accum_0[_len_0] = "placenta/pain/prole" .. tostring(i) .. ".wav" -- 99
			_len_0 = _len_0 + 1 -- 99
		end -- 99
		return _accum_0 -- 99
	end)(), -- 99
	become_sounds = (function() -- 100
		local _accum_0 = { } -- 100
		local _len_0 = 1 -- 100
		for i = 1, 3 do -- 100
			_accum_0[_len_0] = "npc/zombie/zombie_alert" .. tostring(i) .. ".wav" -- 100
			_len_0 = _len_0 + 1 -- 100
		end -- 100
		return _accum_0 -- 100
	end)(), -- 100
	death_sounds = (function() -- 101
		local _accum_0 = { } -- 101
		local _len_0 = 1 -- 101
		for i = 1, 3 do -- 101
			_accum_0[_len_0] = "placenta/death/prole" .. tostring(i) .. ".wav" -- 101
			_len_0 = _len_0 + 1 -- 101
		end -- 101
		return _accum_0 -- 101
	end)(), -- 101
	crosstext = function(ply) -- 102
		local text = "Don't panic." -- 103
		do -- 104
			local _exp_0 = lp:Team() -- 104
			if TEAM_PRIVATE == _exp_0 then -- 105
				text = "He doesn't look like me." -- 106
			elseif TEAM_STALKER == _exp_0 then -- 107
				text = "A fellow plunderer." -- 108
			elseif TEAM_SANITAR == _exp_0 then -- 109
				text = "Despicable." -- 110
			elseif TEAM_KORPSMAN == _exp_0 then -- 111
				text = "Why is he here?" -- 112
			elseif TEAM_KOMMANDANT == _exp_0 then -- 113
				text = "He might be of use to me." -- 114
			elseif TEAM_GHOST == _exp_0 then -- 115
				text = "He has a noble pursuit." -- 116
			elseif TEAM_BONEHEAD == _exp_0 then -- 117
				text = "SEEN HIM BEFORE!!" -- 118
			end -- 118
		end -- 118
		return { -- 119
			text = text, -- 119
			font = "Spleen_Label_Small" -- 119
		}, false -- 119
	end, -- 102
	first_names = { -- 120
		"Wasted", -- 120
		"Decrepit", -- 120
		"Rotten" -- 120
	}, -- 120
	last_names = { -- 121
		"Soul", -- 121
		"Plunderer", -- 121
		"Traitor", -- 121
		"Wanderer" -- 121
	}, -- 121
	bar_names = { -- 123
		health = "regret" -- 123
	}, -- 122
	special_name = "Meatwad", -- 124
	special_name_chance = 1000, -- 125
	ShowSpare1 = open_player_menu, -- 126
	ShowSpare2 = open_action_menu, -- 127
	PlayerLoadout = function(ply) -- 128
		ply:ClearOddities() -- 129
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 130
		for slot, val in pairs({ -- 133
			[0] = 0, -- 133
			[1] = 2, -- 135
			[2] = { -- 137
				2, -- 137
				3, -- 137
				8, -- 137
				6 -- 137
			}, -- 137
			[3] = { -- 139
				19, -- 139
				20 -- 139
			}, -- 139
			[4] = 0, -- 141
			[5] = 0, -- 143
			[6] = { -- 145
				0, -- 145
				1, -- 145
				2, -- 145
				3 -- 145
			}, -- 145
			[7] = 0, -- 147
			[8] = 0, -- 149
			[9] = { -- 151
				0, -- 151
				1 -- 151
			} -- 151
		}) do -- 152
			set_bodygroup(ply, slot, val) -- 131
		end -- 131
		local skins = { -- 153
			4, -- 153
			6, -- 153
			7 -- 153
		} -- 153
		ply:SetSkin(skins[math.random(1, #skins)]) -- 154
		return false -- 155
	end -- 128
}) -- 87
do -- 157
	local _class_0 -- 157
	local _parent_0 = SOUND -- 157
	local _base_0 = { -- 157
		sound = "placenta/bonehead_aggrod4.wav", -- 159
		pitch = { -- 159
			200, -- 159
			250 -- 159
		} -- 157
	} -- 157
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 159
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 157
			_base_0[_key_0] = _val_0 -- 157
		end -- 157
	end -- 159
	if _base_0.__index == nil then -- 157
		_base_0.__index = _base_0 -- 157
	end -- 159
	setmetatable(_base_0, _parent_0.__base) -- 157
	_class_0 = setmetatable({ -- 157
		__init = function(self, ...) -- 157
			return _class_0.__parent.__init(self, ...) -- 157
		end, -- 157
		__base = _base_0, -- 157
		__name = "SpeechBonehead", -- 157
		__parent = _parent_0 -- 157
	}, { -- 157
		__index = function(cls, name) -- 157
			local val = rawget(_base_0, name) -- 157
			if val == nil then -- 157
				local parent = rawget(cls, "__parent") -- 157
				if parent then -- 157
					return parent[name] -- 157
				end -- 157
			else -- 157
				return val -- 157
			end -- 157
		end, -- 157
		__call = function(cls, ...) -- 157
			local _self_0 = setmetatable({ }, _base_0) -- 157
			cls.__init(_self_0, ...) -- 157
			return _self_0 -- 157
		end -- 157
	}) -- 157
	_base_0.__class = _class_0 -- 157
	if _parent_0.__inherited then -- 157
		_parent_0.__inherited(_parent_0, _class_0) -- 157
	end -- 157
	SpeechBonehead = _class_0 -- 157
end -- 159
TEAM_BONEHEAD = DarkRP.createJob("Bonehead", { -- 162
	color = Color(150, 150, 150), -- 162
	model = "models/player/zombie_fast.mdl", -- 163
	description = "evil fucker.", -- 164
	instant_respawn = true, -- 165
	command = "bonehead", -- 166
	salary = 1, -- 167
	max = 0, -- 168
	speech_sounds = "SpeechBonehead", -- 169
	hurt_sounds = (function() -- 170
		local _accum_0 = { } -- 170
		local _len_0 = 1 -- 170
		for i = 1, 2 do -- 170
			_accum_0[_len_0] = "placenta/bonehead_slice" .. tostring(i) .. ".wav" -- 170
			_len_0 = _len_0 + 1 -- 170
		end -- 170
		return _accum_0 -- 170
	end)(), -- 170
	become_sounds = (function() -- 171
		local _accum_0 = { } -- 171
		local _len_0 = 1 -- 171
		for i = 1, 4 do -- 171
			_accum_0[_len_0] = "placenta/bonehead_aggrod" .. tostring(i) .. ".wav" -- 171
			_len_0 = _len_0 + 1 -- 171
		end -- 171
		return _accum_0 -- 171
	end)(), -- 171
	crosstext = function(ply) -- 172
		local text = "Don't panic." -- 173
		do -- 174
			local _exp_0 = lp:Team() -- 174
			if TEAM_PRIVATE == _exp_0 then -- 175
				text = "Oh no! He's real!" -- 176
			elseif TEAM_SANITAR == _exp_0 then -- 177
				text = "Oh boy." -- 178
			elseif TEAM_KORPSMAN == _exp_0 then -- 179
				text = "Oh no! It happened again!" -- 180
			elseif TEAM_KOMMANDANT == _exp_0 then -- 181
				text = "Ha. It happened again." -- 182
			elseif TEAM_GHOST == _exp_0 then -- 183
				text = "Lookin' good." -- 184
			elseif TEAM_BONEHEAD == _exp_0 then -- 185
				text = "THERE'S ANOTHER ONE." -- 186
			end -- 186
		end -- 186
		return { -- 187
			text = text, -- 187
			font = "Spleen_Label_Small" -- 187
		}, false -- 187
	end, -- 172
	first_names = { -- 188
		"Evil" -- 188
	}, -- 188
	last_names = { -- 189
		"Fucker" -- 189
	}, -- 189
	no_needs = true, -- 190
	hint = "You are a truly pissed off skeleton. Go get 'em!", -- 191
	bar_names = { -- 193
		health = "EVIL FUCKER POWER" -- 193
	}, -- 192
	bar_colors = { -- 195
		health = Color(200, 0, 0) -- 195
	}, -- 194
	RenderScreenspaceEffects = function(ply) -- 196
		local ct = CurTime() -- 197
		DrawMotionBlur(0.25, 0.2, 0.3) -- 198
		return DrawSharpen(1 * math.sin(ct), 2 * math.random(0.8, 1.2)) -- 199
	end, -- 196
	ColorMod = function(ply) -- 200
		local abs, cos, sin = math.abs, math.cos, math.sin -- 201
		local ct = CurTime() -- 202
		local tab = { -- 204
			["$pp_colour_addr"] = 0.1, -- 204
			["$pp_colour_addg"] = 0, -- 205
			["$pp_colour_addb"] = 0, -- 206
			["$pp_colour_brightness"] = 0 + (-0.01 * cos(ct)), -- 207
			["$pp_colour_contrast"] = 1.6 + (abs(sin(ct * 0.166)) * 0.5), -- 208
			["$pp_colour_colour"] = 0, -- 209
			["$pp_colour_mulr"] = 0 + abs(sin(ct * 0.789)), -- 210
			["$pp_colour_mulg"] = 0, -- 211
			["$pp_colour_mulb"] = 0 -- 212
		} -- 203
		return tab -- 213
	end, -- 200
	ShowSpare1 = function() -- 214
		if CLIENT then -- 215
			return GAMEMODE:Frighten() -- 216
		end -- 215
	end, -- 214
	ShowSpare2 = function() -- 217
		if CLIENT then -- 218
			return GAMEMODE:Frighten() -- 219
		end -- 218
	end, -- 217
	PlayerLoadout = function(ply) -- 220
		ply:SetNWInt("evilrp_gasmask", 0) -- 221
		ply:Give("evilrp_melee/hands/boneclaws") -- 222
		return true -- 223
	end, -- 220
	HandleRagdoll = function(rag, ply) -- 224
		return rag:SetNWInt("decomp_stage", DSTAGE_BONES) -- 225
	end -- 224
}) -- 161
TEAM_PRIVATE = DarkRP.createJob("Private", { -- 228
	color = Color(20, 150, 20), -- 228
	model = "models/vel/evilwar/royalist.mdl", -- 229
	description = "A new recruit that hasn't gone through training yet.", -- 230
	weapons = { -- 231
		"evilrp_weapon/mark", -- 231
		"evilrp_melee/pipe" -- 231
	}, -- 231
	command = "proletariat", -- 232
	salary = 1, -- 233
	max = 0, -- 234
	hasLicense = true, -- 235
	candemote = false, -- 236
	category = "Citizens of Liver Failure", -- 237
	speech_sounds = (function() -- 238
		local _accum_0 = { } -- 238
		local _len_0 = 1 -- 238
		for i = 1, 3 do -- 238
			_accum_0[_len_0] = "placenta/speech/prole" .. tostring(i) .. ".wav" -- 238
			_len_0 = _len_0 + 1 -- 238
		end -- 238
		return _accum_0 -- 238
	end)(), -- 238
	hurt_sounds = (function() -- 239
		local _accum_0 = { } -- 239
		local _len_0 = 1 -- 239
		for i = 1, 5 do -- 239
			_accum_0[_len_0] = "placenta/pain/prole" .. tostring(i) .. ".wav" -- 239
			_len_0 = _len_0 + 1 -- 239
		end -- 239
		return _accum_0 -- 239
	end)(), -- 239
	become_sounds = (function() -- 240
		local _accum_0 = { } -- 240
		local _len_0 = 1 -- 240
		for i = 1, 3 do -- 240
			_accum_0[_len_0] = "npc/zombie/zombie_alert" .. tostring(i) .. ".wav" -- 240
			_len_0 = _len_0 + 1 -- 240
		end -- 240
		return _accum_0 -- 240
	end)(), -- 240
	death_sounds = (function() -- 241
		local _accum_0 = { } -- 241
		local _len_0 = 1 -- 241
		for i = 1, 3 do -- 241
			_accum_0[_len_0] = "placenta/death/prole" .. tostring(i) .. ".wav" -- 241
			_len_0 = _len_0 + 1 -- 241
		end -- 241
		return _accum_0 -- 241
	end)(), -- 241
	crosstext = function(ply) -- 242
		local text = "Don't panic." -- 243
		do -- 244
			local _exp_0 = lp:Team() -- 244
			if TEAM_PRIVATE == _exp_0 then -- 245
				text = "United in rank?" -- 246
			elseif TEAM_SANITAR == _exp_0 then -- 247
				text = "Keep the fear\nin his heart." -- 248
			elseif TEAM_KORPSMAN == _exp_0 then -- 249
				text = "Smelly." -- 250
			elseif TEAM_KOMMANDANT == _exp_0 then -- 251
				text = "Is he working hard enough?" -- 252
			elseif TEAM_GHOST == _exp_0 then -- 253
				text = "Sad, but funny." -- 254
			elseif TEAM_BONEHEAD == _exp_0 then -- 255
				text = "SKIN...!" -- 256
			end -- 256
		end -- 256
		return { -- 257
			text = text, -- 257
			font = "Spleen_Label_Small" -- 257
		}, false -- 257
	end, -- 242
	first_names = { -- 258
		"Private", -- 258
		"PVT.", -- 258
		"Recruit" -- 258
	}, -- 258
	last_names = { -- 259
		"Parts", -- 259
		"Smallwood", -- 259
		"Neublud", -- 259
		"Smallfry" -- 259
	}, -- 259
	special_name = "Meatwad", -- 260
	special_name_chance = 1000, -- 261
	ShowSpare1 = open_player_menu, -- 262
	ShowSpare2 = open_action_menu, -- 263
	PlayerLoadout = function(ply) -- 264
		ply:ClearOddities() -- 265
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 266
		for slot, val in pairs({ -- 269
			[0] = 0, -- 269
			[1] = 0, -- 271
			[2] = 0, -- 273
			[3] = 0, -- 275
			[4] = 0, -- 277
			[5] = 0 -- 279
		}) do -- 280
			set_bodygroup(ply, slot, val) -- 267
		end -- 267
		return false -- 281
	end -- 264
}) -- 227
TEAM_SANITAR = DarkRP.createJob("Dragoon", { -- 284
	color = Color(25, 170, 0), -- 284
	model = "models/vel/evilwar/royalist.mdl", -- 285
	description = "The right hand of the Kommandant.\nRespected by his peers,\nfeared by his enemies.", -- 286
	weapons = { -- 287
		"evilrp_weapon/pacifier", -- 287
		"simple_hl2_stunstick" -- 287
	}, -- 287
	command = "ss", -- 288
	salary = 1, -- 289
	max = 6, -- 290
	hasLicense = true, -- 291
	ammo = { -- 293
		pistol = 60 -- 293
	}, -- 292
	category = "Sanitar Squad", -- 294
	speech_sounds = (function() -- 295
		local _accum_0 = { } -- 295
		local _len_0 = 1 -- 295
		for i = 1, 15 do -- 295
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 295
			_len_0 = _len_0 + 1 -- 295
		end -- 295
		return _accum_0 -- 295
	end)(), -- 295
	hurt_sounds = (function() -- 296
		local _accum_0 = { } -- 296
		local _len_0 = 1 -- 296
		for i = 1, 4 do -- 296
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 296
			_len_0 = _len_0 + 1 -- 296
		end -- 296
		return _accum_0 -- 296
	end)(), -- 296
	become_sounds = (function() -- 297
		local _accum_0 = { } -- 297
		local _len_0 = 1 -- 297
		for i = 1, 15 do -- 297
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 297
			_len_0 = _len_0 + 1 -- 297
		end -- 297
		return _accum_0 -- 297
	end)(), -- 297
	crosstext = function(ply) -- 298
		local text = "Don't panic." -- 299
		do -- 300
			local _exp_0 = lp:Team() -- 300
			if TEAM_PRIVATE == _exp_0 then -- 301
				text = "The Cell is here." -- 302
			elseif TEAM_SANITAR == _exp_0 then -- 303
				text = "One of my only\n friends here." -- 304
			elseif TEAM_KORPSMAN == _exp_0 then -- 305
				text = "Beware of shadows in the\nNight of the Long Pipes." -- 306
			elseif TEAM_KOMMANDANT == _exp_0 then -- 307
				text = "A tentacle of mine." -- 308
			elseif TEAM_GHOST == _exp_0 then -- 309
				text = "Evil, stupid,\n maybe both." -- 310
			elseif TEAM_BONEHEAD == _exp_0 then -- 311
				text = "DANGER." -- 312
			end -- 312
		end -- 312
		return { -- 313
			text = text, -- 313
			font = "Spleen_Label_Small" -- 313
		}, true -- 313
	end, -- 298
	first_names = { -- 314
		"Subjugator", -- 314
		"Dragoner", -- 314
		"Persecuter", -- 314
		"Draconarius", -- 314
		"Volontaire" -- 314
	}, -- 314
	last_names = { -- 315
		"of Die Augen", -- 315
		"of Knochen", -- 315
		"of Sehne", -- 315
		"of Knorpel", -- 315
		"of Bauchspeicheldrüse" -- 315
	}, -- 315
	arms_model = "models/weapons/c_arms_refugee.mdl", -- 316
	ShowSpare1 = open_player_menu, -- 317
	ShowSpare2 = open_action_menu, -- 318
	bar_names = { -- 320
		health = "resolve" -- 320
	}, -- 319
	PlayerLoadout = function(ply) -- 321
		ply:ClearOddities() -- 322
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 323
		for slot, val in pairs({ -- 326
			[0] = 1, -- 326
			[1] = 1, -- 328
			[2] = 1, -- 330
			[3] = 2, -- 332
			[4] = 3, -- 334
			[5] = 0 -- 336
		}) do -- 337
			set_bodygroup(ply, slot, val) -- 324
		end -- 324
		return false -- 338
	end -- 321
}) -- 283
TEAM_DEALER = DarkRP.createJob("Quartermaster", { -- 341
	color = Color(255, 140, 0), -- 341
	model = { -- 342
		"models/liver_failure/liverish/liverish.mdl", -- 342
		"models/liver_failure/kidneystani/kidneystani.mdl", -- 343
		"models/liver_failure/arrythmian/arrythmian.mdl" -- 344
	}, -- 342
	description = "The left hand of the Kommandant.\nManage the goods and keep your men armed.", -- 345
	weapons = { }, -- 346
	command = "dealer", -- 347
	salary = 1, -- 348
	max = 2, -- 349
	hasLicense = false, -- 350
	category = "Citizens of Liver Failure", -- 351
	speech_sounds = (function() -- 352
		local _accum_0 = { } -- 352
		local _len_0 = 1 -- 352
		for i = 1, 3 do -- 352
			_accum_0[_len_0] = "placenta/speech/dealer" .. tostring(i) .. ".wav" -- 352
			_len_0 = _len_0 + 1 -- 352
		end -- 352
		return _accum_0 -- 352
	end)(), -- 352
	first_names = { -- 353
		"Kanan", -- 353
		"Merce", -- 353
		"Ameel", -- 353
		"Otis", -- 353
		"Cedric", -- 353
		"Edwin", -- 353
		"Floy", -- 353
		"Benjamin", -- 353
		"Fortune", -- 353
		"William", -- 353
		"Thomas", -- 353
		"Dean", -- 353
		"Aurum", -- 353
		"Klep" -- 353
	}, -- 353
	last_names = { -- 354
		"Chapman", -- 354
		"Merchant", -- 354
		"Cash", -- 354
		"Keeper", -- 354
		"Bones", -- 354
		"Ryker", -- 354
		"Plutarch", -- 354
		"Nasir", -- 354
		"Greenback", -- 354
		"Grocer", -- 354
		"Flanders", -- 354
		"Hooper", -- 354
		"Watto", -- 354
		"Loman", -- 354
		"Stehlen", -- 354
		"Reichmann", -- 354
		"Kaufmann" -- 354
	}, -- 354
	special_name = "Unfortunate Shopkeep", -- 355
	special_name_chance = 1000, -- 356
	ShowSpare1 = open_player_menu, -- 357
	ShowSpare2 = open_action_menu, -- 358
	bar_names = { -- 360
		health = "insurance" -- 360
	}, -- 359
	PlayerLoadout = function(ply) -- 361
		ply:ClearOddities() -- 362
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 363
		for slot, val in pairs({ -- 366
			[0] = 0, -- 366
			[1] = 0, -- 368
			[2] = { -- 370
				3, -- 370
				5, -- 370
				16 -- 370
			}, -- 370
			[3] = 22, -- 372
			[4] = 0, -- 374
			[5] = 0, -- 376
			[6] = 1, -- 378
			[7] = 0, -- 380
			[8] = { -- 382
				0, -- 382
				1, -- 382
				2, -- 382
				3, -- 382
				4, -- 382
				5 -- 382
			}, -- 382
			[9] = 0 -- 384
		}) do -- 385
			set_bodygroup(ply, slot, val) -- 364
		end -- 364
		local skins = { -- 386
			2, -- 386
			4, -- 386
			5, -- 386
			6, -- 386
			7, -- 386
			8, -- 386
			9, -- 386
			10, -- 386
			11, -- 386
			12, -- 386
			13, -- 386
			14, -- 386
			15 -- 386
		} -- 386
		ply:SetSkin(skins[math.random(1, #skins)]) -- 387
		return false -- 388
	end -- 361
}) -- 340
TEAM_KORPSMAN = DarkRP.createJob("Sanitäter", { -- 391
	color = Color(79, 150, 150), -- 391
	model = "models/vel/evilwar/royalist.mdl", -- 392
	description = "You keep people alive in this terrible place.\nFill the blood and empty the rust.", -- 393
	weapons = { -- 394
		"evilrp/medkit" -- 394
	}, -- 394
	command = "medic", -- 395
	salary = 1, -- 396
	max = 3, -- 397
	hasLicense = false, -- 398
	medic = true, -- 399
	category = "Citizens of Liver Failure", -- 400
	speech_sounds = (function() -- 401
		local _accum_0 = { } -- 401
		local _len_0 = 1 -- 401
		for i = 1, 4 do -- 401
			_accum_0[_len_0] = "placenta/speech/korps" .. tostring(i) .. ".wav" -- 401
			_len_0 = _len_0 + 1 -- 401
		end -- 401
		return _accum_0 -- 401
	end)(), -- 401
	hurt_sounds = (function() -- 402
		local _accum_0 = { } -- 402
		local _len_0 = 1 -- 402
		for i = 1, 4 do -- 402
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 402
			_len_0 = _len_0 + 1 -- 402
		end -- 402
		return _accum_0 -- 402
	end)(), -- 402
	become_sounds = { -- 403
		"items/suitchargeok1.wav" -- 403
	}, -- 403
	crosstext = function(ply) -- 404
		local text = "Don't panic." -- 405
		do -- 406
			local _exp_0 = lp:Team() -- 406
			if TEAM_PRIVATE == _exp_0 then -- 407
				text = "I forgot what\nto call these guys." -- 408
			elseif TEAM_SANITAR == _exp_0 then -- 409
				text = "Better remember\nwho lets them live." -- 410
			elseif TEAM_KORPSMAN == _exp_0 then -- 411
				text = "Something to\nbe happy about." -- 412
			elseif TEAM_KOMMANDANT == _exp_0 then -- 413
				text = "What a strange,\nselfless thing." -- 414
			elseif TEAM_GHOST == _exp_0 then -- 415
				text = "A respectable mortal." -- 416
			elseif TEAM_BONEHEAD == _exp_0 then -- 417
				text = "CONFUSING." -- 418
			end -- 418
		end -- 418
		return { -- 419
			text = text, -- 419
			font = "Spleen_Label_Small" -- 419
		}, true -- 419
	end, -- 404
	first_names = { -- 420
		"Dissector", -- 420
		"Retractor", -- 420
		"Suture", -- 420
		"Femur", -- 420
		"Cystic", -- 420
		"Rasp", -- 420
		"Ferrum", -- 420
		"Fascia", -- 420
		"Marrow", -- 420
		"Lienis", -- 420
		"Aorta", -- 420
		"Tunica", -- 420
		"Maxilla", -- 420
		"Sacrum", -- 420
		"Leach" -- 420
	}, -- 420
	last_names = { -- 421
		"Forceps", -- 421
		"Scalpel", -- 421
		"Curette", -- 421
		"Rongeur", -- 421
		"Trocar", -- 421
		"Babcock", -- 421
		"Duval", -- 421
		"Hemostat", -- 421
		"Ossis", -- 421
		"Caro", -- 421
		"Cadaver", -- 421
		"Sanguis", -- 421
		"Bilis", -- 421
		"Viscera", -- 421
		"Jugular", -- 421
		"Clavius" -- 421
	}, -- 421
	special_name = "Corpseman", -- 422
	special_name_chance = 1000, -- 423
	ShowSpare1 = open_player_menu, -- 424
	ShowSpare2 = open_action_menu, -- 425
	bar_names = { -- 427
		health = "Bio-reserves" -- 427
	}, -- 426
	PlayerLoadout = function(ply) -- 428
		ply:ClearOddities() -- 429
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 430
		ply:SetSkin(4) -- 431
		for slot, val in pairs({ -- 434
			[0] = 0, -- 434
			[1] = 0, -- 436
			[2] = 2, -- 438
			[3] = 3, -- 440
			[4] = 1, -- 442
			[5] = 0 -- 444
		}) do -- 445
			set_bodygroup(ply, slot, val) -- 432
		end -- 432
		return false -- 446
	end -- 428
}) -- 390
TEAM_KOMMANDANT = DarkRP.createJob("Kommandant", { -- 449
	color = Color(150, 20, 20), -- 449
	model = "models/vel/evilwar/royalist.mdl", -- 450
	description = "Rule with an iron fist.", -- 451
	command = "kommandant", -- 452
	salary = 1, -- 453
	weapons = { -- 454
		"evilrp_weapon/novoluger" -- 454
	}, -- 454
	max = 1, -- 455
	weapons = { }, -- 456
	hasLicense = true, -- 457
	mayor = true, -- 458
	category = "Bureaukracy", -- 459
	speech_sounds = (function() -- 460
		local _accum_0 = { } -- 460
		local _len_0 = 1 -- 460
		for i = 1, 15 do -- 460
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 460
			_len_0 = _len_0 + 1 -- 460
		end -- 460
		return _accum_0 -- 460
	end)(), -- 460
	become_sounds = { -- 461
		"kidneydagger/broadcast1.wav" -- 461
	}, -- 461
	crosstext = function(ply) -- 462
		local text = "Don't panic." -- 463
		do -- 464
			local _exp_0 = lp:Team() -- 464
			if TEAM_PRIVATE == _exp_0 then -- 465
				text = "Listen carefully." -- 466
			elseif TEAM_SANITAR == _exp_0 then -- 467
				text = "Hail, hail!" -- 468
			elseif TEAM_KORPSMAN == _exp_0 then -- 469
				text = "Is he feeling okay?" -- 470
			elseif TEAM_KOMMANDANT == _exp_0 then -- 471
				text = "Our strength\nshall prevail." -- 472
			elseif TEAM_GHOST == _exp_0 then -- 473
				text = "So full of lies." -- 474
			elseif TEAM_BONEHEAD == _exp_0 then -- 475
				text = "THERE HE IS!!" -- 476
			end -- 476
		end -- 476
		return { -- 477
			text = text, -- 477
			font = "Spleen_Label_Small" -- 477
		}, true -- 477
	end, -- 462
	first_names = ("Kommandant"), -- 478
	special_name = "Kamdonot", -- 479
	special_name_chance = 1000, -- 480
	ShowSpare1 = open_player_menu, -- 481
	ShowSpare2 = open_action_menu, -- 482
	bar_names = { -- 484
		health = "PRIDE" -- 484
	}, -- 483
	PlayerLoadout = function(ply) -- 485
		ply:ClearOddities() -- 486
		local oddities -- 487
		do -- 487
			local _accum_0 = { } -- 487
			local _len_0 = 1 -- 487
			for k, v in pairs(ODDITY.list) do -- 487
				if v ~= ODDITY_ILLITERACY then -- 487
					_accum_0[_len_0] = v -- 487
					_len_0 = _len_0 + 1 -- 487
				end -- 487
			end -- 487
			oddities = _accum_0 -- 487
		end -- 487
		ply:AddOddity(oddities[math.random(#oddities)]) -- 488
		for slot, val in pairs({ -- 491
			[0] = 1, -- 491
			[1] = 2, -- 493
			[2] = 0, -- 495
			[3] = 1, -- 497
			[4] = 2, -- 499
			[5] = 0 -- 501
		}) do -- 502
			set_bodygroup(ply, slot, val) -- 489
		end -- 489
		ply:SetNWInt("evilrp_gasmask", 4) -- 503
		ply:Give("evilrp_weapon/novoluger") -- 504
		return false -- 505
	end -- 485
}) -- 448
GAMEMODE.CivilProtection = { -- 508
	[TEAM_PRIVATE] = true, -- 508
	[TEAM_SANITAR] = true, -- 509
	[TEAM_KOMMANDANT] = true -- 510
} -- 507
GAMEMODE.DefaultTeam = TEAM_GHOST -- 512
