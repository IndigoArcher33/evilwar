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
			[2] = 0, -- 309
			[3] = { -- 311
				0, -- 311
				6, -- 311
				7, -- 311
				8 -- 311
			}, -- 311
			[4] = { -- 313
				0, -- 313
				4 -- 313
			}, -- 313
			[5] = 0, -- 315
			[6] = 0 -- 317
		}) do -- 319
			set_bodygroup(ply, slot, val) -- 303
		end -- 303
		return false -- 320
	end -- 300
}) -- 250
TEAM_CONSCRIPT = DarkRP.createJob("Conscript", { -- 323
	color = Color(19, 51, 45), -- 323
	model = "models/vel/evilwar/royalist.mdl", -- 324
	description = "The fate of those who don't make the cut.", -- 325
	weapons = { -- 326
		"evilrp_melee/pipe" -- 326
	}, -- 326
	randomweapon = conscript_weapons, -- 327
	command = "conscript", -- 328
	salary = 1, -- 329
	max = 5, -- 330
	cost = 1, -- 331
	hasLicense = true, -- 332
	use_machines = false, -- 333
	ammo = { -- 335
		pistol = 60 -- 335
	}, -- 334
	category = "Royalists", -- 336
	speech_sounds = (function() -- 337
		local _accum_0 = { } -- 337
		local _len_0 = 1 -- 337
		for i = 1, 15 do -- 337
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 337
			_len_0 = _len_0 + 1 -- 337
		end -- 337
		return _accum_0 -- 337
	end)(), -- 337
	hurt_sounds = (function() -- 338
		local _accum_0 = { } -- 338
		local _len_0 = 1 -- 338
		for i = 1, 4 do -- 338
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 338
			_len_0 = _len_0 + 1 -- 338
		end -- 338
		return _accum_0 -- 338
	end)(), -- 338
	become_sounds = (function() -- 339
		local _accum_0 = { } -- 339
		local _len_0 = 1 -- 339
		for i = 1, 15 do -- 339
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 339
			_len_0 = _len_0 + 1 -- 339
		end -- 339
		return _accum_0 -- 339
	end)(), -- 339
	crosstext = function(ply) -- 340
		local text = "Don't panic." -- 341
		do -- 342
			local _exp_0 = lp:Team() -- 342
			if TEAM_PRIVATE == _exp_0 then -- 343
				text = "I could be like him!" -- 344
			elseif TEAM_STALKER == _exp_0 then -- 345
				text = "Poor bastard." -- 346
			elseif TEAM_SANITAR == _exp_0 then -- 347
				text = "A fine meat shield." -- 348
			elseif TEAM_KORPSMAN == _exp_0 then -- 349
				text = "Fodder, made to die\n Unless..." -- 350
			elseif TEAM_DEALER == _exp_0 then -- 351
				text = "A follower of mine." -- 352
			elseif TEAM_EMPEROR == _exp_0 then -- 353
				text = "Cannon fodder, splendid." -- 354
			elseif TEAM_CONSCRIPT == _exp_0 then -- 355
				text = "United in blood." -- 356
			elseif TEAM_GHOST == _exp_0 then -- 357
				text = "Definitely stupid." -- 358
			elseif TEAM_BONEHEAD == _exp_0 then -- 359
				text = "HAHAHAH." -- 360
			end -- 360
		end -- 360
		return { -- 361
			text = text, -- 361
			font = "Spleen_Label_Small" -- 361
		}, false -- 361
	end, -- 340
	first_names = { -- 362
		"Fodder", -- 362
		"Meatshield", -- 362
		"Grunt", -- 362
		"Drone", -- 362
		"Conscript", -- 362
		"Meatbag" -- 362
	}, -- 362
	GenerateName = function(self, ply) -- 363
		local unit_id = math.random(1, 99) -- 364
		if unit_id < 10 then -- 365
			unit_id = "0" .. tostring(unit_id) -- 366
		else -- 368
			unit_id = tostring(unit_id) -- 368
		end -- 365
		return self.first_names[math.random(1, #self.first_names)] .. " #" .. unit_id -- 369
	end, -- 363
	special_name = "private parts", -- 370
	special_name_chance = 1000, -- 371
	ShowSpare1 = open_player_menu, -- 372
	ShowSpare2 = open_action_menu, -- 373
	Reflect = function(ply) -- 374
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I have been conscripted by the EMPEROR himself. I must patrol the Wasteland and prevent the entry of foreign invaders, and risk my life for the Emperor. This role holds responsibility.<c=210,0,0> I must not purposely cause the deaths of your comrades.") -- 375
	end, -- 374
	PlayerLoadout = function(ply) -- 376
		for slot, val in pairs({ -- 379
			[0] = 0, -- 379
			[1] = 0, -- 381
			[2] = 0, -- 383
			[3] = { -- 385
				7, -- 385
				8 -- 385
			}, -- 385
			[4] = { -- 387
				0, -- 387
				4 -- 387
			}, -- 387
			[5] = 0, -- 389
			[6] = 0, -- 391
			[7] = 1 -- 393
		}) do -- 394
			set_bodygroup(ply, slot, val) -- 377
		end -- 377
		ply:SetArmor(25) -- 395
		ply:Give(conscript_weapons[math.random(1, #conscript_weapons)]) -- 396
		return false -- 397
	end -- 376
}) -- 322
TEAM_SANITAR = DarkRP.createJob("Dragoon", { -- 400
	color = Color(0, 25, 93), -- 400
	model = "models/vel/evilwar/royalist.mdl", -- 401
	description = "The right hand of the Emperor.\nRespected by his peers,\nfeared by his enemies.", -- 402
	weapons = { -- 403
		"evilrp_weapon/hope", -- 403
		"evilrp_melee/sabre" -- 403
	}, -- 403
	command = "ss", -- 404
	salary = 1, -- 405
	max = 6, -- 406
	cost = 3, -- 407
	hasLicense = true, -- 408
	use_machines = false, -- 409
	ammo = { -- 411
		pistol = 60 -- 411
	}, -- 410
	category = "Royalists", -- 412
	speech_sounds = (function() -- 413
		local _accum_0 = { } -- 413
		local _len_0 = 1 -- 413
		for i = 1, 15 do -- 413
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 413
			_len_0 = _len_0 + 1 -- 413
		end -- 413
		return _accum_0 -- 413
	end)(), -- 413
	hurt_sounds = (function() -- 414
		local _accum_0 = { } -- 414
		local _len_0 = 1 -- 414
		for i = 1, 4 do -- 414
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 414
			_len_0 = _len_0 + 1 -- 414
		end -- 414
		return _accum_0 -- 414
	end)(), -- 414
	become_sounds = (function() -- 415
		local _accum_0 = { } -- 415
		local _len_0 = 1 -- 415
		for i = 1, 15 do -- 415
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 415
			_len_0 = _len_0 + 1 -- 415
		end -- 415
		return _accum_0 -- 415
	end)(), -- 415
	crosstext = function(ply) -- 416
		local text = "Don't panic." -- 417
		do -- 418
			local _exp_0 = lp:Team() -- 418
			if TEAM_PRIVATE == _exp_0 then -- 419
				text = "A Lymphomian legend!" -- 420
			elseif TEAM_STALKER == _exp_0 then -- 421
				text = "Fight or run?!" -- 422
			elseif TEAM_SANITAR == _exp_0 then -- 423
				text = "Finally...\nSomeone competent." -- 424
			elseif TEAM_KORPSMAN == _exp_0 then -- 425
				text = "Is that enemy blood?\nNo of course not." -- 426
			elseif TEAM_DEALER == _exp_0 then -- 427
				text = "A follower of mine." -- 428
			elseif TEAM_EMPEROR == _exp_0 then -- 429
				text = "A tentacle of mine." -- 430
			elseif TEAM_GHOST == _exp_0 then -- 431
				text = "Evil, stupid,\n maybe both." -- 432
			elseif TEAM_BONEHEAD == _exp_0 then -- 433
				text = "DANGER." -- 434
			end -- 434
		end -- 434
		return { -- 435
			text = text, -- 435
			font = "Spleen_Label_Small" -- 435
		}, true -- 435
	end, -- 416
	first_names = { -- 436
		"Subjugator", -- 436
		"Dragoner", -- 436
		"Persecuter", -- 436
		"Draconarius", -- 436
		"Volontaire" -- 436
	}, -- 436
	last_names = { -- 437
		"of Die Augen", -- 437
		"of Knochen", -- 437
		"of Sehne", -- 437
		"of Knorpel", -- 437
		"of Bauchspeicheldrüse" -- 437
	}, -- 437
	arms_model = "models/weapons/c_arms_refugee.mdl", -- 438
	ShowSpare1 = open_player_menu, -- 439
	ShowSpare2 = open_action_menu, -- 440
	bar_names = { -- 442
		health = "resolve" -- 442
	}, -- 441
	Reflect = function(ply) -- 443
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I am part of the EMPEROR's finest soldiers. The Privates, Conscripts, and Sanitaters are my subordinates, whilst the EMPEROR and the Quartermaster are my superiors. <c=0,210,0>I must keep order within the city, and the machines tidy") -- 444
	end, -- 443
	PlayerLoadout = function(ply) -- 445
		ply:ClearOddities() -- 446
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 447
		for slot, val in pairs({ -- 450
			[0] = 1, -- 450
			[1] = 1, -- 452
			[2] = 1, -- 454
			[3] = 2, -- 456
			[4] = 3, -- 458
			[5] = 0, -- 460
			[6] = 0 -- 462
		}) do -- 463
			set_bodygroup(ply, slot, val) -- 448
		end -- 448
		ply:SetArmor(40) -- 464
		return false -- 465
	end -- 445
}) -- 399
TEAM_DEALER = DarkRP.createJob("Quartermaster", { -- 468
	color = Color(255, 140, 0), -- 468
	model = "models/vel/evilwar/royalist.mdl", -- 469
	description = "The left hand of the Emperor.\nManage the goods and keep your men armed.", -- 470
	weapons = { }, -- 472
	command = "dealer", -- 473
	salary = 1, -- 474
	max = 1, -- 475
	cost = 3, -- 476
	hasLicense = false, -- 477
	use_machines = false, -- 478
	can_sell = true, -- 479
	can_build = true, -- 480
	category = "Royalists", -- 481
	speech_sounds = (function() -- 482
		local _accum_0 = { } -- 482
		local _len_0 = 1 -- 482
		for i = 1, 3 do -- 482
			_accum_0[_len_0] = "placenta/speech/dealer" .. tostring(i) .. ".wav" -- 482
			_len_0 = _len_0 + 1 -- 482
		end -- 482
		return _accum_0 -- 482
	end)(), -- 482
	hurt_sounds = (function() -- 483
		local _accum_0 = { } -- 483
		local _len_0 = 1 -- 483
		for i = 1, 4 do -- 483
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 483
			_len_0 = _len_0 + 1 -- 483
		end -- 483
		return _accum_0 -- 483
	end)(), -- 483
	become_sounds = (function() -- 484
		local _accum_0 = { } -- 484
		local _len_0 = 1 -- 484
		for i = 1, 15 do -- 484
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 484
			_len_0 = _len_0 + 1 -- 484
		end -- 484
		return _accum_0 -- 484
	end)(), -- 484
	crosstext = function(ply) -- 485
		local text = "Don't panic." -- 486
		do -- 487
			local _exp_0 = lp:Team() -- 487
			if TEAM_PRIVATE == _exp_0 then -- 488
				text = "This guy handles the guns." -- 489
			elseif TEAM_STALKER == _exp_0 then -- 490
				text = "Captain of the goods." -- 491
			elseif TEAM_SANITAR == _exp_0 then -- 492
				text = "The oldest living Dragoon.\nRespect. Honor." -- 493
			elseif TEAM_KORPSMAN == _exp_0 then -- 494
				text = "A reminder of the power of Kapitalism." -- 495
			elseif TEAM_DEALER == _exp_0 then -- 496
				text = "I'm seeing double!" -- 497
			elseif TEAM_EMPEROR == _exp_0 then -- 498
				text = "My brother in arms.\nIf he fails, I'll cut his off." -- 499
			elseif TEAM_GHOST == _exp_0 then -- 500
				text = "Glorified accountant." -- 501
			elseif TEAM_BONEHEAD == _exp_0 then -- 502
				text = "BONES ARE HIS DOLLARS." -- 503
			end -- 503
		end -- 503
		return { -- 504
			text = text, -- 504
			font = "Spleen_Label_Small" -- 504
		}, true -- 504
	end, -- 485
	first_names = { -- 505
		"Quartermaster", -- 505
		"Quartiermeister" -- 505
	}, -- 505
	last_names = { -- 506
		"Kommissariatsdienst" -- 506
	}, -- 506
	special_name = "Trusty", -- 507
	special_name_chance = 1000, -- 508
	ShowSpare1 = open_player_menu, -- 509
	ShowSpare2 = open_action_menu, -- 510
	bar_names = { -- 512
		health = "insurance" -- 512
	}, -- 511
	PlayerLoadout = function(ply) -- 513
		ply:ClearOddities() -- 514
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 515
		for slot, val in pairs({ -- 518
			[0] = 1, -- 518
			[1] = 1, -- 520
			[2] = 1, -- 522
			[3] = 1, -- 524
			[4] = 3, -- 526
			[5] = 0, -- 528
			[6] = 0 -- 530
		}) do -- 531
			set_bodygroup(ply, slot, val) -- 516
		end -- 516
		return false -- 532
	end -- 513
}) -- 467
TEAM_KORPSMAN = DarkRP.createJob("Sanitater", { -- 535
	color = Color(79, 150, 150), -- 535
	model = "models/vel/evilwar/royalist.mdl", -- 536
	description = "You keep people alive in this terrible place.\nFill the blood and empty the rust.", -- 537
	weapons = { -- 538
		"evilrp/medkit", -- 538
		"evilrp_melee/knife" -- 538
	}, -- 538
	command = "medic", -- 539
	salary = 1, -- 540
	max = 2, -- 541
	cost = 2, -- 542
	hasLicense = false, -- 543
	medic = true, -- 544
	use_machines = false, -- 545
	category = "Royalists", -- 546
	speech_sounds = (function() -- 547
		local _accum_0 = { } -- 547
		local _len_0 = 1 -- 547
		for i = 1, 4 do -- 547
			_accum_0[_len_0] = "placenta/speech/korps" .. tostring(i) .. ".wav" -- 547
			_len_0 = _len_0 + 1 -- 547
		end -- 547
		return _accum_0 -- 547
	end)(), -- 547
	hurt_sounds = (function() -- 548
		local _accum_0 = { } -- 548
		local _len_0 = 1 -- 548
		for i = 1, 4 do -- 548
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 548
			_len_0 = _len_0 + 1 -- 548
		end -- 548
		return _accum_0 -- 548
	end)(), -- 548
	become_sounds = { -- 549
		"items/suitchargeok1.wav" -- 549
	}, -- 549
	crosstext = function(ply) -- 550
		local text = "Don't panic." -- 551
		do -- 552
			local _exp_0 = lp:Team() -- 552
			if TEAM_PRIVATE == _exp_0 then -- 553
				text = "I forgot what\nto call these guys." -- 554
			elseif TEAM_STALKER == _exp_0 then -- 555
				text = "A walking blood bag." -- 556
			elseif TEAM_SANITAR == _exp_0 then -- 557
				text = "Better remember\nwho lets them live." -- 558
			elseif TEAM_KORPSMAN == _exp_0 then -- 559
				text = "Something to\nbe happy about." -- 560
			elseif TEAM_DEALER == _exp_0 then -- 561
				text = "Keep them busy.\nWe need their blood and sweat." -- 562
			elseif TEAM_EMPEROR == _exp_0 then -- 563
				text = "What a strange,\nselfless thing." -- 564
			elseif TEAM_GHOST == _exp_0 then -- 565
				text = "A respectable mortal." -- 566
			elseif TEAM_BONEHEAD == _exp_0 then -- 567
				text = "CONFUSING." -- 568
			end -- 568
		end -- 568
		return { -- 569
			text = text, -- 569
			font = "Spleen_Label_Small" -- 569
		}, true -- 569
	end, -- 550
	first_names = { -- 570
		"Dissector", -- 570
		"Retractor", -- 570
		"Suture", -- 570
		"Femur", -- 570
		"Cystic", -- 570
		"Rasp", -- 570
		"Ferrum", -- 570
		"Fascia", -- 570
		"Marrow", -- 570
		"Lienis", -- 570
		"Aorta", -- 570
		"Tunica", -- 570
		"Maxilla", -- 570
		"Sacrum", -- 570
		"Leach" -- 570
	}, -- 570
	last_names = { -- 571
		"Forceps", -- 571
		"Scalpel", -- 571
		"Curette", -- 571
		"Rongeur", -- 571
		"Trocar", -- 571
		"Babcock", -- 571
		"Duval", -- 571
		"Hemostat", -- 571
		"Ossis", -- 571
		"Caro", -- 571
		"Cadaver", -- 571
		"Sanguis", -- 571
		"Bilis", -- 571
		"Viscera", -- 571
		"Jugular", -- 571
		"Clavius" -- 571
	}, -- 571
	special_name = "Corpseman", -- 572
	special_name_chance = 1000, -- 573
	ShowSpare1 = open_player_menu, -- 574
	ShowSpare2 = open_action_menu, -- 575
	bar_names = { -- 577
		health = "Bio-reserves" -- 577
	}, -- 576
	PlayerLoadout = function(ply) -- 578
		ply:ClearOddities() -- 579
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 580
		ply:SetSkin(4) -- 581
		for slot, val in pairs({ -- 584
			[0] = 0, -- 584
			[1] = 0, -- 586
			[2] = 2, -- 588
			[3] = 3, -- 590
			[4] = 1, -- 592
			[5] = 0, -- 594
			[6] = 0 -- 596
		}) do -- 597
			set_bodygroup(ply, slot, val) -- 582
		end -- 582
		return false -- 598
	end -- 578
}) -- 534
TEAM_EMPEROR = DarkRP.createJob("Emperor", { -- 601
	color = Color(150, 20, 20), -- 601
	model = "models/vel/evilwar/royalist.mdl", -- 602
	description = "Rule with an iron fist.", -- 603
	command = "emperor", -- 604
	salary = 1, -- 605
	weapons = { -- 606
		"evilrp_weapon/novoluger" -- 606
	}, -- 606
	max = 1, -- 607
	cost = 5, -- 608
	cooldown = 200, -- 609
	weapons = { }, -- 610
	hasLicense = true, -- 611
	mayor = true, -- 612
	use_machines = false, -- 613
	category = "Royalists", -- 614
	speech_sounds = (function() -- 615
		local _accum_0 = { } -- 615
		local _len_0 = 1 -- 615
		for i = 1, 15 do -- 615
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 615
			_len_0 = _len_0 + 1 -- 615
		end -- 615
		return _accum_0 -- 615
	end)(), -- 615
	become_sounds = { -- 616
		"kidneydagger/broadcast1.wav" -- 616
	}, -- 616
	crosstext = function(ply) -- 617
		local text = "Don't panic." -- 618
		do -- 619
			local _exp_0 = lp:Team() -- 619
			if TEAM_PRIVATE == _exp_0 then -- 620
				text = "Listen carefully." -- 621
			elseif TEAM_STALKER == _exp_0 then -- 622
				text = "Oh, your majesty!" -- 623
			elseif TEAM_SANITAR == _exp_0 then -- 624
				text = "Hail, hail!" -- 625
			elseif TEAM_KORPSMAN == _exp_0 then -- 626
				text = "Is he feeling okay?" -- 627
			elseif TEAM_DEALER == _exp_0 then -- 628
				text = "Glorious leader.\nI'm nothing without him." -- 629
			elseif TEAM_EMPEROR == _exp_0 then -- 630
				text = "Our strength\nshall prevail." -- 631
			elseif TEAM_GHOST == _exp_0 then -- 632
				text = "So full of lies." -- 633
			elseif TEAM_BONEHEAD == _exp_0 then -- 634
				text = "THERE HE IS!!" -- 635
			end -- 635
		end -- 635
		return { -- 636
			text = text, -- 636
			font = "Spleen_Label_Small" -- 636
		}, true -- 636
	end, -- 617
	first_names = { -- 638
		"Basileus", -- 638
		"Agrippa", -- 638
		"Gnaeus", -- 638
		"Gaius" -- 638
	}, -- 638
	last_names = { -- 639
		"Imperator Lymphoma", -- 639
		"Kaiser Lymphoma", -- 639
		"Rex Lymphoma", -- 639
		"Lymphoma Magnus" -- 639
	}, -- 639
	special_name = "Which Kaiser", -- 640
	special_name_chance = 1000, -- 641
	ShowSpare1 = open_player_menu, -- 642
	ShowSpare2 = open_action_menu, -- 643
	bar_names = { -- 645
		health = "PRIDE" -- 645
	}, -- 644
	Reflect = function(ply) -- 646
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I am the EMPEROR of Lymphoma. I am the supreme ruler of this city and its people. I decide who lives and who dies. <c=0,210,0>I can use my terminal to administrate our internal affairs.") -- 647
	end, -- 646
	PlayerLoadout = function(ply) -- 648
		ply:ClearOddities() -- 649
		local oddities -- 650
		do -- 650
			local _accum_0 = { } -- 650
			local _len_0 = 1 -- 650
			for k, v in pairs(ODDITY.list) do -- 650
				if v ~= ODDITY_ILLITERACY then -- 650
					_accum_0[_len_0] = v -- 650
					_len_0 = _len_0 + 1 -- 650
				end -- 650
			end -- 650
			oddities = _accum_0 -- 650
		end -- 650
		ply:AddOddity(oddities[math.random(#oddities)]) -- 651
		for slot, val in pairs({ -- 654
			[0] = 1, -- 654
			[1] = 2, -- 656
			[2] = 0, -- 658
			[3] = 1, -- 660
			[4] = 1, -- 662
			[5] = 0, -- 664
			[6] = 0 -- 666
		}) do -- 667
			set_bodygroup(ply, slot, val) -- 652
		end -- 652
		ply:SetNWInt("evilrp_gasmask", 4) -- 668
		ply:Give("evilrp_weapon/novoluger") -- 669
		ply:SetArmor(65) -- 670
		return false -- 671
	end -- 648
}) -- 600
GAMEMODE.CivilProtection = { -- 674
	[TEAM_PRIVATE] = true, -- 674
	[TEAM_CONSCRIPT] = true, -- 675
	[TEAM_SANITAR] = true, -- 676
	[TEAM_EMPEROR] = true -- 677
} -- 673
GAMEMODE.DefaultTeam = TEAM_GHOST -- 679
