-- [yue]: darkrp_modules\portals\sh_portal.yue
local matrix -- 1
local lights_enabled -- 2
local lights_range -- 3
local developer -- 4
local sprite -- 5
local mat_wave -- 7
local mat_spawn -- 8
local allow_sound -- 10
local default_sound -- 11
local extended_whitelist -- 12
CreateConVar("portals_allow_custom_colors", 1, { -- 14
	FCVAR_ARCHIVE, -- 14
	FCVAR_REPLICATED -- 14
}, "Whether players should be able to change portal colors.", 0, 1) -- 14
CreateConVar("portals_allow_custom_sounds", 1, { -- 15
	FCVAR_ARCHIVE, -- 15
	FCVAR_REPLICATED -- 15
}, "Whether players should be able to change portal sounds.", 0, 1) -- 15
CreateConVar("portals_default_sound", "beams/beamstart5.wav", { -- 16
	FCVAR_ARCHIVE, -- 16
	FCVAR_REPLICATED -- 16
}, "The default sound that is used for portal effects.") -- 16
CreateConVar("portals_extended_whitelist", 1, { -- 17
	FCVAR_ARCHIVE, -- 17
	FCVAR_REPLICATED -- 17
}, "Whether portals should teleport non-player, non-npc entities.") -- 17
if CLIENT then -- 19
	CreateClientConVar("portals_lights_enabled", 1, true, false, "Whether portals should emit light.", 0, 1) -- 20
	CreateClientConVar("portals_lights_range", 1024, true, false, "The range at which portals emit light.", 0) -- 21
	lights_enabled = GetConVar("portals_lights_enabled") -- 22
	lights_range = GetConVar("portals_lights_range") -- 23
	developer = GetConVar("developer") -- 24
	sprite = Material("sprites/light_glow02_add") -- 25
	mat_spawn = CreateMaterial("portal_spawn", "UnlitTwoTexture", { -- 27
		["$basetexture"] = "models/effects/vortshield_color", -- 27
		["$texture2"] = "models/effects/vortshield_base", -- 28
		["$model"] = 1, -- 29
		["$nocull"] = 1, -- 30
		["$additive"] = 1, -- 31
		Proxies = { -- 33
			TextureScroll = { -- 34
				texturescrollvar = "$texture2transform", -- 34
				texturescrollrate = -0.1, -- 35
				texturescrollangle = 0 -- 36
			} -- 33
		} -- 32
	}) -- 26
	mat_wave = CreateMaterial("portal/wave22", "UnlitTwoTexture", { -- 39
		["$basetexture"] = "models/player/player_chrome1", -- 39
		["$texture2"] = "models/effects/vortshield_base", -- 40
		["$model"] = 1, -- 41
		["$nocull"] = 1, -- 42
		["$additive"] = 1, -- 43
		Proxies = { -- 45
			TextureScroll = { -- 46
				texturescrollvar = "$texture2transform", -- 46
				texturescrollrate = .23, -- 47
				texturescrollangle = 23 -- 48
			} -- 45
		} -- 44
	}) -- 38
	matrix = Matrix() -- 50
	matrix:SetScale(Vector(2, 2, 2)) -- 51
elseif SERVER then -- 52
	resource.AddWorkshop("2841352626") -- 53
	allow_sound = GetConVar("portals_allow_custom_sounds") -- 54
	default_sound = GetConVar("portals_default_sound") -- 55
	extended_whitelist = GetConVar("portals_extended_whitelist") -- 56
