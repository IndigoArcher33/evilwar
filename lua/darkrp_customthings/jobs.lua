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
		"evilrp_weapon/whisper", -- 98
		"evilrp_melee/knife" -- 98
	}, -- 98
	category = "Wasteland", -- 99
	command = "stalker", -- 100
	use_machines = true, -- 101
	salary = 1, -- 102
	max = 3, -- 103
	cost = 4, -- 104
	can_build = true, -- 105
	hasLicense = false, -- 106
	candemote = false, -- 107
	use_machines = false, -- 108
	speech_sounds = (function() -- 109
		local _accum_0 = { } -- 109
		local _len_0 = 1 -- 109
		for i = 1, 4 do -- 109
			_accum_0[_len_0] = "speech/gruffprole" .. tostring(i) .. ".wav" -- 109
			_len_0 = _len_0 + 1 -- 109
		end -- 109
		return _accum_0 -- 109
	end)(), -- 109
	hurt_sounds = (function() -- 110
		local _accum_0 = { } -- 110
		local _len_0 = 1 -- 110
		for i = 1, 6 do -- 110
			_accum_0[_len_0] = "placenta/pain/cult" .. tostring(i) .. ".wav" -- 110
			_len_0 = _len_0 + 1 -- 110
		end -- 110
		return _accum_0 -- 110
	end)(), -- 110
	become_sounds = (function() -- 111
		local _accum_0 = { } -- 111
		local _len_0 = 1 -- 111
		for i = 1, 3 do -- 111
			_accum_0[_len_0] = "npc/zombie/zombie_alert" .. tostring(i) .. ".wav" -- 111
			_len_0 = _len_0 + 1 -- 111
		end -- 111
		return _accum_0 -- 111
	end)(), -- 111
	death_sounds = (function() -- 112
		local _accum_0 = { } -- 112
		local _len_0 = 1 -- 112
		for i = 1, 4 do -- 112
			_accum_0[_len_0] = "placenta/death/cult" .. tostring(i) .. ".wav" -- 112
			_len_0 = _len_0 + 1 -- 112
		end -- 112
		return _accum_0 -- 112
	end)(), -- 112
	crosstext = function(ply) -- 113
		local text = "Don't panic." -- 114
		do -- 115
			local _exp_0 = lp:Team() -- 115
			if TEAM_PRIVATE == _exp_0 then -- 116
				text = "He doesn't look like me." -- 117
			elseif TEAM_STALKER == _exp_0 then -- 118
				text = "A fellow plunderer." -- 119
			elseif TEAM_SANITAR == _exp_0 then -- 120
				text = "Despicable." -- 121
			elseif TEAM_KORPSMAN == _exp_0 then -- 122
				text = "Why is he here?" -- 123
			elseif TEAM_DEALER == _exp_0 then -- 124
				text = "Keep the armaments locked up." -- 125
			elseif TEAM_EMPEROR == _exp_0 then -- 126
				text = "He might be of use to me." -- 127
			elseif TEAM_GHOST == _exp_0 then -- 128
				text = "He has a noble pursuit." -- 129
			elseif TEAM_BONEHEAD == _exp_0 then -- 130
				text = "SEEN HIM BEFORE!!" -- 131
			end -- 131
		end -- 131
		return { -- 132
			text = text, -- 132
			font = "Spleen_Label_Small" -- 132
		}, false -- 132
	end, -- 113
	first_names = { -- 133
		"Wasted", -- 133
		"Decrepit", -- 133
		"Rotten" -- 133
	}, -- 133
	last_names = { -- 134
		"Soul", -- 134
		"Plunderer", -- 134
		"Traitor", -- 134
		"Wanderer" -- 134
	}, -- 134
	bar_names = { -- 136
		health = "regret" -- 136
	}, -- 135
	special_name = "Waste", -- 137
	special_name_chance = 1000, -- 138
	ShowSpare1 = open_player_menu, -- 139
	ShowSpare2 = open_action_menu, -- 140
	Reflect = function(ply) -- 141
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I am a Stalker, an unpatriotic wastelander. I pawn off the Wasteland's treasures to the highest bidder. Unlike everyone else, I am talented at digging through trash. Bone capsules are of great use to me, I can use their contents for nutritious recipes that quench the soul") -- 142
	end, -- 141
	PlayerLoadout = function(ply) -- 143
		ply:ClearOddities() -- 144
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 145
		for slot, val in pairs({ -- 148
			[0] = 0, -- 148
			[1] = 2, -- 150
			[2] = { -- 152
				2, -- 152
				3, -- 152
				8, -- 152
				6 -- 152
			}, -- 152
			[3] = { -- 154
				19, -- 154
				20 -- 154
			}, -- 154
			[4] = 0, -- 156
			[5] = 0, -- 158
			[6] = { -- 160
				0, -- 160
				1, -- 160
				2, -- 160
				3 -- 160
			}, -- 160
			[7] = 0, -- 162
			[8] = 0, -- 164
			[9] = { -- 166
				0, -- 166
				1 -- 166
			} -- 166
		}) do -- 167
			set_bodygroup(ply, slot, val) -- 146
		end -- 146
		local skins = { -- 168
			4, -- 168
			6, -- 168
			7 -- 168
		} -- 168
		ply:SetSkin(skins[math.random(1, #skins)]) -- 169
		return false -- 170
	end -- 143
}) -- 94
do -- 172
	local _class_0 -- 172
	local _parent_0 = SOUND -- 172
	local _base_0 = { -- 172
		sound = "placenta/bonehead_aggrod4.wav", -- 174
		pitch = { -- 174
			200, -- 174
			250 -- 174
		} -- 172
	} -- 172
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 174
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 172
			_base_0[_key_0] = _val_0 -- 172
		end -- 172
	end -- 174
	if _base_0.__index == nil then -- 172
		_base_0.__index = _base_0 -- 172
	end -- 174
	setmetatable(_base_0, _parent_0.__base) -- 172
	_class_0 = setmetatable({ -- 172
		__init = function(self, ...) -- 172
			return _class_0.__parent.__init(self, ...) -- 172
		end, -- 172
		__base = _base_0, -- 172
		__name = "SpeechBonehead", -- 172
		__parent = _parent_0 -- 172
	}, { -- 172
		__index = function(cls, name) -- 172
			local val = rawget(_base_0, name) -- 172
			if val == nil then -- 172
				local parent = rawget(cls, "__parent") -- 172
				if parent then -- 172
					return parent[name] -- 172
				end -- 172
			else -- 172
				return val -- 172
			end -- 172
		end, -- 172
		__call = function(cls, ...) -- 172
			local _self_0 = setmetatable({ }, _base_0) -- 172
			cls.__init(_self_0, ...) -- 172
			return _self_0 -- 172
		end -- 172
	}) -- 172
	_base_0.__class = _class_0 -- 172
	if _parent_0.__inherited then -- 172
		_parent_0.__inherited(_parent_0, _class_0) -- 172
	end -- 172
	SpeechBonehead = _class_0 -- 172
end -- 174
TEAM_BONEHEAD = DarkRP.createJob("Bonehead", { -- 177
	color = Color(150, 150, 150), -- 177
	model = "models/player/zombie_fast.mdl", -- 178
	description = "evil fucker.", -- 179
	instant_respawn = true, -- 180
	command = "bonehead", -- 181
	category = "Scum of Liver Failure", -- 182
	salary = 1, -- 183
	max = 2, -- 184
	cost = 2, -- 185
	use_machines = false, -- 186
	speech_sounds = "SpeechBonehead", -- 187
	hurt_sounds = (function() -- 188
		local _accum_0 = { } -- 188
		local _len_0 = 1 -- 188
		for i = 1, 2 do -- 188
			_accum_0[_len_0] = "placenta/bonehead_slice" .. tostring(i) .. ".wav" -- 188
			_len_0 = _len_0 + 1 -- 188
		end -- 188
		return _accum_0 -- 188
	end)(), -- 188
	become_sounds = (function() -- 189
		local _accum_0 = { } -- 189
		local _len_0 = 1 -- 189
		for i = 1, 4 do -- 189
			_accum_0[_len_0] = "placenta/bonehead_aggrod" .. tostring(i) .. ".wav" -- 189
			_len_0 = _len_0 + 1 -- 189
		end -- 189
		return _accum_0 -- 189
	end)(), -- 189
	crosstext = function(ply) -- 190
		local text = "Don't panic." -- 191
		do -- 192
			local _exp_0 = lp:Team() -- 192
			if TEAM_PRIVATE == _exp_0 then -- 193
				text = "Oh no! He's real!" -- 194
			elseif TEAM_SANITAR == _exp_0 then -- 195
				text = "Oh boy." -- 196
			elseif TEAM_KORPSMAN == _exp_0 then -- 197
				text = "Oh no! It happened again!" -- 198
			elseif TEAM_DEALER == _exp_0 then -- 199
				text = "Free ribs to feed the troops." -- 200
			elseif TEAM_EMPEROR == _exp_0 then -- 201
				text = "Ha. It happened again." -- 202
			elseif TEAM_GHOST == _exp_0 then -- 203
				text = "Lookin' good." -- 204
			elseif TEAM_BONEHEAD == _exp_0 then -- 205
				text = "THERE'S ANOTHER ONE." -- 206
			end -- 206
		end -- 206
		return { -- 207
			text = text, -- 207
			font = "Spleen_Label_Small" -- 207
		}, false -- 207
	end, -- 190
	first_names = { -- 208
		"Evil" -- 208
	}, -- 208
	last_names = { -- 209
		"Fucker" -- 209
	}, -- 209
	no_needs = true, -- 210
	hint = "You are a truly pissed off skeleton. Go get 'em!", -- 211
	bar_names = { -- 213
		health = "EVIL FUCKER POWER" -- 213
	}, -- 212
	bar_colors = { -- 215
		health = Color(200, 0, 0) -- 215
	}, -- 214
	RenderScreenspaceEffects = function(ply) -- 216
		local ct = CurTime() -- 217
		DrawMotionBlur(0.25, 0.2, 0.3) -- 218
		return DrawSharpen(1 * math.sin(ct), 2 * math.random(0.8, 1.2)) -- 219
	end, -- 216
	ColorMod = function(ply) -- 220
		local abs, cos, sin = math.abs, math.cos, math.sin -- 221
		local ct = CurTime() -- 222
		local tab = { -- 224
			["$pp_colour_addr"] = 0.1, -- 224
			["$pp_colour_addg"] = 0, -- 225
			["$pp_colour_addb"] = 0, -- 226
			["$pp_colour_brightness"] = 0 + (-0.01 * cos(ct)), -- 227
			["$pp_colour_contrast"] = 1.6 + (abs(sin(ct * 0.166)) * 0.5), -- 228
			["$pp_colour_colour"] = 0, -- 229
			["$pp_colour_mulr"] = 0 + abs(sin(ct * 0.789)), -- 230
			["$pp_colour_mulg"] = 0, -- 231
			["$pp_colour_mulb"] = 0 -- 232
		} -- 223
		return tab -- 233
	end, -- 220
	ShowSpare1 = function() -- 234
		if CLIENT then -- 235
			return GAMEMODE:Frighten() -- 236
		end -- 235
	end, -- 234
	ShowSpare2 = function() -- 237
		if CLIENT then -- 238
			return GAMEMODE:Frighten() -- 239
		end -- 238
	end, -- 237
	Reflect = function(ply) -- 240
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=210,0,0>ARRRRGHH, I MUST KILL THEM ALL AND TAKE THEIR SKIN!!!") -- 241
	end, -- 240
	PlayerLoadout = function(ply) -- 242
		ply:SetNWInt("evilrp_gasmask", 0) -- 243
		ply:Give("evilrp_melee/hands/boneclaws") -- 244
		return true -- 245
	end, -- 242
	HandleRagdoll = function(rag, ply) -- 246
		return rag:SetNWInt("decomp_stage", DSTAGE_BONES) -- 247
	end -- 246
}) -- 176
TEAM_PRIVATE = DarkRP.createJob("Private", { -- 250
	color = Color(20, 150, 20), -- 250
	model = "models/vel/evilwar/royalist.mdl", -- 251
	description = "A new recruit that hasn't gone through training yet.", -- 252
	command = "proletariat", -- 253
	salary = 1, -- 254
	max = 0, -- 255
	cost = 0, -- 256
	hasLicense = true, -- 257
	candemote = false, -- 258
	use_machines = true, -- 259
	category = "Royalists", -- 260
	speech_sounds = (function() -- 261
		local _accum_0 = { } -- 261
		local _len_0 = 1 -- 261
		for i = 1, 3 do -- 261
			_accum_0[_len_0] = "placenta/speech/prole" .. tostring(i) .. ".wav" -- 261
			_len_0 = _len_0 + 1 -- 261
		end -- 261
		return _accum_0 -- 261
	end)(), -- 261
	hurt_sounds = (function() -- 262
		local _accum_0 = { } -- 262
		local _len_0 = 1 -- 262
		for i = 1, 5 do -- 262
			_accum_0[_len_0] = "placenta/pain/prole" .. tostring(i) .. ".wav" -- 262
			_len_0 = _len_0 + 1 -- 262
		end -- 262
		return _accum_0 -- 262
	end)(), -- 262
	become_sounds = (function() -- 263
		local _accum_0 = { } -- 263
		local _len_0 = 1 -- 263
		for i = 1, 3 do -- 263
			_accum_0[_len_0] = "npc/zombie/zombie_alert" .. tostring(i) .. ".wav" -- 263
			_len_0 = _len_0 + 1 -- 263
		end -- 263
		return _accum_0 -- 263
	end)(), -- 263
	death_sounds = (function() -- 264
		local _accum_0 = { } -- 264
		local _len_0 = 1 -- 264
		for i = 1, 3 do -- 264
			_accum_0[_len_0] = "placenta/death/prole" .. tostring(i) .. ".wav" -- 264
			_len_0 = _len_0 + 1 -- 264
		end -- 264
		return _accum_0 -- 264
	end)(), -- 264
	crosstext = function(ply) -- 265
		local text = "Don't panic." -- 266
		do -- 267
			local _exp_0 = lp:Team() -- 267
			if TEAM_PRIVATE == _exp_0 then -- 268
				text = "United in rank?" -- 269
			elseif TEAM_STALKER == _exp_0 then -- 270
				text = "A soldier from Lymphoma." -- 271
			elseif TEAM_SANITAR == _exp_0 then -- 272
				text = "These soldiers need guidance.\nPut the fear in their hearts." -- 273
			elseif TEAM_KORPSMAN == _exp_0 then -- 274
				text = "Smelly and stupid." -- 275
			elseif TEAM_DEALER == _exp_0 then -- 276
				text = "Prove your place, worm.\nOnly then will you be decorated." -- 277
			elseif TEAM_EMPEROR == _exp_0 then -- 278
				text = "Is he working hard enough?" -- 279
			elseif TEAM_GHOST == _exp_0 then -- 280
				text = "Sad, but funny." -- 281
			elseif TEAM_BONEHEAD == _exp_0 then -- 282
				text = "SKIN...!" -- 283
			end -- 283
		end -- 283
		return { -- 284
			text = text, -- 284
			font = "Spleen_Label_Small" -- 284
		}, false -- 284
	end, -- 265
	first_names = { -- 285
		"Private", -- 285
		"PVT.", -- 285
		"Recruit", -- 285
		"Enlistee", -- 285
		"Grunt", -- 285
		"Fodder", -- 285
		"Cadet", -- 285
		"CDT.", -- 285
		"Rookie" -- 285
	}, -- 285
	GenerateName = function(self, ply) -- 286
		local unit_id = math.random(1, 99) -- 287
		if unit_id < 10 then -- 288
			unit_id = "0" .. tostring(unit_id) -- 289
		else -- 291
			unit_id = tostring(unit_id) -- 291
		end -- 288
		return self.first_names[math.random(1, #self.first_names)] .. " #" .. unit_id -- 292
	end, -- 286
	special_name = "private parts", -- 293
	special_name_chance = 1000, -- 294
	ShowSpare1 = open_player_menu, -- 295
	ShowSpare2 = open_action_menu, -- 296
	Reflect = function(ply) -- 297
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I am a patriotic Lymphoman resident, a laborer and combatant. I must remain productive, my body should be used for the greater good. <c=0,210,0> I can be conscripted by the EMPEROR.") -- 298
	end, -- 297
	PlayerLoadout = function(ply) -- 299
		ply:ClearOddities() -- 300
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 301
		for slot, val in pairs({ -- 304
			[0] = 0, -- 304
			[1] = 0, -- 306
			[3] = { -- 308
				0, -- 308
				6, -- 308
				7, -- 308
				8 -- 308
			}, -- 308
			[4] = { -- 310
				0, -- 310
				4 -- 310
			}, -- 310
			[5] = 0, -- 312
			[6] = 0 -- 314
		}) do -- 315
			set_bodygroup(ply, slot, val) -- 302
		end -- 302
		return false -- 316
	end -- 299
}) -- 249
TEAM_CONSCRIPT = DarkRP.createJob("Conscript", { -- 319
	color = Color(19, 51, 45), -- 319
	model = "models/vel/evilwar/royalist.mdl", -- 320
	description = "The fate of those who don't make the cut.", -- 321
	weapons = { -- 322
		"evilrp_melee/pipe" -- 322
	}, -- 322
	randomweapon = conscript_weapons, -- 323
	command = "conscript", -- 324
	salary = 1, -- 325
	max = 5, -- 326
	cost = 1, -- 327
	hasLicense = true, -- 328
	use_machines = false, -- 329
	ammo = { -- 331
		pistol = 60 -- 331
	}, -- 330
	category = "Royalists", -- 332
	speech_sounds = (function() -- 333
		local _accum_0 = { } -- 333
		local _len_0 = 1 -- 333
		for i = 1, 15 do -- 333
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 333
			_len_0 = _len_0 + 1 -- 333
		end -- 333
		return _accum_0 -- 333
	end)(), -- 333
	hurt_sounds = (function() -- 334
		local _accum_0 = { } -- 334
		local _len_0 = 1 -- 334
		for i = 1, 4 do -- 334
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 334
			_len_0 = _len_0 + 1 -- 334
		end -- 334
		return _accum_0 -- 334
	end)(), -- 334
	become_sounds = (function() -- 335
		local _accum_0 = { } -- 335
		local _len_0 = 1 -- 335
		for i = 1, 15 do -- 335
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 335
			_len_0 = _len_0 + 1 -- 335
		end -- 335
		return _accum_0 -- 335
	end)(), -- 335
	crosstext = function(ply) -- 336
		local text = "Don't panic." -- 337
		do -- 338
			local _exp_0 = lp:Team() -- 338
			if TEAM_PRIVATE == _exp_0 then -- 339
				text = "I could be like him!" -- 340
			elseif TEAM_STALKER == _exp_0 then -- 341
				text = "Poor bastard." -- 342
			elseif TEAM_SANITAR == _exp_0 then -- 343
				text = "A fine meat shield." -- 344
			elseif TEAM_KORPSMAN == _exp_0 then -- 345
				text = "Fodder, made to die\n Unless..." -- 346
			elseif TEAM_DEALER == _exp_0 then -- 347
				text = "A follower of mine." -- 348
			elseif TEAM_EMPEROR == _exp_0 then -- 349
				text = "Cannon fodder, splendid." -- 350
			elseif TEAM_CONSCRIPT == _exp_0 then -- 351
				text = "United in blood." -- 352
			elseif TEAM_GHOST == _exp_0 then -- 353
				text = "Definitely stupid." -- 354
			elseif TEAM_BONEHEAD == _exp_0 then -- 355
				text = "HAHAHAH." -- 356
			end -- 356
		end -- 356
		return { -- 357
			text = text, -- 357
			font = "Spleen_Label_Small" -- 357
		}, false -- 357
	end, -- 336
	first_names = { -- 358
		"Fodder", -- 358
		"Meatshield", -- 358
		"Grunt", -- 358
		"Drone", -- 358
		"Conscript", -- 358
		"Meatbag" -- 358
	}, -- 358
	GenerateName = function(self, ply) -- 359
		local unit_id = math.random(1, 99) -- 360
		if unit_id < 10 then -- 361
			unit_id = "0" .. tostring(unit_id) -- 362
		else -- 364
			unit_id = tostring(unit_id) -- 364
		end -- 361
		return self.first_names[math.random(1, #self.first_names)] .. " #" .. unit_id -- 365
	end, -- 359
	special_name = "private parts", -- 366
	special_name_chance = 1000, -- 367
	ShowSpare1 = open_player_menu, -- 368
	ShowSpare2 = open_action_menu, -- 369
	Reflect = function(ply) -- 370
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I have been conscripted by the EMPEROR himself. I must patrol the Wasteland and prevent the entry of foreign invaders, and risk my life for the Emperor. This role holds responsibility.<c=210,0,0> I must not purposely cause the deaths of your comrades.") -- 371
	end, -- 370
	PlayerLoadout = function(ply) -- 372
		for slot, val in pairs({ -- 375
			[0] = 0, -- 375
			[2] = 0, -- 377
			[3] = { -- 379
				7, -- 379
				8 -- 379
			}, -- 379
			[4] = { -- 381
				0, -- 381
				4 -- 381
			}, -- 381
			[5] = 0, -- 383
			[6] = 0, -- 385
			[7] = 1 -- 387
		}) do -- 388
			set_bodygroup(ply, slot, val) -- 373
		end -- 373
		ply:SetArmor(25) -- 389
		ply:Give(conscript_weapons[math.random(1, #conscript_weapons)]) -- 390
		return false -- 391
	end -- 372
}) -- 318
TEAM_SANITAR = DarkRP.createJob("Dragoon", { -- 394
	color = Color(0, 25, 93), -- 394
	model = "models/vel/evilwar/royalist.mdl", -- 395
	description = "The right hand of the Emperor.\nRespected by his peers,\nfeared by his enemies.", -- 396
	weapons = { -- 397
		"evilrp_weapon/hope", -- 397
		"evilrp_melee/sabre" -- 397
	}, -- 397
	command = "ss", -- 398
	salary = 1, -- 399
	max = 6, -- 400
	cost = 3, -- 401
	hasLicense = true, -- 402
	use_machines = false, -- 403
	ammo = { -- 405
		pistol = 60 -- 405
	}, -- 404
	category = "Royalists", -- 406
	speech_sounds = (function() -- 407
		local _accum_0 = { } -- 407
		local _len_0 = 1 -- 407
		for i = 1, 15 do -- 407
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 407
			_len_0 = _len_0 + 1 -- 407
		end -- 407
		return _accum_0 -- 407
	end)(), -- 407
	hurt_sounds = (function() -- 408
		local _accum_0 = { } -- 408
		local _len_0 = 1 -- 408
		for i = 1, 4 do -- 408
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 408
			_len_0 = _len_0 + 1 -- 408
		end -- 408
		return _accum_0 -- 408
	end)(), -- 408
	become_sounds = (function() -- 409
		local _accum_0 = { } -- 409
		local _len_0 = 1 -- 409
		for i = 1, 15 do -- 409
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 409
			_len_0 = _len_0 + 1 -- 409
		end -- 409
		return _accum_0 -- 409
	end)(), -- 409
	crosstext = function(ply) -- 410
		local text = "Don't panic." -- 411
		do -- 412
			local _exp_0 = lp:Team() -- 412
			if TEAM_PRIVATE == _exp_0 then -- 413
				text = "A Lymphomian legend!" -- 414
			elseif TEAM_STALKER == _exp_0 then -- 415
				text = "Fight or run?!" -- 416
			elseif TEAM_SANITAR == _exp_0 then -- 417
				text = "Finally...\nSomeone competent." -- 418
			elseif TEAM_KORPSMAN == _exp_0 then -- 419
				text = "Is that enemy blood?\nNo of course not." -- 420
			elseif TEAM_DEALER == _exp_0 then -- 421
				text = "A follower of mine." -- 422
			elseif TEAM_EMPEROR == _exp_0 then -- 423
				text = "A tentacle of mine." -- 424
			elseif TEAM_GHOST == _exp_0 then -- 425
				text = "Evil, stupid,\n maybe both." -- 426
			elseif TEAM_BONEHEAD == _exp_0 then -- 427
				text = "DANGER." -- 428
			end -- 428
		end -- 428
		return { -- 429
			text = text, -- 429
			font = "Spleen_Label_Small" -- 429
		}, true -- 429
	end, -- 410
	first_names = { -- 430
		"Subjugator", -- 430
		"Dragoner", -- 430
		"Persecuter", -- 430
		"Draconarius", -- 430
		"Volontaire" -- 430
	}, -- 430
	last_names = { -- 431
		"of Die Augen", -- 431
		"of Knochen", -- 431
		"of Sehne", -- 431
		"of Knorpel", -- 431
		"of Bauchspeicheldrüse" -- 431
	}, -- 431
	arms_model = "models/weapons/c_arms_refugee.mdl", -- 432
	ShowSpare1 = open_player_menu, -- 433
	ShowSpare2 = open_action_menu, -- 434
	bar_names = { -- 436
		health = "resolve" -- 436
	}, -- 435
	Reflect = function(ply) -- 437
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I am part of the EMPEROR's finest soldiers. The Privates, Conscripts, and Sanitaters are my subordinates, whilst the EMPEROR and the Quartermaster are my superiors. <c=0,210,0>I must keep order within the city, and the machines tidy") -- 438
	end, -- 437
	PlayerLoadout = function(ply) -- 439
		ply:ClearOddities() -- 440
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 441
		for slot, val in pairs({ -- 444
			[0] = 1, -- 444
			[1] = 1, -- 446
			[2] = 1, -- 448
			[3] = 2, -- 450
			[4] = 3, -- 452
			[5] = 0 -- 454
		}) do -- 455
			set_bodygroup(ply, slot, val) -- 442
		end -- 442
		ply:SetArmor(40) -- 456
		return false -- 457
	end -- 439
}) -- 393
TEAM_DEALER = DarkRP.createJob("Quartermaster", { -- 460
	color = Color(255, 140, 0), -- 460
	model = "models/vel/evilwar/royalist.mdl", -- 461
	description = "The left hand of the Emperor.\nManage the goods and keep your men armed.", -- 462
	weapons = { }, -- 463
	command = "dealer", -- 464
	salary = 1, -- 465
	max = 1, -- 466
	cost = 3, -- 467
	hasLicense = false, -- 468
	use_machines = false, -- 469
	category = "Royalists", -- 470
	speech_sounds = (function() -- 471
		local _accum_0 = { } -- 471
		local _len_0 = 1 -- 471
		for i = 1, 3 do -- 471
			_accum_0[_len_0] = "placenta/speech/dealer" .. tostring(i) .. ".wav" -- 471
			_len_0 = _len_0 + 1 -- 471
		end -- 471
		return _accum_0 -- 471
	end)(), -- 471
	hurt_sounds = (function() -- 472
		local _accum_0 = { } -- 472
		local _len_0 = 1 -- 472
		for i = 1, 4 do -- 472
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 472
			_len_0 = _len_0 + 1 -- 472
		end -- 472
		return _accum_0 -- 472
	end)(), -- 472
	become_sounds = (function() -- 473
		local _accum_0 = { } -- 473
		local _len_0 = 1 -- 473
		for i = 1, 15 do -- 473
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 473
			_len_0 = _len_0 + 1 -- 473
		end -- 473
		return _accum_0 -- 473
	end)(), -- 473
	crosstext = function(ply) -- 474
		local text = "Don't panic." -- 475
		do -- 476
			local _exp_0 = lp:Team() -- 476
			if TEAM_PRIVATE == _exp_0 then -- 477
				text = "This guy handles the guns." -- 478
			elseif TEAM_STALKER == _exp_0 then -- 479
				text = "Captain of the goods." -- 480
			elseif TEAM_SANITAR == _exp_0 then -- 481
				text = "The oldest living Dragoon.\nRespect. Honor." -- 482
			elseif TEAM_KORPSMAN == _exp_0 then -- 483
				text = "A reminder of the power of Kapitalism." -- 484
			elseif TEAM_DEALER == _exp_0 then -- 485
				text = "I'm seeing double!" -- 486
			elseif TEAM_EMPEROR == _exp_0 then -- 487
				text = "My brother in arms.\nIf he fails, I'll cut his off." -- 488
			elseif TEAM_GHOST == _exp_0 then -- 489
				text = "Glorified accountant." -- 490
			elseif TEAM_BONEHEAD == _exp_0 then -- 491
				text = "BONES ARE HIS DOLLARS." -- 492
			end -- 492
		end -- 492
		return { -- 493
			text = text, -- 493
			font = "Spleen_Label_Small" -- 493
		}, true -- 493
	end, -- 474
	first_names = { -- 494
		"Quartermaster", -- 494
		"Quartiermeister" -- 494
	}, -- 494
	last_names = { -- 495
		"Kommissariatsdienst" -- 495
	}, -- 495
	special_name = "Trusty", -- 496
	special_name_chance = 1000, -- 497
	ShowSpare1 = open_player_menu, -- 498
	ShowSpare2 = open_action_menu, -- 499
	bar_names = { -- 501
		health = "insurance" -- 501
	}, -- 500
	PlayerLoadout = function(ply) -- 502
		ply:ClearOddities() -- 503
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 504
		for slot, val in pairs({ -- 507
			[0] = 1, -- 507
			[1] = 1, -- 509
			[2] = 1, -- 511
			[3] = 1, -- 513
			[4] = 3, -- 515
			[5] = 0 -- 517
		}) do -- 518
			set_bodygroup(ply, slot, val) -- 505
		end -- 505
		return false -- 519
	end -- 502
}) -- 459
TEAM_KORPSMAN = DarkRP.createJob("Sanitater", { -- 522
	color = Color(79, 150, 150), -- 522
	model = "models/vel/evilwar/royalist.mdl", -- 523
	description = "You keep people alive in this terrible place.\nFill the blood and empty the rust.", -- 524
	weapons = { -- 525
		"evilrp/medkit" -- 525
	}, -- 525
	command = "medic", -- 526
	salary = 1, -- 527
	max = 2, -- 528
	cost = 2, -- 529
	hasLicense = false, -- 530
	medic = true, -- 531
	use_machines = false, -- 532
	category = "Royalists", -- 533
	speech_sounds = (function() -- 534
		local _accum_0 = { } -- 534
		local _len_0 = 1 -- 534
		for i = 1, 4 do -- 534
			_accum_0[_len_0] = "placenta/speech/korps" .. tostring(i) .. ".wav" -- 534
			_len_0 = _len_0 + 1 -- 534
		end -- 534
		return _accum_0 -- 534
	end)(), -- 534
	hurt_sounds = (function() -- 535
		local _accum_0 = { } -- 535
		local _len_0 = 1 -- 535
		for i = 1, 4 do -- 535
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 535
			_len_0 = _len_0 + 1 -- 535
		end -- 535
		return _accum_0 -- 535
	end)(), -- 535
	become_sounds = { -- 536
		"items/suitchargeok1.wav" -- 536
	}, -- 536
	crosstext = function(ply) -- 537
		local text = "Don't panic." -- 538
		do -- 539
			local _exp_0 = lp:Team() -- 539
			if TEAM_PRIVATE == _exp_0 then -- 540
				text = "I forgot what\nto call these guys." -- 541
			elseif TEAM_STALKER == _exp_0 then -- 542
				text = "A walking blood bag." -- 543
			elseif TEAM_SANITAR == _exp_0 then -- 544
				text = "Better remember\nwho lets them live." -- 545
			elseif TEAM_KORPSMAN == _exp_0 then -- 546
				text = "Something to\nbe happy about." -- 547
			elseif TEAM_DEALER == _exp_0 then -- 548
				text = "Keep them busy.\nWe need their blood and sweat." -- 549
			elseif TEAM_EMPEROR == _exp_0 then -- 550
				text = "What a strange,\nselfless thing." -- 551
			elseif TEAM_GHOST == _exp_0 then -- 552
				text = "A respectable mortal." -- 553
			elseif TEAM_BONEHEAD == _exp_0 then -- 554
				text = "CONFUSING." -- 555
			end -- 555
		end -- 555
		return { -- 556
			text = text, -- 556
			font = "Spleen_Label_Small" -- 556
		}, true -- 556
	end, -- 537
	first_names = { -- 557
		"Dissector", -- 557
		"Retractor", -- 557
		"Suture", -- 557
		"Femur", -- 557
		"Cystic", -- 557
		"Rasp", -- 557
		"Ferrum", -- 557
		"Fascia", -- 557
		"Marrow", -- 557
		"Lienis", -- 557
		"Aorta", -- 557
		"Tunica", -- 557
		"Maxilla", -- 557
		"Sacrum", -- 557
		"Leach" -- 557
	}, -- 557
	last_names = { -- 558
		"Forceps", -- 558
		"Scalpel", -- 558
		"Curette", -- 558
		"Rongeur", -- 558
		"Trocar", -- 558
		"Babcock", -- 558
		"Duval", -- 558
		"Hemostat", -- 558
		"Ossis", -- 558
		"Caro", -- 558
		"Cadaver", -- 558
		"Sanguis", -- 558
		"Bilis", -- 558
		"Viscera", -- 558
		"Jugular", -- 558
		"Clavius" -- 558
	}, -- 558
	special_name = "Corpseman", -- 559
	special_name_chance = 1000, -- 560
	ShowSpare1 = open_player_menu, -- 561
	ShowSpare2 = open_action_menu, -- 562
	bar_names = { -- 564
		health = "Bio-reserves" -- 564
	}, -- 563
	PlayerLoadout = function(ply) -- 565
		ply:ClearOddities() -- 566
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 567
		ply:SetSkin(4) -- 568
		for slot, val in pairs({ -- 571
			[0] = 0, -- 571
			[1] = 0, -- 573
			[2] = 2, -- 575
			[3] = 3, -- 577
			[4] = 1, -- 579
			[5] = 0 -- 581
		}) do -- 582
			set_bodygroup(ply, slot, val) -- 569
		end -- 569
		return false -- 583
	end -- 565
}) -- 521
TEAM_EMPEROR = DarkRP.createJob("Emperor", { -- 586
	color = Color(150, 20, 20), -- 586
	model = "models/vel/evilwar/royalist.mdl", -- 587
	description = "Rule with an iron fist.", -- 588
	command = "emperor", -- 589
	salary = 1, -- 590
	weapons = { -- 591
		"evilrp_weapon/novoluger" -- 591
	}, -- 591
	max = 1, -- 592
	cost = 5, -- 593
	weapons = { }, -- 594
	hasLicense = true, -- 595
	mayor = true, -- 596
	use_machines = false, -- 597
	category = "Royalists", -- 598
	speech_sounds = (function() -- 599
		local _accum_0 = { } -- 599
		local _len_0 = 1 -- 599
		for i = 1, 15 do -- 599
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 599
			_len_0 = _len_0 + 1 -- 599
		end -- 599
		return _accum_0 -- 599
	end)(), -- 599
	become_sounds = { -- 600
		"kidneydagger/broadcast1.wav" -- 600
	}, -- 600
	crosstext = function(ply) -- 601
		local text = "Don't panic." -- 602
		do -- 603
			local _exp_0 = lp:Team() -- 603
			if TEAM_PRIVATE == _exp_0 then -- 604
				text = "Listen carefully." -- 605
			elseif TEAM_STALKER == _exp_0 then -- 606
				text = "Oh, your majesty!" -- 607
			elseif TEAM_SANITAR == _exp_0 then -- 608
				text = "Hail, hail!" -- 609
			elseif TEAM_KORPSMAN == _exp_0 then -- 610
				text = "Is he feeling okay?" -- 611
			elseif TEAM_DEALER == _exp_0 then -- 612
				text = "Glorious leader.\nI'm nothing without him." -- 613
			elseif TEAM_EMPEROR == _exp_0 then -- 614
				text = "Our strength\nshall prevail." -- 615
			elseif TEAM_GHOST == _exp_0 then -- 616
				text = "So full of lies." -- 617
			elseif TEAM_BONEHEAD == _exp_0 then -- 618
				text = "THERE HE IS!!" -- 619
			end -- 619
		end -- 619
		return { -- 620
			text = text, -- 620
			font = "Spleen_Label_Small" -- 620
		}, true -- 620
	end, -- 601
	first_names = { -- 622
		"Basileus", -- 622
		"Agrippa", -- 622
		"Gnaeus", -- 622
		"Gaius" -- 622
	}, -- 622
	last_names = { -- 623
		"Imperator Lymphoma", -- 623
		"Kaiser Lymphoma", -- 623
		"Rex Lymphoma", -- 623
		"Lymphoma Magnus" -- 623
	}, -- 623
	special_name = "Which Kaiser", -- 624
	special_name_chance = 1000, -- 625
	ShowSpare1 = open_player_menu, -- 626
	ShowSpare2 = open_action_menu, -- 627
	bar_names = { -- 629
		health = "PRIDE" -- 629
	}, -- 628
	Reflect = function(ply) -- 630
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I am the EMPEROR of Lymphoma. I am the supreme ruler of this city and its people. I decide who lives and who dies. <c=0,210,0>I can use my terminal to administrate our internal affairs.") -- 631
	end, -- 630
	PlayerLoadout = function(ply) -- 632
		ply:ClearOddities() -- 633
		local oddities -- 634
		do -- 634
			local _accum_0 = { } -- 634
			local _len_0 = 1 -- 634
			for k, v in pairs(ODDITY.list) do -- 634
				if v ~= ODDITY_ILLITERACY then -- 634
					_accum_0[_len_0] = v -- 634
					_len_0 = _len_0 + 1 -- 634
				end -- 634
			end -- 634
			oddities = _accum_0 -- 634
		end -- 634
		ply:AddOddity(oddities[math.random(#oddities)]) -- 635
		for slot, val in pairs({ -- 638
			[0] = 1, -- 638
			[1] = 2, -- 640
			[2] = 0, -- 642
			[3] = 1, -- 644
			[4] = 2, -- 646
			[5] = 0 -- 648
		}) do -- 649
			set_bodygroup(ply, slot, val) -- 636
		end -- 636
		ply:SetNWInt("evilrp_gasmask", 4) -- 650
		ply:Give("evilrp_weapon/novoluger") -- 651
		ply:SetArmor(65) -- 652
		return false -- 653
	end -- 632
}) -- 585
GAMEMODE.CivilProtection = { -- 656
	[TEAM_PRIVATE] = true, -- 656
	[TEAM_CONSCRIPT] = true, -- 657
	[TEAM_SANITAR] = true, -- 658
	[TEAM_EMPEROR] = true -- 659
} -- 655
GAMEMODE.DefaultTeam = TEAM_GHOST -- 661
