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
	max = 3, -- 104
	cost = 4, -- 105
	can_build = true, -- 106
	can_sell = true, -- 107
	hasLicense = false, -- 108
	candemote = false, -- 109
	use_machines = false, -- 110
	speech_sounds = (function() -- 111
		local _accum_0 = { } -- 111
		local _len_0 = 1 -- 111
		for i = 1, 4 do -- 111
			_accum_0[_len_0] = "speech/gruffprole" .. tostring(i) .. ".wav" -- 111
			_len_0 = _len_0 + 1 -- 111
		end -- 111
		return _accum_0 -- 111
	end)(), -- 111
	hurt_sounds = (function() -- 112
		local _accum_0 = { } -- 112
		local _len_0 = 1 -- 112
		for i = 1, 6 do -- 112
			_accum_0[_len_0] = "placenta/pain/cult" .. tostring(i) .. ".wav" -- 112
			_len_0 = _len_0 + 1 -- 112
		end -- 112
		return _accum_0 -- 112
	end)(), -- 112
	become_sounds = (function() -- 113
		local _accum_0 = { } -- 113
		local _len_0 = 1 -- 113
		for i = 1, 3 do -- 113
			_accum_0[_len_0] = "npc/zombie/zombie_alert" .. tostring(i) .. ".wav" -- 113
			_len_0 = _len_0 + 1 -- 113
		end -- 113
		return _accum_0 -- 113
	end)(), -- 113
	death_sounds = (function() -- 114
		local _accum_0 = { } -- 114
		local _len_0 = 1 -- 114
		for i = 1, 4 do -- 114
			_accum_0[_len_0] = "placenta/death/cult" .. tostring(i) .. ".wav" -- 114
			_len_0 = _len_0 + 1 -- 114
		end -- 114
		return _accum_0 -- 114
	end)(), -- 114
	crosstext = function(ply) -- 115
		local text = "Don't panic." -- 116
		do -- 117
			local _exp_0 = lp:Team() -- 117
			if TEAM_PRIVATE == _exp_0 then -- 118
				text = "He could sell me some goodies." -- 119
			elseif TEAM_STALKER == _exp_0 then -- 120
				text = "A fellow plunderer." -- 121
			elseif TEAM_SANITAR == _exp_0 then -- 122
				text = "A necessary evil." -- 123
			elseif TEAM_KORPSMAN == _exp_0 then -- 124
				text = "Why is he here?" -- 125
			elseif TEAM_DEALER == _exp_0 then -- 126
				text = "Keep the armaments locked up." -- 127
			elseif TEAM_EMPEROR == _exp_0 then -- 128
				text = "He might be of use to me." -- 129
			elseif TEAM_GHOST == _exp_0 then -- 130
				text = "He has a noble pursuit." -- 131
			elseif TEAM_BONEHEAD == _exp_0 then -- 132
				text = "SEEN HIM BEFORE!!" -- 133
			end -- 133
		end -- 133
		return { -- 134
			text = text, -- 134
			font = "Spleen_Label_Small" -- 134
		}, false -- 134
	end, -- 115
	first_names = { -- 135
		"Wasted", -- 135
		"Decrepit", -- 135
		"Rotten" -- 135
	}, -- 135
	last_names = { -- 136
		"Soul", -- 136
		"Plunderer", -- 136
		"Traitor", -- 136
		"Wanderer" -- 136
	}, -- 136
	bar_names = { -- 138
		health = "regret" -- 138
	}, -- 137
	special_name = "Waste", -- 139
	special_name_chance = 1000, -- 140
	ShowSpare1 = open_player_menu, -- 141
	ShowSpare2 = open_action_menu, -- 142
	Reflect = function(ply) -- 143
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I am a Stalker, an unpatriotic wastelander. I pawn off the Wasteland's treasures to the highest bidder. Unlike everyone else, I am talented at digging through trash. Bone capsules are of great use to me, I can use their contents for nutritious recipes that quench the soul") -- 144
	end, -- 143
	PlayerLoadout = function(ply) -- 145
		ply:ClearOddities() -- 146
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 147
		for slot, val in pairs({ -- 150
			[0] = 0, -- 150
			[1] = 2, -- 152
			[2] = { -- 154
				2, -- 154
				3, -- 154
				8, -- 154
				6 -- 154
			}, -- 154
			[3] = { -- 156
				19, -- 156
				20 -- 156
			}, -- 156
			[4] = 0, -- 158
			[5] = 0, -- 160
			[6] = { -- 162
				0, -- 162
				1, -- 162
				2, -- 162
				3 -- 162
			}, -- 162
			[7] = 0, -- 164
			[8] = 0, -- 166
			[9] = { -- 168
				0, -- 168
				1 -- 168
			} -- 168
		}) do -- 169
			set_bodygroup(ply, slot, val) -- 148
		end -- 148
		local skins = { -- 170
			4, -- 170
			6, -- 170
			7 -- 170
		} -- 170
		ply:SetSkin(skins[math.random(1, #skins)]) -- 171
		return false -- 172
	end -- 145
}) -- 95
do -- 174
	local _class_0 -- 174
	local _parent_0 = SOUND -- 174
	local _base_0 = { -- 174
		sound = "placenta/bonehead_aggrod4.wav", -- 176
		pitch = { -- 176
			200, -- 176
			250 -- 176
		} -- 174
	} -- 174
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 176
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 174
			_base_0[_key_0] = _val_0 -- 174
		end -- 174
	end -- 176
	if _base_0.__index == nil then -- 174
		_base_0.__index = _base_0 -- 174
	end -- 176
	setmetatable(_base_0, _parent_0.__base) -- 174
	_class_0 = setmetatable({ -- 174
		__init = function(self, ...) -- 174
			return _class_0.__parent.__init(self, ...) -- 174
		end, -- 174
		__base = _base_0, -- 174
		__name = "SpeechBonehead", -- 174
		__parent = _parent_0 -- 174
	}, { -- 174
		__index = function(cls, name) -- 174
			local val = rawget(_base_0, name) -- 174
			if val == nil then -- 174
				local parent = rawget(cls, "__parent") -- 174
				if parent then -- 174
					return parent[name] -- 174
				end -- 174
			else -- 174
				return val -- 174
			end -- 174
		end, -- 174
		__call = function(cls, ...) -- 174
			local _self_0 = setmetatable({ }, _base_0) -- 174
			cls.__init(_self_0, ...) -- 174
			return _self_0 -- 174
		end -- 174
	}) -- 174
	_base_0.__class = _class_0 -- 174
	if _parent_0.__inherited then -- 174
		_parent_0.__inherited(_parent_0, _class_0) -- 174
	end -- 174
	SpeechBonehead = _class_0 -- 174
end -- 176
TEAM_BONEHEAD = DarkRP.createJob("Bonehead", { -- 179
	color = Color(150, 150, 150), -- 179
	model = "models/player/zombie_fast.mdl", -- 180
	description = "evil fucker.", -- 181
	instant_respawn = true, -- 182
	command = "bonehead", -- 183
	category = "Scum of Liver Failure", -- 184
	salary = 1, -- 185
	max = 2, -- 186
	cost = 2, -- 187
	use_machines = false, -- 188
	speech_sounds = "SpeechBonehead", -- 189
	hurt_sounds = (function() -- 190
		local _accum_0 = { } -- 190
		local _len_0 = 1 -- 190
		for i = 1, 2 do -- 190
			_accum_0[_len_0] = "placenta/bonehead_slice" .. tostring(i) .. ".wav" -- 190
			_len_0 = _len_0 + 1 -- 190
		end -- 190
		return _accum_0 -- 190
	end)(), -- 190
	become_sounds = (function() -- 191
		local _accum_0 = { } -- 191
		local _len_0 = 1 -- 191
		for i = 1, 4 do -- 191
			_accum_0[_len_0] = "placenta/bonehead_aggrod" .. tostring(i) .. ".wav" -- 191
			_len_0 = _len_0 + 1 -- 191
		end -- 191
		return _accum_0 -- 191
	end)(), -- 191
	crosstext = function(ply) -- 192
		local text = "Don't panic." -- 193
		do -- 194
			local _exp_0 = lp:Team() -- 194
			if TEAM_PRIVATE == _exp_0 then -- 195
				text = "Oh no! He's real!" -- 196
			elseif TEAM_SANITAR == _exp_0 then -- 197
				text = "Oh boy." -- 198
			elseif TEAM_KORPSMAN == _exp_0 then -- 199
				text = "Oh no! It happened again!" -- 200
			elseif TEAM_DEALER == _exp_0 then -- 201
				text = "Free ribs to feed the troops." -- 202
			elseif TEAM_EMPEROR == _exp_0 then -- 203
				text = "Ha. It happened again." -- 204
			elseif TEAM_GHOST == _exp_0 then -- 205
				text = "Lookin' good." -- 206
			elseif TEAM_BONEHEAD == _exp_0 then -- 207
				text = "THERE'S ANOTHER ONE." -- 208
			end -- 208
		end -- 208
		return { -- 209
			text = text, -- 209
			font = "Spleen_Label_Small" -- 209
		}, false -- 209
	end, -- 192
	first_names = { -- 210
		"Evil" -- 210
	}, -- 210
	last_names = { -- 211
		"Fucker" -- 211
	}, -- 211
	no_needs = true, -- 212
	hint = "You are a truly pissed off skeleton. Go get 'em!", -- 213
	bar_names = { -- 215
		health = "EVIL FUCKER POWER" -- 215
	}, -- 214
	bar_colors = { -- 217
		health = Color(200, 0, 0) -- 217
	}, -- 216
	RenderScreenspaceEffects = function(ply) -- 218
		local ct = CurTime() -- 219
		DrawMotionBlur(0.25, 0.2, 0.3) -- 220
		return DrawSharpen(1 * math.sin(ct), 2 * math.random(0.8, 1.2)) -- 221
	end, -- 218
	ColorMod = function(ply) -- 222
		local abs, cos, sin = math.abs, math.cos, math.sin -- 223
		local ct = CurTime() -- 224
		local tab = { -- 226
			["$pp_colour_addr"] = 0.1, -- 226
			["$pp_colour_addg"] = 0, -- 227
			["$pp_colour_addb"] = 0, -- 228
			["$pp_colour_brightness"] = 0 + (-0.01 * cos(ct)), -- 229
			["$pp_colour_contrast"] = 1.6 + (abs(sin(ct * 0.166)) * 0.5), -- 230
			["$pp_colour_colour"] = 0, -- 231
			["$pp_colour_mulr"] = 0 + abs(sin(ct * 0.789)), -- 232
			["$pp_colour_mulg"] = 0, -- 233
			["$pp_colour_mulb"] = 0 -- 234
		} -- 225
		return tab -- 235
	end, -- 222
	ShowSpare1 = function() -- 236
		if CLIENT then -- 237
			return GAMEMODE:Frighten() -- 238
		end -- 237
	end, -- 236
	ShowSpare2 = function() -- 239
		if CLIENT then -- 240
			return GAMEMODE:Frighten() -- 241
		end -- 240
	end, -- 239
	Reflect = function(ply) -- 242
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=210,0,0>ARRRRGHH, I MUST KILL THEM ALL AND TAKE THEIR SKIN!!!") -- 243
	end, -- 242
	PlayerLoadout = function(ply) -- 244
		ply:SetNWInt("evilrp_gasmask", 0) -- 245
		ply:Give("evilrp_melee/hands/boneclaws") -- 246
		return true -- 247
	end, -- 244
	HandleRagdoll = function(rag, ply) -- 248
		return rag:SetNWInt("decomp_stage", DSTAGE_BONES) -- 249
	end -- 248
}) -- 178
TEAM_PRIVATE = DarkRP.createJob("Private", { -- 252
	color = Color(20, 150, 20), -- 252
	model = "models/vel/evilwar/royalist.mdl", -- 253
	description = "A new recruit that hasn't gone through training yet.", -- 254
	command = "proletariat", -- 255
	salary = 1, -- 256
	max = 0, -- 257
	cost = 0, -- 258
	hasLicense = true, -- 259
	candemote = false, -- 260
	use_machines = true, -- 261
	category = "Royalists", -- 262
	speech_sounds = (function() -- 263
		local _accum_0 = { } -- 263
		local _len_0 = 1 -- 263
		for i = 1, 3 do -- 263
			_accum_0[_len_0] = "placenta/speech/prole" .. tostring(i) .. ".wav" -- 263
			_len_0 = _len_0 + 1 -- 263
		end -- 263
		return _accum_0 -- 263
	end)(), -- 263
	hurt_sounds = (function() -- 264
		local _accum_0 = { } -- 264
		local _len_0 = 1 -- 264
		for i = 1, 5 do -- 264
			_accum_0[_len_0] = "placenta/pain/prole" .. tostring(i) .. ".wav" -- 264
			_len_0 = _len_0 + 1 -- 264
		end -- 264
		return _accum_0 -- 264
	end)(), -- 264
	become_sounds = (function() -- 265
		local _accum_0 = { } -- 265
		local _len_0 = 1 -- 265
		for i = 1, 3 do -- 265
			_accum_0[_len_0] = "npc/zombie/zombie_alert" .. tostring(i) .. ".wav" -- 265
			_len_0 = _len_0 + 1 -- 265
		end -- 265
		return _accum_0 -- 265
	end)(), -- 265
	death_sounds = (function() -- 266
		local _accum_0 = { } -- 266
		local _len_0 = 1 -- 266
		for i = 1, 3 do -- 266
			_accum_0[_len_0] = "placenta/death/prole" .. tostring(i) .. ".wav" -- 266
			_len_0 = _len_0 + 1 -- 266
		end -- 266
		return _accum_0 -- 266
	end)(), -- 266
	crosstext = function(ply) -- 267
		local text = "Don't panic." -- 268
		do -- 269
			local _exp_0 = lp:Team() -- 269
			if TEAM_PRIVATE == _exp_0 then -- 270
				text = "United in rank?" -- 271
			elseif TEAM_STALKER == _exp_0 then -- 272
				text = "A soldier from Lymphoma." -- 273
			elseif TEAM_SANITAR == _exp_0 then -- 274
				text = "These soldiers need guidance.\nPut the fear in their hearts." -- 275
			elseif TEAM_KORPSMAN == _exp_0 then -- 276
				text = "Smelly and stupid." -- 277
			elseif TEAM_DEALER == _exp_0 then -- 278
				text = "Prove your place, worm.\nOnly then will you be decorated." -- 279
			elseif TEAM_EMPEROR == _exp_0 then -- 280
				text = "Is he working hard enough?" -- 281
			elseif TEAM_GHOST == _exp_0 then -- 282
				text = "Sad, but funny." -- 283
			elseif TEAM_BONEHEAD == _exp_0 then -- 284
				text = "SKIN...!" -- 285
			end -- 285
		end -- 285
		return { -- 286
			text = text, -- 286
			font = "Spleen_Label_Small" -- 286
		}, false -- 286
	end, -- 267
	first_names = { -- 287
		"Private", -- 287
		"PVT.", -- 287
		"Recruit", -- 287
		"Enlistee", -- 287
		"Grunt", -- 287
		"Fodder", -- 287
		"Cadet", -- 287
		"CDT.", -- 287
		"Rookie" -- 287
	}, -- 287
	GenerateName = function(self, ply) -- 288
		local unit_id = math.random(1, 99) -- 289
		if unit_id < 10 then -- 290
			unit_id = "0" .. tostring(unit_id) -- 291
		else -- 293
			unit_id = tostring(unit_id) -- 293
		end -- 290
		return self.first_names[math.random(1, #self.first_names)] .. " #" .. unit_id -- 294
	end, -- 288
	special_name = "private parts", -- 295
	special_name_chance = 1000, -- 296
	ShowSpare1 = open_player_menu, -- 297
	ShowSpare2 = open_action_menu, -- 298
	Reflect = function(ply) -- 299
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I am a patriotic Lymphoman resident, a laborer and combatant. I must remain productive, my body should be used for the greater good. <c=0,210,0> I can be conscripted by the EMPEROR.") -- 300
	end, -- 299
	PlayerLoadout = function(ply) -- 301
		ply:ClearOddities() -- 302
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 303
		for slot, val in pairs({ -- 306
			[0] = 0, -- 306
			[1] = 0, -- 308
			[2] = 0, -- 310
			[3] = { -- 312
				0, -- 312
				6, -- 312
				7, -- 312
				8 -- 312
			}, -- 312
			[4] = { -- 314
				0, -- 314
				4 -- 314
			}, -- 314
			[5] = 0, -- 316
			[6] = 0 -- 318
		}) do -- 320
			set_bodygroup(ply, slot, val) -- 304
		end -- 304
		return false -- 321
	end -- 301
}) -- 251
TEAM_CONSCRIPT = DarkRP.createJob("Conscript", { -- 324
	color = Color(19, 51, 45), -- 324
	model = "models/vel/evilwar/royalist.mdl", -- 325
	description = "The fate of those who don't make the cut.", -- 326
	weapons = { -- 327
		"evilrp_melee/pipe" -- 327
	}, -- 327
	randomweapon = conscript_weapons, -- 328
	command = "conscript", -- 329
	salary = 1, -- 330
	max = 5, -- 331
	cost = 1, -- 332
	hasLicense = true, -- 333
	use_machines = false, -- 334
	ammo = { -- 336
		pistol = 60 -- 336
	}, -- 335
	category = "Royalists", -- 337
	speech_sounds = (function() -- 338
		local _accum_0 = { } -- 338
		local _len_0 = 1 -- 338
		for i = 1, 15 do -- 338
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 338
			_len_0 = _len_0 + 1 -- 338
		end -- 338
		return _accum_0 -- 338
	end)(), -- 338
	hurt_sounds = (function() -- 339
		local _accum_0 = { } -- 339
		local _len_0 = 1 -- 339
		for i = 1, 4 do -- 339
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 339
			_len_0 = _len_0 + 1 -- 339
		end -- 339
		return _accum_0 -- 339
	end)(), -- 339
	become_sounds = (function() -- 340
		local _accum_0 = { } -- 340
		local _len_0 = 1 -- 340
		for i = 1, 15 do -- 340
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 340
			_len_0 = _len_0 + 1 -- 340
		end -- 340
		return _accum_0 -- 340
	end)(), -- 340
	crosstext = function(ply) -- 341
		local text = "Don't panic." -- 342
		do -- 343
			local _exp_0 = lp:Team() -- 343
			if TEAM_PRIVATE == _exp_0 then -- 344
				text = "I could be like him!" -- 345
			elseif TEAM_STALKER == _exp_0 then -- 346
				text = "Poor bastard." -- 347
			elseif TEAM_SANITAR == _exp_0 then -- 348
				text = "A fine meat shield." -- 349
			elseif TEAM_KORPSMAN == _exp_0 then -- 350
				text = "Fodder, made to die\n Unless..." -- 351
			elseif TEAM_DEALER == _exp_0 then -- 352
				text = "A follower of mine." -- 353
			elseif TEAM_EMPEROR == _exp_0 then -- 354
				text = "Cannon fodder, splendid." -- 355
			elseif TEAM_CONSCRIPT == _exp_0 then -- 356
				text = "United in blood." -- 357
			elseif TEAM_GHOST == _exp_0 then -- 358
				text = "Definitely stupid." -- 359
			elseif TEAM_BONEHEAD == _exp_0 then -- 360
				text = "HAHAHAH." -- 361
			end -- 361
		end -- 361
		return { -- 362
			text = text, -- 362
			font = "Spleen_Label_Small" -- 362
		}, false -- 362
	end, -- 341
	first_names = { -- 363
		"Fodder", -- 363
		"Meatshield", -- 363
		"Grunt", -- 363
		"Drone", -- 363
		"Conscript", -- 363
		"Meatbag" -- 363
	}, -- 363
	GenerateName = function(self, ply) -- 364
		local unit_id = math.random(1, 99) -- 365
		if unit_id < 10 then -- 366
			unit_id = "0" .. tostring(unit_id) -- 367
		else -- 369
			unit_id = tostring(unit_id) -- 369
		end -- 366
		return self.first_names[math.random(1, #self.first_names)] .. " #" .. unit_id -- 370
	end, -- 364
	special_name = "private parts", -- 371
	special_name_chance = 1000, -- 372
	ShowSpare1 = open_player_menu, -- 373
	ShowSpare2 = open_action_menu, -- 374
	Reflect = function(ply) -- 375
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I have been conscripted by the EMPEROR himself. I must patrol the Wasteland and prevent the entry of foreign invaders, and risk my life for the Emperor. This role holds responsibility.<c=210,0,0> I must not purposely cause the deaths of your comrades.") -- 376
	end, -- 375
	PlayerLoadout = function(ply) -- 377
		for slot, val in pairs({ -- 380
			[0] = 0, -- 380
			[1] = 0, -- 382
			[2] = 0, -- 384
			[3] = { -- 386
				7, -- 386
				8 -- 386
			}, -- 386
			[4] = { -- 388
				0, -- 388
				4 -- 388
			}, -- 388
			[5] = 0, -- 390
			[6] = 0, -- 392
			[7] = 1 -- 394
		}) do -- 395
			set_bodygroup(ply, slot, val) -- 378
		end -- 378
		ply:SetArmor(25) -- 396
		ply:Give(conscript_weapons[math.random(1, #conscript_weapons)]) -- 397
		return false -- 398
	end -- 377
}) -- 323
TEAM_SANITAR = DarkRP.createJob("Dragoon", { -- 401
	color = Color(0, 25, 93), -- 401
	model = "models/vel/evilwar/royalist.mdl", -- 402
	description = "The right hand of the Emperor.\nRespected by his peers,\nfeared by his enemies.", -- 403
	weapons = { -- 404
		"evilrp_weapon/hope", -- 404
		"evilrp_melee/sabre" -- 404
	}, -- 404
	command = "ss", -- 405
	salary = 1, -- 406
	max = 6, -- 407
	cost = 3, -- 408
	hasLicense = true, -- 409
	use_machines = false, -- 410
	ammo = { -- 412
		pistol = 60 -- 412
	}, -- 411
	category = "Royalists", -- 413
	speech_sounds = (function() -- 414
		local _accum_0 = { } -- 414
		local _len_0 = 1 -- 414
		for i = 1, 15 do -- 414
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 414
			_len_0 = _len_0 + 1 -- 414
		end -- 414
		return _accum_0 -- 414
	end)(), -- 414
	hurt_sounds = (function() -- 415
		local _accum_0 = { } -- 415
		local _len_0 = 1 -- 415
		for i = 1, 4 do -- 415
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 415
			_len_0 = _len_0 + 1 -- 415
		end -- 415
		return _accum_0 -- 415
	end)(), -- 415
	become_sounds = (function() -- 416
		local _accum_0 = { } -- 416
		local _len_0 = 1 -- 416
		for i = 1, 15 do -- 416
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 416
			_len_0 = _len_0 + 1 -- 416
		end -- 416
		return _accum_0 -- 416
	end)(), -- 416
	crosstext = function(ply) -- 417
		local text = "Don't panic." -- 418
		do -- 419
			local _exp_0 = lp:Team() -- 419
			if TEAM_PRIVATE == _exp_0 then -- 420
				text = "A Lymphomian legend!" -- 421
			elseif TEAM_STALKER == _exp_0 then -- 422
				text = "Fight or run?!" -- 423
			elseif TEAM_SANITAR == _exp_0 then -- 424
				text = "Finally...\nSomeone competent." -- 425
			elseif TEAM_KORPSMAN == _exp_0 then -- 426
				text = "Is that enemy blood?\nNo of course not." -- 427
			elseif TEAM_DEALER == _exp_0 then -- 428
				text = "A follower of mine." -- 429
			elseif TEAM_EMPEROR == _exp_0 then -- 430
				text = "A tentacle of mine." -- 431
			elseif TEAM_GHOST == _exp_0 then -- 432
				text = "Evil, stupid,\n maybe both." -- 433
			elseif TEAM_BONEHEAD == _exp_0 then -- 434
				text = "DANGER." -- 435
			end -- 435
		end -- 435
		return { -- 436
			text = text, -- 436
			font = "Spleen_Label_Small" -- 436
		}, true -- 436
	end, -- 417
	first_names = { -- 437
		"Subjugator", -- 437
		"Dragoner", -- 437
		"Persecuter", -- 437
		"Draconarius", -- 437
		"Volontaire" -- 437
	}, -- 437
	last_names = { -- 438
		"of Die Augen", -- 438
		"of Knochen", -- 438
		"of Sehne", -- 438
		"of Knorpel", -- 438
		"of Bauchspeicheldrüse" -- 438
	}, -- 438
	arms_model = "models/weapons/c_arms_refugee.mdl", -- 439
	ShowSpare1 = open_player_menu, -- 440
	ShowSpare2 = open_action_menu, -- 441
	bar_names = { -- 443
		health = "resolve" -- 443
	}, -- 442
	Reflect = function(ply) -- 444
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I am part of the EMPEROR's finest soldiers. The Privates, Conscripts, and Sanitaters are my subordinates, whilst the EMPEROR and the Quartermaster are my superiors. <c=0,210,0>I must keep order within the city, and the machines tidy") -- 445
	end, -- 444
	PlayerLoadout = function(ply) -- 446
		ply:ClearOddities() -- 447
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 448
		for slot, val in pairs({ -- 451
			[0] = 1, -- 451
			[1] = 1, -- 453
			[2] = 1, -- 455
			[3] = 2, -- 457
			[4] = 3, -- 459
			[5] = 0, -- 461
			[6] = 0 -- 463
		}) do -- 464
			set_bodygroup(ply, slot, val) -- 449
		end -- 449
		ply:SetArmor(40) -- 465
		return false -- 466
	end -- 446
}) -- 400
TEAM_DEALER = DarkRP.createJob("Quartermaster", { -- 469
	color = Color(255, 140, 0), -- 469
	model = "models/vel/evilwar/royalist.mdl", -- 470
	description = "The left hand of the Emperor.\nManage the goods and keep your men armed.", -- 471
	weapons = { }, -- 473
	command = "dealer", -- 474
	salary = 1, -- 475
	max = 1, -- 476
	cost = 3, -- 477
	hasLicense = false, -- 478
	use_machines = false, -- 479
	can_sell = true, -- 480
	can_build = true, -- 481
	category = "Royalists", -- 482
	speech_sounds = (function() -- 483
		local _accum_0 = { } -- 483
		local _len_0 = 1 -- 483
		for i = 1, 3 do -- 483
			_accum_0[_len_0] = "placenta/speech/dealer" .. tostring(i) .. ".wav" -- 483
			_len_0 = _len_0 + 1 -- 483
		end -- 483
		return _accum_0 -- 483
	end)(), -- 483
	hurt_sounds = (function() -- 484
		local _accum_0 = { } -- 484
		local _len_0 = 1 -- 484
		for i = 1, 4 do -- 484
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 484
			_len_0 = _len_0 + 1 -- 484
		end -- 484
		return _accum_0 -- 484
	end)(), -- 484
	become_sounds = (function() -- 485
		local _accum_0 = { } -- 485
		local _len_0 = 1 -- 485
		for i = 1, 15 do -- 485
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav" -- 485
			_len_0 = _len_0 + 1 -- 485
		end -- 485
		return _accum_0 -- 485
	end)(), -- 485
	crosstext = function(ply) -- 486
		local text = "Don't panic." -- 487
		do -- 488
			local _exp_0 = lp:Team() -- 488
			if TEAM_PRIVATE == _exp_0 then -- 489
				text = "This guy handles the guns." -- 490
			elseif TEAM_STALKER == _exp_0 then -- 491
				text = "Captain of the goods." -- 492
			elseif TEAM_SANITAR == _exp_0 then -- 493
				text = "The oldest living Dragoon.\nRespect. Honor." -- 494
			elseif TEAM_KORPSMAN == _exp_0 then -- 495
				text = "A reminder of the power of Kapitalism." -- 496
			elseif TEAM_DEALER == _exp_0 then -- 497
				text = "I'm seeing double!" -- 498
			elseif TEAM_EMPEROR == _exp_0 then -- 499
				text = "My brother in arms.\nIf he fails, I'll cut his off." -- 500
			elseif TEAM_GHOST == _exp_0 then -- 501
				text = "Glorified accountant." -- 502
			elseif TEAM_BONEHEAD == _exp_0 then -- 503
				text = "BONES ARE HIS DOLLARS." -- 504
			end -- 504
		end -- 504
		return { -- 505
			text = text, -- 505
			font = "Spleen_Label_Small" -- 505
		}, true -- 505
	end, -- 486
	first_names = { -- 506
		"Quartermaster", -- 506
		"Quartiermeister" -- 506
	}, -- 506
	last_names = { -- 507
		"Kommissariatsdienst" -- 507
	}, -- 507
	special_name = "Trusty", -- 508
	special_name_chance = 1000, -- 509
	ShowSpare1 = open_player_menu, -- 510
	ShowSpare2 = open_action_menu, -- 511
	bar_names = { -- 513
		health = "insurance" -- 513
	}, -- 512
	PlayerLoadout = function(ply) -- 514
		ply:ClearOddities() -- 515
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 516
		for slot, val in pairs({ -- 519
			[0] = 1, -- 519
			[1] = 1, -- 521
			[2] = 1, -- 523
			[3] = 1, -- 525
			[4] = 3, -- 527
			[5] = 0, -- 529
			[6] = 0 -- 531
		}) do -- 532
			set_bodygroup(ply, slot, val) -- 517
		end -- 517
		return false -- 533
	end -- 514
}) -- 468
TEAM_KORPSMAN = DarkRP.createJob("Sanitater", { -- 536
	color = Color(79, 150, 150), -- 536
	model = "models/vel/evilwar/royalist.mdl", -- 537
	description = "You keep people alive in this terrible place.\nFill the blood and empty the rust.", -- 538
	weapons = { -- 539
		"evilrp/medkit", -- 539
		"evilrp_melee/knife" -- 539
	}, -- 539
	command = "medic", -- 540
	salary = 1, -- 541
	max = 2, -- 542
	cost = 2, -- 543
	hasLicense = false, -- 544
	medic = true, -- 545
	use_machines = false, -- 546
	category = "Royalists", -- 547
	speech_sounds = (function() -- 548
		local _accum_0 = { } -- 548
		local _len_0 = 1 -- 548
		for i = 1, 4 do -- 548
			_accum_0[_len_0] = "placenta/speech/korps" .. tostring(i) .. ".wav" -- 548
			_len_0 = _len_0 + 1 -- 548
		end -- 548
		return _accum_0 -- 548
	end)(), -- 548
	hurt_sounds = (function() -- 549
		local _accum_0 = { } -- 549
		local _len_0 = 1 -- 549
		for i = 1, 4 do -- 549
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav" -- 549
			_len_0 = _len_0 + 1 -- 549
		end -- 549
		return _accum_0 -- 549
	end)(), -- 549
	become_sounds = { -- 550
		"items/suitchargeok1.wav" -- 550
	}, -- 550
	crosstext = function(ply) -- 551
		local text = "Don't panic." -- 552
		do -- 553
			local _exp_0 = lp:Team() -- 553
			if TEAM_PRIVATE == _exp_0 then -- 554
				text = "I forgot what\nto call these guys." -- 555
			elseif TEAM_STALKER == _exp_0 then -- 556
				text = "A walking blood bag." -- 557
			elseif TEAM_SANITAR == _exp_0 then -- 558
				text = "Better remember\nwho lets them live." -- 559
			elseif TEAM_KORPSMAN == _exp_0 then -- 560
				text = "Something to\nbe happy about." -- 561
			elseif TEAM_DEALER == _exp_0 then -- 562
				text = "Keep them busy.\nWe need their blood and sweat." -- 563
			elseif TEAM_EMPEROR == _exp_0 then -- 564
				text = "What a strange,\nselfless thing." -- 565
			elseif TEAM_GHOST == _exp_0 then -- 566
				text = "A respectable mortal." -- 567
			elseif TEAM_BONEHEAD == _exp_0 then -- 568
				text = "CONFUSING." -- 569
			end -- 569
		end -- 569
		return { -- 570
			text = text, -- 570
			font = "Spleen_Label_Small" -- 570
		}, true -- 570
	end, -- 551
	first_names = { -- 571
		"Dissector", -- 571
		"Retractor", -- 571
		"Suture", -- 571
		"Femur", -- 571
		"Cystic", -- 571
		"Rasp", -- 571
		"Ferrum", -- 571
		"Fascia", -- 571
		"Marrow", -- 571
		"Lienis", -- 571
		"Aorta", -- 571
		"Tunica", -- 571
		"Maxilla", -- 571
		"Sacrum", -- 571
		"Leach" -- 571
	}, -- 571
	last_names = { -- 572
		"Forceps", -- 572
		"Scalpel", -- 572
		"Curette", -- 572
		"Rongeur", -- 572
		"Trocar", -- 572
		"Babcock", -- 572
		"Duval", -- 572
		"Hemostat", -- 572
		"Ossis", -- 572
		"Caro", -- 572
		"Cadaver", -- 572
		"Sanguis", -- 572
		"Bilis", -- 572
		"Viscera", -- 572
		"Jugular", -- 572
		"Clavius" -- 572
	}, -- 572
	special_name = "Corpseman", -- 573
	special_name_chance = 1000, -- 574
	ShowSpare1 = open_player_menu, -- 575
	ShowSpare2 = open_action_menu, -- 576
	bar_names = { -- 578
		health = "Bio-reserves" -- 578
	}, -- 577
	PlayerLoadout = function(ply) -- 579
		ply:ClearOddities() -- 580
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)]) -- 581
		ply:SetSkin(4) -- 582
		for slot, val in pairs({ -- 585
			[0] = 0, -- 585
			[1] = 0, -- 587
			[2] = 2, -- 589
			[3] = 3, -- 591
			[4] = 1, -- 593
			[5] = 0, -- 595
			[6] = 0 -- 597
		}) do -- 598
			set_bodygroup(ply, slot, val) -- 583
		end -- 583
		return false -- 599
	end -- 579
}) -- 535
TEAM_EMPEROR = DarkRP.createJob("Emperor", { -- 602
	color = Color(150, 20, 20), -- 602
	model = "models/vel/evilwar/royalist.mdl", -- 603
	description = "Rule with an iron fist.", -- 604
	command = "emperor", -- 605
	salary = 1, -- 606
	weapons = { -- 607
		"evilrp_weapon/novoluger" -- 607
	}, -- 607
	max = 1, -- 608
	cost = 5, -- 609
	cooldown = 200, -- 610
	weapons = { }, -- 611
	hasLicense = true, -- 612
	mayor = true, -- 613
	use_machines = false, -- 614
	category = "Royalists", -- 615
	speech_sounds = (function() -- 616
		local _accum_0 = { } -- 616
		local _len_0 = 1 -- 616
		for i = 1, 15 do -- 616
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg" -- 616
			_len_0 = _len_0 + 1 -- 616
		end -- 616
		return _accum_0 -- 616
	end)(), -- 616
	become_sounds = { -- 617
		"kidneydagger/broadcast1.wav" -- 617
	}, -- 617
	crosstext = function(ply) -- 618
		local text = "Don't panic." -- 619
		do -- 620
			local _exp_0 = lp:Team() -- 620
			if TEAM_PRIVATE == _exp_0 then -- 621
				text = "Listen carefully." -- 622
			elseif TEAM_STALKER == _exp_0 then -- 623
				text = "Oh, your majesty!" -- 624
			elseif TEAM_SANITAR == _exp_0 then -- 625
				text = "Hail, hail!" -- 626
			elseif TEAM_KORPSMAN == _exp_0 then -- 627
				text = "Is he feeling okay?" -- 628
			elseif TEAM_DEALER == _exp_0 then -- 629
				text = "Glorious leader.\nI'm nothing without him." -- 630
			elseif TEAM_EMPEROR == _exp_0 then -- 631
				text = "Our strength\nshall prevail." -- 632
			elseif TEAM_GHOST == _exp_0 then -- 633
				text = "So full of lies." -- 634
			elseif TEAM_BONEHEAD == _exp_0 then -- 635
				text = "THERE HE IS!!" -- 636
			end -- 636
		end -- 636
		return { -- 637
			text = text, -- 637
			font = "Spleen_Label_Small" -- 637
		}, true -- 637
	end, -- 618
	first_names = { -- 639
		"Basileus", -- 639
		"Agrippa", -- 639
		"Gnaeus", -- 639
		"Gaius" -- 639
	}, -- 639
	last_names = { -- 640
		"Imperator Lymphoma", -- 640
		"Kaiser Lymphoma", -- 640
		"Rex Lymphoma", -- 640
		"Lymphoma Magnus" -- 640
	}, -- 640
	special_name = "Which Kaiser", -- 641
	special_name_chance = 1000, -- 642
	ShowSpare1 = open_player_menu, -- 643
	ShowSpare2 = open_action_menu, -- 644
	bar_names = { -- 646
		health = "PRIDE" -- 646
	}, -- 645
	Reflect = function(ply) -- 647
		return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>I am the EMPEROR of Lymphoma. I am the supreme ruler of this city and its people. I decide who lives and who dies. <c=0,210,0>I can use my terminal to administrate our internal affairs.") -- 648
	end, -- 647
	PlayerLoadout = function(ply) -- 649
		ply:ClearOddities() -- 650
		local oddities -- 651
		do -- 651
			local _accum_0 = { } -- 651
			local _len_0 = 1 -- 651
			for k, v in pairs(ODDITY.list) do -- 651
				if v ~= ODDITY_ILLITERACY then -- 651
					_accum_0[_len_0] = v -- 651
					_len_0 = _len_0 + 1 -- 651
				end -- 651
			end -- 651
			oddities = _accum_0 -- 651
		end -- 651
		ply:AddOddity(oddities[math.random(#oddities)]) -- 652
		for slot, val in pairs({ -- 655
			[0] = 1, -- 655
			[1] = 2, -- 657
			[2] = 0, -- 659
			[3] = 1, -- 661
			[4] = 2, -- 663
			[5] = 1, -- 665
			[6] = 0 -- 667
		}) do -- 668
			set_bodygroup(ply, slot, val) -- 653
		end -- 653
		ply:SetNWInt("evilrp_gasmask", 4) -- 669
		ply:Give("evilrp_weapon/novoluger") -- 670
		ply:SetArmor(65) -- 671
		return false -- 672
	end -- 649
}) -- 601
GAMEMODE.CivilProtection = { -- 675
	[TEAM_PRIVATE] = true, -- 675
	[TEAM_CONSCRIPT] = true, -- 676
	[TEAM_SANITAR] = true, -- 677
	[TEAM_EMPEROR] = true -- 678
} -- 674
GAMEMODE.DefaultTeam = TEAM_GHOST -- 680
