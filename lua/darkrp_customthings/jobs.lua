-- [yue]: darkrp_customthings\jobs.yue
local Config = GAMEMODE.Config -- 4
local conscript_weapons = { -- 11
	"evilrp_weapon/obrez", -- 11
	"evilrp_weapon/pacifier", -- 12
	"evilrp_weapon/warrant", -- 13
	"evilrp_weapon/viper", -- 14
	"evilrp_weapon/coach" -- 15
} -- 10
local set_bodygroup -- 18
set_bodygroup = function(ply, slot, val) -- 18
	if type(val) == "table" then -- 19
		val = val[math.random(1, #val)] -- 21
	end -- 19
	return ply:SetBodygroup(slot, val) -- 22
end -- 18
local open_player_menu -- 24
open_player_menu = function(ply) -- 24
	if not CLIENT then -- 25
		return -- 25
	end -- 25
	if lp:Alive() then -- 26
		return GAMEMODE:CreatePlayerMenu() -- 27
	end -- 26
end -- 24
local open_action_menu -- 29
open_action_menu = function(ply) -- 29
	if not CLIENT then -- 30
		return -- 30
	end -- 30
	local tr = GAMEMODE:GetHandTrace(ply, 80) -- 31
	return GAMEMODE:OpenActionMenu(tr.HitPos, tr.Entity) -- 32
end -- 29
TEAM_GHOST = DarkRP.createJob("Ghost", { -- 35
	color = Color(150, 150, 150), -- 35
	model = "models/player/skeleton.mdl", -- 36
	description = "A lost soul.", -- 37
	instant_respawn = true, -- 38
	weapons = { }, -- 39
	command = "ghost", -- 40
	salary = 1, -- 41
	max = 0, -- 42
	cost = 0, -- 43
	use_machines = false, -- 44
	speech_sounds = { -- 45
		"ambient/voices/squeal1.wav" -- 45
	}, -- 45
	crosstext = function(ply) -- 46
		local text = "OH SOTLA,\nTHE HORROR." -- 48
		do -- 49
			local _exp_0 = lp:Team() -- 49
			if TEAM_KORPSMAN == _exp_0 then -- 50
				text = "Evil spirits wander!\n<wiggle>Not on my shift." -- 51
			elseif TEAM_GHOST == _exp_0 then -- 52
				text = "We're the same,\nyou and I." -- 53
			end -- 53
		end -- 53
		return { -- 54
			text = text, -- 54
			font = "Spleen_Label_Small" -- 54
		} -- 54
	end, -- 46
	first_names = { -- 55
		"Suffering", -- 55
		"Fear", -- 55
		"Agony", -- 55
		"Malice", -- 55
		"Hatred", -- 55
		"Grief", -- 55
		"Pain", -- 55
		"Despair", -- 55
		"Rage" -- 55
	}, -- 55
	ShowSpare1 = function(ply) -- 58
		if CLIENT then -- 59
			return ply:Notify("<c=0,200,0>YOU HAVE " .. tostring(ply:GetStemCells()) .. " STEM CELLS.") -- 60
		end -- 59
	end, -- 58
	ShowSpare2 = function(ply) -- 61
		local nearby = ents.FindInSphere(ply:GetPos(), 16) -- 62
		local found -- 63
		for _index_0 = 1, #nearby do -- 64
			local ent = nearby[_index_0] -- 64
			if ent:GetClass():find("portal/spawn") then -- 65
				found = ent -- 66
				break -- 67
			end -- 65
		end -- 67
		if not (found and IsValid(found)) then -- 68
			if CLIENT then -- 69
				return GAMEMODE:Frighten() -- 70
			else -- 72
				return ply:Notify("<c=200,0,0>There is no purpose in life near me.") -- 72
			end -- 69
		elseif SERVER then -- 73
			return found:Use(ply) -- 74
		end -- 68
	end, -- 61
	PlayerLoadout = function(ply) -- 75
		ply:ClearOddities() -- 77
		ply:SetNWInt("evilrp_gasmask", 0) -- 78
		return true -- 79
	end, -- 75
	ColorMod = function(ply) -- 80
		local abs, cos, sin = math.abs, math.cos, math.sin -- 81
		local ct = CurTime() -- 82
		local tab = { -- 84
			["$pp_colour_addr"] = 0, -- 84
			["$pp_colour_addg"] = 0, -- 85
			["$pp_colour_addb"] = 0, -- 86
			["$pp_colour_brightness"] = 0 + (-0.01 * cos(ct)), -- 87
			["$pp_colour_contrast"] = 0.6 + (abs(sin(ct * 0.166)) * 0.5), -- 88
			["$pp_colour_colour"] = 0, -- 89
			["$pp_colour_mulr"] = 0 + abs(sin(ct * 0.789)), -- 90
			["$pp_colour_mulg"] = 0, -- 91
			["$pp_colour_mulb"] = 0 -- 92
		} -- 83
		return tab -- 93
	end -- 80
}) -- 34
TEAM_STALKER = DarkRP.createJob("Stalker", { -- 96
	color = Color(71, 22, 0), -- 96
	model = "models/liver_failure/wastelander/wastelander.mdl", -- 97
	description = "A soul with no allegiance, destined to plunder the wasteland.", -- 98
	weapons = { -- 99
		"evilrp_melee/pipe", -- 99
		"evilrp_melee/knife" -- 99
	}, -- 99
	category = "Wasteland", -- 100
	command = "stalker", -- 101
	use_machines = true, -- 102
	salary = 1, -- 103
	cooldown = 200, -- 104
	pop_threshold = 10, -- 105
	max = 3, -- 106
	cost = 4, -- 107
	can_build = true, -- 108
	can_sell = true, -- 109
	hasLicense = false, -- 110
	candemote = false, -- 111
	use_machines = false, -- 112
	speech_sounds = (function() -- 113
		local _accum_0 = { } -- 113
		local _len_0 = 1 -- 113
		for i = 1, 4 do -- 113
			_accum_0[_len_0] = "speech/gruffprole" .. tostring(i) .. ".wav" -- 113
			_len_0 = _len_0 + 1 -- 113
		end -- 113
		return _accum_0 -- 113
	end)(), -- 113
	hurt_sounds = (function() -- 114
		local _accum_0 = { } -- 114
		local _len_0 = 1 -- 114
		for i = 1, 6 do -- 114
			_accum_0[_len_0] = "placenta/pain/cult" .. tostring(i) .. ".wav" -- 114
			_len_0 = _len_0 + 1 -- 114
		end -- 114
		return _accum_0 -- 114
	end)(), -- 114
	become_sounds = (function() -- 115
		local _accum_0 = { } -- 115
		local _len_0 = 1 -- 115
		for i = 1, 3 do -- 115
			_accum_0[_len_0] = "npc/zombie/zombie_alert" .. tostring(i) .. ".wav" -- 115
			_len_0 = _len_0 + 1 -- 115
		end -- 115
		return _accum_0 -- 115
	end)(), -- 115
	death_sounds = (function() -- 116
		local _accum_0 = { } -- 116
		local _len_0 = 1 -- 116
		for i = 1, 4 do -- 116
			_accum_0[_len_0] = "placenta/death/cult" .. tostring(i) .. ".wav" -- 116
			_len_0 = _len_0 + 1 -- 116
		end -- 116
		return _accum_0 -- 116
	end)(), -- 116
	crosstext = function(ply) -- 117
		local text = "Don't panic." -- 118
		do -- 119
			local _exp_0 = lp:Team() -- 119
			if TEAM_PRIVATE == _exp_0 then -- 120
				text = "He could sell me some goodies." -- 121
			elseif TEAM_STALKER == _exp_0 then -- 122
				text = "A fellow plunderer." -- 123
			elseif TEAM_SANITAR == _exp_0 then -- 124
				text = "A necessary evil." -- 125
			elseif TEAM_KORPSMAN == _exp_0 then -- 126
				text = "Why is he here?" -- 127
			elseif TEAM_DEALER == _exp_0 then -- 128
				text = "Keep the armaments locked up." -- 129
			elseif TEAM_EMPEROR == _exp_0 then -- 130
				text = "He might be of use to me." -- 131
			elseif TEAM_GHOST == _exp_0 then -- 132
				text = "He has a noble pursuit." -- 133
			elseif TEAM_BONEHEAD == _exp_0 then -- 134
				text = "SEEN HIM BEFORE!!" -- 135
			end -- 135
		end -- 135
		return { -- 136
			text = text, -- 136
			font = "Spleen_Label_Small" -- 136
		}, false -- 136
	end, -- 117
	first_names = { -- 137
		"Wasted", -- 137
		"Decrepit", -- 137
		"Rotten" -- 137
	}, -- 137
	last_names = { -- 138
		"Soul", -- 138
		"Plunderer", -- 138
		"Traitor", -- 138
		"Wanderer" -- 138
	}, -- 138
	bar_names = { -- 140
		health = "regret" -- 140
	}, -- 139
	special_name = "Waste", -- 141
	special_name_chance = 1000, -- 142
	ShowSpare1 = open_player_menu, -- 143
	ShowSpare2 = open_action_menu, -- 144
	Reflect = function(ply) -- 145
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I am a Stalker, an unpatriotic wastelander. I pawn off the Wasteland's treasures to the highest bidder. Unlike everyone else, I am talented at digging through trash. Bone capsules are of great use to me, I can use their contents for nutritious recipes that quench the soul") -- 146
	end, -- 145
	PlayerLoadout = function(ply) -- 147
		ply:ClearOddities() -- 148
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 149
		for slot, val in pairs({ -- 152
			[0] = 0, -- 152
			[1] = 2, -- 154
			[2] = { -- 156
				2, -- 156
				3, -- 156
				8, -- 156
				6 -- 156
			}, -- 156
			[3] = { -- 158
				19, -- 158
				20 -- 158
			}, -- 158
			[4] = 0, -- 160
			[5] = 0, -- 162
			[6] = { -- 164
				0, -- 164
				1, -- 164
				2, -- 164
				3 -- 164
			}, -- 164
			[7] = 0, -- 166
			[8] = 0, -- 168
			[9] = { -- 170
				0, -- 170
				1 -- 170
			} -- 170
		}) do -- 171
			set_bodygroup(ply, slot, val) -- 150
		end -- 150
		local skins = { -- 172
			4, -- 172
			6, -- 172
			7 -- 172
		} -- 172
		ply:SetSkin(skins[math.random(1, #skins)]) -- 173
		return false -- 174
	end -- 147
}) -- 95
do -- 176
	local _class_0 -- 176
	local _parent_0 = SOUND -- 176
	local _base_0 = { -- 176
		sound = "placenta/bonehead_aggrod4.wav", -- 178
		pitch = { -- 178
			200, -- 178
			250 -- 178
		} -- 176
	} -- 176
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 178
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 176
			_base_0[_key_0] = _val_0 -- 176
		end -- 176
	end -- 178
	if _base_0.__index == nil then -- 176
		_base_0.__index = _base_0 -- 176
	end -- 178
	setmetatable(_base_0, _parent_0.__base) -- 176
	_class_0 = setmetatable({ -- 176
		__init = function(self, ...) -- 176
			return _class_0.__parent.__init(self, ...) -- 176
		end, -- 176
		__base = _base_0, -- 176
		__name = "SpeechBonehead", -- 176
		__parent = _parent_0 -- 176
	}, { -- 176
		__index = function(cls, name) -- 176
			local val = rawget(_base_0, name) -- 176
			if val == nil then -- 176
				local parent = rawget(cls, "__parent") -- 176
				if parent then -- 176
					return parent[name] -- 176
				end -- 176
			else -- 176
				return val -- 176
			end -- 176
		end, -- 176
		__call = function(cls, ...) -- 176
			local _self_0 = setmetatable({ }, _base_0) -- 176
			cls.__init(_self_0, ...) -- 176
			return _self_0 -- 176
		end -- 176
	}) -- 176
	_base_0.__class = _class_0 -- 176
	if _parent_0.__inherited then -- 176
		_parent_0.__inherited(_parent_0, _class_0) -- 176
	end -- 176
	SpeechBonehead = _class_0 -- 176
end -- 178
TEAM_BONEHEAD = DarkRP.createJob("Bonehead", { -- 181
	color = Color(150, 150, 150), -- 181
	model = "models/player/zombie_fast.mdl", -- 182
	description = "evil fucker.", -- 183
	instant_respawn = true, -- 184
	command = "bonehead", -- 185
	category = "Scum of Liver Failure", -- 186
	salary = 1, -- 187
	max = 2, -- 188
	cost = 2, -- 189
	cooldown = 120, -- 190
	use_machines = false, -- 191
	speech_sounds = "SpeechBonehead", -- 192
	hurt_sounds = (function() -- 193
		local _accum_0 = { } -- 193
		local _len_0 = 1 -- 193
		for i = 1, 2 do -- 193
			_accum_0[_len_0] = "placenta/bonehead_slice" .. tostring(i) .. ".wav" -- 193
			_len_0 = _len_0 + 1 -- 193
		end -- 193
		return _accum_0 -- 193
	end)(), -- 193
	become_sounds = (function() -- 194
		local _accum_0 = { } -- 194
		local _len_0 = 1 -- 194
		for i = 1, 4 do -- 194
			_accum_0[_len_0] = "placenta/bonehead_aggrod" .. tostring(i) .. ".wav" -- 194
			_len_0 = _len_0 + 1 -- 194
		end -- 194
		return _accum_0 -- 194
	end)(), -- 194
	crosstext = function(ply) -- 195
		local text = "Don't panic." -- 196
		do -- 197
			local _exp_0 = lp:Team() -- 197
			if TEAM_PRIVATE == _exp_0 then -- 198
				text = "Oh no! He's real!" -- 199
			elseif TEAM_SANITAR == _exp_0 then -- 200
				text = "Oh boy." -- 201
			elseif TEAM_KORPSMAN == _exp_0 then -- 202
				text = "Oh no! It happened again!" -- 203
			elseif TEAM_DEALER == _exp_0 then -- 204
				text = "Free ribs to feed the troops." -- 205
			elseif TEAM_EMPEROR == _exp_0 then -- 206
				text = "Ha. It happened again." -- 207
			elseif TEAM_GHOST == _exp_0 then -- 208
				text = "Lookin' good." -- 209
			elseif TEAM_BONEHEAD == _exp_0 then -- 210
				text = "THERE'S ANOTHER ONE." -- 211
			end -- 211
		end -- 211
		return { -- 212
			text = text, -- 212
			font = "Spleen_Label_Small" -- 212
		}, false -- 212
	end, -- 195
	first_names = { -- 213
		"Evil" -- 213
	}, -- 213
	last_names = { -- 214
		"Fucker" -- 214
	}, -- 214
	no_needs = true, -- 215
	hint = "You are a truly pissed off skeleton. Go get 'em!", -- 216
	bar_names = { -- 218
		health = "EVIL FUCKER POWER" -- 218
	}, -- 217
	bar_colors = { -- 220
		health = Color(200, 0, 0) -- 220
	}, -- 219
	RenderScreenspaceEffects = function(ply) -- 221
		local ct = CurTime() -- 222
		DrawMotionBlur(0.25, 0.2, 0.3) -- 223
		return DrawSharpen(1 * math.sin(ct), 2 * math.random(0.8, 1.2)) -- 224
	end, -- 221
	ColorMod = function(ply) -- 225
		local abs, cos, sin = math.abs, math.cos, math.sin -- 226
		local ct = CurTime() -- 227
		local tab = { -- 229
			["$pp_colour_addr"] = 0.1, -- 229
			["$pp_colour_addg"] = 0, -- 230
			["$pp_colour_addb"] = 0, -- 231
			["$pp_colour_brightness"] = 0 + (-0.01 * cos(ct)), -- 232
			["$pp_colour_contrast"] = 1.6 + (abs(sin(ct * 0.166)) * 0.5), -- 233
			["$pp_colour_colour"] = 0, -- 234
			["$pp_colour_mulr"] = 0 + abs(sin(ct * 0.789)), -- 235
			["$pp_colour_mulg"] = 0, -- 236
			["$pp_colour_mulb"] = 0 -- 237
		} -- 228
		return tab -- 238
	end, -- 225
	ShowSpare1 = function() -- 239
		if CLIENT then -- 240
			return GAMEMODE:Frighten() -- 241
		end -- 240
	end, -- 239
	ShowSpare2 = function() -- 242
		if CLIENT then -- 243
			return GAMEMODE:Frighten() -- 244
		end -- 243
	end, -- 242
	Reflect = function(ply) -- 245
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=210,0,0>ARRRRGHH, I MUST KILL THEM ALL AND TAKE THEIR SKIN!!!") -- 246
	end, -- 245
	PlayerLoadout = function(ply) -- 247
		ply:SetNWInt("evilrp_gasmask", 0) -- 248
		ply:Give("evilrp_melee/hands/boneclaws") -- 249
		return true -- 250
	end, -- 247
	HandleRagdoll = function(rag, ply) -- 251
		return rag:SetNWInt("decomp_stage", DSTAGE_BONES) -- 252
	end -- 251
}) -- 180
TEAM_PRIVATE = DarkRP.createJob("Private", { -- 255
	color = Color(20, 150, 20), -- 255
	model = "models/vel/evilwar/royalist.mdl", -- 256
	description = "A new recruit that hasn't gone through training yet.", -- 257
	command = "proletariat", -- 258
	salary = 1, -- 259
	max = 0, -- 260
	cost = 0, -- 261
	hasLicense = true, -- 262
	candemote = false, -- 263
	use_machines = true, -- 264
	category = "Royalists", -- 265
	speech_sounds = (function() -- 266
		local _accum_0 = { } -- 266
		local _len_0 = 1 -- 266
		for i = 1, 3 do -- 266
			_accum_0[_len_0] = "placenta/speech/prole" .. tostring(i) .. ".wav" -- 266
			_len_0 = _len_0 + 1 -- 266
		end -- 266
		return _accum_0 -- 266
	end)(), -- 266
	hurt_sounds = (function() -- 267
		local _accum_0 = { } -- 267
		local _len_0 = 1 -- 267
		for i = 1, 5 do -- 267
			_accum_0[_len_0] = "placenta/pain/prole" .. tostring(i) .. ".wav" -- 267
			_len_0 = _len_0 + 1 -- 267
		end -- 267
		return _accum_0 -- 267
	end)(), -- 267
	become_sounds = (function() -- 268
		local _accum_0 = { } -- 268
		local _len_0 = 1 -- 268
		for i = 1, 3 do -- 268
			_accum_0[_len_0] = "npc/zombie/zombie_alert" .. tostring(i) .. ".wav" -- 268
			_len_0 = _len_0 + 1 -- 268
		end -- 268
		return _accum_0 -- 268
	end)(), -- 268
	death_sounds = (function() -- 269
		local _accum_0 = { } -- 269
		local _len_0 = 1 -- 269
		for i = 1, 3 do -- 269
			_accum_0[_len_0] = "placenta/death/prole" .. tostring(i) .. ".wav" -- 269
			_len_0 = _len_0 + 1 -- 269
		end -- 269
		return _accum_0 -- 269
	end)(), -- 269
	crosstext = function(ply) -- 270
		local text = "Don't panic." -- 271
		do -- 272
			local _exp_0 = lp:Team() -- 272
			if TEAM_PRIVATE == _exp_0 then -- 273
				text = "United in rank?" -- 274
			elseif TEAM_STALKER == _exp_0 then -- 275
				text = "A soldier from Lymphoma." -- 276
			elseif TEAM_SANITAR == _exp_0 then -- 277
				text = "These soldiers need guidance.\nPut the fear in their hearts." -- 278
			elseif TEAM_KORPSMAN == _exp_0 then -- 279
				text = "Smelly and stupid." -- 280
			elseif TEAM_DEALER == _exp_0 then -- 281
				text = "Prove your place, worm.\nOnly then will you be decorated." -- 282
			elseif TEAM_EMPEROR == _exp_0 then -- 283
				text = "Is he working hard enough?" -- 284
			elseif TEAM_GHOST == _exp_0 then -- 285
				text = "Sad, but funny." -- 286
			elseif TEAM_BONEHEAD == _exp_0 then -- 287
				text = "SKIN...!" -- 288
			end -- 288
		end -- 288
		return { -- 289
			text = text, -- 289
			font = "Spleen_Label_Small" -- 289
		}, false -- 289
	end, -- 270
	first_names = { -- 290
		"Private", -- 290
		"PVT.", -- 290
		"Recruit", -- 290
		"Enlistee", -- 290
		"Grunt", -- 290
		"Fodder", -- 290
		"Cadet", -- 290
		"CDT.", -- 290
		"Rookie" -- 290
	}, -- 290
	GenerateName = function(self, ply) -- 291
		local unit_id = math.random(1, 99) -- 292
		if unit_id < 10 then -- 293
			unit_id = "0" .. tostring(unit_id) -- 294
		else -- 296
			unit_id = tostring(unit_id) -- 296
		end -- 293
		return self.first_names[math.random(1, #self.first_names)] .. " #" .. unit_id -- 297
	end, -- 291
	special_name = "private parts", -- 298
	special_name_chance = 1000, -- 299
	ShowSpare1 = open_player_menu, -- 300
	ShowSpare2 = open_action_menu, -- 301
	Reflect = function(ply) -- 302
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I am a patriotic Lymphoman resident, a laborer and combatant. I must remain productive, my body should be used for the greater good. <c=0,210,0> I can be conscripted by the EMPEROR.") -- 303
	end, -- 302
	PlayerLoadout = function(ply) -- 304
		ply:ClearOddities() -- 305
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 306
		for slot, val in pairs({ -- 309
			[0] = 0, -- 309
			[1] = 0, -- 311
			[2] = 0, -- 313
			[3] = { -- 315
				0, -- 315
				6, -- 315
				7, -- 315
				8 -- 315
			}, -- 315
			[4] = { -- 317
				0, -- 317
				4 -- 317
			}, -- 317
			[5] = 0, -- 319
			[6] = 0 -- 321
		}) do -- 323
			set_bodygroup(ply, slot, val) -- 307
		end -- 307
		return false -- 324
	end -- 304
}) -- 254
TEAM_CONSCRIPT = DarkRP.createJob("Conscript", { -- 327
	color = Color(19, 51, 45), -- 327
	model = "models/vel/evilwar/royalist.mdl", -- 328
	description = "The fate of those who don't make the cut.", -- 329
	weapons = { -- 330
		"evilrp_melee/pipe" -- 330
	}, -- 330
	randomweapon = conscript_weapons, -- 331
	command = "conscript", -- 332
	salary = 1, -- 333
	max = 5, -- 334
	cost = 1, -- 335
	hasLicense = true, -- 336
	use_machines = false, -- 337
	ammo = { -- 339
		pistol = 60 -- 339
	}, -- 338
	category = "Royalists", -- 340
	speech_sounds = (function() -- 341
		local _accum_0 = { } -- 341
		local _len_0 = 1 -- 341
		for i = 1, 15 do -- 341
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 341
			_len_0 = _len_0 + 1 -- 341
		end -- 341
		return _accum_0 -- 341
	end)(), -- 341
	hurt_sounds = (function() -- 342
		local _accum_0 = { } -- 342
		local _len_0 = 1 -- 342
		for i = 1, 4 do -- 342
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 342
			_len_0 = _len_0 + 1 -- 342
		end -- 342
		return _accum_0 -- 342
	end)(), -- 342
	become_sounds = (function() -- 343
		local _accum_0 = { } -- 343
		local _len_0 = 1 -- 343
		for i = 1, 15 do -- 343
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 343
			_len_0 = _len_0 + 1 -- 343
		end -- 343
		return _accum_0 -- 343
	end)(), -- 343
	crosstext = function(ply) -- 344
		local text = "Don't panic." -- 345
		do -- 346
			local _exp_0 = lp:Team() -- 346
			if TEAM_PRIVATE == _exp_0 then -- 347
				text = "I could be like him!" -- 348
			elseif TEAM_STALKER == _exp_0 then -- 349
				text = "Poor bastard." -- 350
			elseif TEAM_SANITAR == _exp_0 then -- 351
				text = "A fine meat shield." -- 352
			elseif TEAM_KORPSMAN == _exp_0 then -- 353
				text = "Fodder, made to die\n Unless..." -- 354
			elseif TEAM_DEALER == _exp_0 then -- 355
				text = "A follower of mine." -- 356
			elseif TEAM_EMPEROR == _exp_0 then -- 357
				text = "Cannon fodder, splendid." -- 358
			elseif TEAM_CONSCRIPT == _exp_0 then -- 359
				text = "United in blood." -- 360
			elseif TEAM_GHOST == _exp_0 then -- 361
				text = "Definitely stupid." -- 362
			elseif TEAM_BONEHEAD == _exp_0 then -- 363
				text = "HAHAHAH." -- 364
			end -- 364
		end -- 364
		return { -- 365
			text = text, -- 365
			font = "Spleen_Label_Small" -- 365
		}, false -- 365
	end, -- 344
	first_names = { -- 366
		"Fodder", -- 366
		"Meatshield", -- 366
		"Grunt", -- 366
		"Drone", -- 366
		"Conscript", -- 366
		"Meatbag" -- 366
	}, -- 366
	GenerateName = function(self, ply) -- 367
		local unit_id = math.random(1, 99) -- 368
		if unit_id < 10 then -- 369
			unit_id = "0" .. tostring(unit_id) -- 370
		else -- 372
			unit_id = tostring(unit_id) -- 372
		end -- 369
		return self.first_names[math.random(1, #self.first_names)] .. " #" .. unit_id -- 373
	end, -- 367
	special_name = "private parts", -- 374
	special_name_chance = 1000, -- 375
	ShowSpare1 = open_player_menu, -- 376
	ShowSpare2 = open_action_menu, -- 377
	Reflect = function(ply) -- 378
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I have been conscripted by the EMPEROR himself. I must patrol the Wasteland and prevent the entry of foreign invaders, and risk my life for the Emperor. This role holds responsibility.<c=210,0,0> I must not purposely cause the deaths of your comrades.") -- 379
	end, -- 378
	PlayerLoadout = function(ply) -- 380
		for slot, val in pairs({ -- 383
			[0] = 0, -- 383
			[1] = 0, -- 385
			[2] = 0, -- 387
			[3] = { -- 389
				7, -- 389
				8 -- 389
			}, -- 389
			[4] = { -- 391
				0, -- 391
				4 -- 391
			}, -- 391
			[5] = 0, -- 393
			[6] = 0, -- 395
			[7] = 1 -- 397
		}) do -- 398
			set_bodygroup(ply, slot, val) -- 381
		end -- 381
		ply:SetArmor(25) -- 399
		ply:Give(conscript_weapons[math.random(1, #conscript_weapons)]) -- 400
		return false -- 401
	end -- 380
}) -- 326
TEAM_SANITAR = DarkRP.createJob("Dragoon", { -- 404
	color = Color(0, 25, 93), -- 404
	model = "models/vel/evilwar/royalist.mdl", -- 405
	description = "The right hand of the Emperor.\nRespected by his peers,\nfeared by his enemies.", -- 406
	weapons = { -- 407
		"evilrp_weapon/hope", -- 407
		"evilrp_melee/sabre" -- 407
	}, -- 407
	command = "ss", -- 408
	salary = 1, -- 409
	max = 6, -- 410
	cost = 3, -- 411
	hasLicense = true, -- 412
	use_machines = false, -- 413
	ammo = { -- 415
		pistol = 60 -- 415
	}, -- 414
	category = "Royalists", -- 416
	speech_sounds = (function() -- 417
		local _accum_0 = { } -- 417
		local _len_0 = 1 -- 417
		for i = 1, 15 do -- 417
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 417
			_len_0 = _len_0 + 1 -- 417
		end -- 417
		return _accum_0 -- 417
	end)(), -- 417
	hurt_sounds = (function() -- 418
		local _accum_0 = { } -- 418
		local _len_0 = 1 -- 418
		for i = 1, 4 do -- 418
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 418
			_len_0 = _len_0 + 1 -- 418
		end -- 418
		return _accum_0 -- 418
	end)(), -- 418
	become_sounds = (function() -- 419
		local _accum_0 = { } -- 419
		local _len_0 = 1 -- 419
		for i = 1, 15 do -- 419
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 419
			_len_0 = _len_0 + 1 -- 419
		end -- 419
		return _accum_0 -- 419
	end)(), -- 419
	crosstext = function(ply) -- 420
		local text = "Don't panic." -- 421
		do -- 422
			local _exp_0 = lp:Team() -- 422
			if TEAM_PRIVATE == _exp_0 then -- 423
				text = "A Lymphomian legend!" -- 424
			elseif TEAM_STALKER == _exp_0 then -- 425
				text = "Fight or run?!" -- 426
			elseif TEAM_SANITAR == _exp_0 then -- 427
				text = "Finally...\nSomeone competent." -- 428
			elseif TEAM_KORPSMAN == _exp_0 then -- 429
				text = "Is that enemy blood?\nNo of course not." -- 430
			elseif TEAM_DEALER == _exp_0 then -- 431
				text = "A follower of mine." -- 432
			elseif TEAM_EMPEROR == _exp_0 then -- 433
				text = "A tentacle of mine." -- 434
			elseif TEAM_GHOST == _exp_0 then -- 435
				text = "Evil, stupid,\n maybe both." -- 436
			elseif TEAM_BONEHEAD == _exp_0 then -- 437
				text = "DANGER." -- 438
			end -- 438
		end -- 438
		return { -- 439
			text = text, -- 439
			font = "Spleen_Label_Small" -- 439
		}, true -- 439
	end, -- 420
	first_names = { -- 440
		"Subjugator", -- 440
		"Dragoner", -- 440
		"Persecuter", -- 440
		"Draconarius", -- 440
		"Volontaire" -- 440
	}, -- 440
	last_names = { -- 441
		"of Die Augen", -- 441
		"of Knochen", -- 441
		"of Sehne", -- 441
		"of Knorpel", -- 441
		"of Bauchspeicheldrüse" -- 441
	}, -- 441
	arms_model = "models/weapons/c_arms_refugee.mdl", -- 442
	ShowSpare1 = open_player_menu, -- 443
	ShowSpare2 = open_action_menu, -- 444
	bar_names = { -- 446
		health = "resolve" -- 446
	}, -- 445
	Reflect = function(ply) -- 447
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I am part of the EMPEROR's finest soldiers. The Privates, Conscripts, and Sanitaters are my subordinates, whilst the EMPEROR and the Quartermaster are my superiors. <c=0,210,0>I must keep order within the city, and the machines tidy") -- 448
	end, -- 447
	PlayerLoadout = function(ply) -- 449
		ply:ClearOddities() -- 450
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 451
		for slot, val in pairs({ -- 454
			[0] = 1, -- 454
			[1] = 1, -- 456
			[2] = 1, -- 458
			[3] = 2, -- 460
			[4] = 3, -- 462
			[5] = 0, -- 464
			[6] = 0 -- 466
		}) do -- 467
			set_bodygroup(ply, slot, val) -- 452
		end -- 452
		ply:SetArmor(40) -- 468
		return false -- 469
	end -- 449
}) -- 403
TEAM_DEALER = DarkRP.createJob("Quartermaster", { -- 472
	color = Color(255, 140, 0), -- 472
	model = "models/vel/evilwar/royalist.mdl", -- 473
	description = "The left hand of the Emperor.\nManage the goods and keep your men armed.", -- 474
	weapons = { }, -- 476
	command = "dealer", -- 477
	salary = 1, -- 478
	max = 1, -- 479
	cost = 3, -- 480
	hasLicense = false, -- 481
	use_machines = false, -- 482
	can_sell = true, -- 483
	can_build = true, -- 484
	category = "Royalists", -- 485
	speech_sounds = (function() -- 486
		local _accum_0 = { } -- 486
		local _len_0 = 1 -- 486
		for i = 1, 3 do -- 486
			_accum_0[_len_0] = "placenta/speech/dealer" .. tostring(i) .. ".wav" -- 486
			_len_0 = _len_0 + 1 -- 486
		end -- 486
		return _accum_0 -- 486
	end)(), -- 486
	hurt_sounds = (function() -- 487
		local _accum_0 = { } -- 487
		local _len_0 = 1 -- 487
		for i = 1, 4 do -- 487
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 487
			_len_0 = _len_0 + 1 -- 487
		end -- 487
		return _accum_0 -- 487
	end)(), -- 487
	become_sounds = (function() -- 488
		local _accum_0 = { } -- 488
		local _len_0 = 1 -- 488
		for i = 1, 15 do -- 488
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 488
			_len_0 = _len_0 + 1 -- 488
		end -- 488
		return _accum_0 -- 488
	end)(), -- 488
	crosstext = function(ply) -- 489
		local text = "Don't panic." -- 490
		do -- 491
			local _exp_0 = lp:Team() -- 491
			if TEAM_PRIVATE == _exp_0 then -- 492
				text = "This guy handles the guns." -- 493
			elseif TEAM_STALKER == _exp_0 then -- 494
				text = "Captain of the goods." -- 495
			elseif TEAM_SANITAR == _exp_0 then -- 496
				text = "The oldest living Dragoon.\nRespect. Honor." -- 497
			elseif TEAM_KORPSMAN == _exp_0 then -- 498
				text = "A reminder of the power of Kapitalism." -- 499
			elseif TEAM_DEALER == _exp_0 then -- 500
				text = "I'm seeing double!" -- 501
			elseif TEAM_EMPEROR == _exp_0 then -- 502
				text = "My brother in arms.\nIf he fails, I'll cut his off." -- 503
			elseif TEAM_GHOST == _exp_0 then -- 504
				text = "Glorified accountant." -- 505
			elseif TEAM_BONEHEAD == _exp_0 then -- 506
				text = "BONES ARE HIS DOLLARS." -- 507
			end -- 507
		end -- 507
		return { -- 508
			text = text, -- 508
			font = "Spleen_Label_Small" -- 508
		}, true -- 508
	end, -- 489
	first_names = { -- 509
		"Quartermaster", -- 509
		"Quartiermeister" -- 509
	}, -- 509
	last_names = { -- 510
		"Kommissariatsdienst" -- 510
	}, -- 510
	special_name = "Trusty", -- 511
	special_name_chance = 1000, -- 512
	ShowSpare1 = open_player_menu, -- 513
	ShowSpare2 = open_action_menu, -- 514
	bar_names = { -- 516
		health = "insurance" -- 516
	}, -- 515
	PlayerLoadout = function(ply) -- 517
		ply:ClearOddities() -- 518
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 519
		for slot, val in pairs({ -- 522
			[0] = 1, -- 522
			[1] = 1, -- 524
			[2] = 1, -- 526
			[3] = 1, -- 528
			[4] = 3, -- 530
			[5] = 0, -- 532
			[6] = 0 -- 534
		}) do -- 535
			set_bodygroup(ply, slot, val) -- 520
		end -- 520
		return false -- 536
	end -- 517
}) -- 471
TEAM_KORPSMAN = DarkRP.createJob("Sanitater", { -- 539
	color = Color(79, 150, 150), -- 539
	model = "models/vel/evilwar/royalist.mdl", -- 540
	description = "You keep people alive in this terrible place.\nFill the blood and empty the rust.", -- 541
	weapons = { -- 542
		"evilrp/medkit", -- 542
		"evilrp_melee/knife" -- 542
	}, -- 542
	command = "medic", -- 543
	salary = 1, -- 544
	max = 2, -- 545
	cost = 2, -- 546
	hasLicense = false, -- 547
	medic = true, -- 548
	use_machines = false, -- 549
	category = "Royalists", -- 550
	speech_sounds = (function() -- 551
		local _accum_0 = { } -- 551
		local _len_0 = 1 -- 551
		for i = 1, 4 do -- 551
			_accum_0[_len_0] = "placenta/speech/korps" .. tostring(i) .. ".wav" -- 551
			_len_0 = _len_0 + 1 -- 551
		end -- 551
		return _accum_0 -- 551
	end)(), -- 551
	hurt_sounds = (function() -- 552
		local _accum_0 = { } -- 552
		local _len_0 = 1 -- 552
		for i = 1, 4 do -- 552
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 552
			_len_0 = _len_0 + 1 -- 552
		end -- 552
		return _accum_0 -- 552
	end)(), -- 552
	become_sounds = { -- 553
		"items/suitchargeok1.wav" -- 553
	}, -- 553
	crosstext = function(ply) -- 554
		local text = "Don't panic." -- 555
		do -- 556
			local _exp_0 = lp:Team() -- 556
			if TEAM_PRIVATE == _exp_0 then -- 557
				text = "I forgot what\nto call these guys." -- 558
			elseif TEAM_STALKER == _exp_0 then -- 559
				text = "A walking blood bag." -- 560
			elseif TEAM_SANITAR == _exp_0 then -- 561
				text = "Better remember\nwho lets them live." -- 562
			elseif TEAM_KORPSMAN == _exp_0 then -- 563
				text = "Something to\nbe happy about." -- 564
			elseif TEAM_DEALER == _exp_0 then -- 565
				text = "Keep them busy.\nWe need their blood and sweat." -- 566
			elseif TEAM_EMPEROR == _exp_0 then -- 567
				text = "What a strange,\nselfless thing." -- 568
			elseif TEAM_GHOST == _exp_0 then -- 569
				text = "A respectable mortal." -- 570
			elseif TEAM_BONEHEAD == _exp_0 then -- 571
				text = "CONFUSING." -- 572
			end -- 572
		end -- 572
		return { -- 573
			text = text, -- 573
			font = "Spleen_Label_Small" -- 573
		}, true -- 573
	end, -- 554
	first_names = { -- 574
		"Dissector", -- 574
		"Retractor", -- 574
		"Suture", -- 574
		"Femur", -- 574
		"Cystic", -- 574
		"Rasp", -- 574
		"Ferrum", -- 574
		"Fascia", -- 574
		"Marrow", -- 574
		"Lienis", -- 574
		"Aorta", -- 574
		"Tunica", -- 574
		"Maxilla", -- 574
		"Sacrum", -- 574
		"Leach" -- 574
	}, -- 574
	last_names = { -- 575
		"Forceps", -- 575
		"Scalpel", -- 575
		"Curette", -- 575
		"Rongeur", -- 575
		"Trocar", -- 575
		"Babcock", -- 575
		"Duval", -- 575
		"Hemostat", -- 575
		"Ossis", -- 575
		"Caro", -- 575
		"Cadaver", -- 575
		"Sanguis", -- 575
		"Bilis", -- 575
		"Viscera", -- 575
		"Jugular", -- 575
		"Clavius" -- 575
	}, -- 575
	special_name = "Corpseman", -- 576
	special_name_chance = 1000, -- 577
	ShowSpare1 = open_player_menu, -- 578
	ShowSpare2 = open_action_menu, -- 579
	bar_names = { -- 581
		health = "Bio-reserves" -- 581
	}, -- 580
	PlayerLoadout = function(ply) -- 582
		ply:ClearOddities() -- 583
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 584
		ply:SetSkin(4) -- 585
		for slot, val in pairs({ -- 588
			[0] = 0, -- 588
			[1] = 0, -- 590
			[2] = 2, -- 592
			[3] = 3, -- 594
			[4] = 1, -- 596
			[5] = 0, -- 598
			[6] = 0 -- 600
		}) do -- 601
			set_bodygroup(ply, slot, val) -- 586
		end -- 586
		return false -- 602
	end -- 582
}) -- 538
TEAM_EMPEROR = DarkRP.createJob("Emperor", { -- 605
	color = Color(150, 20, 20), -- 605
	model = "models/vel/evilwar/royalist.mdl", -- 606
	description = "Rule with an iron fist.", -- 607
	command = "emperor", -- 608
	salary = 1, -- 609
	weapons = { -- 610
		"evilrp_weapon/novoluger" -- 610
	}, -- 610
	max = 1, -- 611
	cost = 5, -- 612
	cooldown = 200, -- 613
	weapons = { }, -- 614
	hasLicense = true, -- 615
	mayor = true, -- 616
	use_machines = false, -- 617
	category = "Royalists", -- 618
	speech_sounds = (function() -- 619
		local _accum_0 = { } -- 619
		local _len_0 = 1 -- 619
		for i = 1, 15 do -- 619
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 619
			_len_0 = _len_0 + 1 -- 619
		end -- 619
		return _accum_0 -- 619
	end)(), -- 619
	become_sounds = { -- 620
		"kidneydagger/broadcast1.wav" -- 620
	}, -- 620
	crosstext = function(ply) -- 621
		local text = "Don't panic." -- 622
		do -- 623
			local _exp_0 = lp:Team() -- 623
			if TEAM_PRIVATE == _exp_0 then -- 624
				text = "Listen carefully." -- 625
			elseif TEAM_STALKER == _exp_0 then -- 626
				text = "Oh, your majesty!" -- 627
			elseif TEAM_SANITAR == _exp_0 then -- 628
				text = "Hail, hail!" -- 629
			elseif TEAM_KORPSMAN == _exp_0 then -- 630
				text = "Is he feeling okay?" -- 631
			elseif TEAM_DEALER == _exp_0 then -- 632
				text = "Glorious leader.\nI'm nothing without him." -- 633
			elseif TEAM_EMPEROR == _exp_0 then -- 634
				text = "Our strength\nshall prevail." -- 635
			elseif TEAM_GHOST == _exp_0 then -- 636
				text = "So full of lies." -- 637
			elseif TEAM_BONEHEAD == _exp_0 then -- 638
				text = "THERE HE IS!!" -- 639
			end -- 639
		end -- 639
		return { -- 640
			text = text, -- 640
			font = "Spleen_Label_Small" -- 640
		}, true -- 640
	end, -- 621
	first_names = { -- 642
		"Basileus", -- 642
		"Agrippa", -- 642
		"Gnaeus", -- 642
		"Gaius" -- 642
	}, -- 642
	last_names = { -- 643
		"Imperator Lymphoma", -- 643
		"Kaiser Lymphoma", -- 643
		"Rex Lymphoma", -- 643
		"Lymphoma Magnus" -- 643
	}, -- 643
	special_name = "Which Kaiser", -- 644
	special_name_chance = 1000, -- 645
	ShowSpare1 = open_player_menu, -- 646
	ShowSpare2 = open_action_menu, -- 647
	bar_names = { -- 649
		health = "PRIDE" -- 649
	}, -- 648
	Reflect = function(ply) -- 650
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I am the EMPEROR of Lymphoma. I am the supreme ruler of this city and its people. I decide who lives and who dies. <c=0,210,0>I can use my terminal to administrate our internal affairs.") -- 651
	end, -- 650
	PlayerLoadout = function(ply) -- 652
		ply:ClearOddities() -- 653
		local oddities -- 654
		do -- 654
			local _accum_0 = { } -- 654
			local _len_0 = 1 -- 654
			for k, v in pairs(ODDITY.list) do -- 654
				if v ~= ODDITY_ILLITERACY then -- 654
					_accum_0[_len_0] = v -- 654
					_len_0 = _len_0 + 1 -- 654
				end -- 654
			end -- 654
			oddities = _accum_0 -- 654
		end -- 654
		ply:AddOddity(oddities[math.random(#oddities)]) -- 655
		for slot, val in pairs({ -- 658
			[0] = 1, -- 658
			[1] = 2, -- 660
			[2] = 0, -- 662
			[3] = 1, -- 664
			[4] = 2, -- 666
			[5] = 1, -- 668
			[6] = 0 -- 670
		}) do -- 671
			set_bodygroup(ply, slot, val) -- 656
		end -- 656
		ply:SetNWInt("evilrp_gasmask", 4) -- 672
		ply:Give("evilrp_weapon/novoluger") -- 673
		ply:SetArmor(65) -- 674
		return false -- 675
	end -- 652
}) -- 604
GAMEMODE.CivilProtection = { -- 678
	[TEAM_PRIVATE] = true, -- 678
	[TEAM_CONSCRIPT] = true, -- 679
	[TEAM_SANITAR] = true, -- 680
	[TEAM_EMPEROR] = true -- 681
} -- 677
GAMEMODE.DefaultTeam = TEAM_GHOST -- 683
