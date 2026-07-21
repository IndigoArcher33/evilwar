local Config = GAMEMODE.Config
local set_bodygroup
set_bodygroup = function(ply, slot, val)
	if type(val) == "table" then
		val = val[math.random(1, #val)]
	end
	return ply:SetBodygroup(slot, val)
end
local open_player_menu
open_player_menu = function(ply)
	if not CLIENT then
		return
	end
	if lp:Alive() then
		return GAMEMODE:CreatePlayerMenu()
	else
		return GAMEMODE:Frighten()
	end
end
local open_action_menu
open_action_menu = function(ply)
	if not CLIENT then
		return
	end
	local tr = GAMEMODE:GetHandTrace(ply, 80)
	return GAMEMODE:OpenActionMenu(tr.HitPos, tr.Entity)
end
TEAM_GHOST = DarkRP.createJob("Ghost", {
	color = Color(150, 150, 150),
	model = "models/player/skeleton.mdl",
	description = "A lost soul.",
	instant_respawn = true,
	weapons = { },
	command = "ghost",
	salary = 1,
	max = 0,
	speech_sounds = {
		"ambient/voices/squeal1.wav"
	},
	crosstext = function(ply)
		local text = "OH SOTLA,\nTHE HORROR."
		do
			local _exp_0 = lp:Team()
			if TEAM_KORPSMAN == _exp_0 then
				text = "Evil spirits wander!\n<wiggle>Not on my shift."
			elseif TEAM_GHOST == _exp_0 then
				text = "We're the same,\nyou and I."
			end
		end
		return {
			text = text,
			font = "Spleen_Label_Small"
		}
	end,
	first_names = {
		"Suffering",
		"Fear",
		"Agony",
		"Malice",
		"Hatred",
		"Grief",
		"Pain",
		"Despair",
		"Rage"
	},
	ShowSpare1 = function(ply)
		if CLIENT then
			return GAMEMODE:Frighten()
		end
	end,
	ShowSpare2 = function(ply)
		local nearby = ents.FindInSphere(ply:GetPos(), 16)
		local found
		for _index_0 = 1, #nearby do
			local ent = nearby[_index_0]
			if ent:GetClass():find("portal/spawn") then
				found = ent
				break
			end
		end
		if not (found and IsValid(found)) then
			if CLIENT then
				return GAMEMODE:Frighten()
			else
				return ply:Notify("<c=200,0,0>There is no purpose in life near me.")
			end
		elseif SERVER then
			return found:Use(ply)
		end
	end,
	PlayerLoadout = function(ply)
		ply:ClearOddities()
		ply:SetNWInt("evilrp_gasmask", 0)
		return true
	end,
	ColorMod = function(ply)
		local abs, cos, sin = math.abs, math.cos, math.sin
		local ct = CurTime()
		local tab = {
			["$pp_colour_addr"] = 0,
			["$pp_colour_addg"] = 0,
			["$pp_colour_addb"] = 0,
			["$pp_colour_brightness"] = 0 + (-0.01 * cos(ct)),
			["$pp_colour_contrast"] = 0.6 + (abs(sin(ct * 0.166)) * 0.5),
			["$pp_colour_colour"] = 0,
			["$pp_colour_mulr"] = 0 + abs(sin(ct * 0.789)),
			["$pp_colour_mulg"] = 0,
			["$pp_colour_mulb"] = 0
		}
		return tab
	end
})
TEAM_STALKER = DarkRP.createJob("Stalker", {
	color = Color(20, 150, 20),
	model = "models/liver_failure/wastelander/wastelander.mdl",
	description = "A soul with no allegiance, destined to plunder the wasteland.",
	weapons = {
		"evilrp_weapon/brainpaster",
		"evilrp_melee/axe"
	},
	category = "Scum of Liver Failure",
	command = "stalker",
	salary = 1,
	max = 0,
	hasLicense = false,
	candemote = false,
	speech_sounds = (function()
		local _accum_0 = { }
		local _len_0 = 1
		for i = 1, 3 do
			_accum_0[_len_0] = "placenta/speech/prole" .. tostring(i) .. ".wav"
			_len_0 = _len_0 + 1
		end
		return _accum_0
	end)(),
	hurt_sounds = (function()
		local _accum_0 = { }
		local _len_0 = 1
		for i = 1, 5 do
			_accum_0[_len_0] = "placenta/pain/prole" .. tostring(i) .. ".wav"
			_len_0 = _len_0 + 1
		end
		return _accum_0
	end)(),
	become_sounds = (function()
		local _accum_0 = { }
		local _len_0 = 1
		for i = 1, 3 do
			_accum_0[_len_0] = "npc/zombie/zombie_alert" .. tostring(i) .. ".wav"
			_len_0 = _len_0 + 1
		end
		return _accum_0
	end)(),
	death_sounds = (function()
		local _accum_0 = { }
		local _len_0 = 1
		for i = 1, 3 do
			_accum_0[_len_0] = "placenta/death/prole" .. tostring(i) .. ".wav"
			_len_0 = _len_0 + 1
		end
		return _accum_0
	end)(),
	crosstext = function(ply)
		local text = "Don't panic."
		do
			local _exp_0 = lp:Team()
			if TEAM_PRIVATE == _exp_0 then
				text = "He doesn't look like me."
			elseif TEAM_STALKER == _exp_0 then
				text = "A fellow plunderer."
			elseif TEAM_SANITAR == _exp_0 then
				text = "Despicable."
			elseif TEAM_KORPSMAN == _exp_0 then
				text = "Why is he here?"
			elseif TEAM_KOMMANDANT == _exp_0 then
				text = "He might be of use to me."
			elseif TEAM_GHOST == _exp_0 then
				text = "He has a noble pursuit."
			elseif TEAM_BONEHEAD == _exp_0 then
				text = "SEEN HIM BEFORE!!"
			end
		end
		return {
			text = text,
			font = "Spleen_Label_Small"
		}, false
	end,
	first_names = {
		"Wasted",
		"Decrepit",
		"Rotten"
	},
	last_names = {
		"Soul",
		"Plunderer",
		"Traitor",
		"Wanderer"
	},
	bar_names = {
		health = "regret"
	},
	special_name = "Meatwad",
	special_name_chance = 1000,
	ShowSpare1 = open_player_menu,
	ShowSpare2 = open_action_menu,
	PlayerLoadout = function(ply)
		ply:ClearOddities()
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)])
		for slot, val in pairs({
			[0] = 0,
			[1] = 2,
			[2] = {
				2,
				3,
				8,
				6
			},
			[3] = {
				19,
				20
			},
			[4] = 0,
			[5] = 0,
			[6] = {
				0,
				1,
				2,
				3
			},
			[7] = 0,
			[8] = 0,
			[9] = {
				0,
				1
			}
		}) do
			set_bodygroup(ply, slot, val)
		end
		local skins = {
			4,
			6,
			7
		}
		ply:SetSkin(skins[math.random(1, #skins)])
		return false
	end
})
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = "placenta/bonehead_aggrod4.wav",
		pitch = {
			200,
			250
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "SpeechBonehead",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	SpeechBonehead = _class_0
end
TEAM_BONEHEAD = DarkRP.createJob("Bonehead", {
	color = Color(150, 150, 150),
	model = "models/player/zombie_fast.mdl",
	description = "evil fucker.",
	instant_respawn = true,
	command = "bonehead",
	salary = 1,
	max = 0,
	speech_sounds = "SpeechBonehead",
	hurt_sounds = (function()
		local _accum_0 = { }
		local _len_0 = 1
		for i = 1, 2 do
			_accum_0[_len_0] = "placenta/bonehead_slice" .. tostring(i) .. ".wav"
			_len_0 = _len_0 + 1
		end
		return _accum_0
	end)(),
	become_sounds = (function()
		local _accum_0 = { }
		local _len_0 = 1
		for i = 1, 4 do
			_accum_0[_len_0] = "placenta/bonehead_aggrod" .. tostring(i) .. ".wav"
			_len_0 = _len_0 + 1
		end
		return _accum_0
	end)(),
	crosstext = function(ply)
		local text = "Don't panic."
		do
			local _exp_0 = lp:Team()
			if TEAM_PRIVATE == _exp_0 then
				text = "Oh no! He's real!"
			elseif TEAM_SANITAR == _exp_0 then
				text = "Oh boy."
			elseif TEAM_KORPSMAN == _exp_0 then
				text = "Oh no! It happened again!"
			elseif TEAM_KOMMANDANT == _exp_0 then
				text = "Ha. It happened again."
			elseif TEAM_GHOST == _exp_0 then
				text = "Lookin' good."
			elseif TEAM_BONEHEAD == _exp_0 then
				text = "THERE'S ANOTHER ONE."
			end
		end
		return {
			text = text,
			font = "Spleen_Label_Small"
		}, false
	end,
	first_names = {
		"Evil"
	},
	last_names = {
		"Fucker"
	},
	no_needs = true,
	hint = "You are a truly pissed off skeleton. Go get 'em!",
	bar_names = {
		health = "EVIL FUCKER POWER"
	},
	bar_colors = {
		health = Color(200, 0, 0)
	},
	RenderScreenspaceEffects = function(ply)
		local ct = CurTime()
		DrawMotionBlur(0.25, 0.2, 0.3)
		return DrawSharpen(1 * math.sin(ct), 2 * math.random(0.8, 1.2))
	end,
	ColorMod = function(ply)
		local abs, cos, sin = math.abs, math.cos, math.sin
		local ct = CurTime()
		local tab = {
			["$pp_colour_addr"] = 0.1,
			["$pp_colour_addg"] = 0,
			["$pp_colour_addb"] = 0,
			["$pp_colour_brightness"] = 0 + (-0.01 * cos(ct)),
			["$pp_colour_contrast"] = 1.6 + (abs(sin(ct * 0.166)) * 0.5),
			["$pp_colour_colour"] = 0,
			["$pp_colour_mulr"] = 0 + abs(sin(ct * 0.789)),
			["$pp_colour_mulg"] = 0,
			["$pp_colour_mulb"] = 0
		}
		return tab
	end,
	ShowSpare1 = function()
		if CLIENT then
			return GAMEMODE:Frighten()
		end
	end,
	ShowSpare2 = function()
		if CLIENT then
			return GAMEMODE:Frighten()
		end
	end,
	PlayerLoadout = function(ply)
		ply:SetNWInt("evilrp_gasmask", 0)
		ply:Give("evilrp_melee/hands/boneclaws")
		return true
	end,
	HandleRagdoll = function(rag, ply)
		return rag:SetNWInt("decomp_stage", DSTAGE_BONES)
	end
})
TEAM_PRIVATE = DarkRP.createJob("Private", {
	color = Color(20, 150, 20),
	model = "models/vel/evilwar/royalist.mdl",
	description = "A new recruit that hasn't gone through training yet.",
	command = "proletariat",
	salary = 1,
	max = 0,
	hasLicense = true,
	candemote = false,
	category = "Citizens of Liver Failure",
	speech_sounds = (function()
		local _accum_0 = { }
		local _len_0 = 1
		for i = 1, 3 do
			_accum_0[_len_0] = "placenta/speech/prole" .. tostring(i) .. ".wav"
			_len_0 = _len_0 + 1
		end
		return _accum_0
	end)(),
	hurt_sounds = (function()
		local _accum_0 = { }
		local _len_0 = 1
		for i = 1, 5 do
			_accum_0[_len_0] = "placenta/pain/prole" .. tostring(i) .. ".wav"
			_len_0 = _len_0 + 1
		end
		return _accum_0
	end)(),
	become_sounds = (function()
		local _accum_0 = { }
		local _len_0 = 1
		for i = 1, 3 do
			_accum_0[_len_0] = "npc/zombie/zombie_alert" .. tostring(i) .. ".wav"
			_len_0 = _len_0 + 1
		end
		return _accum_0
	end)(),
	death_sounds = (function()
		local _accum_0 = { }
		local _len_0 = 1
		for i = 1, 3 do
			_accum_0[_len_0] = "placenta/death/prole" .. tostring(i) .. ".wav"
			_len_0 = _len_0 + 1
		end
		return _accum_0
	end)(),
	crosstext = function(ply)
		local text = "Don't panic."
		do
			local _exp_0 = lp:Team()
			if TEAM_PRIVATE == _exp_0 then
				text = "United in rank?"
			elseif TEAM_STALKER == _exp_0 then
				text = "A soldier from Lymphoma."
			elseif TEAM_SANITAR == _exp_0 then
				text = "These soldiers need guidance.\nPut the fear in their hearts."
			elseif TEAM_KORPSMAN == _exp_0 then
				text = "Smelly and stupid."
			elseif TEAM_KOMMANDANT == _exp_0 then
				text = "Is he working hard enough?"
			elseif TEAM_GHOST == _exp_0 then
				text = "Sad, but funny."
			elseif TEAM_BONEHEAD == _exp_0 then
				text = "SKIN...!"
			end
		end
		return {
			text = text,
			font = "Spleen_Label_Small"
		}, false
	end,
	first_names = {
		"Private",
		"PVT.",
		"Recruit"
	},
	GenerateName = function(self, ply)
		local unit_id = math.random(100, 999)
		if unit_id < 10 then
			unit_id = "00" .. tostring(unit_id)
		elseif unit_id < 100 then
			unit_id = "0" .. tostring(unit_id)
		else
			unit_id = tostring(unit_id)
		end
		return self.first_names[math.random(1, #self.first_names)] .. " #" .. unit_id
	end,
	special_name = "private parts",
	special_name_chance = 1000,
	ShowSpare1 = open_player_menu,
	ShowSpare2 = open_action_menu,
	PlayerLoadout = function(ply)
		ply:ClearOddities()
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)])
		for slot, val in pairs({
			[0] = 0,
			[1] = 0,
			[2] = 0,
			[3] = 0,
			[4] = 0,
			[5] = 0
		}) do
			set_bodygroup(ply, slot, val)
		end
		return false
	end
})
TEAM_SANITAR = DarkRP.createJob("Dragoon", {
	color = Color(25, 170, 0),
	model = "models/vel/evilwar/royalist.mdl",
	description = "The right hand of the Kommandant.\nRespected by his peers,\nfeared by his enemies.",
	weapons = {
		"evilrp_weapon/pacifier",
		"simple_hl2_stunstick"
	},
	command = "ss",
	salary = 1,
	max = 6,
	hasLicense = true,
	ammo = {
		pistol = 60
	},
	category = "Sanitar Squad",
	speech_sounds = (function()
		local _accum_0 = { }
		local _len_0 = 1
		for i = 1, 15 do
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg"
			_len_0 = _len_0 + 1
		end
		return _accum_0
	end)(),
	hurt_sounds = (function()
		local _accum_0 = { }
		local _len_0 = 1
		for i = 1, 4 do
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav"
			_len_0 = _len_0 + 1
		end
		return _accum_0
	end)(),
	become_sounds = (function()
		local _accum_0 = { }
		local _len_0 = 1
		for i = 1, 15 do
			_accum_0[_len_0] = "ambient/levels/prison/radio_random" .. tostring(i) .. ".wav"
			_len_0 = _len_0 + 1
		end
		return _accum_0
	end)(),
	crosstext = function(ply)
		local text = "Don't panic."
		do
			local _exp_0 = lp:Team()
			if TEAM_PRIVATE == _exp_0 then
				text = "A Lymphomian legend!"
			elseif TEAM_STALKER == _exp_0 then
				text = "Fight or run?!"
			elseif TEAM_SANITAR == _exp_0 then
				text = "Finally...\nSomeone competent."
			elseif TEAM_KORPSMAN == _exp_0 then
				text = "Is that enemy blood?\nNo of course not."
			elseif TEAM_KOMMANDANT == _exp_0 then
				text = "A tentacle of mine."
			elseif TEAM_GHOST == _exp_0 then
				text = "Evil, stupid,\n maybe both."
			elseif TEAM_BONEHEAD == _exp_0 then
				text = "DANGER."
			end
		end
		return {
			text = text,
			font = "Spleen_Label_Small"
		}, true
	end,
	first_names = {
		"Subjugator",
		"Dragoner",
		"Persecuter",
		"Draconarius",
		"Volontaire"
	},
	last_names = {
		"of Die Augen",
		"of Knochen",
		"of Sehne",
		"of Knorpel",
		"of Bauchspeicheldrüse"
	},
	arms_model = "models/weapons/c_arms_refugee.mdl",
	ShowSpare1 = open_player_menu,
	ShowSpare2 = open_action_menu,
	bar_names = {
		health = "resolve"
	},
	PlayerLoadout = function(ply)
		ply:ClearOddities()
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)])
		for slot, val in pairs({
			[0] = 1,
			[1] = 1,
			[2] = 1,
			[3] = 2,
			[4] = 3,
			[5] = 0
		}) do
			set_bodygroup(ply, slot, val)
		end
		return false
	end
})
TEAM_DEALER = DarkRP.createJob("Quartermaster", {
	color = Color(255, 140, 0),
	model = {
		"models/liver_failure/liverish/liverish.mdl",
		"models/liver_failure/kidneystani/kidneystani.mdl",
		"models/liver_failure/arrythmian/arrythmian.mdl"
	},
	description = "The left hand of the Kommandant.\nManage the goods and keep your men armed.",
	weapons = { },
	command = "dealer",
	salary = 1,
	max = 2,
	hasLicense = false,
	category = "Citizens of Liver Failure",
	speech_sounds = (function()
		local _accum_0 = { }
		local _len_0 = 1
		for i = 1, 3 do
			_accum_0[_len_0] = "placenta/speech/dealer" .. tostring(i) .. ".wav"
			_len_0 = _len_0 + 1
		end
		return _accum_0
	end)(),
	first_names = {
		"Kanan",
		"Merce",
		"Ameel",
		"Otis",
		"Cedric",
		"Edwin",
		"Floy",
		"Benjamin",
		"Fortune",
		"William",
		"Thomas",
		"Dean",
		"Aurum",
		"Klep"
	},
	last_names = {
		"Chapman",
		"Merchant",
		"Cash",
		"Keeper",
		"Bones",
		"Ryker",
		"Plutarch",
		"Nasir",
		"Greenback",
		"Grocer",
		"Flanders",
		"Hooper",
		"Watto",
		"Loman",
		"Stehlen",
		"Reichmann",
		"Kaufmann"
	},
	special_name = "Unfortunate Shopkeep",
	special_name_chance = 1000,
	ShowSpare1 = open_player_menu,
	ShowSpare2 = open_action_menu,
	bar_names = {
		health = "insurance"
	},
	PlayerLoadout = function(ply)
		ply:ClearOddities()
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)])
		for slot, val in pairs({
			[0] = 0,
			[1] = 0,
			[2] = {
				3,
				5,
				16
			},
			[3] = 22,
			[4] = 0,
			[5] = 0,
			[6] = 1,
			[7] = 0,
			[8] = {
				0,
				1,
				2,
				3,
				4,
				5
			},
			[9] = 0
		}) do
			set_bodygroup(ply, slot, val)
		end
		local skins = {
			2,
			4,
			5,
			6,
			7,
			8,
			9,
			10,
			11,
			12,
			13,
			14,
			15
		}
		ply:SetSkin(skins[math.random(1, #skins)])
		return false
	end
})
TEAM_KORPSMAN = DarkRP.createJob("Sanitäter", {
	color = Color(79, 150, 150),
	model = "models/vel/evilwar/royalist.mdl",
	description = "You keep people alive in this terrible place.\nFill the blood and empty the rust.",
	weapons = {
		"evilrp/medkit"
	},
	command = "medic",
	salary = 1,
	max = 3,
	hasLicense = false,
	medic = true,
	category = "Citizens of Liver Failure",
	speech_sounds = (function()
		local _accum_0 = { }
		local _len_0 = 1
		for i = 1, 4 do
			_accum_0[_len_0] = "placenta/speech/korps" .. tostring(i) .. ".wav"
			_len_0 = _len_0 + 1
		end
		return _accum_0
	end)(),
	hurt_sounds = (function()
		local _accum_0 = { }
		local _len_0 = 1
		for i = 1, 4 do
			_accum_0[_len_0] = "placenta/pain/sanitar" .. tostring(i) .. ".wav"
			_len_0 = _len_0 + 1
		end
		return _accum_0
	end)(),
	become_sounds = {
		"items/suitchargeok1.wav"
	},
	crosstext = function(ply)
		local text = "Don't panic."
		do
			local _exp_0 = lp:Team()
			if TEAM_PRIVATE == _exp_0 then
				text = "I forgot what\nto call these guys."
			elseif TEAM_STALKER == _exp_0 then
				text = "A walking blood bag."
			elseif TEAM_SANITAR == _exp_0 then
				text = "Better remember\nwho lets them live."
			elseif TEAM_KORPSMAN == _exp_0 then
				text = "Something to\nbe happy about."
			elseif TEAM_KOMMANDANT == _exp_0 then
				text = "What a strange,\nselfless thing."
			elseif TEAM_GHOST == _exp_0 then
				text = "A respectable mortal."
			elseif TEAM_BONEHEAD == _exp_0 then
				text = "CONFUSING."
			end
		end
		return {
			text = text,
			font = "Spleen_Label_Small"
		}, true
	end,
	first_names = {
		"Dissector",
		"Retractor",
		"Suture",
		"Femur",
		"Cystic",
		"Rasp",
		"Ferrum",
		"Fascia",
		"Marrow",
		"Lienis",
		"Aorta",
		"Tunica",
		"Maxilla",
		"Sacrum",
		"Leach"
	},
	last_names = {
		"Forceps",
		"Scalpel",
		"Curette",
		"Rongeur",
		"Trocar",
		"Babcock",
		"Duval",
		"Hemostat",
		"Ossis",
		"Caro",
		"Cadaver",
		"Sanguis",
		"Bilis",
		"Viscera",
		"Jugular",
		"Clavius"
	},
	special_name = "Corpseman",
	special_name_chance = 1000,
	ShowSpare1 = open_player_menu,
	ShowSpare2 = open_action_menu,
	bar_names = {
		health = "Bio-reserves"
	},
	PlayerLoadout = function(ply)
		ply:ClearOddities()
		ply:AddOddity(ODDITY.list[math.random(#ODDITY.list)])
		ply:SetSkin(4)
		for slot, val in pairs({
			[0] = 0,
			[1] = 0,
			[2] = 2,
			[3] = 3,
			[4] = 1,
			[5] = 0
		}) do
			set_bodygroup(ply, slot, val)
		end
		return false
	end
})
TEAM_KOMMANDANT = DarkRP.createJob("Kommandant", {
	color = Color(150, 20, 20),
	model = "models/vel/evilwar/royalist.mdl",
	description = "Rule with an iron fist.",
	command = "kommandant",
	salary = 1,
	weapons = {
		"evilrp_weapon/novoluger"
	},
	max = 1,
	weapons = { },
	hasLicense = true,
	mayor = true,
	category = "Bureaukracy",
	speech_sounds = (function()
		local _accum_0 = { }
		local _len_0 = 1
		for i = 1, 15 do
			_accum_0[_len_0] = "placenta/speech/chatter" .. tostring(i) .. ".ogg"
			_len_0 = _len_0 + 1
		end
		return _accum_0
	end)(),
	become_sounds = {
		"kidneydagger/broadcast1.wav"
	},
	crosstext = function(ply)
		local text = "Don't panic."
		do
			local _exp_0 = lp:Team()
			if TEAM_PRIVATE == _exp_0 then
				text = "Listen carefully."
			elseif TEAM_STALKER == _exp_0 then
				text = "Oh your magesty!"
			elseif TEAM_SANITAR == _exp_0 then
				text = "Hail, hail!"
			elseif TEAM_KORPSMAN == _exp_0 then
				text = "Is he feeling okay?"
			elseif TEAM_KOMMANDANT == _exp_0 then
				text = "Our strength\nshall prevail."
			elseif TEAM_GHOST == _exp_0 then
				text = "So full of lies."
			elseif TEAM_BONEHEAD == _exp_0 then
				text = "THERE HE IS!!"
			end
		end
		return {
			text = text,
			font = "Spleen_Label_Small"
		}, true
	end,
	first_names = ("Kommandant"),
	special_name = "Kamdonot",
	special_name_chance = 1000,
	ShowSpare1 = open_player_menu,
	ShowSpare2 = open_action_menu,
	bar_names = {
		health = "PRIDE"
	},
	PlayerLoadout = function(ply)
		ply:ClearOddities()
		local oddities
		do
			local _accum_0 = { }
			local _len_0 = 1
			for k, v in pairs(ODDITY.list) do
				if v ~= ODDITY_ILLITERACY then
					_accum_0[_len_0] = v
					_len_0 = _len_0 + 1
				end
			end
			oddities = _accum_0
		end
		ply:AddOddity(oddities[math.random(#oddities)])
		for slot, val in pairs({
			[0] = 1,
			[1] = 2,
			[2] = 0,
			[3] = 1,
			[4] = 2,
			[5] = 0
		}) do
			set_bodygroup(ply, slot, val)
		end
		ply:SetNWInt("evilrp_gasmask", 4)
		ply:Give("evilrp_weapon/novoluger")
		return false
	end
})
GAMEMODE.CivilProtection = {
	[TEAM_PRIVATE] = true,
	[TEAM_SANITAR] = true,
	[TEAM_KOMMANDANT] = true
}
GAMEMODE.DefaultTeam = TEAM_GHOST
