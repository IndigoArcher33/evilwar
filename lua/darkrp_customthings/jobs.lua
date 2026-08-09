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
	end -- 18
end -- 16
local open_action_menu -- 21
open_action_menu = function(ply) -- 21
	if not CLIENT then -- 22
		return -- 22
	end -- 22
	local tr = GAMEMODE:GetHandTrace(ply, 80) -- 23
	return GAMEMODE:OpenActionMenu(tr.HitPos, tr.Entity) -- 24
end -- 21
TEAM_GHOST = DarkRP.createJob("Ghost", { -- 27
	color = Color(150, 150, 150), -- 27
	model = "models/player/skeleton.mdl", -- 28
	description = "A lost soul.", -- 29
	instant_respawn = true, -- 30
	weapons = { }, -- 31
	command = "ghost", -- 32
	salary = 1, -- 33
	max = 0, -- 34
	cost = 0, -- 35
	use_machines = false, -- 36
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
			return ply:Notify("<c=0,200,0>YOU HAVE " .. tostring(ply:GetStemCells()) .. " STEM CELLS.") -- 52
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
}) -- 26
TEAM_STALKER = DarkRP.createJob("Stalker", { -- 88
	color = Color(71, 22, 0), -- 88
	model = "models/liver_failure/wastelander/wastelander.mdl", -- 89
	description = "A soul with no allegiance, destined to plunder the wasteland.", -- 90
	weapons = { -- 91
		"evilrp_weapon/whisper", -- 91
		"evilrp_melee/knife" -- 91
	}, -- 91
	category = "Wasteland", -- 92
	command = "stalker", -- 93
	use_machines = true, -- 94
	salary = 1, -- 95
	max = 3, -- 96
	cost = 4, -- 97
	can_build = true, -- 98
	hasLicense = false, -- 99
	candemote = false, -- 100
	use_machines = false, -- 101
	speech_sounds = (function() -- 102
		local _accum_0 = { } -- 102
		local _len_0 = 1 -- 102
		for i = 1, 4 do -- 102
			_accum_0[_len_0] = "speech/gruffprole" .. tostring(i) .. ".wav" -- 102
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
	Reflect = function(ply) -- 134
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I am a Stalker, an unpatriotic wastelander. I pawn off the Wasteland's treasures to the highest bidder. Unlike everyone else, I am talented at digging through trash. Bone capsules are of great use to me, I can use their contents for nutritious recipes that quench the soul") -- 135
	end, -- 134
	PlayerLoadout = function(ply) -- 136
		ply:ClearOddities() -- 137
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 138
		for slot, val in pairs({ -- 141
			[0] = 0, -- 141
			[1] = 2, -- 143
			[2] = { -- 145
				2, -- 145
				3, -- 145
				8, -- 145
				6 -- 145
			}, -- 145
			[3] = { -- 147
				19, -- 147
				20 -- 147
			}, -- 147
			[4] = 0, -- 149
			[5] = 0, -- 151
			[6] = { -- 153
				0, -- 153
				1, -- 153
				2, -- 153
				3 -- 153
			}, -- 153
			[7] = 0, -- 155
			[8] = 0, -- 157
			[9] = { -- 159
				0, -- 159
				1 -- 159
			} -- 159
		}) do -- 160
			set_bodygroup(ply, slot, val) -- 139
		end -- 139
		local skins = { -- 161
			4, -- 161
			6, -- 161
			7 -- 161
		} -- 161
		ply:SetSkin(skins[math.random(1, #skins)]) -- 162
		return false -- 163
	end -- 136
}) -- 87
do -- 165
	local _class_0 -- 165
	local _parent_0 = SOUND -- 165
	local _base_0 = { -- 165
		sound = "placenta/bonehead_aggrod4.wav", -- 167
		pitch = { -- 167
			200, -- 167
			250 -- 167
		} -- 165
	} -- 165
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 167
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 165
			_base_0[_key_0] = _val_0 -- 165
		end -- 165
	end -- 167
	if _base_0.__index == nil then -- 165
		_base_0.__index = _base_0 -- 165
	end -- 167
	setmetatable(_base_0, _parent_0.__base) -- 165
	_class_0 = setmetatable({ -- 165
		__init = function(self, ...) -- 165
			return _class_0.__parent.__init(self, ...) -- 165
		end, -- 165
		__base = _base_0, -- 165
		__name = "SpeechBonehead", -- 165
		__parent = _parent_0 -- 165
	}, { -- 165
		__index = function(cls, name) -- 165
			local val = rawget(_base_0, name) -- 165
			if val == nil then -- 165
				local parent = rawget(cls, "__parent") -- 165
				if parent then -- 165
					return parent[name] -- 165
				end -- 165
			else -- 165
				return val -- 165
			end -- 165
		end, -- 165
		__call = function(cls, ...) -- 165
			local _self_0 = setmetatable({ }, _base_0) -- 165
			cls.__init(_self_0, ...) -- 165
			return _self_0 -- 165
		end -- 165
	}) -- 165
	_base_0.__class = _class_0 -- 165
	if _parent_0.__inherited then -- 165
		_parent_0.__inherited(_parent_0, _class_0) -- 165
	end -- 165
	SpeechBonehead = _class_0 -- 165
end -- 167
TEAM_BONEHEAD = DarkRP.createJob("Bonehead", { -- 170
	color = Color(150, 150, 150), -- 170
	model = "models/player/zombie_fast.mdl", -- 171
	description = "evil fucker.", -- 172
	instant_respawn = true, -- 173
	command = "bonehead", -- 174
	category = "Scum of Liver Failure", -- 175
	salary = 1, -- 176
	max = 2, -- 177
	cost = 2, -- 178
	use_machines = false, -- 179
	speech_sounds = "SpeechBonehead", -- 180
	hurt_sounds = (function() -- 181
		local _accum_0 = { } -- 181
		local _len_0 = 1 -- 181
		for i = 1, 2 do -- 181
			_accum_0[_len_0] = "placenta/bonehead_slice" .. tostring(i) .. ".wav" -- 181
			_len_0 = _len_0 + 1 -- 181
		end -- 181
		return _accum_0 -- 181
	end)(), -- 181
	become_sounds = (function() -- 182
		local _accum_0 = { } -- 182
		local _len_0 = 1 -- 182
		for i = 1, 4 do -- 182
			_accum_0[_len_0] = "placenta/bonehead_aggrod" .. tostring(i) .. ".wav" -- 182
			_len_0 = _len_0 + 1 -- 182
		end -- 182
		return _accum_0 -- 182
	end)(), -- 182
	crosstext = function(ply) -- 183
		local text = "Don't panic." -- 184
		do -- 185
			local _exp_0 = lp:Team() -- 185
			if TEAM_PRIVATE == _exp_0 then -- 186
				text = "Oh no! He's real!" -- 187
			elseif TEAM_SANITAR == _exp_0 then -- 188
				text = "Oh boy." -- 189
			elseif TEAM_KORPSMAN == _exp_0 then -- 190
				text = "Oh no! It happened again!" -- 191
			elseif TEAM_DEALER == _exp_0 then -- 192
				text = "Free ribs to feed the troops." -- 193
			elseif TEAM_EMPEROR == _exp_0 then -- 194
				text = "Ha. It happened again." -- 195
			elseif TEAM_GHOST == _exp_0 then -- 196
				text = "Lookin' good." -- 197
			elseif TEAM_BONEHEAD == _exp_0 then -- 198
				text = "THERE'S ANOTHER ONE." -- 199
			end -- 199
		end -- 199
		return { -- 200
			text = text, -- 200
			font = "Spleen_Label_Small" -- 200
		}, false -- 200
	end, -- 183
	first_names = { -- 201
		"Evil" -- 201
	}, -- 201
	last_names = { -- 202
		"Fucker" -- 202
	}, -- 202
	no_needs = true, -- 203
	hint = "You are a truly pissed off skeleton. Go get 'em!", -- 204
	bar_names = { -- 206
		health = "EVIL FUCKER POWER" -- 206
	}, -- 205
	bar_colors = { -- 208
		health = Color(200, 0, 0) -- 208
	}, -- 207
	RenderScreenspaceEffects = function(ply) -- 209
		local ct = CurTime() -- 210
		DrawMotionBlur(0.25, 0.2, 0.3) -- 211
		return DrawSharpen(1 * math.sin(ct), 2 * math.random(0.8, 1.2)) -- 212
	end, -- 209
	ColorMod = function(ply) -- 213
		local abs, cos, sin = math.abs, math.cos, math.sin -- 214
		local ct = CurTime() -- 215
		local tab = { -- 217
			["$pp_colour_addr"] = 0.1, -- 217
			["$pp_colour_addg"] = 0, -- 218
			["$pp_colour_addb"] = 0, -- 219
			["$pp_colour_brightness"] = 0 + (-0.01 * cos(ct)), -- 220
			["$pp_colour_contrast"] = 1.6 + (abs(sin(ct * 0.166)) * 0.5), -- 221
			["$pp_colour_colour"] = 0, -- 222
			["$pp_colour_mulr"] = 0 + abs(sin(ct * 0.789)), -- 223
			["$pp_colour_mulg"] = 0, -- 224
			["$pp_colour_mulb"] = 0 -- 225
		} -- 216
		return tab -- 226
	end, -- 213
	ShowSpare1 = function() -- 227
		if CLIENT then -- 228
			return GAMEMODE:Frighten() -- 229
		end -- 228
	end, -- 227
	ShowSpare2 = function() -- 230
		if CLIENT then -- 231
			return GAMEMODE:Frighten() -- 232
		end -- 231
	end, -- 230
	Reflect = function(ply) -- 233
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=210,0,0>ARRRRGHH, I MUST KILL THEM ALL AND TAKE THEIR SKIN!!!") -- 234
	end, -- 233
	PlayerLoadout = function(ply) -- 235
		ply:SetNWInt("evilrp_gasmask", 0) -- 236
		ply:Give("evilrp_melee/hands/boneclaws") -- 237
		return true -- 238
	end, -- 235
	HandleRagdoll = function(rag, ply) -- 239
		return rag:SetNWInt("decomp_stage", DSTAGE_BONES) -- 240
	end -- 239
}) -- 169
TEAM_PRIVATE = DarkRP.createJob("Private", { -- 243
	color = Color(20, 150, 20), -- 243
	model = "models/vel/evilwar/royalist.mdl", -- 244
	description = "A new recruit that hasn't gone through training yet.", -- 245
	command = "proletariat", -- 246
	salary = 1, -- 247
	max = 0, -- 248
	cost = 0, -- 249
	hasLicense = true, -- 250
	candemote = false, -- 251
	use_machines = true, -- 252
	category = "Royalists", -- 253
	speech_sounds = (function() -- 254
		local _accum_0 = { } -- 254
		local _len_0 = 1 -- 254
		for i = 1, 3 do -- 254
			_accum_0[_len_0] = "placenta/speech/prole" .. tostring(i) .. ".wav" -- 254
			_len_0 = _len_0 + 1 -- 254
		end -- 254
		return _accum_0 -- 254
	end)(), -- 254
	hurt_sounds = (function() -- 255
		local _accum_0 = { } -- 255
		local _len_0 = 1 -- 255
		for i = 1, 5 do -- 255
			_accum_0[_len_0] = "placenta/pain/prole" .. tostring(i) .. ".wav" -- 255
			_len_0 = _len_0 + 1 -- 255
		end -- 255
		return _accum_0 -- 255
	end)(), -- 255
	become_sounds = (function() -- 256
		local _accum_0 = { } -- 256
		local _len_0 = 1 -- 256
		for i = 1, 3 do -- 256
			_accum_0[_len_0] = "npc/zombie/zombie_alert" .. tostring(i) .. ".wav" -- 256
			_len_0 = _len_0 + 1 -- 256
		end -- 256
		return _accum_0 -- 256
	end)(), -- 256
	death_sounds = (function() -- 257
		local _accum_0 = { } -- 257
		local _len_0 = 1 -- 257
		for i = 1, 3 do -- 257
			_accum_0[_len_0] = "placenta/death/prole" .. tostring(i) .. ".wav" -- 257
			_len_0 = _len_0 + 1 -- 257
		end -- 257
		return _accum_0 -- 257
	end)(), -- 257
	crosstext = function(ply) -- 258
		local text = "Don't panic." -- 259
		do -- 260
			local _exp_0 = lp:Team() -- 260
			if TEAM_PRIVATE == _exp_0 then -- 261
				text = "United in rank?" -- 262
			elseif TEAM_STALKER == _exp_0 then -- 263
				text = "A soldier from Lymphoma." -- 264
			elseif TEAM_SANITAR == _exp_0 then -- 265
				text = "These soldiers need guidance.\nPut the fear in their hearts." -- 266
			elseif TEAM_KORPSMAN == _exp_0 then -- 267
				text = "Smelly and stupid." -- 268
			elseif TEAM_DEALER == _exp_0 then -- 269
				text = "Prove your place, worm.\nOnly then will you be decorated." -- 270
			elseif TEAM_EMPEROR == _exp_0 then -- 271
				text = "Is he working hard enough?" -- 272
			elseif TEAM_GHOST == _exp_0 then -- 273
				text = "Sad, but funny." -- 274
			elseif TEAM_BONEHEAD == _exp_0 then -- 275
				text = "SKIN...!" -- 276
			end -- 276
		end -- 276
		return { -- 277
			text = text, -- 277
			font = "Spleen_Label_Small" -- 277
		}, false -- 277
	end, -- 258
	first_names = { -- 278
		"Private", -- 278
		"PVT.", -- 278
		"Recruit", -- 278
		"Enlistee", -- 278
		"Grunt", -- 278
		"Fodder", -- 278
		"Cadet", -- 278
		"CDT.", -- 278
		"Rookie" -- 278
	}, -- 278
	GenerateName = function(self, ply) -- 279
		local unit_id = math.random(1, 99) -- 280
		if unit_id < 10 then -- 281
			unit_id = "0" .. tostring(unit_id) -- 282
		else -- 284
			unit_id = tostring(unit_id) -- 284
		end -- 281
		return self.first_names[math.random(1, #self.first_names)] .. " #" .. unit_id -- 285
	end, -- 279
	special_name = "private parts", -- 286
	special_name_chance = 1000, -- 287
	ShowSpare1 = open_player_menu, -- 288
	ShowSpare2 = open_action_menu, -- 289
	Reflect = function(ply) -- 290
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I am a patriotic Lymphoman resident, a laborer and combatant. I must remain productive, my body should be used for the greater good. <c=0,210,0> I can be conscripted by the EMPEROR.") -- 291
	end, -- 290
	PlayerLoadout = function(ply) -- 292
		ply:ClearOddities() -- 293
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 294
		for slot, val in pairs({ -- 297
			[0] = 0, -- 297
			[1] = 0, -- 299
			[3] = { -- 301
				0, -- 301
				6, -- 301
				7, -- 301
				8 -- 301
			}, -- 301
			[4] = { -- 303
				0, -- 303
				4 -- 303
			}, -- 303
			[5] = 0, -- 305
			[6] = 0 -- 307
		}) do -- 308
			set_bodygroup(ply, slot, val) -- 295
		end -- 295
		return false -- 309
	end -- 292
}) -- 242
TEAM_CONSCRIPT = DarkRP.createJob("Conscript", { -- 312
	color = Color(19, 51, 45), -- 312
	model = "models/vel/evilwar/royalist.mdl", -- 313
	description = "The fate of those who don't make the cut.", -- 314
	weapons = { -- 315
		"evilrp_weapon/obrez", -- 315
		"evilrp_melee/pipe" -- 315
	}, -- 315
	command = "conscript", -- 316
	salary = 1, -- 317
	max = 5, -- 318
	cost = 1, -- 319
	hasLicense = true, -- 320
	use_machines = false, -- 321
	ammo = { -- 323
		pistol = 60 -- 323
	}, -- 322
	category = "Royalists", -- 324
	speech_sounds = (function() -- 325
		local _accum_0 = { } -- 325
		local _len_0 = 1 -- 325
		for i = 1, 15 do -- 325
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 325
			_len_0 = _len_0 + 1 -- 325
		end -- 325
		return _accum_0 -- 325
	end)(), -- 325
	hurt_sounds = (function() -- 326
		local _accum_0 = { } -- 326
		local _len_0 = 1 -- 326
		for i = 1, 4 do -- 326
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 326
			_len_0 = _len_0 + 1 -- 326
		end -- 326
		return _accum_0 -- 326
	end)(), -- 326
	become_sounds = (function() -- 327
		local _accum_0 = { } -- 327
		local _len_0 = 1 -- 327
		for i = 1, 15 do -- 327
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 327
			_len_0 = _len_0 + 1 -- 327
		end -- 327
		return _accum_0 -- 327
	end)(), -- 327
	crosstext = function(ply) -- 328
		local text = "Don't panic." -- 329
		do -- 330
			local _exp_0 = lp:Team() -- 330
			if TEAM_PRIVATE == _exp_0 then -- 331
				text = "I could be like him!" -- 332
			elseif TEAM_STALKER == _exp_0 then -- 333
				text = "Poor bastard." -- 334
			elseif TEAM_SANITAR == _exp_0 then -- 335
				text = "A fine meat shield." -- 336
			elseif TEAM_KORPSMAN == _exp_0 then -- 337
				text = "Fodder, made to die\n Unless..." -- 338
			elseif TEAM_DEALER == _exp_0 then -- 339
				text = "A follower of mine." -- 340
			elseif TEAM_EMPEROR == _exp_0 then -- 341
				text = "Cannon fodder, splendid." -- 342
			elseif TEAM_CONSCRIPT == _exp_0 then -- 343
				text = "United in blood." -- 344
			elseif TEAM_GHOST == _exp_0 then -- 345
				text = "Definitely stupid." -- 346
			elseif TEAM_BONEHEAD == _exp_0 then -- 347
				text = "HAHAHAH." -- 348
			end -- 348
		end -- 348
		return { -- 349
			text = text, -- 349
			font = "Spleen_Label_Small" -- 349
		}, false -- 349
	end, -- 328
	first_names = { -- 350
		"Fodder", -- 350
		"Meatshield", -- 350
		"Grunt", -- 350
		"Drone", -- 350
		"Conscript", -- 350
		"Meatbag" -- 350
	}, -- 350
	GenerateName = function(self, ply) -- 351
		local unit_id = math.random(1, 99) -- 352
		if unit_id < 10 then -- 353
			unit_id = "0" .. tostring(unit_id) -- 354
		else -- 356
			unit_id = tostring(unit_id) -- 356
		end -- 353
		return self.first_names[math.random(1, #self.first_names)] .. " #" .. unit_id -- 357
	end, -- 351
	special_name = "private parts", -- 358
	special_name_chance = 1000, -- 359
	ShowSpare1 = open_player_menu, -- 360
	ShowSpare2 = open_action_menu, -- 361
	Reflect = function(ply) -- 362
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I have been conscripted by the EMPEROR himself. I must patrol the Wasteland and prevent the entry of foreign invaders, and risk my life for the Emperor. This role holds responsibility.<c=210,0,0> I must not purposely cause the deaths of your comrades.") -- 363
	end, -- 362
	PlayerLoadout = function(ply) -- 364
		for slot, val in pairs({ -- 367
			[0] = 0, -- 367
			[2] = 0, -- 369
			[3] = { -- 371
				7, -- 371
				8 -- 371
			}, -- 371
			[4] = { -- 373
				0, -- 373
				4 -- 373
			}, -- 373
			[5] = 0, -- 375
			[6] = 0, -- 377
			[7] = 1 -- 379
		}) do -- 380
			set_bodygroup(ply, slot, val) -- 365
		end -- 365
		ply:SetArmor(25) -- 381
		return false -- 382
	end -- 364
}) -- 311
TEAM_SANITAR = DarkRP.createJob("Dragoon", { -- 385
	color = Color(0, 25, 93), -- 385
	model = "models/vel/evilwar/royalist.mdl", -- 386
	description = "The right hand of the Emperor.\nRespected by his peers,\nfeared by his enemies.", -- 387
	weapons = { -- 388
		"evilrp_weapon/hope", -- 388
		"evilrp_melee/sabre" -- 388
	}, -- 388
	command = "ss", -- 389
	salary = 1, -- 390
	max = 6, -- 391
	cost = 3, -- 392
	hasLicense = true, -- 393
	use_machines = false, -- 394
	ammo = { -- 396
		pistol = 60 -- 396
	}, -- 395
	category = "Royalists", -- 397
	speech_sounds = (function() -- 398
		local _accum_0 = { } -- 398
		local _len_0 = 1 -- 398
		for i = 1, 15 do -- 398
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 398
			_len_0 = _len_0 + 1 -- 398
		end -- 398
		return _accum_0 -- 398
	end)(), -- 398
	hurt_sounds = (function() -- 399
		local _accum_0 = { } -- 399
		local _len_0 = 1 -- 399
		for i = 1, 4 do -- 399
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 399
			_len_0 = _len_0 + 1 -- 399
		end -- 399
		return _accum_0 -- 399
	end)(), -- 399
	become_sounds = (function() -- 400
		local _accum_0 = { } -- 400
		local _len_0 = 1 -- 400
		for i = 1, 15 do -- 400
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 400
			_len_0 = _len_0 + 1 -- 400
		end -- 400
		return _accum_0 -- 400
	end)(), -- 400
	crosstext = function(ply) -- 401
		local text = "Don't panic." -- 402
		do -- 403
			local _exp_0 = lp:Team() -- 403
			if TEAM_PRIVATE == _exp_0 then -- 404
				text = "A Lymphomian legend!" -- 405
			elseif TEAM_STALKER == _exp_0 then -- 406
				text = "Fight or run?!" -- 407
			elseif TEAM_SANITAR == _exp_0 then -- 408
				text = "Finally...\nSomeone competent." -- 409
			elseif TEAM_KORPSMAN == _exp_0 then -- 410
				text = "Is that enemy blood?\nNo of course not." -- 411
			elseif TEAM_DEALER == _exp_0 then -- 412
				text = "A follower of mine." -- 413
			elseif TEAM_EMPEROR == _exp_0 then -- 414
				text = "A tentacle of mine." -- 415
			elseif TEAM_GHOST == _exp_0 then -- 416
				text = "Evil, stupid,\n maybe both." -- 417
			elseif TEAM_BONEHEAD == _exp_0 then -- 418
				text = "DANGER." -- 419
			end -- 419
		end -- 419
		return { -- 420
			text = text, -- 420
			font = "Spleen_Label_Small" -- 420
		}, true -- 420
	end, -- 401
	first_names = { -- 421
		"Subjugator", -- 421
		"Dragoner", -- 421
		"Persecuter", -- 421
		"Draconarius", -- 421
		"Volontaire" -- 421
	}, -- 421
	last_names = { -- 422
		"of Die Augen", -- 422
		"of Knochen", -- 422
		"of Sehne", -- 422
		"of Knorpel", -- 422
		"of Bauchspeicheldrüse" -- 422
	}, -- 422
	arms_model = "models/weapons/c_arms_refugee.mdl", -- 423
	ShowSpare1 = open_player_menu, -- 424
	ShowSpare2 = open_action_menu, -- 425
	bar_names = { -- 427
		health = "resolve" -- 427
	}, -- 426
	Reflect = function(ply) -- 428
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I am part of the EMPEROR's finest soldiers. The Privates, Conscripts, and Sanitaters are my subordinates, whilst the EMPEROR and the Quartermaster are my superiors. <c=0,210,0>I must keep order within the city, and the machines tidy") -- 429
	end, -- 428
	PlayerLoadout = function(ply) -- 430
		ply:ClearOddities() -- 431
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 432
		for slot, val in pairs({ -- 435
			[0] = 1, -- 435
			[1] = 1, -- 437
			[2] = 1, -- 439
			[3] = 2, -- 441
			[4] = 3, -- 443
			[5] = 0 -- 445
		}) do -- 446
			set_bodygroup(ply, slot, val) -- 433
		end -- 433
		ply:SetArmor(40) -- 447
		return false -- 448
	end -- 430
}) -- 384
TEAM_DEALER = DarkRP.createJob("Quartermaster", { -- 451
	color = Color(255, 140, 0), -- 451
	model = "models/vel/evilwar/royalist.mdl", -- 452
	description = "The left hand of the Emperor.\nManage the goods and keep your men armed.", -- 453
	weapons = { }, -- 454
	command = "dealer", -- 455
	salary = 1, -- 456
	max = 1, -- 457
	cost = 3, -- 458
	hasLicense = false, -- 459
	use_machines = false, -- 460
	category = "Royalists", -- 461
	speech_sounds = (function() -- 462
		local _accum_0 = { } -- 462
		local _len_0 = 1 -- 462
		for i = 1, 3 do -- 462
			_accum_0[_len_0] = "placenta/speech/dealer" .. tostring(i) .. ".wav" -- 462
			_len_0 = _len_0 + 1 -- 462
		end -- 462
		return _accum_0 -- 462
	end)(), -- 462
	hurt_sounds = (function() -- 463
		local _accum_0 = { } -- 463
		local _len_0 = 1 -- 463
		for i = 1, 4 do -- 463
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 463
			_len_0 = _len_0 + 1 -- 463
		end -- 463
		return _accum_0 -- 463
	end)(), -- 463
	become_sounds = (function() -- 464
		local _accum_0 = { } -- 464
		local _len_0 = 1 -- 464
		for i = 1, 15 do -- 464
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 464
			_len_0 = _len_0 + 1 -- 464
		end -- 464
		return _accum_0 -- 464
	end)(), -- 464
	crosstext = function(ply) -- 465
		local text = "Don't panic." -- 466
		do -- 467
			local _exp_0 = lp:Team() -- 467
			if TEAM_PRIVATE == _exp_0 then -- 468
				text = "This guy handles the guns." -- 469
			elseif TEAM_STALKER == _exp_0 then -- 470
				text = "Captain of the goods." -- 471
			elseif TEAM_SANITAR == _exp_0 then -- 472
				text = "The oldest living Dragoon.\nRespect. Honor." -- 473
			elseif TEAM_KORPSMAN == _exp_0 then -- 474
				text = "A reminder of the power of Kapitalism." -- 475
			elseif TEAM_DEALER == _exp_0 then -- 476
				text = "I'm seeing double!" -- 477
			elseif TEAM_EMPEROR == _exp_0 then -- 478
				text = "My brother in arms.\nIf he fails, I'll cut his off." -- 479
			elseif TEAM_GHOST == _exp_0 then -- 480
				text = "Glorified accountant." -- 481
			elseif TEAM_BONEHEAD == _exp_0 then -- 482
				text = "BONES ARE HIS DOLLARS." -- 483
			end -- 483
		end -- 483
		return { -- 484
			text = text, -- 484
			font = "Spleen_Label_Small" -- 484
		}, true -- 484
	end, -- 465
	first_names = { -- 485
		"Quartermaster", -- 485
		"Quartiermeister" -- 485
	}, -- 485
	last_names = { -- 486
		"Kommissariatsdienst" -- 486
	}, -- 486
	special_name = "Trusty", -- 487
	special_name_chance = 1000, -- 488
	ShowSpare1 = open_player_menu, -- 489
	ShowSpare2 = open_action_menu, -- 490
	bar_names = { -- 492
		health = "insurance" -- 492
	}, -- 491
	PlayerLoadout = function(ply) -- 493
		ply:ClearOddities() -- 494
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 495
		for slot, val in pairs({ -- 498
			[0] = 1, -- 498
			[1] = 1, -- 500
			[2] = 1, -- 502
			[3] = 1, -- 504
			[4] = 3, -- 506
			[5] = 0 -- 508
		}) do -- 509
			set_bodygroup(ply, slot, val) -- 496
		end -- 496
		return false -- 510
	end -- 493
}) -- 450
TEAM_KORPSMAN = DarkRP.createJob("Sanitater", { -- 513
	color = Color(79, 150, 150), -- 513
	model = "models/vel/evilwar/royalist.mdl", -- 514
	description = "You keep people alive in this terrible place.\nFill the blood and empty the rust.", -- 515
	weapons = { -- 516
		"evilrp/medkit" -- 516
	}, -- 516
	command = "medic", -- 517
	salary = 1, -- 518
	max = 2, -- 519
	cost = 2, -- 520
	hasLicense = false, -- 521
	medic = true, -- 522
	use_machines = false, -- 523
	category = "Royalists", -- 524
	speech_sounds = (function() -- 525
		local _accum_0 = { } -- 525
		local _len_0 = 1 -- 525
		for i = 1, 4 do -- 525
			_accum_0[_len_0] = "placenta/speech/korps" .. tostring(i) .. ".wav" -- 525
			_len_0 = _len_0 + 1 -- 525
		end -- 525
		return _accum_0 -- 525
	end)(), -- 525
	hurt_sounds = (function() -- 526
		local _accum_0 = { } -- 526
		local _len_0 = 1 -- 526
		for i = 1, 4 do -- 526
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 526
			_len_0 = _len_0 + 1 -- 526
		end -- 526
		return _accum_0 -- 526
	end)(), -- 526
	become_sounds = { -- 527
		"items/suitchargeok1.wav" -- 527
	}, -- 527
	crosstext = function(ply) -- 528
		local text = "Don't panic." -- 529
		do -- 530
			local _exp_0 = lp:Team() -- 530
			if TEAM_PRIVATE == _exp_0 then -- 531
				text = "I forgot what\nto call these guys." -- 532
			elseif TEAM_STALKER == _exp_0 then -- 533
				text = "A walking blood bag." -- 534
			elseif TEAM_SANITAR == _exp_0 then -- 535
				text = "Better remember\nwho lets them live." -- 536
			elseif TEAM_KORPSMAN == _exp_0 then -- 537
				text = "Something to\nbe happy about." -- 538
			elseif TEAM_DEALER == _exp_0 then -- 539
				text = "Keep them busy.\nWe need their blood and sweat." -- 540
			elseif TEAM_EMPEROR == _exp_0 then -- 541
				text = "What a strange,\nselfless thing." -- 542
			elseif TEAM_GHOST == _exp_0 then -- 543
				text = "A respectable mortal." -- 544
			elseif TEAM_BONEHEAD == _exp_0 then -- 545
				text = "CONFUSING." -- 546
			end -- 546
		end -- 546
		return { -- 547
			text = text, -- 547
			font = "Spleen_Label_Small" -- 547
		}, true -- 547
	end, -- 528
	first_names = { -- 548
		"Dissector", -- 548
		"Retractor", -- 548
		"Suture", -- 548
		"Femur", -- 548
		"Cystic", -- 548
		"Rasp", -- 548
		"Ferrum", -- 548
		"Fascia", -- 548
		"Marrow", -- 548
		"Lienis", -- 548
		"Aorta", -- 548
		"Tunica", -- 548
		"Maxilla", -- 548
		"Sacrum", -- 548
		"Leach" -- 548
	}, -- 548
	last_names = { -- 549
		"Forceps", -- 549
		"Scalpel", -- 549
		"Curette", -- 549
		"Rongeur", -- 549
		"Trocar", -- 549
		"Babcock", -- 549
		"Duval", -- 549
		"Hemostat", -- 549
		"Ossis", -- 549
		"Caro", -- 549
		"Cadaver", -- 549
		"Sanguis", -- 549
		"Bilis", -- 549
		"Viscera", -- 549
		"Jugular", -- 549
		"Clavius" -- 549
	}, -- 549
	special_name = "Corpseman", -- 550
	special_name_chance = 1000, -- 551
	ShowSpare1 = open_player_menu, -- 552
	ShowSpare2 = open_action_menu, -- 553
	bar_names = { -- 555
		health = "Bio-reserves" -- 555
	}, -- 554
	PlayerLoadout = function(ply) -- 556
		ply:ClearOddities() -- 557
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 558
		ply:SetSkin(4) -- 559
		for slot, val in pairs({ -- 562
			[0] = 0, -- 562
			[1] = 0, -- 564
			[2] = 2, -- 566
			[3] = 3, -- 568
			[4] = 1, -- 570
			[5] = 0 -- 572
		}) do -- 573
			set_bodygroup(ply, slot, val) -- 560
		end -- 560
		return false -- 574
	end -- 556
}) -- 512
TEAM_EMPEROR = DarkRP.createJob("Emperor", { -- 577
	color = Color(150, 20, 20), -- 577
	model = "models/vel/evilwar/royalist.mdl", -- 578
	description = "Rule with an iron fist.", -- 579
	command = "emperor", -- 580
	salary = 1, -- 581
	weapons = { -- 582
		"evilrp_weapon/novoluger" -- 582
	}, -- 582
	max = 1, -- 583
	cost = 5, -- 584
	weapons = { }, -- 585
	hasLicense = true, -- 586
	mayor = true, -- 587
	use_machines = false, -- 588
	category = "Royalists", -- 589
	speech_sounds = (function() -- 590
		local _accum_0 = { } -- 590
		local _len_0 = 1 -- 590
		for i = 1, 15 do -- 590
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 590
			_len_0 = _len_0 + 1 -- 590
		end -- 590
		return _accum_0 -- 590
	end)(), -- 590
	become_sounds = { -- 591
		"kidneydagger/broadcast1.wav" -- 591
	}, -- 591
	crosstext = function(ply) -- 592
		local text = "Don't panic." -- 593
		do -- 594
			local _exp_0 = lp:Team() -- 594
			if TEAM_PRIVATE == _exp_0 then -- 595
				text = "Listen carefully." -- 596
			elseif TEAM_STALKER == _exp_0 then -- 597
				text = "Oh, your majesty!" -- 598
			elseif TEAM_SANITAR == _exp_0 then -- 599
				text = "Hail, hail!" -- 600
			elseif TEAM_KORPSMAN == _exp_0 then -- 601
				text = "Is he feeling okay?" -- 602
			elseif TEAM_DEALER == _exp_0 then -- 603
				text = "Glorious leader.\nI'm nothing without him." -- 604
			elseif TEAM_EMPEROR == _exp_0 then -- 605
				text = "Our strength\nshall prevail." -- 606
			elseif TEAM_GHOST == _exp_0 then -- 607
				text = "So full of lies." -- 608
			elseif TEAM_BONEHEAD == _exp_0 then -- 609
				text = "THERE HE IS!!" -- 610
			end -- 610
		end -- 610
		return { -- 611
			text = text, -- 611
			font = "Spleen_Label_Small" -- 611
		}, true -- 611
	end, -- 592
	first_names = { -- 613
		"Basileus", -- 613
		"Agrippa", -- 613
		"Gnaeus", -- 613
		"Gaius" -- 613
	}, -- 613
	last_names = { -- 614
		"Imperator Lymphoma", -- 614
		"Kaiser Lymphoma", -- 614
		"Rex Lymphoma", -- 614
		"Lymphoma Magnus" -- 614
	}, -- 614
	special_name = "Which Kaiser", -- 615
	special_name_chance = 1000, -- 616
	ShowSpare1 = open_player_menu, -- 617
	ShowSpare2 = open_action_menu, -- 618
	bar_names = { -- 620
		health = "PRIDE" -- 620
	}, -- 619
	Reflect = function(ply) -- 621
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I am the EMPEROR of Lymphoma. I am the supreme ruler of this city and its people. I decide who lives and who dies. <c=0,210,0>I can use my terminal to administrate our internal affairs.") -- 622
	end, -- 621
	PlayerLoadout = function(ply) -- 623
		ply:ClearOddities() -- 624
		local oddities -- 625
		do -- 625
			local _accum_0 = { } -- 625
			local _len_0 = 1 -- 625
			for k, v in pairs(ODDITY.list) do -- 625
				if v ~= ODDITY_ILLITERACY then -- 625
					_accum_0[_len_0] = v -- 625
					_len_0 = _len_0 + 1 -- 625
				end -- 625
			end -- 625
			oddities = _accum_0 -- 625
		end -- 625
		ply:AddOddity(oddities[math.random(#oddities)]) -- 626
		for slot, val in pairs({ -- 629
			[0] = 1, -- 629
			[1] = 2, -- 631
			[2] = 0, -- 633
			[3] = 1, -- 635
			[4] = 2, -- 637
			[5] = 0 -- 639
		}) do -- 640
			set_bodygroup(ply, slot, val) -- 627
		end -- 627
		ply:SetNWInt("evilrp_gasmask", 4) -- 641
		ply:Give("evilrp_weapon/novoluger") -- 642
		ply:SetArmor(65) -- 643
		return false -- 644
	end -- 623
}) -- 576
GAMEMODE.CivilProtection = { -- 647
	[TEAM_PRIVATE] = true, -- 647
	[TEAM_CONSCRIPT] = true, -- 648
	[TEAM_SANITAR] = true, -- 649
	[TEAM_EMPEROR] = true -- 650
} -- 646
GAMEMODE.DefaultTeam = TEAM_GHOST -- 652