end -- 19
local Portal -- 58
do -- 58
	local _class_0 -- 58
	local _parent_0 = ENTITY -- 58
	local _base_0 = { -- 58
		Base = "base_anim", -- 60
		Type = "anim", -- 62
		RenderGroup = RENDERGROUP_TRANSLUCENT, -- 64
		Model = Model("models/effects/intro_vortshield.mdl"), -- 66
		mins = Vector(-25, -25, -25), -- 67
		maxs = Vector(25, 25, 25), -- 69
		Initialize = function(self) -- 69
			self:SetModel(self.Model) -- 70
			self:DrawShadow(false) -- 71
			if SERVER then -- 72
				self:PhysicsInitBox(self.mins, self.maxs) -- 73
				self:SetMoveType(MOVETYPE_NONE) -- 74
				self:SetUseType(SIMPLE_USE) -- 75
				self:SetTrigger(true) -- 76
				self:SetNotSolid(true) -- 77
			end -- 72
			return self:SetCollisionGroup(COLLISION_GROUP_WORLD) -- 78
		end, -- 80
		GetCustomColor = function(self) -- 80
			return color_white -- 80
		end, -- 84
		ShouldDoLight = function(self) -- 84
			if not lights_enabled:GetBool() then -- 85
				return false -- 85
			end -- 85
			local range = lights_range:GetFloat() ^ 2 -- 86
			return (not self:IsDormant()) and EyePos():DistToSqr(self:GetPos()) < range -- 87
		end, -- 89
		Think = function(self) -- 89
			if CLIENT then -- 90
				local color = self:GetCustomColor() -- 91
				if self:GetColor() ~= color then -- 92
					self:SetColor(color) -- 92
				end -- 92
				if self:ShouldDoLight() then -- 93
					local light = DynamicLight(self:EntIndex()) -- 94
					if light then -- 95
						light.pos = self:GetPos() -- 97
						light.r = color.r -- 98
						light.g = color.g -- 99
						light.b = color.b -- 100
						light.brightness = 2 -- 101
						light.Decay = 1000 -- 102
						light.Size = 128 -- 103
						light.DieTime = CurTime() + 1 -- 104
					end -- 95
				end -- 93
				return self:RemoveAllDecals() -- 105
			end -- 90
		end, -- 107
		DrawTranslucent = function(self) -- 107
			if developer:GetBool() then -- 108
				local mins = self.mins - Vector(.1, .1, .1) -- 109
				local maxs = self.maxs + Vector(.1, .1, .1) -- 110
				local color = ColorAlpha(self:GetCustomColor(), 50) -- 111
				render.SetColorMaterial() -- 112
				local pos = self:GetPos() -- 113
				local ang = self:GetNetworkAngles() -- 114
				render.DrawBox(pos, ang, mins, maxs, color, true) -- 115
				render.DrawWireframeBox(pos, ang, mins, maxs, color, true) -- 116
				render.DrawLine(pos, pos + self:GetForward() * 50, self:GetCustomColor(), true) -- 117
			end -- 108
			render.OverrideBlend(true, BLEND_ZERO, BLEND_ONE_MINUS_SRC_COLOR, BLENDFUNC_ADD) -- 118
			render.SetMaterial(sprite) -- 119
			render.DrawSprite(self:GetPos(), 150, 150) -- 120
			render.OverrideBlend(false) -- 121
			local ang = (EyePos() - self:GetPos()):Angle() -- 122
			self:SetRenderAngles(ang) -- 123
			self:SetupBones() -- 124
			self:DrawModel() -- 125
			return self:DrawModel() -- 126
		end, -- 130
		TeleportEffect = function(self, ent) -- 130
			if ent == nil then -- 130
				ent = self -- 130
			end -- 130
			local snd = default_sound:GetString() -- 131
			if allow_sound:GetBool() and self.GetTeleportSound then -- 132
				snd = self:GetTeleportSound() -- 132
			end -- 132
			if snd == "" then -- 133
				return -- 133
			end -- 133
			return ent:EmitSound(snd, 75, 100, 0.5) -- 134
		end, -- 136
		IsValidEntity = function(self, ent) -- 136
			if ent:IsPlayer() then -- 137
				return ent:GetMoveType() ~= MOVETYPE_NOCLIP -- 137
			end -- 137
			if not extended_whitelist:GetBool() and not ent:IsNPC() then -- 138
				return false -- 138
			end -- 138
			local phys = ent:GetPhysicsObject() -- 139
			if IsValid(phys) and not phys:IsMotionEnabled() then -- 140
				return false -- 140
			end -- 140
			local cls = ent:GetClass() -- 141
			if cls:find("prop_dynamic") then -- 142
				return false -- 142
			end -- 142
			if cls:find("prop_door") then -- 143
				return false -- 143
			end -- 143
			if cls == "func_physbox" and ent:HasSpawnFlags(SF_PHYSBOX_MOTIONDISABLED) then -- 144
				return false -- 144
			end -- 144
			if cls:find("prop_") and (ent:HasSpawnFlags(SF_PHYSPROP_MOTIONDISABLED)) or ent:HasSpawnFlags(SF_PHYSPROP_PREVENT_PICKUP) then -- 145
				return false -- 145
			end -- 145
			if cls ~= "func_physbox" and cls:find("func_") then -- 146
				return false -- 146
			end -- 146
			return true -- 147
		end -- 58
	} -- 58
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 148
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 58
			_base_0[_key_0] = _val_0 -- 58
		end -- 58
	end -- 148
	if _base_0.__index == nil then -- 58
		_base_0.__index = _base_0 -- 58
	end -- 148
	setmetatable(_base_0, _parent_0.__base) -- 58
	_class_0 = setmetatable({ -- 58
		__init = function(self, ...) -- 58
			return _class_0.__parent.__init(self, ...) -- 58
		end, -- 58
		__base = _base_0, -- 58
		__name = "Portal", -- 58
		__parent = _parent_0 -- 58
	}, { -- 58
		__index = function(cls, name) -- 58
			local val = rawget(_base_0, name) -- 58
			if val == nil then -- 58
				local parent = rawget(cls, "__parent") -- 58
				if parent then -- 58
					return parent[name] -- 58
				end -- 58
			else -- 58
				return val -- 58
			end -- 58
		end, -- 58
		__call = function(cls, ...) -- 58
			local _self_0 = setmetatable({ }, _base_0) -- 58
			cls.__init(_self_0, ...) -- 58
			return _self_0 -- 58
		end -- 58
	}) -- 58
	_base_0.__class = _class_0 -- 58
	if _parent_0.__inherited then -- 58
		_parent_0.__inherited(_parent_0, _class_0) -- 58
	end -- 58
	Portal = _class_0 -- 58
