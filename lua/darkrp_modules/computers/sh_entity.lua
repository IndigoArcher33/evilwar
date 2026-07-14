GT_COL_NIL = 0
GT_COL_MSG = 1
GT_COL_WRN = 2
GT_COL_ERR = 3
GT_COL_INFO = 4
GT_COL_INTL = 5
GT_COL_CMD = 6
GT_COL_SUCC = 7
local r = math.random(0, 255)
local g = math.random(0, 255)
local b = math.random(0, 255)
local font = "Spleen_TTY"
local random_chars = {
	"*",
	"%",
	"#",
	"!",
	"&",
	"a",
	"b",
	"c",
	"d",
	"e",
	"f",
	"g",
	"h",
	"i",
	"j",
	"k",
	"l",
	"m",
	"n",
	"o",
	"p",
	"q",
	"r",
	"s",
	"t",
	"u",
	"v",
	"w",
	"x",
	"y",
	"z"
}
local TerminalBoot
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = "placenta/crimevision/boot.ogg",
		pitch = {
			110,
			125
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
		__name = "TerminalBoot",
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
	TerminalBoot = _class_0
end
local broken = Material("glass/reflectiveglass001")
local Terminal
do
	local _class_0
	local _parent_0 = ENTITY
	local _base_0 = {
		Type = "anim",
		Base = "base_anim",
		PrintName = "Terminal",
		Author = "Chessnut, Sotla",
		Purpose = "Evil machine.",
		Spawnable = true,
		Category = "EvilRP: Devices",
		Pocketable = false,
		OnRemove = function(self) end,
		SetupDataTables = function(self)
			self:NetworkVar("Bool", "Active")
			self:NetworkVar("Bool", "WarmingUp")
			self:NetworkVar("Bool", "Broken")
			self:NetworkVar("Entity", "User")
			return self:NetworkVar("Int", "SoundLoop")
		end,
		SetOS = function(self, name)
			self.os = name
		end,
		GetOS = function(self)
			return self.os or "basic"
		end,
		WarmUp = function(self)
			self:EmitSound("TerminalBoot")
			self.warm_up_text = gterm.OS:Call(self, "GetWarmUpText")
			if self.warm_up_text then
				local time = math.random(1, 3)
				self:SetWarmingUp(true)
				for i = 1, #self.warm_up_text do
					timer.Simple(i * (#self.warm_up_text / time), function()
						if IsValid(self) then
							gterm:Broadcast(self, self.warm_up_text[i], GT_COL_INT)
							if i == #self.warm_up_text then
								return timer.Simple(math.Rand(1, 3), function()
									if IsValid(self) then
										gterm:Broadcast(self, "")
										gterm:Broadcast(self, "TTY READY.")
										gterm:Broadcast(self, "TYPE :help TO LIST COMMANDS")
										gterm.OS:Call(self, "Initialized")
										self:SetActive(true)
										return self:SetWarmingUp(false)
									end
								end)
							end
						end
					end)
				end
			else
				gterm:Broadcast(self, "TTY READY.")
				gterm:Broadcast(self, "TYPE :help TO LIST COMMANDS")
				gterm.OS:Call(self, "Initialized")
				self:SetActive(true)
				return self:SetWarmingUp(false)
			end
		end,
		SpawnFunction = function(self, ply, trace)
			if not trace.Hit then
				return false
			end
			local ent = ents.Create(self.ClassName)
			ent:Initialize()
			ent:SetPos(trace.HitPos + Vector(0, 0, 32))
			ent:Spawn()
			ent:Activate()
			return ent
		end,
		Initialize = function(self)
			if SERVER then
				self:SetModel(self.Model)
				self:SetMoveType(MOVETYPE_VPHYSICS)
				self:PhysicsInit(SOLID_VPHYSICS)
				self:SetSolid(SOLID_VPHYSICS)
				self:SetUseType(SIMPLE_USE)
				self:DrawShadow(false)
				self:SetActive(false)
				self:SetOS("basic")
				self:PhysWake()
				local phys_obj = self:GetPhysicsObject()
				if IsValid(phys_obj) then
					return phys_obj:EnableMotion(true)
				end
			end
		end,
		Model = "models/props_lab/monitor01a.mdl",
		scrW = 905,
		scrH = 768,
		max_chars = 65,
		max_lines = 24,
		line_height = 28.7,
		trapping = false,
		console_text = "",
		next_blink = 0,
		screensaver = Material("models/props_lab/warp_sheet"),
		noise = Material("models/props_lab/projector_noise"),
		GetScreenPos = function(self)
			local ang = self:GetAngles()
			local offset = (ang:Up() * 11.8) + (ang:Forward() * 11.7) + (ang:Right() * 9.7)
			return self:GetPos() + offset
		end,
		GetScreenAngles = function(self)
			local ang = self:GetAngles()
			ang:RotateAroundAxis(ang:Forward(), 180)
			ang:RotateAroundAxis(ang:Right(), 265.5)
			ang:RotateAroundAxis(ang:Up(), 270)
			return ang
		end,
		Draw = function(self)
			self:DrawModel()
			local dist_sqr = self:GetPos():DistToSqr(lp:GetPos())
			if not (dist_sqr < 128 ^ 2) then
				return
			end
			if self:GetWarmingUp() or self:GetActive() and not self:GetBroken() then
				cam.Start3D2D(self:GetScreenPos(), self:GetScreenAngles(), 0.0215)
				render.PushFilterMin(TEXFILTER.ANISOTROPIC)
				render.PushFilterMag(TEXFILTER.ANISOTROPIC)
				local rgb = HSVToColor((CurTime() * 38) % 360, 1, 1)
				local flick = self.flicker or 0
				if self.flicker then
					self.flicker = Lerp(FrameTime() * 3, self.flicker, 0)
				end
				if lp:HasOddity(ODDITY_ILLITERACY) then
					flick = 1
				end
				rgb.r = math.max(16, rgb.r * flick)
				rgb.g = math.max(16, rgb.g * flick)
				rgb.b = math.max(16, rgb.b * flick)
				surface.SetDrawColor(rgb.r, rgb.g, rgb.b, 255)
				surface.DrawRect(0, 0, self.scrW, self.scrH)
				local desp = lp:GetDespair() * 0.01
				local lines = gterm[self:EntIndex()] or { }
				for i = 1, self.max_lines do
					if lines[i] then
						local color = gterm:ColorFromIndex(lines[i].color)
						local text = lines[i].text or ""
						if lp:HasOddity(ODDITY_ILLITERACY) then
							text = ""
							color = gterm:ColorFromIndex(GT_COL_MSG)
						end
						r = color.r
						g = color.g
						b = color.b
						if not MUTATORS[MUTATOR_CHROMOPHOBIA].active then
							text = "<c=" .. tostring(r) .. "," .. tostring(g) .. "," .. tostring(b) .. ">" .. tostring(text)
						end
						local txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(20 * desp) .. "," .. tostring(20 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(7 * desp) .. "," .. tostring(3.66 * desp) .. ",2>" .. tostring(text), nil)
						txt_obj:Draw(1, (self.line_height * i) - self.line_height, 1, TEXT_ALIGN_LEFT)
					end
				end
				local y = (self.max_lines + 1) * self.line_height
				surface.SetDrawColor(255, 255, 255, 15)
				surface.DrawRect(1, y, self.scrW - 1, self.line_height)
				local user = self:GetUser()
				if IsValid(user) then
					if user ~= LocalPlayer() then
						self.console_text = tostring(user:Name()) .. " is typing..."
					end
				else
					self.console_text = ""
				end
				local txt
				if not MUTATORS[MUTATOR_CHROMOPHOBIA].active then
					txt = "<rgb=1,1,30>" .. tostring(self.console_text)
				end
				local txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2>$ " .. tostring(txt), nil)
				txt_obj:Draw(1, y, 1, TEXT_ALIGN_LEFT)
				if self:GetWarmingUp() then
					if not self.flash_time then
						self.flash_time = CurTime() + 1
					end
					local fraction = math.Clamp((self.flash_time - CurTime()) / 0.25, 0, 1)
					surface.SetDrawColor(255, 0, 0, 255)
					surface.DrawRect(0, 0, self.scrW / 3, self.scrH * fraction)
					surface.SetDrawColor(0, 255, 0, 255)
					surface.DrawRect(self.scrW / 3, 0, self.scrW / 3, self.scrH * fraction)
					surface.SetDrawColor(0, 0, 255, 255)
					surface.DrawRect((self.scrW * 2) / 3, 0, self.scrW / 3, self.scrH * fraction)
					local rainbow = HSVToColor((CurTime() * 666) % 360, 1, 1)
					surface.SetDrawColor(rainbow.r, rainbow.g, rainbow.b, 255 * fraction)
					surface.DrawRect(0, 0, self.scrW, self.scrH)
					if fraction < 1 and fraction > 0.75 then
						surface.SetDrawColor(math.random(100, 255), math.random(100, 255), math.random(100, 255), 255)
						surface.DrawRect(0, 0, self.scrW, self.scrH)
					elseif fraction < 0.5 then
						if self.next_blink < CurTime() then
							r = math.random(0, 255)
							g = math.random(0, 255)
							b = math.random(0, 255)
							self.next_blink = CurTime() + 0.25
						end
						draw.SimpleText("RES: " .. tostring(self.scrW) .. "x" .. tostring(self.scrH), font, self.scrW - 2, 2, Color(255, 255, 255, 255), 2, 0)
					end
				elseif self.flash_time then
					self.flash_time = nil
				end
				render.PopFilterMin()
				render.PopFilterMag()
				cam.End3D2D()
			elseif self:GetBroken() then
				cam.Start3D2D(self:GetScreenPos(), self:GetScreenAngles(), 0.0215)
				render.PushFilterMin(TEXFILTER.ANISOTROPIC)
				render.PushFilterMag(TEXFILTER.ANISOTROPIC)
				surface.SetDrawColor(255, 255, 255, 255)
				surface.SetMaterial(broken)
				surface.DrawTexturedRect(0, 0, self.scrW, self.scrH)
				render.PopFilterMin()
				render.PopFilterMag()
				cam.End3D2D()
			else
				cam.Start3D2D(self:GetScreenPos(), self:GetScreenAngles(), 0.0215)
				surface.SetDrawColor(255, 255, 255, 255)
				surface.SetMaterial(self.screensaver)
				surface.DrawTexturedRect(0, 0, self.scrW, self.scrH)
				cam.End3D2D()
			end
			cam.Start3D2D(self:GetScreenPos(), self:GetScreenAngles(), 0.0215)
			render.OverrideAlphaWriteEnable(true, true)
			render.OverrideDepthEnable(true, false)
			render.OverrideBlend(true, BLEND_SRC_ALPHA, BLEND_DST_COLOR, BLENDFUNC_ADD)
			local rgb = HSVToColor((CurTime() * 38) % 360, 1, 1)
			surface.SetDrawColor(rgb.r, rgb.g, rgb.b, 255)
			if istable(self.noise) then
				local _list_0 = self.noise
				for _index_0 = 1, #_list_0 do
					local n = _list_0[_index_0]
					if not (type(n) == "IMaterial") then
						goto _continue_0
					end
					surface.SetMaterial(n)
					surface.DrawTexturedRect(0, 0, self.scrW, self.scrH)
					::_continue_0::
				end
			else
				surface.SetMaterial(self.noise)
				surface.DrawTexturedRect(0, 0, self.scrW, self.scrH)
			end
			render.OverrideBlend(false)
			render.OverrideDepthEnable(false)
			render.OverrideAlphaWriteEnable(false)
			return cam.End3D2D()
		end,
		OnRemove = function(self)
			if SERVER then
				local _list_0 = player.GetAll()
				for _index_0 = 1, #_list_0 do
					local ply = _list_0[_index_0]
					ply["pass_authed_" .. tostring(self:EntIndex())] = nil
				end
				gterm.OS:Call(self, "ShutDown", self)
			end
			if CLIENT then
				if CLIENT then
					gterm[self:EntIndex()] = nil
				end
			end
		end,
		Use = function(self, activator, caller)
			if self.locked then
				return
			end
			if self:GetActive() then
				if not IsValid(self:GetUser()) then
					self:SetUser(activator)
					net.Start("evilrp_terminal_activeconsole")
					net.WriteUInt(self:EntIndex(), 16)
					net.Send(activator)
					return gterm.OS:Call(self, "UserInit", activator)
				end
			elseif not self:GetWarmingUp() then
				return self:WarmUp()
			end
		end,
		Think = function(self)
			if not SERVER then
				return
			end
			local user = self:GetUser()
			if IsValid(user) then
				local dist = user:GetPos():Distance(self:GetPos())
				if (not self:GetActive() and not self:GetWarmingUp()) or dist > 96 then
					net.Start("evilrp_terminal_endtyping")
					net.Send(user)
					self:SetUser(nil)
				end
			end
			return gterm.OS:Call(self, "Think")
		end,
		Interactions = {
			{
				desc = "Huh?",
				func = (function()
					return lp:SendChat("GENERIC", "This is a command-based computer.<f=Spleen_Chat_Small>\nUSE to begin typing. Most systems have a <c=0,200,0>:help</c> command.\nThe ENTER key sends a written command.\nPressing ENTER with no text input will free you from this terrible thing.\nDespair makes it much harder to read the screen, and illiteracy makes it impossible.")
				end)
			}
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
		__name = "Terminal",
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
	Terminal = _class_0
end
local Public
do
	local _class_0
	local _parent_0 = Terminal
	local _base_0 = {
		Model = Model("models/props_wasteland/controlroom_monitor001b.mdl"),
		Initialize = function(self)
			_class_0.__parent.__base.Initialize(self)
			self.os = "public"
		end,
		GetScreenPos = function(self)
			local ang = self:GetAngles()
			local offset = (ang:Up() * 1) + (ang:Forward() * 16.2) + (ang:Right() * 10)
			return self:GetPos() + offset
		end,
		GetScreenAngles = function(self)
			local ang = self:GetAngles()
			ang:RotateAroundAxis(ang:Forward(), 180)
			ang:RotateAroundAxis(ang:Right(), 282)
			ang:RotateAroundAxis(ang:Up(), 270)
			return ang
		end,
		scrW = 960,
		scrH = 820,
		max_chars = 74,
		max_lines = 26,
		screensaver = Material("halflife/lab1_cmpm3000"),
		noise = Material("effects/tvscreen_noise003a")
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
		__name = "Public",
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
	Public = _class_0
end
local Xombokom
do
	local _class_0
	local _parent_0 = Terminal
	local _base_0 = {
		Model = Model("models/props_lab/labmonitor002a.mdl"),
		GetScreenPos = function(self)
			local ang = self:GetAngles()
			local offset = (ang:Up() * 5) + (ang:Forward() * 13) + (ang:Right() * 7.4)
			return self:GetPos() + offset
		end,
		GetScreenAngles = function(self)
			local ang = self:GetAngles()
			ang:RotateAroundAxis(ang:Forward(), 180)
			ang:RotateAroundAxis(ang:Right(), 270)
			ang:RotateAroundAxis(ang:Up(), 270)
			return ang
		end,
		Initialize = function(self)
			_class_0.__parent.__base.Initialize(self)
			self.os = "tyrant"
		end,
		scrW = 680,
		scrH = 600,
		max_lines = 18,
		max_chars = 50,
		screensaver = Material("models/props_lab/warp_sheet"),
		noise = Material("models/spawn_effect2")
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
		__name = "Xombokom",
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
	Xombokom = _class_0
	return _class_0
end
