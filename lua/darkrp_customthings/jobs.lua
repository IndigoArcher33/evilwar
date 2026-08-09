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
		"evilrp_melee/pipe" -- 315
	}, -- 315
	randomweapon = { -- 316
		"evilrp_weapon/obrez", -- 316
		"evilrp_weapon/pacifier", -- 316
		"evilrp_weapon/warrant", -- 316
		"evilrp_weapon/viper" -- 316
	}, -- 316
	command = "conscript", -- 317
	salary = 1, -- 318
	max = 5, -- 319
	cost = 1, -- 320
	hasLicense = true, -- 321
	use_machines = false, -- 322
	ammo = { -- 324
		pistol = 60 -- 324
	}, -- 323
	category = "Royalists", -- 325
	speech_sounds = (function() -- 326
		local _accum_0 = { } -- 326
		local _len_0 = 1 -- 326
		for i = 1, 15 do -- 326
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 326
			_len_0 = _len_0 + 1 -- 326
		end -- 326
		return _accum_0 -- 326
	end)(), -- 326
	hurt_sounds = (function() -- 327
		local _accum_0 = { } -- 327
		local _len_0 = 1 -- 327
		for i = 1, 4 do -- 327
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 327
			_len_0 = _len_0 + 1 -- 327
		end -- 327
		return _accum_0 -- 327
	end)(), -- 327
	become_sounds = (function() -- 328
		local _accum_0 = { } -- 328
		local _len_0 = 1 -- 328
		for i = 1, 15 do -- 328
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 328
			_len_0 = _len_0 + 1 -- 328
		end -- 328
		return _accum_0 -- 328
	end)(), -- 328
	crosstext = function(ply) -- 329
		local text = "Don't panic." -- 330
		do -- 331
			local _exp_0 = lp:Team() -- 331
			if TEAM_PRIVATE == _exp_0 then -- 332
				text = "I could be like him!" -- 333
			elseif TEAM_STALKER == _exp_0 then -- 334
				text = "Poor bastard." -- 335
			elseif TEAM_SANITAR == _exp_0 then -- 336
				text = "A fine meat shield." -- 337
			elseif TEAM_KORPSMAN == _exp_0 then -- 338
				text = "Fodder, made to die\n Unless..." -- 339
			elseif TEAM_DEALER == _exp_0 then -- 340
				text = "A follower of mine." -- 341
			elseif TEAM_EMPEROR == _exp_0 then -- 342
				text = "Cannon fodder, splendid." -- 343
			elseif TEAM_CONSCRIPT == _exp_0 then -- 344
				text = "United in blood." -- 345
			elseif TEAM_GHOST == _exp_0 then -- 346
				text = "Definitely stupid." -- 347
			elseif TEAM_BONEHEAD == _exp_0 then -- 348
				text = "HAHAHAH." -- 349
			end -- 349
		end -- 349
		return { -- 350
			text = text, -- 350
			font = "Spleen_Label_Small" -- 350
		}, false -- 350
	end, -- 329
	first_names = { -- 351
		"Fodder", -- 351
		"Meatshield", -- 351
		"Grunt", -- 351
		"Drone", -- 351
		"Conscript", -- 351
		"Meatbag" -- 351
	}, -- 351
	GenerateName = function(self, ply) -- 352
		local unit_id = math.random(1, 99) -- 353
		if unit_id < 10 then -- 354
			unit_id = "0" .. tostring(unit_id) -- 355
		else -- 357
			unit_id = tostring(unit_id) -- 357
		end -- 354
		return self.first_names[math.random(1, #self.first_names)] .. " #" .. unit_id -- 358
	end, -- 352
	special_name = "private parts", -- 359
	special_name_chance = 1000, -- 360
	ShowSpare1 = open_player_menu, -- 361
	ShowSpare2 = open_action_menu, -- 362
	Reflect = function(ply) -- 363
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I have been conscripted by the EMPEROR himself. I must patrol the Wasteland and prevent the entry of foreign invaders, and risk my life for the Emperor. This role holds responsibility.<c=210,0,0> I must not purposely cause the deaths of your comrades.") -- 364
	end, -- 363
	PlayerLoadout = function(ply) -- 365
		for slot, val in pairs({ -- 368
			[0] = 0, -- 368
			[2] = 0, -- 370
			[3] = { -- 372
				7, -- 372
				8 -- 372
			}, -- 372
			[4] = { -- 374
				0, -- 374
				4 -- 374
			}, -- 374
			[5] = 0, -- 376
			[6] = 0, -- 378
			[7] = 1 -- 380
		}) do -- 381
			set_bodygroup(ply, slot, val) -- 366
		end -- 366
		ply:SetArmor(25) -- 382
		ply:Give(self.randomweapon[math.random(1, #self.randomweapon)]) -- 383
		return false -- 384
	end -- 365
}) -- 311
TEAM_SANITAR = DarkRP.createJob("Dragoon", { -- 387
	color = Color(0, 25, 93), -- 387
	model = "models/vel/evilwar/royalist.mdl", -- 388
	description = "The right hand of the Emperor.\nRespected by his peers,\nfeared by his enemies.", -- 389
	weapons = { -- 390
		"evilrp_weapon/hope", -- 390
		"evilrp_melee/sabre" -- 390
	}, -- 390
	command = "ss", -- 391
	salary = 1, -- 392
	max = 6, -- 393
	cost = 3, -- 394
	hasLicense = true, -- 395
	use_machines = false, -- 396
	ammo = { -- 398
		pistol = 60 -- 398
	}, -- 397
	category = "Royalists", -- 399
	speech_sounds = (function() -- 400
		local _accum_0 = { } -- 400
		local _len_0 = 1 -- 400
		for i = 1, 15 do -- 400
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 400
			_len_0 = _len_0 + 1 -- 400
		end -- 400
		return _accum_0 -- 400
	end)(), -- 400
	hurt_sounds = (function() -- 401
		local _accum_0 = { } -- 401
		local _len_0 = 1 -- 401
		for i = 1, 4 do -- 401
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 401
			_len_0 = _len_0 + 1 -- 401
		end -- 401
		return _accum_0 -- 401
	end)(), -- 401
	become_sounds = (function() -- 402
		local _accum_0 = { } -- 402
		local _len_0 = 1 -- 402
		for i = 1, 15 do -- 402
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 402
			_len_0 = _len_0 + 1 -- 402
		end -- 402
		return _accum_0 -- 402
	end)(), -- 402
	crosstext = function(ply) -- 403
		local text = "Don't panic." -- 404
		do -- 405
			local _exp_0 = lp:Team() -- 405
			if TEAM_PRIVATE == _exp_0 then -- 406
				text = "A Lymphomian legend!" -- 407
			elseif TEAM_STALKER == _exp_0 then -- 408
				text = "Fight or run?!" -- 409
			elseif TEAM_SANITAR == _exp_0 then -- 410
				text = "Finally...\nSomeone competent." -- 411
			elseif TEAM_KORPSMAN == _exp_0 then -- 412
				text = "Is that enemy blood?\nNo of course not." -- 413
			elseif TEAM_DEALER == _exp_0 then -- 414
				text = "A follower of mine." -- 415
			elseif TEAM_EMPEROR == _exp_0 then -- 416
				text = "A tentacle of mine." -- 417
			elseif TEAM_GHOST == _exp_0 then -- 418
				text = "Evil, stupid,\n maybe both." -- 419
			elseif TEAM_BONEHEAD == _exp_0 then -- 420
				text = "DANGER." -- 421
			end -- 421
		end -- 421
		return { -- 422
			text = text, -- 422
			font = "Spleen_Label_Small" -- 422
		}, true -- 422
	end, -- 403
	first_names = { -- 423
		"Subjugator", -- 423
		"Dragoner", -- 423
		"Persecuter", -- 423
		"Draconarius", -- 423
		"Volontaire" -- 423
	}, -- 423
	last_names = { -- 424
		"of Die Augen", -- 424
		"of Knochen", -- 424
		"of Sehne", -- 424
		"of Knorpel", -- 424
		"of Bauchspeicheldrüse" -- 424
	}, -- 424
	arms_model = "models/weapons/c_arms_refugee.mdl", -- 425
	ShowSpare1 = open_player_menu, -- 426
	ShowSpare2 = open_action_menu, -- 427
	bar_names = { -- 429
		health = "resolve" -- 429
	}, -- 428
	Reflect = function(ply) -- 430
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I am part of the EMPEROR's finest soldiers. The Privates, Conscripts, and Sanitaters are my subordinates, whilst the EMPEROR and the Quartermaster are my superiors. <c=0,210,0>I must keep order within the city, and the machines tidy") -- 431
	end, -- 430
	PlayerLoadout = function(ply) -- 432
		ply:ClearOddities() -- 433
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 434
		for slot, val in pairs({ -- 437
			[0] = 1, -- 437
			[1] = 1, -- 439
			[2] = 1, -- 441
			[3] = 2, -- 443
			[4] = 3, -- 445
			[5] = 0 -- 447
		}) do -- 448
			set_bodygroup(ply, slot, val) -- 435
		end -- 435
		ply:SetArmor(40) -- 449
		return false -- 450
	end -- 432
}) -- 386
TEAM_DEALER = DarkRP.createJob("Quartermaster", { -- 453
	color = Color(255, 140, 0), -- 453
	model = "models/vel/evilwar/royalist.mdl", -- 454
	description = "The left hand of the Emperor.\nManage the goods and keep your men armed.", -- 455
	weapons = { }, -- 456
	command = "dealer", -- 457
	salary = 1, -- 458
	max = 1, -- 459
	cost = 3, -- 460
	hasLicense = false, -- 461
	use_machines = false, -- 462
	category = "Royalists", -- 463
	speech_sounds = (function() -- 464
		local _accum_0 = { } -- 464
		local _len_0 = 1 -- 464
		for i = 1, 3 do -- 464
			_accum_0[_len_0] = "placenta/speech/dealer" .. tostring(i) .. ".wav" -- 464
			_len_0 = _len_0 + 1 -- 464
		end -- 464
		return _accum_0 -- 464
	end)(), -- 464
	hurt_sounds = (function() -- 465
		local _accum_0 = { } -- 465
		local _len_0 = 1 -- 465
		for i = 1, 4 do -- 465
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 465
			_len_0 = _len_0 + 1 -- 465
		end -- 465
		return _accum_0 -- 465
	end)(), -- 465
	become_sounds = (function() -- 466
		local _accum_0 = { } -- 466
		local _len_0 = 1 -- 466
		for i = 1, 15 do -- 466
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 466
			_len_0 = _len_0 + 1 -- 466
		end -- 466
		return _accum_0 -- 466
	end)(), -- 466
	crosstext = function(ply) -- 467
		local text = "Don't panic." -- 468
		do -- 469
			local _exp_0 = lp:Team() -- 469
			if TEAM_PRIVATE == _exp_0 then -- 470
				text = "This guy handles the guns." -- 471
			elseif TEAM_STALKER == _exp_0 then -- 472
				text = "Captain of the goods." -- 473
			elseif TEAM_SANITAR == _exp_0 then -- 474
				text = "The oldest living Dragoon.\nRespect. Honor." -- 475
			elseif TEAM_KORPSMAN == _exp_0 then -- 476
				text = "A reminder of the power of Kapitalism." -- 477
			elseif TEAM_DEALER == _exp_0 then -- 478
				text = "I'm seeing double!" -- 479
			elseif TEAM_EMPEROR == _exp_0 then -- 480
				text = "My brother in arms.\nIf he fails, I'll cut his off." -- 481
			elseif TEAM_GHOST == _exp_0 then -- 482
				text = "Glorified accountant." -- 483
			elseif TEAM_BONEHEAD == _exp_0 then -- 484
				text = "BONES ARE HIS DOLLARS." -- 485
			end -- 485
		end -- 485
		return { -- 486
			text = text, -- 486
			font = "Spleen_Label_Small" -- 486
		}, true -- 486
	end, -- 467
	first_names = { -- 487
		"Quartermaster", -- 487
		"Quartiermeister" -- 487
	}, -- 487
	last_names = { -- 488
		"Kommissariatsdienst" -- 488
	}, -- 488
	special_name = "Trusty", -- 489
	special_name_chance = 1000, -- 490
	ShowSpare1 = open_player_menu, -- 491
	ShowSpare2 = open_action_menu, -- 492
	bar_names = { -- 494
		health = "insurance" -- 494
	}, -- 493
	PlayerLoadout = function(ply) -- 495
		ply:ClearOddities() -- 496
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 497
		for slot, val in pairs({ -- 500
			[0] = 1, -- 500
			[1] = 1, -- 502
			[2] = 1, -- 504
			[3] = 1, -- 506
			[4] = 3, -- 508
			[5] = 0 -- 510
		}) do -- 511
			set_bodygroup(ply, slot, val) -- 498
		end -- 498
		return false -- 512
	end -- 495
}) -- 452
TEAM_KORPSMAN = DarkRP.createJob("Sanitater", { -- 515
	color = Color(79, 150, 150), -- 515
	model = "models/vel/evilwar/royalist.mdl", -- 516
	description = "You keep people alive in this terrible place.\nFill the blood and empty the rust.", -- 517
	weapons = { -- 518
		"evilrp/medkit" -- 518
	}, -- 518
	command = "medic", -- 519
	salary = 1, -- 520
	max = 2, -- 521
	cost = 2, -- 522
	hasLicense = false, -- 523
	medic = true, -- 524
	use_machines = false, -- 525
	category = "Royalists", -- 526
	speech_sounds = (function() -- 527
		local _accum_0 = { } -- 527
		local _len_0 = 1 -- 527
		for i = 1, 4 do -- 527
			_accum_0[_len_0] = "placenta/speech/korps" .. tostring(i) .. ".wav" -- 527
			_len_0 = _len_0 + 1 -- 527
		end -- 527
		return _accum_0 -- 527
	end)(), -- 527
	hurt_sounds = (function() -- 528
		local _accum_0 = { } -- 528
		local _len_0 = 1 -- 528
		for i = 1, 4 do -- 528
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 528
			_len_0 = _len_0 + 1 -- 528
		end -- 528
		return _accum_0 -- 528
	end)(), -- 528
	become_sounds = { -- 529
		"items/suitchargeok1.wav" -- 529
	}, -- 529
	crosstext = function(ply) -- 530
		local text = "Don't panic." -- 531
		do -- 532
			local _exp_0 = lp:Team() -- 532
			if TEAM_PRIVATE == _exp_0 then -- 533
				text = "I forgot what\nto call these guys." -- 534
			elseif TEAM_STALKER == _exp_0 then -- 535
				text = "A walking blood bag." -- 536
			elseif TEAM_SANITAR == _exp_0 then -- 537
				text = "Better remember\nwho lets them live." -- 538
			elseif TEAM_KORPSMAN == _exp_0 then -- 539
				text = "Something to\nbe happy about." -- 540
			elseif TEAM_DEALER == _exp_0 then -- 541
				text = "Keep them busy.\nWe need their blood and sweat." -- 542
			elseif TEAM_EMPEROR == _exp_0 then -- 543
				text = "What a strange,\nselfless thing." -- 544
			elseif TEAM_GHOST == _exp_0 then -- 545
				text = "A respectable mortal." -- 546
			elseif TEAM_BONEHEAD == _exp_0 then -- 547
				text = "CONFUSING." -- 548
			end -- 548
		end -- 548
		return { -- 549
			text = text, -- 549
			font = "Spleen_Label_Small" -- 549
		}, true -- 549
	end, -- 530
	first_names = { -- 550
		"Dissector", -- 550
		"Retractor", -- 550
		"Suture", -- 550
		"Femur", -- 550
		"Cystic", -- 550
		"Rasp", -- 550
		"Ferrum", -- 550
		"Fascia", -- 550
		"Marrow", -- 550
		"Lienis", -- 550
		"Aorta", -- 550
		"Tunica", -- 550
		"Maxilla", -- 550
		"Sacrum", -- 550
		"Leach" -- 550
	}, -- 550
	last_names = { -- 551
		"Forceps", -- 551
		"Scalpel", -- 551
		"Curette", -- 551
		"Rongeur", -- 551
		"Trocar", -- 551
		"Babcock", -- 551
		"Duval", -- 551
		"Hemostat", -- 551
		"Ossis", -- 551
		"Caro", -- 551
		"Cadaver", -- 551
		"Sanguis", -- 551
		"Bilis", -- 551
		"Viscera", -- 551
		"Jugular", -- 551
		"Clavius" -- 551
	}, -- 551
	special_name = "Corpseman", -- 552
	special_name_chance = 1000, -- 553
	ShowSpare1 = open_player_menu, -- 554
	ShowSpare2 = open_action_menu, -- 555
	bar_names = { -- 557
		health = "Bio-reserves" -- 557
	}, -- 556
	PlayerLoadout = function(ply) -- 558
		ply:ClearOddities() -- 559
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 560
		ply:SetSkin(4) -- 561
		for slot, val in pairs({ -- 564
			[0] = 0, -- 564
			[1] = 0, -- 566
			[2] = 2, -- 568
			[3] = 3, -- 570
			[4] = 1, -- 572
			[5] = 0 -- 574
		}) do -- 575
			set_bodygroup(ply, slot, val) -- 562
		end -- 562
		return false -- 576
	end -- 558
}) -- 514
TEAM_EMPEROR = DarkRP.createJob("Emperor", { -- 579
	color = Color(150, 20, 20), -- 579
	model = "models/vel/evilwar/royalist.mdl", -- 580
	description = "Rule with an iron fist.", -- 581
	command = "emperor", -- 582
	salary = 1, -- 583
	weapons = { -- 584
		"evilrp_weapon/novoluger" -- 584
	}, -- 584
	max = 1, -- 585
	cost = 5, -- 586
	weapons = { }, -- 587
	hasLicense = true, -- 588
	mayor = true, -- 589
	use_machines = false, -- 590
	category = "Royalists", -- 591
	speech_sounds = (function() -- 592
		local _accum_0 = { } -- 592
		local _len_0 = 1 -- 592
		for i = 1, 15 do -- 592
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 592
			_len_0 = _len_0 + 1 -- 592
		end -- 592
		return _accum_0 -- 592
	end)(), -- 592
	become_sounds = { -- 593
		"kidneydagger/broadcast1.wav" -- 593
	}, -- 593
	crosstext = function(ply) -- 594
		local text = "Don't panic." -- 595
		do -- 596
			local _exp_0 = lp:Team() -- 596
			if TEAM_PRIVATE == _exp_0 then -- 597
				text = "Listen carefully." -- 598
			elseif TEAM_STALKER == _exp_0 then -- 599
				text = "Oh, your majesty!" -- 600
			elseif TEAM_SANITAR == _exp_0 then -- 601
				text = "Hail, hail!" -- 602
			elseif TEAM_KORPSMAN == _exp_0 then -- 603
				text = "Is he feeling okay?" -- 604
			elseif TEAM_DEALER == _exp_0 then -- 605
				text = "Glorious leader.\nI'm nothing without him." -- 606
			elseif TEAM_EMPEROR == _exp_0 then -- 607
				text = "Our strength\nshall prevail." -- 608
			elseif TEAM_GHOST == _exp_0 then -- 609
				text = "So full of lies." -- 610
			elseif TEAM_BONEHEAD == _exp_0 then -- 611
				text = "THERE HE IS!!" -- 612
			end -- 612
		end -- 612
		return { -- 613
			text = text, -- 613
			font = "Spleen_Label_Small" -- 613
		}, true -- 613
	end, -- 594
	first_names = { -- 615
		"Basileus", -- 615
		"Agrippa", -- 615
		"Gnaeus", -- 615
		"Gaius" -- 615
	}, -- 615
	last_names = { -- 616
		"Imperator Lymphoma", -- 616
		"Kaiser Lymphoma", -- 616
		"Rex Lymphoma", -- 616
		"Lymphoma Magnus" -- 616
	}, -- 616
	special_name = "Which Kaiser", -- 617
	special_name_chance = 1000, -- 618
	ShowSpare1 = open_player_menu, -- 619
	ShowSpare2 = open_action_menu, -- 620
	bar_names = { -- 622
		health = "PRIDE" -- 622
	}, -- 621
	Reflect = function(ply) -- 623
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I am the EMPEROR of Lymphoma. I am the supreme ruler of this city and its people. I decide who lives and who dies. <c=0,210,0>I can use my terminal to administrate our internal affairs.") -- 624
	end, -- 623
	PlayerLoadout = function(ply) -- 625
		ply:ClearOddities() -- 626
		local oddities -- 627
		do -- 627
			local _accum_0 = { } -- 627
			local _len_0 = 1 -- 627
			for k, v in pairs(ODDITY.list) do -- 627
				if v ~= ODDITY_ILLITERACY then -- 627
					_accum_0[_len_0] = v -- 627
					_len_0 = _len_0 + 1 -- 627
				end -- 627
			end -- 627
			oddities = _accum_0 -- 627
		end -- 627
		ply:AddOddity(oddities[math.random(#oddities)]) -- 628
		for slot, val in pairs({ -- 631
			[0] = 1, -- 631
			[1] = 2, -- 633
			[2] = 0, -- 635
			[3] = 1, -- 637
			[4] = 2, -- 639
			[5] = 0 -- 641
		}) do -- 642
			set_bodygroup(ply, slot, val) -- 629
		end -- 629
		ply:SetNWInt("evilrp_gasmask", 4) -- 643
		ply:Give("evilrp_weapon/novoluger") -- 644
		ply:SetArmor(65) -- 645
		return false -- 646
	end -- 625
}) -- 578
GAMEMODE.CivilProtection = { -- 649
	[TEAM_PRIVATE] = true, -- 649
	[TEAM_CONSCRIPT] = true, -- 650
	[TEAM_SANITAR] = true, -- 651
	[TEAM_EMPEROR] = true -- 652
} -- 648
GAMEMODE.DefaultTeam = TEAM_GHOST -- 654