end -- 148
local Spawn -- 149
do -- 149
	local _class_0 -- 149
	local _parent_0 = Portal -- 149
	local _base_0 = { -- 149
		RenderGroup = RENDERGROUP_TRANSLUCENT, -- 152
		PrintName = "Spawnpoint", -- 153
		Category = "EvilRP: Portals", -- 155
		Spawnable = true, -- 156
		AdminOnly = true, -- 158
		Interesting = true, -- 160
		mins = Vector(-40, -40, -50), -- 161
		maxs = Vector(40, 40, 40), -- 163
		SetupDataTables = function(self) -- 163
			return self:NetworkVar("Int", "Fate") -- 164
		end, -- 168
		OnRemove = function(self) -- 168
			if CLIENT then -- 169
				if self.Sound then -- 170
					return self.Sound:Stop() -- 170
				end -- 170
			end -- 169
		end, -- 172
		GetCustomColor = function(self) -- 172
			return Color(255, 80, 80) -- 172
		end, -- 174
		HUDRender = function(self) -- 174
			local ply = LocalPlayer() -- 175
			if not (ply:Team() == TEAM_GHOST) then -- 176
				return false -- 176
			end -- 176
			local fate = self:GetFate() -- 177
			local ct = { } -- 178
			ct[#ct + 1] = { -- 179
				text = RPExtraTeams[fate].name -- 179
			} -- 179
			ct[#ct + 1] = { -- 180
				text = RPExtraTeams[fate].description, -- 180
				font = "Spleen_Label_Small" -- 180
			} -- 180
			ct[#ct + 1] = { -- 181
				text = "Press F4 to choose this purpose in life.", -- 181
				font = "Spleen_Label_Small" -- 181
			} -- 181
			return ct -- 182
		end, -- 184
		Think = function(self) -- 184
			if not CLIENT then -- 185
				return -- 185
			end -- 185
			local ply = LocalPlayer() -- 186
			if ply:Team() ~= TEAM_GHOST then -- 187
				if self.Sound and self.Sound:IsPlaying() then -- 188
					self.Sound:Stop() -- 188
				end -- 188
				return -- 189
			end -- 187
			local light = DynamicLight(self:EntIndex()) -- 190
			local color = self:GetCustomColor() -- 191
			if self:GetColor() ~= color then -- 192
				self:SetColor(color) -- 192
			end -- 192
			if light then -- 193
				light.pos = self:GetPos() -- 195
				light.r = 255 -- 196
				light.g = 32 -- 197
				light.b = 32 -- 198
				light.brightness = 2 -- 199
				light.Decay = 1000 -- 200
				light.Size = 256 -- 201
				light.DieTime = CurTime() + 1 -- 202
			end -- 193
			if not self.Sound then -- 203
				self.Sound = CreateSound(self, "ambient/levels/citadel/citadel_drone_loop2.wav") -- 204
				self.Sound:ChangePitch(0.2) -- 205
				self.Sound:SetSoundLevel(75) -- 206
			end -- 203
			if not self.Sound:IsPlaying() then -- 207
				self.Sound:Play() -- 207
			end -- 207
			return self:EnableMatrix("RenderMultiply", matrix) -- 208
		end, -- 210
		GetPortalMat = function(self) -- 210
			return mat_spawn -- 210
		end, -- 212
		DrawTranslucent = function(self) -- 212
			local ang = (EyePos() - self:GetPos()):Angle() -- 213
			render.MaterialOverride(self:GetPortalMat()) -- 214
			self:SetRenderAngles(ang) -- 215
			self:SetupBones() -- 216
			if LocalPlayer():Team() == TEAM_GHOST then -- 217
				self:DrawModel() -- 217
			end -- 217
			return render.MaterialOverride() -- 218
		end, -- 222
		IsValidEntity = function(self, ent) -- 222
			if ent:IsPlayer() and ent:Team() == TEAM_GHOST then -- 222
				return true -- 222
			end -- 222
		end, -- 224
		Use = function(self, ply) -- 224
			if not self:IsValidEntity(ply) then -- 225
				return -- 225
			end -- 225
			ply:ForcePlayerDrop() -- 226
			if ply:IsPlayer() then -- 227
				return self:SpawnPlayer(ply) -- 228
			else -- 230
				return ply:Remove() -- 230
			end -- 227
		end, -- 232
		SpawnPlayer = function(self, ply) -- 232
			if not ply:IsPlayer() then -- 233
				return -- 233
			end -- 233
			local fate = self:GetFate() -- 234
			local cost = RPExtraTeams[fate].cost or 0 -- 235
			local cooldown = RPExtraTeams[fate].cooldown or 0 -- 236
			if cooldown > 0 and ply.cooldowns[fate] then -- 237
				if ply.cooldowns[fate] > CurTime() then -- 238
					ply:Notify("<c=200,0,0>TOO QUICK.") -- 239
					net.Start("evilrp_jumpscare") -- 240
					net.Send(ply) -- 241
					return -- 242
				end -- 238
			end -- 237
			if ply:GetStemCells() >= cost then -- 243
				self:TeleportEffect() -- 244
				ply:Notify("<c=200,0,0>DEATHS TODAY: " .. tostring(GAMEMODE:Deaths())) -- 245
				if cost > 0 then -- 246
					ply:AddStemCells(-cost) -- 246
				end -- 246
				ply:ScreenFade(SCREENFADE.IN, Color(255, 0, 0), 2.5, 0) -- 247
				ply:changeTeam(fate) -- 248
				local snd = table.Random(RPExtraTeams[fate].become_sounds) -- 249
				ply:EmitSound(snd) -- 250
				ply:EmitSound("npc/stalker/go_alert2.wav", 140, 40, 0.2) -- 251
				ply:Reflect() -- 252
				net.Start("evilrp_receive_stocks") -- 253
				net.WriteTable(GAMEMODE.Stocks) -- 254
				return net.Send(ply) -- 255
			else -- 257
				net.Start("evilrp_jumpscare") -- 257
				net.Send(ply) -- 258
				ply:Notify("<c=200,0,0>YOU HAVE " .. tostring(ply:GetStemCells()) .. " STEM CELLS.") -- 259
				return ply:Notify("<c=200,0,0>YOU NEED " .. tostring(cost) .. " STEM CELLS TO HAVE THIS PURPOSE IN LIFE.") -- 260
			end -- 243
		end -- 149
	} -- 149
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 260
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 149
			_base_0[_key_0] = _val_0 -- 149
		end -- 149
	end -- 260
	if _base_0.__index == nil then -- 149
		_base_0.__index = _base_0 -- 149
	end -- 260
	setmetatable(_base_0, _parent_0.__base) -- 149
	_class_0 = setmetatable({ -- 149
		__init = function(self, ...) -- 149
			return _class_0.__parent.__init(self, ...) -- 149
		end, -- 149
		__base = _base_0, -- 149
		__name = "Spawn", -- 149
		__parent = _parent_0 -- 149
	}, { -- 149
		__index = function(cls, name) -- 149
			local val = rawget(_base_0, name) -- 149
			if val == nil then -- 149
				local parent = rawget(cls, "__parent") -- 149
				if parent then -- 149
					return parent[name] -- 149
				end -- 149
			else -- 149
				return val -- 149
			end -- 149
		end, -- 149
		__call = function(cls, ...) -- 149
			local _self_0 = setmetatable({ }, _base_0) -- 149
			cls.__init(_self_0, ...) -- 149
			return _self_0 -- 149
		end -- 149
	}) -- 149
	_base_0.__class = _class_0 -- 149
	if _parent_0.__inherited then -- 149
		_parent_0.__inherited(_parent_0, _class_0) -- 149
	end -- 149
	Spawn = _class_0 -- 149
