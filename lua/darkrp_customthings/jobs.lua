-- [yue]: darkrp_customthings\jobs.yue
local Config = GAMEMODE.Config -- 4
local conscript_weapons = { -- 11
	"evilrp_weapon/obrez", -- 11
	"evilrp_weapon/pacifier", -- 12
	"evilrp_weapon/warrant", -- 13
	"evilrp_weapon/viper" -- 14
} -- 10
local set_bodygroup -- 17
set_bodygroup = function(ply, slot, val) -- 17
	if type(val) == "table" then -- 18
		val = val[math.random(1, #val)] -- 20
	end -- 18
	return ply:SetBodygroup(slot, val) -- 21
end -- 17
local open_player_menu -- 23
open_player_menu = function(ply) -- 23
	if not CLIENT then -- 24
		return -- 24
	end -- 24
	if lp:Alive() then -- 25
		return GAMEMODE:CreatePlayerMenu() -- 26
	end -- 25
end -- 23
local open_action_menu -- 28
open_action_menu = function(ply) -- 28
	if not CLIENT then -- 29
		return -- 29
	end -- 29
	local tr = GAMEMODE:GetHandTrace(ply, 80) -- 30
	return GAMEMODE:OpenActionMenu(tr.HitPos, tr.Entity) -- 31
end -- 28
TEAM_GHOST = DarkRP.createJob("Ghost", { -- 34
	color = Color(150, 150, 150), -- 34
	model = "models/player/skeleton.mdl", -- 35
	description = "A lost soul.", -- 36
	instant_respawn = true, -- 37
	weapons = { }, -- 38
	command = "ghost", -- 39
	salary = 1, -- 40
	max = 0, -- 41
	cost = 0, -- 42
	use_machines = false, -- 43
	speech_sounds = { -- 44
		"ambient/voices/squeal1.wav" -- 44
	}, -- 44
	crosstext = function(ply) -- 45
		local text = "OH SOTLA,\nTHE HORROR." -- 47
		do -- 48
			local _exp_0 = lp:Team() -- 48
			if TEAM_KORPSMAN == _exp_0 then -- 49
				text = "Evil spirits wander!\n<wiggle>Not on my shift." -- 50
			elseif TEAM_GHOST == _exp_0 then -- 51
				text = "We're the same,\nyou and I." -- 52
			end -- 52
		end -- 52
		return { -- 53
			text = text, -- 53
			font = "Spleen_Label_Small" -- 53
		} -- 53
	end, -- 45
	first_names = { -- 54
		"Suffering", -- 54
		"Fear", -- 54
		"Agony", -- 54
		"Malice", -- 54
		"Hatred", -- 54
		"Grief", -- 54
		"Pain", -- 54
		"Despair", -- 54
		"Rage" -- 54
	}, -- 54
	ShowSpare1 = function(ply) -- 57
		if CLIENT then -- 58
			return ply:Notify("<c=0,200,0>YOU HAVE " .. tostring(ply:GetStemCells()) .. " STEM CELLS.") -- 59
		end -- 58
	end, -- 57
	ShowSpare2 = function(ply) -- 60
		local nearby = ents.FindInSphere(ply:GetPos(), 16) -- 61
		local found -- 62
		for _index_0 = 1, #nearby do -- 63
			local ent = nearby[_index_0] -- 63
			if ent:GetClass():find("portal/spawn") then -- 64
				found = ent -- 65
				break -- 66
			end -- 64
		end -- 66
		if not (found and IsValid(found)) then -- 67
			if CLIENT then -- 68
				return GAMEMODE:Frighten() -- 69
			else -- 71
				return ply:Notify("<c=200,0,0>There is no purpose in life near me.") -- 71
			end -- 68
		elseif SERVER then -- 72
			return found:Use(ply) -- 73
		end -- 67
	end, -- 60
	PlayerLoadout = function(ply) -- 74
		ply:ClearOddities() -- 76
		ply:SetNWInt("evilrp_gasmask", 0) -- 77
		return true -- 78
	end, -- 74
	ColorMod = function(ply) -- 79
		local abs, cos, sin = math.abs, math.cos, math.sin -- 80
		local ct = CurTime() -- 81
		local tab = { -- 83
			["$pp_colour_addr"] = 0, -- 83
			["$pp_colour_addg"] = 0, -- 84
			["$pp_colour_addb"] = 0, -- 85
			["$pp_colour_brightness"] = 0 + (-0.01 * cos(ct)), -- 86
			["$pp_colour_contrast"] = 0.6 + (abs(sin(ct * 0.166)) * 0.5), -- 87
			["$pp_colour_colour"] = 0, -- 88
			["$pp_colour_mulr"] = 0 + abs(sin(ct * 0.789)), -- 89
			["$pp_colour_mulg"] = 0, -- 90
			["$pp_colour_mulb"] = 0 -- 91
		} -- 82
		return tab -- 92
	end -- 79
}) -- 33
TEAM_STALKER = DarkRP.createJob("Stalker", { -- 95
	color = Color(71, 22, 0), -- 95
	model = "models/liver_failure/wastelander/wastelander.mdl", -- 96
	description = "A soul with no allegiance, destined to plunder the wasteland.", -- 97
	weapons = { -- 98
		"evilrp_melee/pipe", -- 98
		"evilrp_melee/knife" -- 98
	}, -- 98
	category = "Wasteland", -- 99
	command = "stalker", -- 100
	use_machines = true, -- 101
	salary = 1, -- 102
	max = 3, -- 103
	cost = 4, -- 104
	can_build = true, -- 105
	can_sell = true, -- 106
	hasLicense = false, -- 107
	candemote = false, -- 108
	use_machines = false, -- 109
	speech_sounds = (function() -- 110
		local _accum_0 = { } -- 110
		local _len_0 = 1 -- 110
		for i = 1, 4 do -- 110
			_accum_0[_len_0] = "speech/gruffprole" .. tostring(i) .. ".wav" -- 110
			_len_0 = _len_0 + 1 -- 110
		end -- 110
		return _accum_0 -- 110
	end)(), -- 110
	hurt_sounds = (function() -- 111
		local _accum_0 = { } -- 111
		local _len_0 = 1 -- 111
		for i = 1, 6 do -- 111
			_accum_0[_len_0] = "placenta/pain/cult" .. tostring(i) .. ".wav" -- 111
			_len_0 = _len_0 + 1 -- 111
		end -- 111
		return _accum_0 -- 111
	end)(), -- 111
	become_sounds = (function() -- 112
		local _accum_0 = { } -- 112
		local _len_0 = 1 -- 112
		for i = 1, 3 do -- 112
			_accum_0[_len_0] = "npc/zombie/zombie_alert" .. tostring(i) .. ".wav" -- 112
			_len_0 = _len_0 + 1 -- 112
		end -- 112
		return _accum_0 -- 112
	end)(), -- 112
	death_sounds = (function() -- 113
		local _accum_0 = { } -- 113
		local _len_0 = 1 -- 113
		for i = 1, 4 do -- 113
			_accum_0[_len_0] = "placenta/death/cult" .. tostring(i) .. ".wav" -- 113
			_len_0 = _len_0 + 1 -- 113
		end -- 113
		return _accum_0 -- 113
	end)(), -- 113
	crosstext = function(ply) -- 114
		local text = "Don't panic." -- 115
		do -- 116
			local _exp_0 = lp:Team() -- 116
			if TEAM_PRIVATE == _exp_0 then -- 117
				text = "He could sell me some goodies." -- 118
			elseif TEAM_STALKER == _exp_0 then -- 119
				text = "A fellow plunderer." -- 120
			elseif TEAM_SANITAR == _exp_0 then -- 121
				text = "A necessary evil." -- 122
			elseif TEAM_KORPSMAN == _exp_0 then -- 123
				text = "Why is he here?" -- 124
			elseif TEAM_DEALER == _exp_0 then -- 125
				text = "Keep the armaments locked up." -- 126
			elseif TEAM_EMPEROR == _exp_0 then -- 127
				text = "He might be of use to me." -- 128
			elseif TEAM_GHOST == _exp_0 then -- 129
				text = "He has a noble pursuit." -- 130
			elseif TEAM_BONEHEAD == _exp_0 then -- 131
				text = "SEEN HIM BEFORE!!" -- 132
			end -- 132
		end -- 132
		return { -- 133
			text = text, -- 133
			font = "Spleen_Label_Small" -- 133
		}, false -- 133
	end, -- 114
	first_names = { -- 134
		"Wasted", -- 134
		"Decrepit", -- 134
		"Rotten" -- 134
	}, -- 134
	last_names = { -- 135
		"Soul", -- 135
		"Plunderer", -- 135
		"Traitor", -- 135
		"Wanderer" -- 135
	}, -- 135
	bar_names = { -- 137
		health = "regret" -- 137
	}, -- 136
	special_name = "Waste", -- 138
	special_name_chance = 1000, -- 139
	ShowSpare1 = open_player_menu, -- 140
	ShowSpare2 = open_action_menu, -- 141
	Reflect = function(ply) -- 142
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I am a Stalker, an unpatriotic wastelander. I pawn off the Wasteland's treasures to the highest bidder. Unlike everyone else, I am talented at digging through trash. Bone capsules are of great use to me, I can use their contents for nutritious recipes that quench the soul") -- 143
	end, -- 142
	PlayerLoadout = function(ply) -- 144
		ply:ClearOddities() -- 145
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 146
		for slot, val in pairs({ -- 149
			[0] = 0, -- 149
			[1] = 2, -- 151
			[2] = { -- 153
				2, -- 153
				3, -- 153
				8, -- 153
				6 -- 153
			}, -- 153
			[3] = { -- 155
				19, -- 155
				20 -- 155
			}, -- 155
			[4] = 0, -- 157
			[5] = 0, -- 159
			[6] = { -- 161
				0, -- 161
				1, -- 161
				2, -- 161
				3 -- 161
			}, -- 161
			[7] = 0, -- 163
			[8] = 0, -- 165
			[9] = { -- 167
				0, -- 167
				1 -- 167
			} -- 167
		}) do -- 168
			set_bodygroup(ply, slot, val) -- 147
		end -- 147
		local skins = { -- 169
			4, -- 169
			6, -- 169
			7 -- 169
		} -- 169
		ply:SetSkin(skins[math.random(1, #skins)]) -- 170
		return false -- 171
	end -- 144
}) -- 94
do -- 173
	local _class_0 -- 173
	local _parent_0 = SOUND -- 173
	local _base_0 = { -- 173
		sound = "placenta/bonehead_aggrod4.wav", -- 175
		pitch = { -- 175
			200, -- 175
			250 -- 175
		} -- 173
	} -- 173
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 175
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 173
			_base_0[_key_0] = _val_0 -- 173
		end -- 173
	end -- 175
	if _base_0.__index == nil then -- 173
		_base_0.__index = _base_0 -- 173
	end -- 175
	setmetatable(_base_0, _parent_0.__base) -- 173
	_class_0 = setmetatable({ -- 173
		__init = function(self, ...) -- 173
			return _class_0.__parent.__init(self, ...) -- 173
		end, -- 173
		__base = _base_0, -- 173
		__name = "SpeechBonehead", -- 173
		__parent = _parent_0 -- 173
	}, { -- 173
		__index = function(cls, name) -- 173
			local val = rawget(_base_0, name) -- 173
			if val == nil then -- 173
				local parent = rawget(cls, "__parent") -- 173
				if parent then -- 173
					return parent[name] -- 173
				end -- 173
			else -- 173
				return val -- 173
			end -- 173
		end, -- 173
		__call = function(cls, ...) -- 173
			local _self_0 = setmetatable({ }, _base_0) -- 173
			cls.__init(_self_0, ...) -- 173
			return _self_0 -- 173
		end -- 173
	}) -- 173
	_base_0.__class = _class_0 -- 173
	if _parent_0.__inherited then -- 173
		_parent_0.__inherited(_parent_0, _class_0) -- 173
	end -- 173
	SpeechBonehead = _class_0 -- 173
end -- 175
TEAM_BONEHEAD = DarkRP.createJob("Bonehead", { -- 178
	color = Color(150, 150, 150), -- 178
	model = "models/player/zombie_fast.mdl", -- 179
	description = "evil fucker.", -- 180
	instant_respawn = true, -- 181
	command = "bonehead", -- 182
	category = "Scum of Liver Failure", -- 183
	salary = 1, -- 184
	max = 2, -- 185
	cost = 2, -- 186
	use_machines = false, -- 187
	speech_sounds = "SpeechBonehead", -- 188
	hurt_sounds = (function() -- 189
		local _accum_0 = { } -- 189
		local _len_0 = 1 -- 189
		for i = 1, 2 do -- 189
			_accum_0[_len_0] = "placenta/bonehead_slice" .. tostring(i) .. ".wav" -- 189
			_len_0 = _len_0 + 1 -- 189
		end -- 189
		return _accum_0 -- 189
	end)(), -- 189
	become_sounds = (function() -- 190
		local _accum_0 = { } -- 190
		local _len_0 = 1 -- 190
		for i = 1, 4 do -- 190
			_accum_0[_len_0] = "placenta/bonehead_aggrod" .. tostring(i) .. ".wav" -- 190
			_len_0 = _len_0 + 1 -- 190
		end -- 190
		return _accum_0 -- 190
	end)(), -- 190
	crosstext = function(ply) -- 191
		local text = "Don't panic." -- 192
		do -- 193
			local _exp_0 = lp:Team() -- 193
			if TEAM_PRIVATE == _exp_0 then -- 194
				text = "Oh no! He's real!" -- 195
			elseif TEAM_SANITAR == _exp_0 then -- 196
				text = "Oh boy." -- 197
			elseif TEAM_KORPSMAN == _exp_0 then -- 198
				text = "Oh no! It happened again!" -- 199
			elseif TEAM_DEALER == _exp_0 then -- 200
				text = "Free ribs to feed the troops." -- 201
			elseif TEAM_EMPEROR == _exp_0 then -- 202
				text = "Ha. It happened again." -- 203
			elseif TEAM_GHOST == _exp_0 then -- 204
				text = "Lookin' good." -- 205
			elseif TEAM_BONEHEAD == _exp_0 then -- 206
				text = "THERE'S ANOTHER ONE." -- 207
			end -- 207
		end -- 207
		return { -- 208
			text = text, -- 208
			font = "Spleen_Label_Small" -- 208
		}, false -- 208
	end, -- 191
	first_names = { -- 209
		"Evil" -- 209
	}, -- 209
	last_names = { -- 210
		"Fucker" -- 210
	}, -- 210
	no_needs = true, -- 211
	hint = "You are a truly pissed off skeleton. Go get 'em!", -- 212
	bar_names = { -- 214
		health = "EVIL FUCKER POWER" -- 214
	}, -- 213
	bar_colors = { -- 216
		health = Color(200, 0, 0) -- 216
	}, -- 215
	RenderScreenspaceEffects = function(ply) -- 217
		local ct = CurTime() -- 218
		DrawMotionBlur(0.25, 0.2, 0.3) -- 219
		return DrawSharpen(1 * math.sin(ct), 2 * math.random(0.8, 1.2)) -- 220
	end, -- 217
	ColorMod = function(ply) -- 221
		local abs, cos, sin = math.abs, math.cos, math.sin -- 222
		local ct = CurTime() -- 223
		local tab = { -- 225
			["$pp_colour_addr"] = 0.1, -- 225
			["$pp_colour_addg"] = 0, -- 226
			["$pp_colour_addb"] = 0, -- 227
			["$pp_colour_brightness"] = 0 + (-0.01 * cos(ct)), -- 228
			["$pp_colour_contrast"] = 1.6 + (abs(sin(ct * 0.166)) * 0.5), -- 229
			["$pp_colour_colour"] = 0, -- 230
			["$pp_colour_mulr"] = 0 + abs(sin(ct * 0.789)), -- 231
			["$pp_colour_mulg"] = 0, -- 232
			["$pp_colour_mulb"] = 0 -- 233
		} -- 224
		return tab -- 234
	end, -- 221
	ShowSpare1 = function() -- 235
		if CLIENT then -- 236
			return GAMEMODE:Frighten() -- 237
		end -- 236
	end, -- 235
	ShowSpare2 = function() -- 238
		if CLIENT then -- 239
			return GAMEMODE:Frighten() -- 240
		end -- 239
	end, -- 238
	Reflect = function(ply) -- 241
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=210,0,0>ARRRRGHH, I MUST KILL THEM ALL AND TAKE THEIR SKIN!!!") -- 242
	end, -- 241
	PlayerLoadout = function(ply) -- 243
		ply:SetNWInt("evilrp_gasmask", 0) -- 244
		ply:Give("evilrp_melee/hands/boneclaws") -- 245
		return true -- 246
	end, -- 243
	HandleRagdoll = function(rag, ply) -- 247
		return rag:SetNWInt("decomp_stage", DSTAGE_BONES) -- 248
	end -- 247
}) -- 177
TEAM_PRIVATE = DarkRP.createJob("Private", { -- 251
	color = Color(20, 150, 20), -- 251
	model = "models/vel/evilwar/royalist.mdl", -- 252
	description = "A new recruit that hasn't gone through training yet.", -- 253
	command = "proletariat", -- 254
	salary = 1, -- 255
	max = 0, -- 256
	cost = 0, -- 257
	hasLicense = true, -- 258
	candemote = false, -- 259
	use_machines = true, -- 260
	category = "Royalists", -- 261
	speech_sounds = (function() -- 262
		local _accum_0 = { } -- 262
		local _len_0 = 1 -- 262
		for i = 1, 3 do -- 262
			_accum_0[_len_0] = "placenta/speech/prole" .. tostring(i) .. ".wav" -- 262
			_len_0 = _len_0 + 1 -- 262
		end -- 262
		return _accum_0 -- 262
	end)(), -- 262
	hurt_sounds = (function() -- 263
		local _accum_0 = { } -- 263
		local _len_0 = 1 -- 263
		for i = 1, 5 do -- 263
			_accum_0[_len_0] = "placenta/pain/prole" .. tostring(i) .. ".wav" -- 263
			_len_0 = _len_0 + 1 -- 263
		end -- 263
		return _accum_0 -- 263
	end)(), -- 263
	become_sounds = (function() -- 264
		local _accum_0 = { } -- 264
		local _len_0 = 1 -- 264
		for i = 1, 3 do -- 264
			_accum_0[_len_0] = "npc/zombie/zombie_alert" .. tostring(i) .. ".wav" -- 264
			_len_0 = _len_0 + 1 -- 264
		end -- 264
		return _accum_0 -- 264
	end)(), -- 264
	death_sounds = (function() -- 265
		local _accum_0 = { } -- 265
		local _len_0 = 1 -- 265
		for i = 1, 3 do -- 265
			_accum_0[_len_0] = "placenta/death/prole" .. tostring(i) .. ".wav" -- 265
			_len_0 = _len_0 + 1 -- 265
		end -- 265
		return _accum_0 -- 265
	end)(), -- 265
	crosstext = function(ply) -- 266
		local text = "Don't panic." -- 267
		do -- 268
			local _exp_0 = lp:Team() -- 268
			if TEAM_PRIVATE == _exp_0 then -- 269
				text = "United in rank?" -- 270
			elseif TEAM_STALKER == _exp_0 then -- 271
				text = "A soldier from Lymphoma." -- 272
			elseif TEAM_SANITAR == _exp_0 then -- 273
				text = "These soldiers need guidance.\nPut the fear in their hearts." -- 274
			elseif TEAM_KORPSMAN == _exp_0 then -- 275
				text = "Smelly and stupid." -- 276
			elseif TEAM_DEALER == _exp_0 then -- 277
				text = "Prove your place, worm.\nOnly then will you be decorated." -- 278
			elseif TEAM_EMPEROR == _exp_0 then -- 279
				text = "Is he working hard enough?" -- 280
			elseif TEAM_GHOST == _exp_0 then -- 281
				text = "Sad, but funny." -- 282
			elseif TEAM_BONEHEAD == _exp_0 then -- 283
				text = "SKIN...!" -- 284
			end -- 284
		end -- 284
		return { -- 285
			text = text, -- 285
			font = "Spleen_Label_Small" -- 285
		}, false -- 285
	end, -- 266
	first_names = { -- 286
		"Private", -- 286
		"PVT.", -- 286
		"Recruit", -- 286
		"Enlistee", -- 286
		"Grunt", -- 286
		"Fodder", -- 286
		"Cadet", -- 286
		"CDT.", -- 286
		"Rookie" -- 286
	}, -- 286
	GenerateName = function(self, ply) -- 287
		local unit_id = math.random(1, 99) -- 288
		if unit_id < 10 then -- 289
			unit_id = "0" .. tostring(unit_id) -- 290
		else -- 292
			unit_id = tostring(unit_id) -- 292
		end -- 289
		return self.first_names[math.random(1, #self.first_names)] .. " #" .. unit_id -- 293
	end, -- 287
	special_name = "private parts", -- 294
	special_name_chance = 1000, -- 295
	ShowSpare1 = open_player_menu, -- 296
	ShowSpare2 = open_action_menu, -- 297
	Reflect = function(ply) -- 298
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I am a patriotic Lymphoman resident, a laborer and combatant. I must remain productive, my body should be used for the greater good. <c=0,210,0> I can be conscripted by the EMPEROR.") -- 299
	end, -- 298
	PlayerLoadout = function(ply) -- 300
		ply:ClearOddities() -- 301
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 302
		for slot, val in pairs({ -- 305
			[0] = 0, -- 305
			[1] = 0, -- 307
			[3] = { -- 309
				0, -- 309
				6, -- 309
				7, -- 309
				8 -- 309
			}, -- 309
			[4] = { -- 311
				0, -- 311
				4 -- 311
			}, -- 311
			[5] = 0, -- 313
			[6] = 0 -- 315
		}) do -- 316
			set_bodygroup(ply, slot, val) -- 303
		end -- 303
		return false -- 317
	end -- 300
}) -- 250
TEAM_CONSCRIPT = DarkRP.createJob("Conscript", { -- 320
	color = Color(19, 51, 45), -- 320
	model = "models/vel/evilwar/royalist.mdl", -- 321
	description = "The fate of those who don't make the cut.", -- 322
	weapons = { -- 323
		"evilrp_melee/pipe" -- 323
	}, -- 323
	randomweapon = conscript_weapons, -- 324
	command = "conscript", -- 325
	salary = 1, -- 326
	max = 5, -- 327
	cost = 1, -- 328
	hasLicense = true, -- 329
	use_machines = false, -- 330
	ammo = { -- 332
		pistol = 60 -- 332
	}, -- 331
	category = "Royalists", -- 333
	speech_sounds = (function() -- 334
		local _accum_0 = { } -- 334
		local _len_0 = 1 -- 334
		for i = 1, 15 do -- 334
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 334
			_len_0 = _len_0 + 1 -- 334
		end -- 334
		return _accum_0 -- 334
	end)(), -- 334
	hurt_sounds = (function() -- 335
		local _accum_0 = { } -- 335
		local _len_0 = 1 -- 335
		for i = 1, 4 do -- 335
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 335
			_len_0 = _len_0 + 1 -- 335
		end -- 335
		return _accum_0 -- 335
	end)(), -- 335
	become_sounds = (function() -- 336
		local _accum_0 = { } -- 336
		local _len_0 = 1 -- 336
		for i = 1, 15 do -- 336
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 336
			_len_0 = _len_0 + 1 -- 336
		end -- 336
		return _accum_0 -- 336
	end)(), -- 336
	crosstext = function(ply) -- 337
		local text = "Don't panic." -- 338
		do -- 339
			local _exp_0 = lp:Team() -- 339
			if TEAM_PRIVATE == _exp_0 then -- 340
				text = "I could be like him!" -- 341
			elseif TEAM_STALKER == _exp_0 then -- 342
				text = "Poor bastard." -- 343
			elseif TEAM_SANITAR == _exp_0 then -- 344
				text = "A fine meat shield." -- 345
			elseif TEAM_KORPSMAN == _exp_0 then -- 346
				text = "Fodder, made to die\n Unless..." -- 347
			elseif TEAM_DEALER == _exp_0 then -- 348
				text = "A follower of mine." -- 349
			elseif TEAM_EMPEROR == _exp_0 then -- 350
				text = "Cannon fodder, splendid." -- 351
			elseif TEAM_CONSCRIPT == _exp_0 then -- 352
				text = "United in blood." -- 353
			elseif TEAM_GHOST == _exp_0 then -- 354
				text = "Definitely stupid." -- 355
			elseif TEAM_BONEHEAD == _exp_0 then -- 356
				text = "HAHAHAH." -- 357
			end -- 357
		end -- 357
		return { -- 358
			text = text, -- 358
			font = "Spleen_Label_Small" -- 358
		}, false -- 358
	end, -- 337
	first_names = { -- 359
		"Fodder", -- 359
		"Meatshield", -- 359
		"Grunt", -- 359
		"Drone", -- 359
		"Conscript", -- 359
		"Meatbag" -- 359
	}, -- 359
	GenerateName = function(self, ply) -- 360
		local unit_id = math.random(1, 99) -- 361
		if unit_id < 10 then -- 362
			unit_id = "0" .. tostring(unit_id) -- 363
		else -- 365
			unit_id = tostring(unit_id) -- 365
		end -- 362
		return self.first_names[math.random(1, #self.first_names)] .. " #" .. unit_id -- 366
	end, -- 360
	special_name = "private parts", -- 367
	special_name_chance = 1000, -- 368
	ShowSpare1 = open_player_menu, -- 369
	ShowSpare2 = open_action_menu, -- 370
	Reflect = function(ply) -- 371
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I have been conscripted by the EMPEROR himself. I must patrol the Wasteland and prevent the entry of foreign invaders, and risk my life for the Emperor. This role holds responsibility.<c=210,0,0> I must not purposely cause the deaths of your comrades.") -- 372
	end, -- 371
	PlayerLoadout = function(ply) -- 373
		for slot, val in pairs({ -- 376
			[0] = 0, -- 376
			[2] = 0, -- 378
			[3] = { -- 380
				7, -- 380
				8 -- 380
			}, -- 380
			[4] = { -- 382
				0, -- 382
				4 -- 382
			}, -- 382
			[5] = 0, -- 384
			[6] = 0, -- 386
			[7] = 1 -- 388
		}) do -- 389
			set_bodygroup(ply, slot, val) -- 374
		end -- 374
		ply:SetArmor(25) -- 390
		ply:Give(conscript_weapons[math.random(1, #conscript_weapons)]) -- 391
		return false -- 392
	end -- 373
}) -- 319
TEAM_SANITAR = DarkRP.createJob("Dragoon", { -- 395
	color = Color(0, 25, 93), -- 395
	model = "models/vel/evilwar/royalist.mdl", -- 396
	description = "The right hand of the Emperor.\nRespected by his peers,\nfeared by his enemies.", -- 397
	weapons = { -- 398
		"evilrp_weapon/hope", -- 398
		"evilrp_melee/sabre" -- 398
	}, -- 398
	command = "ss", -- 399
	salary = 1, -- 400
	max = 6, -- 401
	cost = 3, -- 402
	hasLicense = true, -- 403
	use_machines = false, -- 404
	ammo = { -- 406
		pistol = 60 -- 406
	}, -- 405
	category = "Royalists", -- 407
	speech_sounds = (function() -- 408
		local _accum_0 = { } -- 408
		local _len_0 = 1 -- 408
		for i = 1, 15 do -- 408
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 408
			_len_0 = _len_0 + 1 -- 408
		end -- 408
		return _accum_0 -- 408
	end)(), -- 408
	hurt_sounds = (function() -- 409
		local _accum_0 = { } -- 409
		local _len_0 = 1 -- 409
		for i = 1, 4 do -- 409
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 409
			_len_0 = _len_0 + 1 -- 409
		end -- 409
		return _accum_0 -- 409
	end)(), -- 409
	become_sounds = (function() -- 410
		local _accum_0 = { } -- 410
		local _len_0 = 1 -- 410
		for i = 1, 15 do -- 410
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 410
			_len_0 = _len_0 + 1 -- 410
		end -- 410
		return _accum_0 -- 410
	end)(), -- 410
	crosstext = function(ply) -- 411
		local text = "Don't panic." -- 412
		do -- 413
			local _exp_0 = lp:Team() -- 413
			if TEAM_PRIVATE == _exp_0 then -- 414
				text = "A Lymphomian legend!" -- 415
			elseif TEAM_STALKER == _exp_0 then -- 416
				text = "Fight or run?!" -- 417
			elseif TEAM_SANITAR == _exp_0 then -- 418
				text = "Finally...\nSomeone competent." -- 419
			elseif TEAM_KORPSMAN == _exp_0 then -- 420
				text = "Is that enemy blood?\nNo of course not." -- 421
			elseif TEAM_DEALER == _exp_0 then -- 422
				text = "A follower of mine." -- 423
			elseif TEAM_EMPEROR == _exp_0 then -- 424
				text = "A tentacle of mine." -- 425
			elseif TEAM_GHOST == _exp_0 then -- 426
				text = "Evil, stupid,\n maybe both." -- 427
			elseif TEAM_BONEHEAD == _exp_0 then -- 428
				text = "DANGER." -- 429
			end -- 429
		end -- 429
		return { -- 430
			text = text, -- 430
			font = "Spleen_Label_Small" -- 430
		}, true -- 430
	end, -- 411
	first_names = { -- 431
		"Subjugator", -- 431
		"Dragoner", -- 431
		"Persecuter", -- 431
		"Draconarius", -- 431
		"Volontaire" -- 431
	}, -- 431
	last_names = { -- 432
		"of Die Augen", -- 432
		"of Knochen", -- 432
		"of Sehne", -- 432
		"of Knorpel", -- 432
		"of Bauchspeicheldrüse" -- 432
	}, -- 432
	arms_model = "models/weapons/c_arms_refugee.mdl", -- 433
	ShowSpare1 = open_player_menu, -- 434
	ShowSpare2 = open_action_menu, -- 435
	bar_names = { -- 437
		health = "resolve" -- 437
	}, -- 436
	Reflect = function(ply) -- 438
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I am part of the EMPEROR's finest soldiers. The Privates, Conscripts, and Sanitaters are my subordinates, whilst the EMPEROR and the Quartermaster are my superiors. <c=0,210,0>I must keep order within the city, and the machines tidy") -- 439
	end, -- 438
	PlayerLoadout = function(ply) -- 440
		ply:ClearOddities() -- 441
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 442
		for slot, val in pairs({ -- 445
			[0] = 1, -- 445
			[1] = 1, -- 447
			[2] = 1, -- 449
			[3] = 2, -- 451
			[4] = 3, -- 453
			[5] = 0 -- 455
		}) do -- 456
			set_bodygroup(ply, slot, val) -- 443
		end -- 443
		ply:SetArmor(40) -- 457
		return false -- 458
	end -- 440
}) -- 394
TEAM_DEALER = DarkRP.createJob("Quartermaster", { -- 461
	color = Color(255, 140, 0), -- 461
	model = "models/vel/evilwar/royalist.mdl", -- 462
	description = "The left hand of the Emperor.\nManage the goods and keep your men armed.", -- 463
	weapons = { }, -- 464
	command = "dealer", -- 465
	salary = 1, -- 466
	max = 1, -- 467
	cost = 3, -- 468
	hasLicense = false, -- 469
	use_machines = false, -- 470
	can_sell = true, -- 471
	can_build = true, -- 472
	category = "Royalists", -- 473
	speech_sounds = (function() -- 474
		local _accum_0 = { } -- 474
		local _len_0 = 1 -- 474
		for i = 1, 3 do -- 474
			_accum_0[_len_0] = "placenta/speech/dealer" .. tostring(i) .. ".wav" -- 474
			_len_0 = _len_0 + 1 -- 474
		end -- 474
		return _accum_0 -- 474
	end)(), -- 474
	hurt_sounds = (function() -- 475
		local _accum_0 = { } -- 475
		local _len_0 = 1 -- 475
		for i = 1, 4 do -- 475
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 475
			_len_0 = _len_0 + 1 -- 475
		end -- 475
		return _accum_0 -- 475
	end)(), -- 475
	become_sounds = (function() -- 476
		local _accum_0 = { } -- 476
		local _len_0 = 1 -- 476
		for i = 1, 15 do -- 476
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 476
			_len_0 = _len_0 + 1 -- 476
		end -- 476
		return _accum_0 -- 476
	end)(), -- 476
	crosstext = function(ply) -- 477
		local text = "Don't panic." -- 478
		do -- 479
			local _exp_0 = lp:Team() -- 479
			if TEAM_PRIVATE == _exp_0 then -- 480
				text = "This guy handles the guns." -- 481
			elseif TEAM_STALKER == _exp_0 then -- 482
				text = "Captain of the goods." -- 483
			elseif TEAM_SANITAR == _exp_0 then -- 484
				text = "The oldest living Dragoon.\nRespect. Honor." -- 485
			elseif TEAM_KORPSMAN == _exp_0 then -- 486
				text = "A reminder of the power of Kapitalism." -- 487
			elseif TEAM_DEALER == _exp_0 then -- 488
				text = "I'm seeing double!" -- 489
			elseif TEAM_EMPEROR == _exp_0 then -- 490
				text = "My brother in arms.\nIf he fails, I'll cut his off." -- 491
			elseif TEAM_GHOST == _exp_0 then -- 492
				text = "Glorified accountant." -- 493
			elseif TEAM_BONEHEAD == _exp_0 then -- 494
				text = "BONES ARE HIS DOLLARS." -- 495
			end -- 495
		end -- 495
		return { -- 496
			text = text, -- 496
			font = "Spleen_Label_Small" -- 496
		}, true -- 496
	end, -- 477
	first_names = { -- 497
		"Quartermaster", -- 497
		"Quartiermeister" -- 497
	}, -- 497
	last_names = { -- 498
		"Kommissariatsdienst" -- 498
	}, -- 498
	special_name = "Trusty", -- 499
	special_name_chance = 1000, -- 500
	ShowSpare1 = open_player_menu, -- 501
	ShowSpare2 = open_action_menu, -- 502
	bar_names = { -- 504
		health = "insurance" -- 504
	}, -- 503
	PlayerLoadout = function(ply) -- 505
		ply:ClearOddities() -- 506
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 507
		for slot, val in pairs({ -- 510
			[0] = 1, -- 510
			[1] = 1, -- 512
			[2] = 1, -- 514
			[3] = 1, -- 516
			[4] = 3, -- 518
			[5] = 0 -- 520
		}) do -- 521
			set_bodygroup(ply, slot, val) -- 508
		end -- 508
		return false -- 522
	end -- 505
}) -- 460
TEAM_KORPSMAN = DarkRP.createJob("Sanitater", { -- 525
	color = Color(79, 150, 150), -- 525
	model = "models/vel/evilwar/royalist.mdl", -- 526
	description = "You keep people alive in this terrible place.\nFill the blood and empty the rust.", -- 527
	weapons = { -- 528
		"evilrp/medkit" -- 528
	}, -- 528
	command = "medic", -- 529
	salary = 1, -- 530
	max = 2, -- 531
	cost = 2, -- 532
	hasLicense = false, -- 533
	medic = true, -- 534
	use_machines = false, -- 535
	category = "Royalists", -- 536
	speech_sounds = (function() -- 537
		local _accum_0 = { } -- 537
		local _len_0 = 1 -- 537
		for i = 1, 4 do -- 537
			_accum_0[_len_0] = "placenta/speech/korps" .. tostring(i) .. ".wav" -- 537
			_len_0 = _len_0 + 1 -- 537
		end -- 537
		return _accum_0 -- 537
	end)(), -- 537
	hurt_sounds = (function() -- 538
		local _accum_0 = { } -- 538
		local _len_0 = 1 -- 538
		for i = 1, 4 do -- 538
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 538
			_len_0 = _len_0 + 1 -- 538
		end -- 538
		return _accum_0 -- 538
	end)(), -- 538
	become_sounds = { -- 539
		"items/suitchargeok1.wav" -- 539
	}, -- 539
	crosstext = function(ply) -- 540
		local text = "Don't panic." -- 541
		do -- 542
			local _exp_0 = lp:Team() -- 542
			if TEAM_PRIVATE == _exp_0 then -- 543
				text = "I forgot what\nto call these guys." -- 544
			elseif TEAM_STALKER == _exp_0 then -- 545
				text = "A walking blood bag." -- 546
			elseif TEAM_SANITAR == _exp_0 then -- 547
				text = "Better remember\nwho lets them live." -- 548
			elseif TEAM_KORPSMAN == _exp_0 then -- 549
				text = "Something to\nbe happy about." -- 550
			elseif TEAM_DEALER == _exp_0 then -- 551
				text = "Keep them busy.\nWe need their blood and sweat." -- 552
			elseif TEAM_EMPEROR == _exp_0 then -- 553
				text = "What a strange,\nselfless thing." -- 554
			elseif TEAM_GHOST == _exp_0 then -- 555
				text = "A respectable mortal." -- 556
			elseif TEAM_BONEHEAD == _exp_0 then -- 557
				text = "CONFUSING." -- 558
			end -- 558
		end -- 558
		return { -- 559
			text = text, -- 559
			font = "Spleen_Label_Small" -- 559
		}, true -- 559
	end, -- 540
	first_names = { -- 560
		"Dissector", -- 560
		"Retractor", -- 560
		"Suture", -- 560
		"Femur", -- 560
		"Cystic", -- 560
		"Rasp", -- 560
		"Ferrum", -- 560
		"Fascia", -- 560
		"Marrow", -- 560
		"Lienis", -- 560
		"Aorta", -- 560
		"Tunica", -- 560
		"Maxilla", -- 560
		"Sacrum", -- 560
		"Leach" -- 560
	}, -- 560
	last_names = { -- 561
		"Forceps", -- 561
		"Scalpel", -- 561
		"Curette", -- 561
		"Rongeur", -- 561
		"Trocar", -- 561
		"Babcock", -- 561
		"Duval", -- 561
		"Hemostat", -- 561
		"Ossis", -- 561
		"Caro", -- 561
		"Cadaver", -- 561
		"Sanguis", -- 561
		"Bilis", -- 561
		"Viscera", -- 561
		"Jugular", -- 561
		"Clavius" -- 561
	}, -- 561
	special_name = "Corpseman", -- 562
	special_name_chance = 1000, -- 563
	ShowSpare1 = open_player_menu, -- 564
	ShowSpare2 = open_action_menu, -- 565
	bar_names = { -- 567
		health = "Bio-reserves" -- 567
	}, -- 566
	PlayerLoadout = function(ply) -- 568
		ply:ClearOddities() -- 569
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 570
		ply:SetSkin(4) -- 571
		for slot, val in pairs({ -- 574
			[0] = 0, -- 574
			[1] = 0, -- 576
			[2] = 2, -- 578
			[3] = 3, -- 580
			[4] = 1, -- 582
			[5] = 0 -- 584
		}) do -- 585
			set_bodygroup(ply, slot, val) -- 572
		end -- 572
		return false -- 586
	end -- 568
}) -- 524
TEAM_EMPEROR = DarkRP.createJob("Emperor", { -- 589
	color = Color(150, 20, 20), -- 589
	model = "models/vel/evilwar/royalist.mdl", -- 590
	description = "Rule with an iron fist.", -- 591
	command = "emperor", -- 592
	salary = 1, -- 593
	weapons = { -- 594
		"evilrp_weapon/novoluger" -- 594
	}, -- 594
	max = 1, -- 595
	cost = 5, -- 596
	cooldown = 200, -- 597
	weapons = { }, -- 598
	hasLicense = true, -- 599
	mayor = true, -- 600
	use_machines = false, -- 601
	category = "Royalists", -- 602
	speech_sounds = (function() -- 603
		local _accum_0 = { } -- 603
		local _len_0 = 1 -- 603
		for i = 1, 15 do -- 603
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 603
			_len_0 = _len_0 + 1 -- 603
		end -- 603
		return _accum_0 -- 603
	end)(), -- 603
	become_sounds = { -- 604
		"kidneydagger/broadcast1.wav" -- 604
	}, -- 604
	crosstext = function(ply) -- 605
		local text = "Don't panic." -- 606
		do -- 607
			local _exp_0 = lp:Team() -- 607
			if TEAM_PRIVATE == _exp_0 then -- 608
				text = "Listen carefully." -- 609
			elseif TEAM_STALKER == _exp_0 then -- 610
				text = "Oh, your majesty!" -- 611
			elseif TEAM_SANITAR == _exp_0 then -- 612
				text = "Hail, hail!" -- 613
			elseif TEAM_KORPSMAN == _exp_0 then -- 614
				text = "Is he feeling okay?" -- 615
			elseif TEAM_DEALER == _exp_0 then -- 616
				text = "Glorious leader.\nI'm nothing without him." -- 617
			elseif TEAM_EMPEROR == _exp_0 then -- 618
				text = "Our strength\nshall prevail." -- 619
			elseif TEAM_GHOST == _exp_0 then -- 620
				text = "So full of lies." -- 621
			elseif TEAM_BONEHEAD == _exp_0 then -- 622
				text = "THERE HE IS!!" -- 623
			end -- 623
		end -- 623
		return { -- 624
			text = text, -- 624
			font = "Spleen_Label_Small" -- 624
		}, true -- 624
	end, -- 605
	first_names = { -- 626
		"Basileus", -- 626
		"Agrippa", -- 626
		"Gnaeus", -- 626
		"Gaius" -- 626
	}, -- 626
	last_names = { -- 627
		"Imperator Lymphoma", -- 627
		"Kaiser Lymphoma", -- 627
		"Rex Lymphoma", -- 627
		"Lymphoma Magnus" -- 627
	}, -- 627
	special_name = "Which Kaiser", -- 628
	special_name_chance = 1000, -- 629
	ShowSpare1 = open_player_menu, -- 630
	ShowSpare2 = open_action_menu, -- 631
	bar_names = { -- 633
		health = "PRIDE" -- 633
	}, -- 632
	Reflect = function(ply) -- 634
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I am the EMPEROR of Lymphoma. I am the supreme ruler of this city and its people. I decide who lives and who dies. <c=0,210,0>I can use my terminal to administrate our internal affairs.") -- 635
	end, -- 634
	PlayerLoadout = function(ply) -- 636
		ply:ClearOddities() -- 637
		local oddities -- 638
		do -- 638
			local _accum_0 = { } -- 638
			local _len_0 = 1 -- 638
			for k, v in pairs(ODDITY.list) do -- 638
				if v ~= ODDITY_ILLITERACY then -- 638
					_accum_0[_len_0] = v -- 638
					_len_0 = _len_0 + 1 -- 638
				end -- 638
			end -- 638
			oddities = _accum_0 -- 638
		end -- 638
		ply:AddOddity(oddities[math.random(#oddities)]) -- 639
		for slot, val in pairs({ -- 642
			[0] = 1, -- 642
			[1] = 2, -- 644
			[2] = 0, -- 646
			[3] = 1, -- 648
			[4] = 1, -- 650
			[5] = 0 -- 652
		}) do -- 653
			set_bodygroup(ply, slot, val) -- 640
		end -- 640
		ply:SetNWInt("evilrp_gasmask", 4) -- 654
		ply:Give("evilrp_weapon/novoluger") -- 655
		ply:SetArmor(65) -- 656
		return false -- 657
	end -- 636
}) -- 588
GAMEMODE.CivilProtection = { -- 660
	[TEAM_PRIVATE] = true, -- 660
	[TEAM_CONSCRIPT] = true, -- 661
	[TEAM_SANITAR] = true, -- 662
	[TEAM_EMPEROR] = true -- 663
} -- 659
GAMEMODE.DefaultTeam = TEAM_GHOST -- 665
