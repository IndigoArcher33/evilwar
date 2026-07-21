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
	category = "Wasteland", -- 92
	command = "stalker", -- 93
	salary = 1, -- 94
	max = 3, -- 95
	hasLicense = false, -- 96
	candemote = false, -- 97
	speech_sounds = (function() -- 98
		local _accum_0 = { } -- 98
		local _len_0 = 1 -- 98
		for i = 1, 9 do -- 98
			_accum_0[_len_0] = "placenta/cultspawn" .. tostring(i) .. ".wav" -- 98
			_len_0 = _len_0 + 1 -- 98
		end -- 98
		return _accum_0 -- 98
	end)(), -- 98
	hurt_sounds = (function() -- 99
		local _accum_0 = { } -- 99
		local _len_0 = 1 -- 99
		for i = 1, 6 do -- 99
			_accum_0[_len_0] = "placenta/pain/cult" .. tostring(i) .. ".wav" -- 99
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
		for i = 1, 4 do -- 101
			_accum_0[_len_0] = "placenta/death/cult" .. tostring(i) .. ".wav" -- 101
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
	special_name = "Waste", -- 124
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
	command = "proletariat", -- 231
	salary = 1, -- 232
	max = 0, -- 233
	hasLicense = true, -- 234
	candemote = false, -- 235
	category = "Royalists", -- 236
	speech_sounds = (function() -- 237
		local _accum_0 = { } -- 237
		local _len_0 = 1 -- 237
		for i = 1, 3 do -- 237
			_accum_0[_len_0] = "placenta/speech/prole" .. tostring(i) .. ".wav" -- 237
			_len_0 = _len_0 + 1 -- 237
		end -- 237
		return _accum_0 -- 237
	end)(), -- 237
	hurt_sounds = (function() -- 238
		local _accum_0 = { } -- 238
		local _len_0 = 1 -- 238
		for i = 1, 5 do -- 238
			_accum_0[_len_0] = "placenta/pain/prole" .. tostring(i) .. ".wav" -- 238
			_len_0 = _len_0 + 1 -- 238
		end -- 238
		return _accum_0 -- 238
	end)(), -- 238
	become_sounds = (function() -- 239
		local _accum_0 = { } -- 239
		local _len_0 = 1 -- 239
		for i = 1, 3 do -- 239
			_accum_0[_len_0] = "npc/zombie/zombie_alert" .. tostring(i) .. ".wav" -- 239
			_len_0 = _len_0 + 1 -- 239
		end -- 239
		return _accum_0 -- 239
	end)(), -- 239
	death_sounds = (function() -- 240
		local _accum_0 = { } -- 240
		local _len_0 = 1 -- 240
		for i = 1, 3 do -- 240
			_accum_0[_len_0] = "placenta/death/prole" .. tostring(i) .. ".wav" -- 240
			_len_0 = _len_0 + 1 -- 240
		end -- 240
		return _accum_0 -- 240
	end)(), -- 240
	crosstext = function(ply) -- 241
		local text = "Don't panic." -- 242
		do -- 243
			local _exp_0 = lp:Team() -- 243
			if TEAM_PRIVATE == _exp_0 then -- 244
				text = "United in rank?" -- 245
			elseif TEAM_STALKER == _exp_0 then -- 246
				text = "A soldier from Lymphoma." -- 247
			elseif TEAM_SANITAR == _exp_0 then -- 248
				text = "These soldiers need guidance.\nPut the fear in their hearts." -- 249
			elseif TEAM_KORPSMAN == _exp_0 then -- 250
				text = "Smelly and stupid." -- 251
			elseif TEAM_KOMMANDANT == _exp_0 then -- 252
				text = "Is he working hard enough?" -- 253
			elseif TEAM_GHOST == _exp_0 then -- 254
				text = "Sad, but funny." -- 255
			elseif TEAM_BONEHEAD == _exp_0 then -- 256
				text = "SKIN...!" -- 257
			end -- 257
		end -- 257
		return { -- 258
			text = text, -- 258
			font = "Spleen_Label_Small" -- 258
		}, false -- 258
	end, -- 241
	first_names = { -- 259
		"Private", -- 259
		"PVT.", -- 259
		"Recruit" -- 259
	}, -- 259
	GenerateName = function(self, ply) -- 260
		local unit_id = math.random(100, 999) -- 261
		if unit_id < 10 then -- 262
			unit_id = "00" .. tostring(unit_id) -- 263
		elseif unit_id < 100 then -- 264
			unit_id = "0" .. tostring(unit_id) -- 265
		else -- 267
			unit_id = tostring(unit_id) -- 267
		end -- 262
		return self.first_names[math.random(1, #self.first_names)] .. " #" .. unit_id -- 268
	end, -- 260
	special_name = "private parts", -- 269
	special_name_chance = 1000, -- 270
	ShowSpare1 = open_player_menu, -- 271
	ShowSpare2 = open_action_menu, -- 272
	PlayerLoadout = function(ply) -- 273
		ply:ClearOddities() -- 274
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 275
		for slot, val in pairs({ -- 278
			[0] = 0, -- 278
			[1] = 0, -- 280
			[2] = 0, -- 282
			[3] = 0, -- 284
			[4] = 0, -- 286
			[5] = 0 -- 288
		}) do -- 289
			set_bodygroup(ply, slot, val) -- 276
		end -- 276
		return false -- 290
	end -- 273
}) -- 227
TEAM_SANITAR = DarkRP.createJob("Dragoon", { -- 293
	color = Color(25, 170, 0), -- 293
	model = "models/vel/evilwar/royalist.mdl", -- 294
	description = "The right hand of the Kommandant.\nRespected by his peers,\nfeared by his enemies.", -- 295
	weapons = { -- 296
		"evilrp_weapon/pacifier", -- 296
		"simple_hl2_stunstick" -- 296
	}, -- 296
	command = "ss", -- 297
	salary = 1, -- 298
	max = 6, -- 299
	hasLicense = true, -- 300
	ammo = { -- 302
		pistol = 60 -- 302
	}, -- 301
	category = "Royalists", -- 303
	speech_sounds = (function() -- 304
		local _accum_0 = { } -- 304
		local _len_0 = 1 -- 304
		for i = 1, 15 do -- 304
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 304
			_len_0 = _len_0 + 1 -- 304
		end -- 304
		return _accum_0 -- 304
	end)(), -- 304
	hurt_sounds = (function() -- 305
		local _accum_0 = { } -- 305
		local _len_0 = 1 -- 305
		for i = 1, 4 do -- 305
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 305
			_len_0 = _len_0 + 1 -- 305
		end -- 305
		return _accum_0 -- 305
	end)(), -- 305
	become_sounds = (function() -- 306
		local _accum_0 = { } -- 306
		local _len_0 = 1 -- 306
		for i = 1, 15 do -- 306
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 306
			_len_0 = _len_0 + 1 -- 306
		end -- 306
		return _accum_0 -- 306
	end)(), -- 306
	crosstext = function(ply) -- 307
		local text = "Don't panic." -- 308
		do -- 309
			local _exp_0 = lp:Team() -- 309
			if TEAM_PRIVATE == _exp_0 then -- 310
				text = "A Lymphomian legend!" -- 311
			elseif TEAM_STALKER == _exp_0 then -- 312
				text = "Fight or run?!" -- 313
			elseif TEAM_SANITAR == _exp_0 then -- 314
				text = "Finally...\nSomeone competent." -- 315
			elseif TEAM_KORPSMAN == _exp_0 then -- 316
				text = "Is that enemy blood?\nNo of course not." -- 317
			elseif TEAM_KOMMANDANT == _exp_0 then -- 318
				text = "A tentacle of mine." -- 319
			elseif TEAM_GHOST == _exp_0 then -- 320
				text = "Evil, stupid,\n maybe both." -- 321
			elseif TEAM_BONEHEAD == _exp_0 then -- 322
				text = "DANGER." -- 323
			end -- 323
		end -- 323
		return { -- 324
			text = text, -- 324
			font = "Spleen_Label_Small" -- 324
		}, true -- 324
	end, -- 307
	first_names = { -- 325
		"Subjugator", -- 325
		"Dragoner", -- 325
		"Persecuter", -- 325
		"Draconarius", -- 325
		"Volontaire" -- 325
	}, -- 325
	last_names = { -- 326
		"of Die Augen", -- 326
		"of Knochen", -- 326
		"of Sehne", -- 326
		"of Knorpel", -- 326
		"of Bauchspeicheldrüse" -- 326
	}, -- 326
	arms_model = "models/weapons/c_arms_refugee.mdl", -- 327
	ShowSpare1 = open_player_menu, -- 328
	ShowSpare2 = open_action_menu, -- 329
	bar_names = { -- 331
		health = "resolve" -- 331
	}, -- 330
	PlayerLoadout = function(ply) -- 332
		ply:ClearOddities() -- 333
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 334
		for slot, val in pairs({ -- 337
			[0] = 1, -- 337
			[1] = 1, -- 339
			[2] = 1, -- 341
			[3] = 2, -- 343
			[4] = 3, -- 345
			[5] = 0 -- 347
		}) do -- 348
			set_bodygroup(ply, slot, val) -- 335
		end -- 335
		return false -- 349
	end -- 332
}) -- 292
TEAM_DEALER = DarkRP.createJob("Quartermaster", { -- 352
	color = Color(255, 140, 0), -- 352
	model = { -- 353
		"models/liver_failure/liverish/liverish.mdl", -- 353
		"models/liver_failure/kidneystani/kidneystani.mdl", -- 354
		"models/liver_failure/arrythmian/arrythmian.mdl" -- 355
	}, -- 353
	description = "The left hand of the Kommandant.\nManage the goods and keep your men armed.", -- 356
	weapons = { }, -- 357
	command = "dealer", -- 358
	salary = 1, -- 359
	max = 1, -- 360
	hasLicense = false, -- 361
	category = "Royalists", -- 362
	speech_sounds = (function() -- 363
		local _accum_0 = { } -- 363
		local _len_0 = 1 -- 363
		for i = 1, 3 do -- 363
			_accum_0[_len_0] = "placenta/speech/dealer" .. tostring(i) .. ".wav" -- 363
			_len_0 = _len_0 + 1 -- 363
		end -- 363
		return _accum_0 -- 363
	end)(), -- 363
	first_names = { -- 364
		"Kanan", -- 364
		"Merce", -- 364
		"Ameel", -- 364
		"Otis", -- 364
		"Cedric", -- 364
		"Edwin", -- 364
		"Floy", -- 364
		"Benjamin", -- 364
		"Fortune", -- 364
		"William", -- 364
		"Thomas", -- 364
		"Dean", -- 364
		"Aurum", -- 364
		"Klep" -- 364
	}, -- 364
	last_names = { -- 365
		"Chapman", -- 365
		"Merchant", -- 365
		"Cash", -- 365
		"Keeper", -- 365
		"Bones", -- 365
		"Ryker", -- 365
		"Plutarch", -- 365
		"Nasir", -- 365
		"Greenback", -- 365
		"Grocer", -- 365
		"Flanders", -- 365
		"Hooper", -- 365
		"Watto", -- 365
		"Loman", -- 365
		"Stehlen", -- 365
		"Reichmann", -- 365
		"Kaufmann" -- 365
	}, -- 365
	special_name = "Unfortunate Shopkeep", -- 366
	special_name_chance = 1000, -- 367
	ShowSpare1 = open_player_menu, -- 368
	ShowSpare2 = open_action_menu, -- 369
	bar_names = { -- 371
		health = "insurance" -- 371
	}, -- 370
	PlayerLoadout = function(ply) -- 372
		ply:ClearOddities() -- 373
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 374
		for slot, val in pairs({ -- 377
			[0] = 0, -- 377
			[1] = 0, -- 379
			[2] = { -- 381
				3, -- 381
				5, -- 381
				16 -- 381
			}, -- 381
			[3] = 22, -- 383
			[4] = 0, -- 385
			[5] = 0, -- 387
			[6] = 1, -- 389
			[7] = 0, -- 391
			[8] = { -- 393
				0, -- 393
				1, -- 393
				2, -- 393
				3, -- 393
				4, -- 393
				5 -- 393
			}, -- 393
			[9] = 0 -- 395
		}) do -- 396
			set_bodygroup(ply, slot, val) -- 375
		end -- 375
		local skins = { -- 397
			2, -- 397
			4, -- 397
			5, -- 397
			6, -- 397
			7, -- 397
			8, -- 397
			9, -- 397
			10, -- 397
			11, -- 397
			12, -- 397
			13, -- 397
			14, -- 397
			15 -- 397
		} -- 397
		ply:SetSkin(skins[math.random(1, #skins)]) -- 398
		return false -- 399
	end -- 372
}) -- 351
TEAM_KORPSMAN = DarkRP.createJob("Sanitäter", { -- 402
	color = Color(79, 150, 150), -- 402
	model = "models/vel/evilwar/royalist.mdl", -- 403
	description = "You keep people alive in this terrible place.\nFill the blood and empty the rust.", -- 404
	weapons = { -- 405
		"evilrp/medkit" -- 405
	}, -- 405
	command = "medic", -- 406
	salary = 1, -- 407
	max = 2, -- 408
	hasLicense = false, -- 409
	medic = true, -- 410
	category = "Royalists", -- 411
	speech_sounds = (function() -- 412
		local _accum_0 = { } -- 412
		local _len_0 = 1 -- 412
		for i = 1, 4 do -- 412
			_accum_0[_len_0] = "placenta/speech/korps" .. tostring(i) .. ".wav" -- 412
			_len_0 = _len_0 + 1 -- 412
		end -- 412
		return _accum_0 -- 412
	end)(), -- 412
	hurt_sounds = (function() -- 413
		local _accum_0 = { } -- 413
		local _len_0 = 1 -- 413
		for i = 1, 4 do -- 413
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 413
			_len_0 = _len_0 + 1 -- 413
		end -- 413
		return _accum_0 -- 413
	end)(), -- 413
	become_sounds = { -- 414
		"items/suitchargeok1.wav" -- 414
	}, -- 414
	crosstext = function(ply) -- 415
		local text = "Don't panic." -- 416
		do -- 417
			local _exp_0 = lp:Team() -- 417
			if TEAM_PRIVATE == _exp_0 then -- 418
				text = "I forgot what\nto call these guys." -- 419
			elseif TEAM_STALKER == _exp_0 then -- 420
				text = "A walking blood bag." -- 421
			elseif TEAM_SANITAR == _exp_0 then -- 422
				text = "Better remember\nwho lets them live." -- 423
			elseif TEAM_KORPSMAN == _exp_0 then -- 424
				text = "Something to\nbe happy about." -- 425
			elseif TEAM_KOMMANDANT == _exp_0 then -- 426
				text = "What a strange,\nselfless thing." -- 427
			elseif TEAM_GHOST == _exp_0 then -- 428
				text = "A respectable mortal." -- 429
			elseif TEAM_BONEHEAD == _exp_0 then -- 430
				text = "CONFUSING." -- 431
			end -- 431
		end -- 431
		return { -- 432
			text = text, -- 432
			font = "Spleen_Label_Small" -- 432
		}, true -- 432
	end, -- 415
	first_names = { -- 433
		"Dissector", -- 433
		"Retractor", -- 433
		"Suture", -- 433
		"Femur", -- 433
		"Cystic", -- 433
		"Rasp", -- 433
		"Ferrum", -- 433
		"Fascia", -- 433
		"Marrow", -- 433
		"Lienis", -- 433
		"Aorta", -- 433
		"Tunica", -- 433
		"Maxilla", -- 433
		"Sacrum", -- 433
		"Leach" -- 433
	}, -- 433
	last_names = { -- 434
		"Forceps", -- 434
		"Scalpel", -- 434
		"Curette", -- 434
		"Rongeur", -- 434
		"Trocar", -- 434
		"Babcock", -- 434
		"Duval", -- 434
		"Hemostat", -- 434
		"Ossis", -- 434
		"Caro", -- 434
		"Cadaver", -- 434
		"Sanguis", -- 434
		"Bilis", -- 434
		"Viscera", -- 434
		"Jugular", -- 434
		"Clavius" -- 434
	}, -- 434
	special_name = "Corpseman", -- 435
	special_name_chance = 1000, -- 436
	ShowSpare1 = open_player_menu, -- 437
	ShowSpare2 = open_action_menu, -- 438
	bar_names = { -- 440
		health = "Bio-reserves" -- 440
	}, -- 439
	PlayerLoadout = function(ply) -- 441
		ply:ClearOddities() -- 442
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 443
		ply:SetSkin(4) -- 444
		for slot, val in pairs({ -- 447
			[0] = 0, -- 447
			[1] = 0, -- 449
			[2] = 2, -- 451
			[3] = 3, -- 453
			[4] = 1, -- 455
			[5] = 0 -- 457
		}) do -- 458
			set_bodygroup(ply, slot, val) -- 445
		end -- 445
		return false -- 459
	end -- 441
}) -- 401
TEAM_KOMMANDANT = DarkRP.createJob("Kommandant", { -- 462
	color = Color(150, 20, 20), -- 462
	model = "models/vel/evilwar/royalist.mdl", -- 463
	description = "Rule with an iron fist.", -- 464
	command = "kommandant", -- 465
	salary = 1, -- 466
	weapons = { -- 467
		"evilrp_weapon/novoluger" -- 467
	}, -- 467
	max = 1, -- 468
	weapons = { }, -- 469
	hasLicense = true, -- 470
	mayor = true, -- 471
	category = "Royalists", -- 472
	speech_sounds = (function() -- 473
		local _accum_0 = { } -- 473
		local _len_0 = 1 -- 473
		for i = 1, 15 do -- 473
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 473
			_len_0 = _len_0 + 1 -- 473
		end -- 473
		return _accum_0 -- 473
	end)(), -- 473
	become_sounds = { -- 474
		"kidneydagger/broadcast1.wav" -- 474
	}, -- 474
	crosstext = function(ply) -- 475
		local text = "Don't panic." -- 476
		do -- 477
			local _exp_0 = lp:Team() -- 477
			if TEAM_PRIVATE == _exp_0 then -- 478
				text = "Listen carefully." -- 479
			elseif TEAM_STALKER == _exp_0 then -- 480
				text = "Oh your magesty!" -- 481
			elseif TEAM_SANITAR == _exp_0 then -- 482
				text = "Hail, hail!" -- 483
			elseif TEAM_KORPSMAN == _exp_0 then -- 484
				text = "Is he feeling okay?" -- 485
			elseif TEAM_KOMMANDANT == _exp_0 then -- 486
				text = "Our strength\nshall prevail." -- 487
			elseif TEAM_GHOST == _exp_0 then -- 488
				text = "So full of lies." -- 489
			elseif TEAM_BONEHEAD == _exp_0 then -- 490
				text = "THERE HE IS!!" -- 491
			end -- 491
		end -- 491
		return { -- 492
			text = text, -- 492
			font = "Spleen_Label_Small" -- 492
		}, true -- 492
	end, -- 475
	first_names = ("Kommandant"), -- 493
	special_name = "Kamdonot", -- 494
	special_name_chance = 1000, -- 495
	ShowSpare1 = open_player_menu, -- 496
	ShowSpare2 = open_action_menu, -- 497
	bar_names = { -- 499
		health = "PRIDE" -- 499
	}, -- 498
	PlayerLoadout = function(ply) -- 500
		ply:ClearOddities() -- 501
		local oddities -- 502
		do -- 502
			local _accum_0 = { } -- 502
			local _len_0 = 1 -- 502
			for k, v in pairs(ODDITY.list) do -- 502
				if v ~= ODDITY_ILLITERACY then -- 502
					_accum_0[_len_0] = v -- 502
					_len_0 = _len_0 + 1 -- 502
				end -- 502
			end -- 502
			oddities = _accum_0 -- 502
		end -- 502
		ply:AddOddity(oddities[math.random(#oddities)]) -- 503
		for slot, val in pairs({ -- 506
			[0] = 1, -- 506
			[1] = 2, -- 508
			[2] = 0, -- 510
			[3] = 1, -- 512
			[4] = 2, -- 514
			[5] = 0 -- 516
		}) do -- 517
			set_bodygroup(ply, slot, val) -- 504
		end -- 504
		ply:SetNWInt("evilrp_gasmask", 4) -- 518
		ply:Give("evilrp_weapon/novoluger") -- 519
		return false -- 520
	end -- 500
}) -- 461
GAMEMODE.CivilProtection = { -- 523
	[TEAM_PRIVATE] = true, -- 523
	[TEAM_SANITAR] = true, -- 524
	[TEAM_KOMMANDANT] = true -- 525
} -- 522
GAMEMODE.DefaultTeam = TEAM_GHOST -- 527