end -- 260
local WavePrepared -- 262
do -- 262
	local _class_0 -- 262
	local _parent_0 = SOUND -- 262
	local _base_0 = { -- 262
		sound = "npc/combine_gunship/ping_patrol.wav", -- 264
		pitch = { -- 264
			80, -- 264
			90 -- 264
		}, -- 265
		volume = 0.9 -- 262
	} -- 262
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 265
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 262
			_base_0[_key_0] = _val_0 -- 262
		end -- 262
	end -- 265
	if _base_0.__index == nil then -- 262
		_base_0.__index = _base_0 -- 262
	end -- 265
	setmetatable(_base_0, _parent_0.__base) -- 262
	_class_0 = setmetatable({ -- 262
		__init = function(self, ...) -- 262
			return _class_0.__parent.__init(self, ...) -- 262
		end, -- 262
		__base = _base_0, -- 262
		__name = "WavePrepared", -- 262
		__parent = _parent_0 -- 262
	}, { -- 262
		__index = function(cls, name) -- 262
			local val = rawget(_base_0, name) -- 262
			if val == nil then -- 262
				local parent = rawget(cls, "__parent") -- 262
				if parent then -- 262
					return parent[name] -- 262
				end -- 262
			else -- 262
				return val -- 262
			end -- 262
		end, -- 262
		__call = function(cls, ...) -- 262
			local _self_0 = setmetatable({ }, _base_0) -- 262
			cls.__init(_self_0, ...) -- 262
			return _self_0 -- 262
		end -- 262
	}) -- 262
	_base_0.__class = _class_0 -- 262
	if _parent_0.__inherited then -- 262
		_parent_0.__inherited(_parent_0, _class_0) -- 262
	end -- 262
	WavePrepared = _class_0 -- 262
