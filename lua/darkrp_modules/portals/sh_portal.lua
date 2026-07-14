local matrix
local lights_enabled
local lights_range
local developer
local sprite
local mat_wave
local mat_spawn
local allow_sound
local default_sound
local extended_whitelist
CreateConVar("portals_allow_custom_colors", 1, {
	FCVAR_ARCHIVE,
	FCVAR_REPLICATED
}, "Whether players should be able to change portal colors.", 0, 1)
CreateConVar("portals_allow_custom_sounds", 1, {
	FCVAR_ARCHIVE,
	FCVAR_REPLICATED
}, "Whether players should be able to change portal sounds.", 0, 1)
CreateConVar("portals_default_sound", "beams/beamstart5.wav", {
	FCVAR_ARCHIVE,
	FCVAR_REPLICATED
}, "The default sound that is used for portal effects.")
CreateConVar("portals_extended_whitelist", 1, {
	FCVAR_ARCHIVE,
	FCVAR_REPLICATED
}, "Whether portals should teleport non-player, non-npc entities.")
if CLIENT then
	CreateClientConVar("portals_lights_enabled", 1, true, false, "Whether portals should emit light.", 0, 1)
	CreateClientConVar("portals_lights_range", 1024, true, false, "The range at which portals emit light.", 0)
	lights_enabled = GetConVar("portals_lights_enabled")
	lights_range = GetConVar("portals_lights_range")
	developer = GetConVar("developer")
	sprite = Material("sprites/light_glow02_add")
	mat_spawn = CreateMaterial("portal_spawn", "UnlitTwoTexture", {
		["$basetexture"] = "models/effects/vortshield_color",
		["$texture2"] = "models/effects/vortshield_base",
		["$model"] = 1,
		["$nocull"] = 1,
		["$additive"] = 1,
		Proxies = {
			TextureScroll = {
				texturescrollvar = "$texture2transform",
				texturescrollrate = -0.1,
				texturescrollangle = 0
			}
		}
	})
	mat_wave = CreateMaterial("portal/wave22", "UnlitTwoTexture", {
		["$basetexture"] = "models/player/player_chrome1",
		["$texture2"] = "models/effects/vortshield_base",
		["$model"] = 1,
		["$nocull"] = 1,
		["$additive"] = 1,
		Proxies = {
			TextureScroll = {
				texturescrollvar = "$texture2transform",
				texturescrollrate = .23,
				texturescrollangle = 23
			}
		}
	})
	matrix = Matrix()
	matrix:SetScale(Vector(2, 2, 2))
elseif SERVER then
	resource.AddWorkshop("2841352626")
	allow_sound = GetConVar("portals_allow_custom_sounds")
	default_sound = GetConVar("portals_default_sound")
	extended_whitelist = GetConVar("portals_extended_whitelist")
