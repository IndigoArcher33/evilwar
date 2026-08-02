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
	color = Color(71, 22, 0), -- 90
	model = "models/liver_failure/wastelander/wastelander.mdl", -- 91
	description = "A soul with no allegiance, destined to plunder the wasteland.", -- 92
	weapons = { -- 93
		"evilrp_weapon/whisper", -- 93
		"evilrp_melee/knife" -- 93
	}, -- 93
	category = "Wasteland", -- 94
	command = "stalker", -- 95
	use_machines = true, -- 96
	salary = 1, -- 97
	max = 3, -- 98
	cost = 4, -- 99
	can_build = true, -- 100
	hasLicense = false, -- 101
	candemote = false, -- 102
	use_machines = false, -- 103
	speech_sounds = (function() -- 104
		local _accum_0 = { } -- 104
		local _len_0 = 1 -- 104
		for i = 1, 9 do -- 104
			_accum_0[_len_0] = "placenta/cultspawn" .. tostring(i) .. ".wav" -- 104
			_len_0 = _len_0 + 1 -- 104
		end -- 104
		return _accum_0 -- 104
	end)(), -- 104
	hurt_sounds = (function() -- 105
		local _accum_0 = { } -- 105
		local _len_0 = 1 -- 105
		for i = 1, 6 do -- 105
			_accum_0[_len_0] = "placenta/pain/cult" .. tostring(i) .. ".wav" -- 105
			_len_0 = _len_0 + 1 -- 105
		end -- 105
		return _accum_0 -- 105
	end)(), -- 105
	become_sounds = (function() -- 106
		local _accum_0 = { } -- 106
		local _len_0 = 1 -- 106
		for i = 1, 3 do -- 106
			_accum_0[_len_0] = "npc/zombie/zombie_alert" .. tostring(i) .. ".wav" -- 106
			_len_0 = _len_0 + 1 -- 106
		end -- 106
		return _accum_0 -- 106
	end)(), -- 106
	death_sounds = (function() -- 107
		local _accum_0 = { } -- 107
		local _len_0 = 1 -- 107
		for i = 1, 4 do -- 107
			_accum_0[_len_0] = "placenta/death/cult" .. tostring(i) .. ".wav" -- 107
			_len_0 = _len_0 + 1 -- 107
		end -- 107
		return _accum_0 -- 107
	end)(), -- 107
	crosstext = function(ply) -- 108
		local text = "Don't panic." -- 109
		do -- 110
			local _exp_0 = lp:Team() -- 110
			if TEAM_PRIVATE == _exp_0 then -- 111
				text = "He doesn't look like me." -- 112
			elseif TEAM_STALKER == _exp_0 then -- 113
				text = "A fellow plunderer." -- 114
			elseif TEAM_SANITAR == _exp_0 then -- 115
				text = "Despicable." -- 116
			elseif TEAM_KORPSMAN == _exp_0 then -- 117
				text = "Why is he here?" -- 118
			elseif TEAM_DEALER == _exp_0 then -- 119
				text = "Keep the armaments locked up." -- 120
			elseif TEAM_EMPEROR == _exp_0 then -- 121
				text = "He might be of use to me." -- 122
			elseif TEAM_GHOST == _exp_0 then -- 123
				text = "He has a noble pursuit." -- 124
			elseif TEAM_BONEHEAD == _exp_0 then -- 125
				text = "SEEN HIM BEFORE!!" -- 126
			end -- 126
		end -- 126
		return { -- 127
			text = text, -- 127
			font = "Spleen_Label_Small" -- 127
		}, false -- 127
	end, -- 108
	first_names = { -- 128
		"Wasted", -- 128
		"Decrepit", -- 128
		"Rotten" -- 128
	}, -- 128
	last_names = { -- 129
		"Soul", -- 129
		"Plunderer", -- 129
		"Traitor", -- 129
		"Wanderer" -- 129
	}, -- 129
	bar_names = { -- 131
		health = "regret" -- 131
	}, -- 130
	special_name = "Waste", -- 132
	special_name_chance = 1000, -- 133
	ShowSpare1 = open_player_menu, -- 134
	ShowSpare2 = open_action_menu, -- 135
	Reflect = function(ply) -- 136
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I am a Stalker, an unpatriotic wastelander. I pawn off the Wasteland's treasures to the highest bidder. Unlike everyone else, I am talented at digging through trash.") -- 137
	end, -- 136
	PlayerLoadout = function(ply) -- 138
		ply:ClearOddities() -- 139
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 140
		for slot, val in pairs({ -- 143
			[0] = 0, -- 143
			[1] = 2, -- 145
			[2] = { -- 147
				2, -- 147
				3, -- 147
				8, -- 147
				6 -- 147
			}, -- 147
			[3] = { -- 149
				19, -- 149
				20 -- 149
			}, -- 149
			[4] = 0, -- 151
			[5] = 0, -- 153
			[6] = { -- 155
				0, -- 155
				1, -- 155
				2, -- 155
				3 -- 155
			}, -- 155
			[7] = 0, -- 157
			[8] = 0, -- 159
			[9] = { -- 161
				0, -- 161
				1 -- 161
			} -- 161
		}) do -- 162
			set_bodygroup(ply, slot, val) -- 141
		end -- 141
		local skins = { -- 163
			4, -- 163
			6, -- 163
			7 -- 163
		} -- 163
		ply:SetSkin(skins[math.random(1, #skins)]) -- 164
		return false -- 165
	end -- 138
}) -- 89
do -- 167
	local _class_0 -- 167
	local _parent_0 = SOUND -- 167
	local _base_0 = { -- 167
		sound = "placenta/bonehead_aggrod4.wav", -- 169
		pitch = { -- 169
			200, -- 169
			250 -- 169
		} -- 167
	} -- 167
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 169
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 167
			_base_0[_key_0] = _val_0 -- 167
		end -- 167
	end -- 169
	if _base_0.__index == nil then -- 167
		_base_0.__index = _base_0 -- 167
	end -- 169
	setmetatable(_base_0, _parent_0.__base) -- 167
	_class_0 = setmetatable({ -- 167
		__init = function(self, ...) -- 167
			return _class_0.__parent.__init(self, ...) -- 167
		end, -- 167
		__base = _base_0, -- 167
		__name = "SpeechBonehead", -- 167
		__parent = _parent_0 -- 167
	}, { -- 167
		__index = function(cls, name) -- 167
			local val = rawget(_base_0, name) -- 167
			if val == nil then -- 167
				local parent = rawget(cls, "__parent") -- 167
				if parent then -- 167
					return parent[name] -- 167
				end -- 167
			else -- 167
				return val -- 167
			end -- 167
		end, -- 167
		__call = function(cls, ...) -- 167
			local _self_0 = setmetatable({ }, _base_0) -- 167
			cls.__init(_self_0, ...) -- 167
			return _self_0 -- 167
		end -- 167
	}) -- 167
	_base_0.__class = _class_0 -- 167
	if _parent_0.__inherited then -- 167
		_parent_0.__inherited(_parent_0, _class_0) -- 167
	end -- 167
	SpeechBonehead = _class_0 -- 167
end -- 169
TEAM_BONEHEAD = DarkRP.createJob("Bonehead", { -- 172
	color = Color(150, 150, 150), -- 172
	model = "models/player/zombie_fast.mdl", -- 173
	description = "evil fucker.", -- 174
	instant_respawn = true, -- 175
	command = "bonehead", -- 176
	salary = 1, -- 177
	max = 0, -- 178
	cost = 1, -- 179
	use_machines = false, -- 180
	speech_sounds = "SpeechBonehead", -- 181
	hurt_sounds = (function() -- 182
		local _accum_0 = { } -- 182
		local _len_0 = 1 -- 182
		for i = 1, 2 do -- 182
			_accum_0[_len_0] = "placenta/bonehead_slice" .. tostring(i) .. ".wav" -- 182
			_len_0 = _len_0 + 1 -- 182
		end -- 182
		return _accum_0 -- 182
	end)(), -- 182
	become_sounds = (function() -- 183
		local _accum_0 = { } -- 183
		local _len_0 = 1 -- 183
		for i = 1, 4 do -- 183
			_accum_0[_len_0] = "placenta/bonehead_aggrod" .. tostring(i) .. ".wav" -- 183
			_len_0 = _len_0 + 1 -- 183
		end -- 183
		return _accum_0 -- 183
	end)(), -- 183
	crosstext = function(ply) -- 184
		local text = "Don't panic." -- 185
		do -- 186
			local _exp_0 = lp:Team() -- 186
			if TEAM_PRIVATE == _exp_0 then -- 187
				text = "Oh no! He's real!" -- 188
			elseif TEAM_SANITAR == _exp_0 then -- 189
				text = "Oh boy." -- 190
			elseif TEAM_KORPSMAN == _exp_0 then -- 191
				text = "Oh no! It happened again!" -- 192
			elseif TEAM_DEALER == _exp_0 then -- 193
				text = "Free ribs to feed the troops." -- 194
			elseif TEAM_EMPEROR == _exp_0 then -- 195
				text = "Ha. It happened again." -- 196
			elseif TEAM_GHOST == _exp_0 then -- 197
				text = "Lookin' good." -- 198
			elseif TEAM_BONEHEAD == _exp_0 then -- 199
				text = "THERE'S ANOTHER ONE." -- 200
			end -- 200
		end -- 200
		return { -- 201
			text = text, -- 201
			font = "Spleen_Label_Small" -- 201
		}, false -- 201
	end, -- 184
	first_names = { -- 202
		"Evil" -- 202
	}, -- 202
	last_names = { -- 203
		"Fucker" -- 203
	}, -- 203
	no_needs = true, -- 204
	hint = "You are a truly pissed off skeleton. Go get 'em!", -- 205
	bar_names = { -- 207
		health = "EVIL FUCKER POWER" -- 207
	}, -- 206
	bar_colors = { -- 209
		health = Color(200, 0, 0) -- 209
	}, -- 208
	RenderScreenspaceEffects = function(ply) -- 210
		local ct = CurTime() -- 211
		DrawMotionBlur(0.25, 0.2, 0.3) -- 212
		return DrawSharpen(1 * math.sin(ct), 2 * math.random(0.8, 1.2)) -- 213
	end, -- 210
	ColorMod = function(ply) -- 214
		local abs, cos, sin = math.abs, math.cos, math.sin -- 215
		local ct = CurTime() -- 216
		local tab = { -- 218
			["$pp_colour_addr"] = 0.1, -- 218
			["$pp_colour_addg"] = 0, -- 219
			["$pp_colour_addb"] = 0, -- 220
			["$pp_colour_brightness"] = 0 + (-0.01 * cos(ct)), -- 221
			["$pp_colour_contrast"] = 1.6 + (abs(sin(ct * 0.166)) * 0.5), -- 222
			["$pp_colour_colour"] = 0, -- 223
			["$pp_colour_mulr"] = 0 + abs(sin(ct * 0.789)), -- 224
			["$pp_colour_mulg"] = 0, -- 225
			["$pp_colour_mulb"] = 0 -- 226
		} -- 217
		return tab -- 227
	end, -- 214
	ShowSpare1 = function() -- 228
		if CLIENT then -- 229
			return GAMEMODE:Frighten() -- 230
		end -- 229
	end, -- 228
	ShowSpare2 = function() -- 231
		if CLIENT then -- 232
			return GAMEMODE:Frighten() -- 233
		end -- 232
	end, -- 231
	Reflect = function(ply) -- 234
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=210,0,0>ARRRRGHH, I MUST KILL THEM ALL AND TAKE THEIR SKIN!!!") -- 235
	end, -- 234
	PlayerLoadout = function(ply) -- 236
		ply:SetNWInt("evilrp_gasmask", 0) -- 237
		ply:Give("evilrp_melee/hands/boneclaws") -- 238
		return true -- 239
	end, -- 236
	HandleRagdoll = function(rag, ply) -- 240
		return rag:SetNWInt("decomp_stage", DSTAGE_BONES) -- 241
	end -- 240
}) -- 171
TEAM_PRIVATE = DarkRP.createJob("Private", { -- 244
	color = Color(20, 150, 20), -- 244
	model = "models/vel/evilwar/royalist.mdl", -- 245
	description = "A new recruit that hasn't gone through training yet.", -- 246
	command = "proletariat", -- 247
	salary = 1, -- 248
	max = 0, -- 249
	cost = 0, -- 250
	hasLicense = true, -- 251
	candemote = false, -- 252
	use_machines = true, -- 253
	category = "Royalists", -- 254
	speech_sounds = (function() -- 255
		local _accum_0 = { } -- 255
		local _len_0 = 1 -- 255
		for i = 1, 3 do -- 255
			_accum_0[_len_0] = "placenta/speech/prole" .. tostring(i) .. ".wav" -- 255
			_len_0 = _len_0 + 1 -- 255
		end -- 255
		return _accum_0 -- 255
	end)(), -- 255
	hurt_sounds = (function() -- 256
		local _accum_0 = { } -- 256
		local _len_0 = 1 -- 256
		for i = 1, 5 do -- 256
			_accum_0[_len_0] = "placenta/pain/prole" .. tostring(i) .. ".wav" -- 256
			_len_0 = _len_0 + 1 -- 256
		end -- 256
		return _accum_0 -- 256
	end)(), -- 256
	become_sounds = (function() -- 257
		local _accum_0 = { } -- 257
		local _len_0 = 1 -- 257
		for i = 1, 3 do -- 257
			_accum_0[_len_0] = "npc/zombie/zombie_alert" .. tostring(i) .. ".wav" -- 257
			_len_0 = _len_0 + 1 -- 257
		end -- 257
		return _accum_0 -- 257
	end)(), -- 257
	death_sounds = (function() -- 258
		local _accum_0 = { } -- 258
		local _len_0 = 1 -- 258
		for i = 1, 3 do -- 258
			_accum_0[_len_0] = "placenta/death/prole" .. tostring(i) .. ".wav" -- 258
			_len_0 = _len_0 + 1 -- 258
		end -- 258
		return _accum_0 -- 258
	end)(), -- 258
	crosstext = function(ply) -- 259
		local text = "Don't panic." -- 260
		do -- 261
			local _exp_0 = lp:Team() -- 261
			if TEAM_PRIVATE == _exp_0 then -- 262
				text = "United in rank?" -- 263
			elseif TEAM_STALKER == _exp_0 then -- 264
				text = "A soldier from Lymphoma." -- 265
			elseif TEAM_SANITAR == _exp_0 then -- 266
				text = "These soldiers need guidance.\nPut the fear in their hearts." -- 267
			elseif TEAM_KORPSMAN == _exp_0 then -- 268
				text = "Smelly and stupid." -- 269
			elseif TEAM_DEALER == _exp_0 then -- 270
				text = "Prove your place, worm.\nOnly then will you be decorated." -- 271
			elseif TEAM_EMPEROR == _exp_0 then -- 272
				text = "Is he working hard enough?" -- 273
			elseif TEAM_GHOST == _exp_0 then -- 274
				text = "Sad, but funny." -- 275
			elseif TEAM_BONEHEAD == _exp_0 then -- 276
				text = "SKIN...!" -- 277
			end -- 277
		end -- 277
		return { -- 278
			text = text, -- 278
			font = "Spleen_Label_Small" -- 278
		}, false -- 278
	end, -- 259
	first_names = { -- 279
		"Private", -- 279
		"PVT.", -- 279
		"Recruit", -- 279
		"Enlistee", -- 279
		"Grunt", -- 279
		"Fodder", -- 279
		"Cadet", -- 279
		"CDT.", -- 279
		"Rookie" -- 279
	}, -- 279
	GenerateName = function(self, ply) -- 280
		local unit_id = math.random(1, 99) -- 281
		if unit_id < 10 then -- 282
			unit_id = "0" .. tostring(unit_id) -- 283
		else -- 285
			unit_id = tostring(unit_id) -- 285
		end -- 282
		return self.first_names[math.random(1, #self.first_names)] .. " #" .. unit_id -- 286
	end, -- 280
	special_name = "private parts", -- 287
	special_name_chance = 1000, -- 288
	ShowSpare1 = open_player_menu, -- 289
	ShowSpare2 = open_action_menu, -- 290
	Reflect = function(ply) -- 291
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I am a patriotic Lymphoman resident, a laborer and combatant. I must remain productive, my body should be used for the greater good. <c=0,210,0> I can be conscripted by the EMPEROR.") -- 292
	end, -- 291
	PlayerLoadout = function(ply) -- 293
		ply:ClearOddities() -- 294
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 295
		for slot, val in pairs({ -- 298
			[0] = 0, -- 298
			[1] = 0, -- 300
			[3] = { -- 302
				0, -- 302
				6, -- 302
				7, -- 302
				8 -- 302
			}, -- 302
			[4] = { -- 304
				0, -- 304
				4 -- 304
			}, -- 304
			[5] = 0, -- 306
			[6] = 0 -- 308
		}) do -- 309
			set_bodygroup(ply, slot, val) -- 296
		end -- 296
		return false -- 310
	end -- 293
}) -- 243
TEAM_CONSCRIPT = DarkRP.createJob("Conscript", { -- 313
	color = Color(19, 51, 45), -- 313
	model = "models/vel/evilwar/royalist.mdl", -- 314
	description = "The fate of those who don't make the cut.", -- 315
	weapons = { -- 316
		"evilrp_weapon/obrez", -- 316
		"evilrp_melee/pipe" -- 316
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
		return false -- 383
	end -- 365
}) -- 312
TEAM_SANITAR = DarkRP.createJob("Dragoon", { -- 386
	color = Color(0, 25, 93), -- 386
	model = "models/vel/evilwar/royalist.mdl", -- 387
	description = "The right hand of the Emperor.\nRespected by his peers,\nfeared by his enemies.", -- 388
	weapons = { -- 389
		"evilrp_weapon/hope", -- 389
		"evilrp_melee/sabre" -- 389
	}, -- 389
	command = "ss", -- 390
	salary = 1, -- 391
	max = 6, -- 392
	cost = 3, -- 393
	hasLicense = true, -- 394
	use_machines = false, -- 395
	ammo = { -- 397
		pistol = 60 -- 397
	}, -- 396
	category = "Royalists", -- 398
	speech_sounds = (function() -- 399
		local _accum_0 = { } -- 399
		local _len_0 = 1 -- 399
		for i = 1, 15 do -- 399
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 399
			_len_0 = _len_0 + 1 -- 399
		end -- 399
		return _accum_0 -- 399
	end)(), -- 399
	hurt_sounds = (function() -- 400
		local _accum_0 = { } -- 400
		local _len_0 = 1 -- 400
		for i = 1, 4 do -- 400
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 400
			_len_0 = _len_0 + 1 -- 400
		end -- 400
		return _accum_0 -- 400
	end)(), -- 400
	become_sounds = (function() -- 401
		local _accum_0 = { } -- 401
		local _len_0 = 1 -- 401
		for i = 1, 15 do -- 401
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 401
			_len_0 = _len_0 + 1 -- 401
		end -- 401
		return _accum_0 -- 401
	end)(), -- 401
	crosstext = function(ply) -- 402
		local text = "Don't panic." -- 403
		do -- 404
			local _exp_0 = lp:Team() -- 404
			if TEAM_PRIVATE == _exp_0 then -- 405
				text = "A Lymphomian legend!" -- 406
			elseif TEAM_STALKER == _exp_0 then -- 407
				text = "Fight or run?!" -- 408
			elseif TEAM_SANITAR == _exp_0 then -- 409
				text = "Finally...\nSomeone competent." -- 410
			elseif TEAM_KORPSMAN == _exp_0 then -- 411
				text = "Is that enemy blood?\nNo of course not." -- 412
			elseif TEAM_DEALER == _exp_0 then -- 413
				text = "A follower of mine." -- 414
			elseif TEAM_EMPEROR == _exp_0 then -- 415
				text = "A tentacle of mine." -- 416
			elseif TEAM_GHOST == _exp_0 then -- 417
				text = "Evil, stupid,\n maybe both." -- 418
			elseif TEAM_BONEHEAD == _exp_0 then -- 419
				text = "DANGER." -- 420
			end -- 420
		end -- 420
		return { -- 421
			text = text, -- 421
			font = "Spleen_Label_Small" -- 421
		}, true -- 421
	end, -- 402
	first_names = { -- 422
		"Subjugator", -- 422
		"Dragoner", -- 422
		"Persecuter", -- 422
		"Draconarius", -- 422
		"Volontaire" -- 422
	}, -- 422
	last_names = { -- 423
		"of Die Augen", -- 423
		"of Knochen", -- 423
		"of Sehne", -- 423
		"of Knorpel", -- 423
		"of Bauchspeicheldrüse" -- 423
	}, -- 423
	arms_model = "models/weapons/c_arms_refugee.mdl", -- 424
	ShowSpare1 = open_player_menu, -- 425
	ShowSpare2 = open_action_menu, -- 426
	bar_names = { -- 428
		health = "resolve" -- 428
	}, -- 427
	Reflect = function(ply) -- 429
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I am part of the EMPEROR's finest soldiers. The Privates, Conscripts, and Sanitaters are my subordinates, whilst the EMPEROR and the Quartermaster are my superiors. <c=0,210,0>I must keep order within the city, and the machines tidy") -- 430
	end, -- 429
	PlayerLoadout = function(ply) -- 431
		ply:ClearOddities() -- 432
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 433
		for slot, val in pairs({ -- 436
			[0] = 1, -- 436
			[1] = 1, -- 438
			[2] = 1, -- 440
			[3] = 2, -- 442
			[4] = 3, -- 444
			[5] = 0 -- 446
		}) do -- 447
			set_bodygroup(ply, slot, val) -- 434
		end -- 434
		ply:SetArmor(40) -- 448
		return false -- 449
	end -- 431
}) -- 385
TEAM_DEALER = DarkRP.createJob("Quartermaster", { -- 452
	color = Color(255, 140, 0), -- 452
	model = "models/vel/evilwar/royalist.mdl", -- 453
	description = "The left hand of the Emperor.\nManage the goods and keep your men armed.", -- 454
	weapons = { }, -- 455
	command = "dealer", -- 456
	salary = 1, -- 457
	max = 1, -- 458
	cost = 3, -- 459
	hasLicense = false, -- 460
	use_machines = false, -- 461
	category = "Royalists", -- 462
	speech_sounds = (function() -- 463
		local _accum_0 = { } -- 463
		local _len_0 = 1 -- 463
		for i = 1, 3 do -- 463
			_accum_0[_len_0] = "placenta/speech/dealer" .. tostring(i) .. ".wav" -- 463
			_len_0 = _len_0 + 1 -- 463
		end -- 463
		return _accum_0 -- 463
	end)(), -- 463
	hurt_sounds = (function() -- 464
		local _accum_0 = { } -- 464
		local _len_0 = 1 -- 464
		for i = 1, 4 do -- 464
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 464
			_len_0 = _len_0 + 1 -- 464
		end -- 464
		return _accum_0 -- 464
	end)(), -- 464
	become_sounds = (function() -- 465
		local _accum_0 = { } -- 465
		local _len_0 = 1 -- 465
		for i = 1, 15 do -- 465
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 465
			_len_0 = _len_0 + 1 -- 465
		end -- 465
		return _accum_0 -- 465
	end)(), -- 465
	crosstext = function(ply) -- 466
		local text = "Don't panic." -- 467
		do -- 468
			local _exp_0 = lp:Team() -- 468
			if TEAM_PRIVATE == _exp_0 then -- 469
				text = "This guy handles the guns." -- 470
			elseif TEAM_STALKER == _exp_0 then -- 471
				text = "Captain of the goods." -- 472
			elseif TEAM_SANITAR == _exp_0 then -- 473
				text = "The oldest living Dragoon.\nRespect. Honor." -- 474
			elseif TEAM_KORPSMAN == _exp_0 then -- 475
				text = "A reminder of the power of Kapitalism." -- 476
			elseif TEAM_DEALER == _exp_0 then -- 477
				text = "I'm seeing double!" -- 478
			elseif TEAM_EMPEROR == _exp_0 then -- 479
				text = "My brother in arms.\nIf he fails, I'll cut his off." -- 480
			elseif TEAM_GHOST == _exp_0 then -- 481
				text = "Glorified accountant." -- 482
			elseif TEAM_BONEHEAD == _exp_0 then -- 483
				text = "BONES ARE HIS DOLLARS." -- 484
			end -- 484
		end -- 484
		return { -- 485
			text = text, -- 485
			font = "Spleen_Label_Small" -- 485
		}, true -- 485
	end, -- 466
	first_names = { -- 486
		"Quartermaster", -- 486
		"Quartiermeister" -- 486
	}, -- 486
	last_names = { -- 487
		"Kommissariatsdienst" -- 487
	}, -- 487
	special_name = "Trusty", -- 488
	special_name_chance = 1000, -- 489
	ShowSpare1 = open_player_menu, -- 490
	ShowSpare2 = open_action_menu, -- 491
	bar_names = { -- 493
		health = "insurance" -- 493
	}, -- 492
	PlayerLoadout = function(ply) -- 494
		ply:ClearOddities() -- 495
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 496
		for slot, val in pairs({ -- 499
			[0] = 1, -- 499
			[1] = 1, -- 501
			[2] = 1, -- 503
			[3] = 1, -- 505
			[4] = 3, -- 507
			[5] = 0 -- 509
		}) do -- 510
			set_bodygroup(ply, slot, val) -- 497
		end -- 497
		return false -- 511
	end -- 494
}) -- 451
TEAM_KORPSMAN = DarkRP.createJob("Sanitäter", { -- 514
	color = Color(79, 150, 150), -- 514
	model = "models/vel/evilwar/royalist.mdl", -- 515
	description = "You keep people alive in this terrible place.\nFill the blood and empty the rust.", -- 516
	weapons = { -- 517
		"evilrp/medkit" -- 517
	}, -- 517
	command = "medic", -- 518
	salary = 1, -- 519
	max = 2, -- 520
	cost = 2, -- 521
	hasLicense = false, -- 522
	medic = true, -- 523
	use_machines = false, -- 524
	category = "Royalists", -- 525
	speech_sounds = (function() -- 526
		local _accum_0 = { } -- 526
		local _len_0 = 1 -- 526
		for i = 1, 4 do -- 526
			_accum_0[_len_0] = "placenta/speech/korps" .. tostring(i) .. ".wav" -- 526
			_len_0 = _len_0 + 1 -- 526
		end -- 526
		return _accum_0 -- 526
	end)(), -- 526
	hurt_sounds = (function() -- 527
		local _accum_0 = { } -- 527
		local _len_0 = 1 -- 527
		for i = 1, 4 do -- 527
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 527
			_len_0 = _len_0 + 1 -- 527
		end -- 527
		return _accum_0 -- 527
	end)(), -- 527
	become_sounds = { -- 528
		"items/suitchargeok1.wav" -- 528
	}, -- 528
	crosstext = function(ply) -- 529
		local text = "Don't panic." -- 530
		do -- 531
			local _exp_0 = lp:Team() -- 531
			if TEAM_PRIVATE == _exp_0 then -- 532
				text = "I forgot what\nto call these guys." -- 533
			elseif TEAM_STALKER == _exp_0 then -- 534
				text = "A walking blood bag." -- 535
			elseif TEAM_SANITAR == _exp_0 then -- 536
				text = "Better remember\nwho lets them live." -- 537
			elseif TEAM_KORPSMAN == _exp_0 then -- 538
				text = "Something to\nbe happy about." -- 539
			elseif TEAM_DEALER == _exp_0 then -- 540
				text = "Keep them busy.\nWe need their blood and sweat." -- 541
			elseif TEAM_EMPEROR == _exp_0 then -- 542
				text = "What a strange,\nselfless thing." -- 543
			elseif TEAM_GHOST == _exp_0 then -- 544
				text = "A respectable mortal." -- 545
			elseif TEAM_BONEHEAD == _exp_0 then -- 546
				text = "CONFUSING." -- 547
			end -- 547
		end -- 547
		return { -- 548
			text = text, -- 548
			font = "Spleen_Label_Small" -- 548
		}, true -- 548
	end, -- 529
	first_names = { -- 549
		"Dissector", -- 549
		"Retractor", -- 549
		"Suture", -- 549
		"Femur", -- 549
		"Cystic", -- 549
		"Rasp", -- 549
		"Ferrum", -- 549
		"Fascia", -- 549
		"Marrow", -- 549
		"Lienis", -- 549
		"Aorta", -- 549
		"Tunica", -- 549
		"Maxilla", -- 549
		"Sacrum", -- 549
		"Leach" -- 549
	}, -- 549
	last_names = { -- 550
		"Forceps", -- 550
		"Scalpel", -- 550
		"Curette", -- 550
		"Rongeur", -- 550
		"Trocar", -- 550
		"Babcock", -- 550
		"Duval", -- 550
		"Hemostat", -- 550
		"Ossis", -- 550
		"Caro", -- 550
		"Cadaver", -- 550
		"Sanguis", -- 550
		"Bilis", -- 550
		"Viscera", -- 550
		"Jugular", -- 550
		"Clavius" -- 550
	}, -- 550
	special_name = "Corpseman", -- 551
	special_name_chance = 1000, -- 552
	ShowSpare1 = open_player_menu, -- 553
	ShowSpare2 = open_action_menu, -- 554
	bar_names = { -- 556
		health = "Bio-reserves" -- 556
	}, -- 555
	PlayerLoadout = function(ply) -- 557
		ply:ClearOddities() -- 558
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 559
		ply:SetSkin(4) -- 560
		for slot, val in pairs({ -- 563
			[0] = 0, -- 563
			[1] = 0, -- 565
			[2] = 2, -- 567
			[3] = 3, -- 569
			[4] = 1, -- 571
			[5] = 0 -- 573
		}) do -- 574
			set_bodygroup(ply, slot, val) -- 561
		end -- 561
		return false -- 575
	end -- 557
}) -- 513
TEAM_EMPEROR = DarkRP.createJob("Emperor", { -- 578
	color = Color(150, 20, 20), -- 578
	model = "models/vel/evilwar/royalist.mdl", -- 579
	description = "Rule with an iron fist.", -- 580
	command = "emperor", -- 581
	salary = 1, -- 582
	weapons = { -- 583
		"evilrp_weapon/novoluger" -- 583
	}, -- 583
	max = 1, -- 584
	cost = 5, -- 585
	weapons = { }, -- 586
	hasLicense = true, -- 587
	mayor = true, -- 588
	use_machines = false, -- 589
	category = "Royalists", -- 590
	speech_sounds = (function() -- 591
		local _accum_0 = { } -- 591
		local _len_0 = 1 -- 591
		for i = 1, 15 do -- 591
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 591
			_len_0 = _len_0 + 1 -- 591
		end -- 591
		return _accum_0 -- 591
	end)(), -- 591
	become_sounds = { -- 592
		"kidneydagger/broadcast1.wav" -- 592
	}, -- 592
	crosstext = function(ply) -- 593
		local text = "Don't panic." -- 594
		do -- 595
			local _exp_0 = lp:Team() -- 595
			if TEAM_PRIVATE == _exp_0 then -- 596
				text = "Listen carefully." -- 597
			elseif TEAM_STALKER == _exp_0 then -- 598
				text = "Oh, your majesty!" -- 599
			elseif TEAM_SANITAR == _exp_0 then -- 600
				text = "Hail, hail!" -- 601
			elseif TEAM_KORPSMAN == _exp_0 then -- 602
				text = "Is he feeling okay?" -- 603
			elseif TEAM_DEALER == _exp_0 then -- 604
				text = "Glorious leader.\nI'm nothing without him." -- 605
			elseif TEAM_EMPEROR == _exp_0 then -- 606
				text = "Our strength\nshall prevail." -- 607
			elseif TEAM_GHOST == _exp_0 then -- 608
				text = "So full of lies." -- 609
			elseif TEAM_BONEHEAD == _exp_0 then -- 610
				text = "THERE HE IS!!" -- 611
			end -- 611
		end -- 611
		return { -- 612
			text = text, -- 612
			font = "Spleen_Label_Small" -- 612
		}, true -- 612
	end, -- 593
	first_names = { -- 614
		"Basileus", -- 614
		"Agrippa", -- 614
		"Gnaeus", -- 614
		"Gaius" -- 614
	}, -- 614
	last_names = { -- 615
		"Imperator Lymphoma", -- 615
		"Kaiser Lymphoma", -- 615
		"Rex Lymphoma", -- 615
		"Lymphoma Magnus" -- 615
	}, -- 615
	special_name = "Which Kaiser", -- 616
	special_name_chance = 1000, -- 617
	ShowSpare1 = open_player_menu, -- 618
	ShowSpare2 = open_action_menu, -- 619
	bar_names = { -- 621
		health = "PRIDE" -- 621
	}, -- 620
	Reflect = function(ply) -- 622
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I am the EMPEROR of Lymphoma. I am the supreme ruler of this city and its people. I decide who lives and who dies. <c=0,210,0>I can use my terminal to administrate our internal affairs.") -- 623
	end, -- 622
	PlayerLoadout = function(ply) -- 624
		ply:ClearOddities() -- 625
		local oddities -- 626
		do -- 626
			local _accum_0 = { } -- 626
			local _len_0 = 1 -- 626
			for k, v in pairs(ODDITY.list) do -- 626
				if v ~= ODDITY_ILLITERACY then -- 626
					_accum_0[_len_0] = v -- 626
					_len_0 = _len_0 + 1 -- 626
				end -- 626
			end -- 626
			oddities = _accum_0 -- 626
		end -- 626
		ply:AddOddity(oddities[math.random(#oddities)]) -- 627
		for slot, val in pairs({ -- 630
			[0] = 1, -- 630
			[1] = 2, -- 632
			[2] = 0, -- 634
			[3] = 1, -- 636
			[4] = 2, -- 638
			[5] = 0 -- 640
		}) do -- 641
			set_bodygroup(ply, slot, val) -- 628
		end -- 628
		ply:SetNWInt("evilrp_gasmask", 4) -- 642
		ply:Give("evilrp_weapon/novoluger") -- 643
		ply:SetArmor(65) -- 644
		return false -- 645
	end -- 624
}) -- 577
GAMEMODE.CivilProtection = { -- 648
	[TEAM_PRIVATE] = true, -- 648
	[TEAM_SANITAR] = true, -- 649
	[TEAM_EMPEROR] = true -- 650
} -- 647
GAMEMODE.DefaultTeam = TEAM_GHOST -- 652