end -- 265
local Wave -- 267
do -- 267
	local _class_0 -- 267
	local _parent_0 = Spawn -- 267
	local _base_0 = { -- 267
		PrintName = "Wavepoint", -- 270
		spawn_delay = 30, -- 272
		SetupDataTables = function(self) -- 272
			_class_0.__parent.__base.SetupDataTables(self) -- 273
			self:NetworkVar("Bool", "Active") -- 274
			return self:NetworkVar("Int", "SpawnTime") -- 275
		end, -- 277
		GetCustomColor = function(self) -- 277
			if self:GetActive() then -- 278
				return HSVToColor((CurTime() * 128) % 360, 1, 1) -- 279
			else -- 281
				return Color(0, 0, 255) -- 281
			end -- 278
		end, -- 283
		GetPortalMat = function(self) -- 283
			return mat_wave -- 283
		end, -- 285
		HUDRender = function(self) -- 285
			local ply = LocalPlayer() -- 286
			if not (ply:Team() == TEAM_GHOST) then -- 287
				return false -- 287
			end -- 287
			local fate = self:GetFate() -- 288
			local ct = { } -- 289
			ct[#ct + 1] = { -- 290
				text = RPExtraTeams[fate].name -- 290
			} -- 290
			ct[#ct + 1] = { -- 291
				text = RPExtraTeams[fate].description, -- 291
				font = "Spleen_Label_Small" -- 291
			} -- 291
			ct[#ct + 1] = { -- 292
				text = " " -- 292
			} -- 292
			if self:GetActive() then -- 293
				ct[#ct + 1] = { -- 294
					text = "A wave is gathering in T-" .. tostring(string.NiceTime(self:GetSpawnTime() - CurTime())) .. ".", -- 294
					font = "Spleen_Label_Small" -- 294
				} -- 294
				if ply:GetPos():DistToSqr(self:GetPos()) < 256 ^ 2 then -- 295
					ct[#ct + 1] = { -- 296
						text = "Stay close to participate.", -- 296
						font = "Spleen_Label_Small" -- 296
					} -- 296
				else -- 298
					ct[#ct + 1] = { -- 298
						text = "Come closer.", -- 298
						font = "Spleen_Label_Small" -- 298
					} -- 298
				end -- 295
			else -- 300
				ct[#ct + 1] = { -- 300
					text = "A wave is not gathering.", -- 300
					font = "Spleen_Label_Small" -- 300
				} -- 300
				ct[#ct + 1] = { -- 301
					text = "You can change that, if you're ready.", -- 301
					font = "Spleen_Label_Small" -- 301
				} -- 301
			end -- 293
			return ct -- 302
		end, -- 304
		Use = function(self, ply) -- 304
			if not self:IsValidEntity(ply) then -- 305
				return -- 305
			end -- 305
			ply:ForcePlayerDrop() -- 306
			if self:GetActive() then -- 307
				return -- 307
			end -- 307
			self:EmitSound("WavePrepared") -- 308
			self:SetActive(true) -- 309
			return self:SetSpawnTime(CurTime() + self.spawn_delay) -- 310
		end, -- 312
		GetNearbyGhosts = function(self) -- 312
			local ghosts = { } -- 313
			local _list_0 = player.GetAll() -- 314
			for _index_0 = 1, #_list_0 do -- 314
				local ply = _list_0[_index_0] -- 314
				if (ply:Team() == TEAM_GHOST and ply:GetPos():DistToSqr(self:GetPos()) <= 256 ^ 2) then -- 314
					ghosts[#ghosts + 1] = ply -- 314
				end -- 314
			end -- 314
			return ghosts -- 315
		end, -- 317
		SpawnWave = function(self) -- 317
			local ghosts = self:GetNearbyGhosts() -- 318
			if not (#ghosts > 0) then -- 319
				return self:Reset() -- 321
			end -- 319
			for _index_0 = 1, #ghosts do -- 322
				local g = ghosts[_index_0] -- 322
				self:SpawnPlayer(g) -- 322
			end -- 322
			return self:Remove() -- 323
		end, -- 325
		Reset = function(self) -- 325
			self:SetActive(false) -- 326
			return self:SetSpawnTime(0) -- 327
		end, -- 329
		Think = function(self) -- 329
			_class_0.__parent.__base.Think(self) -- 330
			if not SERVER then -- 331
				return -- 331
			end -- 331
			if self:GetActive() then -- 332
				local ct = CurTime() -- 333
				if not self.next_ghost_check then -- 334
					self.next_ghost_check = ct -- 334
				end -- 334
				if ct >= self.next_ghost_check then -- 335
					self.next_ghost_check = ct + 3 -- 336
					local nearby = self:GetNearbyGhosts() -- 337
					if not (#nearby > 0) then -- 338
						return self:SetActive(false) -- 339
					end -- 338
				end -- 335
				if ct >= self:GetSpawnTime() then -- 340
					return self:SpawnWave() -- 341
				end -- 340
			end -- 332
		end -- 267
	} -- 267
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 341
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 267
			_base_0[_key_0] = _val_0 -- 267
		end -- 267
	end -- 341
	if _base_0.__index == nil then -- 267
		_base_0.__index = _base_0 -- 267
	end -- 341
	setmetatable(_base_0, _parent_0.__base) -- 267
	_class_0 = setmetatable({ -- 267
		__init = function(self, ...) -- 267
			return _class_0.__parent.__init(self, ...) -- 267
		end, -- 267
		__base = _base_0, -- 267
		__name = "Wave", -- 267
		__parent = _parent_0 -- 267
	}, { -- 267
		__index = function(cls, name) -- 267
			local val = rawget(_base_0, name) -- 267
			if val == nil then -- 267
				local parent = rawget(cls, "__parent") -- 267
				if parent then -- 267
					return parent[name] -- 267
				end -- 267
			else -- 267
				return val -- 267
			end -- 267
		end, -- 267
		__call = function(cls, ...) -- 267
			local _self_0 = setmetatable({ }, _base_0) -- 267
			cls.__init(_self_0, ...) -- 267
			return _self_0 -- 267
		end -- 267
	}) -- 267
	_base_0.__class = _class_0 -- 267
	if _parent_0.__inherited then -- 267
		_parent_0.__inherited(_parent_0, _class_0) -- 267
	end -- 267
	Wave = _class_0 -- 267
	return _class_0 -- 341
end -- 341