end
local Portal
do
	local _class_0
	local _parent_0 = ENTITY
	local _base_0 = {
		Base = "base_anim",
		Type = "anim",
		RenderGroup = RENDERGROUP_TRANSLUCENT,
		Model = Model("models/effects/intro_vortshield.mdl"),
		mins = Vector(-25, -25, -25),
		maxs = Vector(25, 25, 25),
		Initialize = function(self)
			self:SetModel(self.Model)
			self:DrawShadow(false)
			if SERVER then
				self:PhysicsInitBox(self.mins, self.maxs)
				self:SetMoveType(MOVETYPE_NONE)
				self:SetUseType(SIMPLE_USE)
				self:SetTrigger(true)
				self:SetNotSolid(true)
			end
			return self:SetCollisionGroup(COLLISION_GROUP_WORLD)
		end,
		GetCustomColor = function(self)
			return color_white
		end,
		ShouldDoLight = function(self)
			if not lights_enabled:GetBool() then
				return false
			end
			local range = lights_range:GetFloat() ^ 2
			return (not self:IsDormant()) and EyePos():DistToSqr(self:GetPos()) < range
		end,
		Think = function(self)
			if CLIENT then
				local color = self:GetCustomColor()
				if self:GetColor() ~= color then
					self:SetColor(color)
				end
				if self:ShouldDoLight() then
					local light = DynamicLight(self:EntIndex())
					if light then
						light.pos = self:GetPos()
						light.r = color.r
						light.g = color.g
						light.b = color.b
						light.brightness = 2
						light.Decay = 1000
						light.Size = 128
						light.DieTime = CurTime() + 1
					end
				end
				return self:RemoveAllDecals()
			end
		end,
		DrawTranslucent = function(self)
			if developer:GetBool() then
				local mins = self.mins - Vector(.1, .1, .1)
				local maxs = self.maxs + Vector(.1, .1, .1)
				local color = ColorAlpha(self:GetCustomColor(), 50)
				render.SetColorMaterial()
				local pos = self:GetPos()
				local ang = self:GetNetworkAngles()
				render.DrawBox(pos, ang, mins, maxs, color, true)
				render.DrawWireframeBox(pos, ang, mins, maxs, color, true)
				render.DrawLine(pos, pos + self:GetForward() * 50, self:GetCustomColor(), true)
			end
			render.OverrideBlend(true, BLEND_ZERO, BLEND_ONE_MINUS_SRC_COLOR, BLENDFUNC_ADD)
			render.SetMaterial(sprite)
			render.DrawSprite(self:GetPos(), 150, 150)
			render.OverrideBlend(false)
			local ang = (EyePos() - self:GetPos()):Angle()
			self:SetRenderAngles(ang)
			self:SetupBones()
			self:DrawModel()
			return self:DrawModel()
		end,
		TeleportEffect = function(self, ent)
			if ent == nil then
				ent = self
			end
			local snd = default_sound:GetString()
			if allow_sound:GetBool() and self.GetTeleportSound then
				snd = self:GetTeleportSound()
			end
			if snd == "" then
				return
			end
			return ent:EmitSound(snd, 75, 100, 0.5)
		end,
		IsValidEntity = function(self, ent)
			if ent:IsPlayer() then
				return ent:GetMoveType() ~= MOVETYPE_NOCLIP
			end
			if not extended_whitelist:GetBool() and not ent:IsNPC() then
				return false
			end
			local phys = ent:GetPhysicsObject()
			if IsValid(phys) and not phys:IsMotionEnabled() then
				return false
			end
			local cls = ent:GetClass()
			if cls:find("prop_dynamic") then
				return false
			end
			if cls:find("prop_door") then
				return false
			end
			if cls == "func_physbox" and ent:HasSpawnFlags(SF_PHYSBOX_MOTIONDISABLED) then
				return false
			end
			if cls:find("prop_") and (ent:HasSpawnFlags(SF_PHYSPROP_MOTIONDISABLED)) or ent:HasSpawnFlags(SF_PHYSPROP_PREVENT_PICKUP) then
				return false
			end
			if cls ~= "func_physbox" and cls:find("func_") then
				return false
			end
			return true
		end
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
		__name = "Portal",
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
	Portal = _class_0
end
local Spawn
do
	local _class_0
	local _parent_0 = Portal
	local _base_0 = {
		RenderGroup = RENDERGROUP_TRANSLUCENT,
		PrintName = "Spawnpoint",
		Category = "EvilRP: Portals",
		Spawnable = true,
		AdminOnly = true,
		Interesting = true,
		mins = Vector(-40, -40, -50),
		maxs = Vector(40, 40, 40),
		SetupDataTables = function(self)
			return self:NetworkVar("Int", "Fate")
		end,
		OnRemove = function(self)
			if CLIENT then
				if self.Sound then
					return self.Sound:Stop()
				end
			end
		end,
		GetCustomColor = function(self)
			return Color(255, 80, 80)
		end,
		HUDRender = function(self)
			local ply = LocalPlayer()
			if not (ply:Team() == TEAM_GHOST) then
				return false
			end
			local fate = self:GetFate()
			local ct = { }
			ct[#ct + 1] = {
				text = RPExtraTeams[fate].name
			}
			ct[#ct + 1] = {
				text = RPExtraTeams[fate].description,
				font = "Spleen_Label_Small"
			}
			ct[#ct + 1] = {
				text = "Press F4 to choose this purpose in life.",
				font = "Spleen_Label_Small"
			}
			return ct
		end,
		Think = function(self)
			if not CLIENT then
				return
			end
			local ply = LocalPlayer()
			if ply:Team() ~= TEAM_GHOST then
				if self.Sound and self.Sound:IsPlaying() then
					self.Sound:Stop()
				end
				return
			end
			local light = DynamicLight(self:EntIndex())
			local color = self:GetCustomColor()
			if self:GetColor() ~= color then
				self:SetColor(color)
			end
			if light then
				light.pos = self:GetPos()
				light.r = 255
				light.g = 32
				light.b = 32
				light.brightness = 2
				light.Decay = 1000
				light.Size = 256
				light.DieTime = CurTime() + 1
			end
			if not self.Sound then
				self.Sound = CreateSound(self, "ambient/levels/citadel/citadel_drone_loop2.wav")
				self.Sound:ChangePitch(0.2)
				self.Sound:SetSoundLevel(75)
			end
			if not self.Sound:IsPlaying() then
				self.Sound:Play()
			end
			return self:EnableMatrix("RenderMultiply", matrix)
		end,
		GetPortalMat = function(self)
			return mat_spawn
		end,
		DrawTranslucent = function(self)
			local ang = (EyePos() - self:GetPos()):Angle()
			render.MaterialOverride(self:GetPortalMat())
			self:SetRenderAngles(ang)
			self:SetupBones()
			if LocalPlayer():Team() == TEAM_GHOST then
				self:DrawModel()
			end
			return render.MaterialOverride()
		end,
		IsValidEntity = function(self, ent)
			if ent:IsPlayer() and ent:Team() == TEAM_GHOST then
				return true
			end
		end,
		Use = function(self, ply)
			if not self:IsValidEntity(ply) then
				return
			end
			ply:ForcePlayerDrop()
			if ply:IsPlayer() then
				self:SpawnPlayer(ply)
			else
				ply:Remove()
			end
			self:TeleportEffect()
			return ply:Notify("<c=200,0,0>DEATHS TODAY: " .. tostring(GAMEMODE:Deaths()))
		end,
		SpawnPlayer = function(self, ply)
			if not ply:IsPlayer() then
				return
			end
			ply:ScreenFade(SCREENFADE.IN, Color(255, 0, 0), 2.5, 0)
			ply:changeTeam(self:GetFate())
			local snd = table.Random(RPExtraTeams[self:GetFate()].become_sounds)
			ply:EmitSound(snd)
			ply:EmitSound("npc/stalker/go_alert2.wav", 140, 40, 0.2)
			net.Start("evilrp_receive_stocks")
			net.WriteTable(GAMEMODE.Stocks)
			return net.Send(ply)
		end
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
		__name = "Spawn",
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
	Spawn = _class_0
end
local WavePrepared
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = "npc/combine_gunship/ping_patrol.wav",
		pitch = {
			80,
			90
		},
		volume = 0.9
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
		__name = "WavePrepared",
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
	WavePrepared = _class_0
end
local Wave
do
	local _class_0
	local _parent_0 = Spawn
	local _base_0 = {
		PrintName = "Wavepoint",
		spawn_delay = 30,
		SetupDataTables = function(self)
			_class_0.__parent.__base.SetupDataTables(self)
			self:NetworkVar("Bool", "Active")
			return self:NetworkVar("Int", "SpawnTime")
		end,
		GetCustomColor = function(self)
			if self:GetActive() then
				return HSVToColor((CurTime() * 128) % 360, 1, 1)
			else
				return Color(0, 0, 255)
			end
		end,
		GetPortalMat = function(self)
			return mat_wave
		end,
		HUDRender = function(self)
			local ply = LocalPlayer()
			if not (ply:Team() == TEAM_GHOST) then
				return false
			end
			local fate = self:GetFate()
			local ct = { }
			ct[#ct + 1] = {
				text = RPExtraTeams[fate].name
			}
			ct[#ct + 1] = {
				text = RPExtraTeams[fate].description,
				font = "Spleen_Label_Small"
			}
			ct[#ct + 1] = {
				text = " "
			}
			if self:GetActive() then
				ct[#ct + 1] = {
					text = "A wave is gathering in T-" .. tostring(string.NiceTime(self:GetSpawnTime() - CurTime())) .. ".",
					font = "Spleen_Label_Small"
				}
				if ply:GetPos():DistToSqr(self:GetPos()) < 256 ^ 2 then
					ct[#ct + 1] = {
						text = "Stay close to participate.",
						font = "Spleen_Label_Small"
					}
				else
					ct[#ct + 1] = {
						text = "Come closer.",
						font = "Spleen_Label_Small"
					}
				end
			else
				ct[#ct + 1] = {
					text = "A wave is not gathering.",
					font = "Spleen_Label_Small"
				}
				ct[#ct + 1] = {
					text = "You can change that, if you're ready.",
					font = "Spleen_Label_Small"
				}
			end
			return ct
		end,
		Use = function(self, ply)
			if not self:IsValidEntity(ply) then
				return
			end
			ply:ForcePlayerDrop()
			if self:GetActive() then
				return
			end
			self:EmitSound("WavePrepared")
			self:SetActive(true)
			return self:SetSpawnTime(CurTime() + self.spawn_delay)
		end,
		GetNearbyGhosts = function(self)
			local ghosts = { }
			local _list_0 = player.GetAll()
			for _index_0 = 1, #_list_0 do
				local ply = _list_0[_index_0]
				if (ply:Team() == TEAM_GHOST and ply:GetPos():DistToSqr(self:GetPos()) <= 256 ^ 2) then
					ghosts[#ghosts + 1] = ply
				end
			end
			return ghosts
		end,
		SpawnWave = function(self)
			local ghosts = self:GetNearbyGhosts()
			if not (#ghosts > 0) then
				return self:Reset()
			end
			for _index_0 = 1, #ghosts do
				local g = ghosts[_index_0]
				self:SpawnPlayer(g)
			end
			return self:Remove()
		end,
		Reset = function(self)
			self:SetActive(false)
			return self:SetSpawnTime(0)
		end,
		Think = function(self)
			_class_0.__parent.__base.Think(self)
			if not SERVER then
				return
			end
			if self:GetActive() then
				local ct = CurTime()
				if not self.next_ghost_check then
					self.next_ghost_check = ct
				end
				if ct >= self.next_ghost_check then
					self.next_ghost_check = ct + 3
					local nearby = self:GetNearbyGhosts()
					if not (#nearby > 0) then
						return self:SetActive(false)
					end
				end
				if ct >= self:GetSpawnTime() then
					return self:SpawnWave()
				end
			end
		end
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
		__name = "Wave",
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
	Wave = _class_0
	return _class_0
end
