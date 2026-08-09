-- [yue]: darkrp_modules\computers\sh_entity.yue
GT_COL_NIL = 0 -- 3
GT_COL_MSG = 1 -- 4
GT_COL_WRN = 2 -- 5
GT_COL_ERR = 3 -- 6
GT_COL_INFO = 4 -- 7
GT_COL_INTL = 5 -- 8
GT_COL_CMD = 6 -- 9
GT_COL_SUCC = 7 -- 10
local r = math.random(0, 255) -- 12
local g = math.random(0, 255) -- 13
local b = math.random(0, 255) -- 14
local font = "Spleen_TTY" -- 16
local random_chars = { -- 19
	"*", -- 19
	"%", -- 20
	"#", -- 21
	"!", -- 22
	"&", -- 23
	"a", -- 24
	"b", -- 25
	"c", -- 26
	"d", -- 27
	"e", -- 28
	"f", -- 29
	"g", -- 30
	"h", -- 31
	"i", -- 32
	"j", -- 33
	"k", -- 34
	"l", -- 35
	"m", -- 36
	"n", -- 37
	"o", -- 38
	"p", -- 39
	"q", -- 40
	"r", -- 41
	"s", -- 42
	"t", -- 43
	"u", -- 44
	"v", -- 45
	"w", -- 46
	"x", -- 47
	"y", -- 48
	"z" -- 49
} -- 18
local TerminalBoot -- 52
do -- 52
	local _class_0 -- 52
	local _parent_0 = SOUND -- 52
	local _base_0 = { -- 52
		sound = "placenta/crimevision/boot.ogg", -- 54
		pitch = { -- 54
			110, -- 54
			125 -- 54
		} -- 52
	} -- 52
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 54
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 52
			_base_0[_key_0] = _val_0 -- 52
		end -- 52
	end -- 54
	if _base_0.__index == nil then -- 52
		_base_0.__index = _base_0 -- 52
	end -- 54
	setmetatable(_base_0, _parent_0.__base) -- 52
	_class_0 = setmetatable({ -- 52
		__init = function(self, ...) -- 52
			return _class_0.__parent.__init(self, ...) -- 52
		end, -- 52
		__base = _base_0, -- 52
		__name = "TerminalBoot", -- 52
		__parent = _parent_0 -- 52
	}, { -- 52
		__index = function(cls, name) -- 52
			local val = rawget(_base_0, name) -- 52
			if val == nil then -- 52
				local parent = rawget(cls, "__parent") -- 52
				if parent then -- 52
					return parent[name] -- 52
				end -- 52
			else -- 52
				return val -- 52
			end -- 52
		end, -- 52
		__call = function(cls, ...) -- 52
			local _self_0 = setmetatable({ }, _base_0) -- 52
			cls.__init(_self_0, ...) -- 52
			return _self_0 -- 52
		end -- 52
	}) -- 52
	_base_0.__class = _class_0 -- 52
	if _parent_0.__inherited then -- 52
		_parent_0.__inherited(_parent_0, _class_0) -- 52
	end -- 52
	TerminalBoot = _class_0 -- 52
end -- 54
local broken = Material("glass/reflectiveglass001") -- 56
local Terminal -- 58
do -- 58
	local _class_0 -- 58
	local _parent_0 = ENTITY -- 58
	local _base_0 = { -- 58
		Type = "anim", -- 60
		Base = "base_anim", -- 62
		PrintName = "Terminal", -- 63
		Author = "Chessnut, Sotla", -- 64
		Purpose = "Evil machine.", -- 66
		Spawnable = true, -- 67
		Category = "EvilRP: Devices", -- 69
		Pocketable = false, -- 71
		OnRemove = function(self) end, -- 73
		SetupDataTables = function(self) -- 73
			self:NetworkVar("Bool", "Active") -- 74
			self:NetworkVar("Bool", "WarmingUp") -- 75
			self:NetworkVar("Bool", "Broken") -- 76
			self:NetworkVar("Entity", "User") -- 77
			return self:NetworkVar("Int", "SoundLoop") -- 78
		end, -- 80
		SetOS = function(self, name) -- 80
			self.os = name -- 81
		end, -- 83
		GetOS = function(self) -- 83
			return self.os or "basic" -- 83
		end, -- 85
		WarmUp = function(self) -- 85
			self:EmitSound("TerminalBoot") -- 86
			self.warm_up_text = gterm.OS:Call(self, "GetWarmUpText") -- 87
			if self.warm_up_text then -- 88
				local time = math.random(1, 3) -- 89
				self:SetWarmingUp(true) -- 90
				for i = 1, #self.warm_up_text do -- 91
					timer.Simple(i * (#self.warm_up_text / time), function() -- 92
						if IsValid(self) then -- 93
							gterm:Broadcast(self, self.warm_up_text[i], GT_COL_INT) -- 94
							if i == #self.warm_up_text then -- 95
								return timer.Simple(math.Rand(1, 3), function() -- 96
									if IsValid(self) then -- 97
										gterm:Broadcast(self, "") -- 98
										gterm:Broadcast(self, "TTY READY.") -- 99
										gterm:Broadcast(self, "TYPE :help TO LIST COMMANDS") -- 100
										gterm.OS:Call(self, "Initialized") -- 101
										self:SetActive(true) -- 102
										return self:SetWarmingUp(false) -- 103
									end -- 97
								end) -- 103
							end -- 95
						end -- 93
					end) -- 92
				end -- 103
			else -- 105
				gterm:Broadcast(self, "TTY READY.") -- 105
				gterm:Broadcast(self, "TYPE :help TO LIST COMMANDS") -- 106
				gterm.OS:Call(self, "Initialized") -- 107
				self:SetActive(true) -- 108
				return self:SetWarmingUp(false) -- 109
			end -- 88
		end, -- 111
		SpawnFunction = function(self, ply, trace) -- 111
			if not trace.Hit then -- 112
				return false -- 112
			end -- 112
			local ent = ents.Create(self.ClassName) -- 113
			ent:Initialize() -- 115
			ent:SetPos(trace.HitPos + Vector(0, 0, 32)) -- 116
			ent:Spawn() -- 117
			ent:Activate() -- 118
			return ent -- 119
		end, -- 121
		Initialize = function(self) -- 121
			if SERVER then -- 122
				self:SetModel(self.Model) -- 123
				self:SetMoveType(MOVETYPE_VPHYSICS) -- 124
				self:PhysicsInit(SOLID_VPHYSICS) -- 125
				self:SetSolid(SOLID_VPHYSICS) -- 126
				self:SetUseType(SIMPLE_USE) -- 127
				self:DrawShadow(false) -- 128
				self:SetActive(false) -- 129
				self:SetOS("basic") -- 130
				self:PhysWake() -- 131
				local phys_obj = self:GetPhysicsObject() -- 132
				if IsValid(phys_obj) then -- 133
					return phys_obj:EnableMotion(true) -- 133
				end -- 133
			end -- 122
		end, -- 135
		Model = "models/props_lab/monitor01a.mdl", -- 137
		scrW = 905, -- 138
		scrH = 768, -- 139
		max_chars = 65, -- 140
		max_lines = 24, -- 141
		line_height = 28.7, -- 142
		trapping = false, -- 143
		console_text = "", -- 144
		next_blink = 0, -- 145
		screensaver = Material("models/props_lab/warp_sheet"), -- 146
		noise = Material("models/props_lab/projector_noise"), -- 148
		GetScreenPos = function(self) -- 148
			local ang = self:GetAngles() -- 149
			local offset = (ang:Up() * 11.8) + (ang:Forward() * 11.7) + (ang:Right() * 9.7) -- 150
			return self:GetPos() + offset -- 151
		end, -- 153
		GetScreenAngles = function(self) -- 153
			local ang = self:GetAngles() -- 154
			ang:RotateAroundAxis(ang:Forward(), 180) -- 156
			ang:RotateAroundAxis(ang:Right(), 265.5) -- 157
			ang:RotateAroundAxis(ang:Up(), 270) -- 158
			return ang -- 159
		end, -- 161
		Draw = function(self) -- 161
			self:DrawModel() -- 162
			local dist_sqr = self:GetPos():DistToSqr(lp:GetPos()) -- 163
			if not (dist_sqr < 128 ^ 2) then -- 164
				return -- 164
			end -- 164
			if self:GetWarmingUp() or self:GetActive() and not self:GetBroken() then -- 165
				cam.Start3D2D(self:GetScreenPos(), self:GetScreenAngles(), 0.0215) -- 166
				render.PushFilterMin(TEXFILTER.ANISOTROPIC) -- 167
				render.PushFilterMag(TEXFILTER.ANISOTROPIC) -- 168
				local rgb = HSVToColor((CurTime() * 38) % 360, 1, 1) -- 169
				local flick = self.flicker or 0 -- 170
				if self.flicker then -- 171
					self.flicker = Lerp(FrameTime() * 3, self.flicker, 0) -- 172
				end -- 171
				if lp:HasOddity(ODDITY_ILLITERACY) then -- 173
					flick = 1 -- 173
				end -- 173
				rgb.r = math.max(16, rgb.r * flick) -- 174
				rgb.g = math.max(16, rgb.g * flick) -- 175
				rgb.b = math.max(16, rgb.b * flick) -- 176
				surface.SetDrawColor(rgb.r, rgb.g, rgb.b, 255) -- 177
				surface.DrawRect(0, 0, self.scrW, self.scrH) -- 178
				local desp = lp:GetDespair() * 0.01 -- 179
				local lines = gterm[self:EntIndex()] or { } -- 180
				for i = 1, self.max_lines do -- 181
					if lines[i] then -- 182
						local color = gterm:ColorFromIndex(lines[i].color) -- 183
						local text = lines[i].text or "" -- 184
						if lp:HasOddity(ODDITY_ILLITERACY) then -- 185
							text = "" -- 186
							color = gterm:ColorFromIndex(GT_COL_MSG) -- 187
						end -- 185
						r = color.r -- 189
						g = color.g -- 190
						b = color.b -- 191
						if not MUTATORS[MUTATOR_CHROMOPHOBIA].active then -- 192
							text = "<c=" .. tostring(r) .. "," .. tostring(g) .. "," .. tostring(b) .. ">" .. tostring(text) -- 192
						end -- 192
						local txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(20 * desp) .. "," .. tostring(20 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(7 * desp) .. "," .. tostring(3.66 * desp) .. ",2>" .. tostring(text), nil) -- 193
						txt_obj:Draw(1, (self.line_height * i) - self.line_height, 1, TEXT_ALIGN_LEFT) -- 194
					end -- 182
				end -- 194
				local y = (self.max_lines + 1) * self.line_height -- 195
				surface.SetDrawColor(255, 255, 255, 15) -- 196
				surface.DrawRect(1, y, self.scrW - 1, self.line_height) -- 197
				local user = self:GetUser() -- 198
				if IsValid(user) then -- 199
					if user ~= LocalPlayer() then -- 200
						self.console_text = tostring(user:Name()) .. " is typing..." -- 201
					end -- 200
				else -- 203
					self.console_text = "" -- 203
				end -- 199
				local txt -- 205
				if not MUTATORS[MUTATOR_CHROMOPHOBIA].active then -- 205
					txt = "<rgb=1,1,30>" .. tostring(self.console_text) -- 205
				end -- 205
				local txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2>$ " .. tostring(txt), nil) -- 206
				txt_obj:Draw(1, y, 1, TEXT_ALIGN_LEFT) -- 207
				if self:GetWarmingUp() then -- 208
					if not self.flash_time then -- 209
						self.flash_time = CurTime() + 1 -- 209
					end -- 209
					local fraction = math.Clamp((self.flash_time - CurTime()) / 0.25, 0, 1) -- 210
					surface.SetDrawColor(255, 0, 0, 255) -- 211
					surface.DrawRect(0, 0, self.scrW / 3, self.scrH * fraction) -- 212
					surface.SetDrawColor(0, 255, 0, 255) -- 213
					surface.DrawRect(self.scrW / 3, 0, self.scrW / 3, self.scrH * fraction) -- 214
					surface.SetDrawColor(0, 0, 255, 255) -- 215
					surface.DrawRect((self.scrW * 2) / 3, 0, self.scrW / 3, self.scrH * fraction) -- 216
					local rainbow = HSVToColor((CurTime() * 666) % 360, 1, 1) -- 217
					surface.SetDrawColor(rainbow.r, rainbow.g, rainbow.b, 255 * fraction) -- 218
					surface.DrawRect(0, 0, self.scrW, self.scrH) -- 219
					if fraction < 1 and fraction > 0.75 then -- 220
						surface.SetDrawColor(math.random(100, 255), math.random(100, 255), math.random(100, 255), 255) -- 221
						surface.DrawRect(0, 0, self.scrW, self.scrH) -- 222
					elseif fraction < 0.5 then -- 223
						if self.next_blink < CurTime() then -- 224
							r = math.random(0, 255) -- 225
							g = math.random(0, 255) -- 226
							b = math.random(0, 255) -- 227
							self.next_blink = CurTime() + 0.25 -- 228
						end -- 224
						draw.SimpleText("RES: " .. tostring(self.scrW) .. "x" .. tostring(self.scrH), font, self.scrW - 2, 2, Color(255, 255, 255, 255), 2, 0) -- 229
					end -- 220
				elseif self.flash_time then -- 230
					self.flash_time = nil -- 231
				end -- 208
				render.PopFilterMin() -- 232
				render.PopFilterMag() -- 233
				cam.End3D2D() -- 234
			elseif self:GetBroken() then -- 235
				cam.Start3D2D(self:GetScreenPos(), self:GetScreenAngles(), 0.0215) -- 236
				render.PushFilterMin(TEXFILTER.ANISOTROPIC) -- 237
				render.PushFilterMag(TEXFILTER.ANISOTROPIC) -- 238
				surface.SetDrawColor(255, 255, 255, 255) -- 239
				surface.SetMaterial(broken) -- 240
				surface.DrawTexturedRect(0, 0, self.scrW, self.scrH) -- 241
				render.PopFilterMin() -- 242
				render.PopFilterMag() -- 243
				cam.End3D2D() -- 244
			else -- 246
				cam.Start3D2D(self:GetScreenPos(), self:GetScreenAngles(), 0.0215) -- 246
				surface.SetDrawColor(255, 255, 255, 255) -- 247
				surface.SetMaterial(self.screensaver) -- 248
				surface.DrawTexturedRect(0, 0, self.scrW, self.scrH) -- 249
				cam.End3D2D() -- 250
			end -- 165
			cam.Start3D2D(self:GetScreenPos(), self:GetScreenAngles(), 0.0215) -- 251
			render.OverrideAlphaWriteEnable(true, true) -- 252
			render.OverrideDepthEnable(true, false) -- 253
			render.OverrideBlend(true, BLEND_SRC_ALPHA, BLEND_DST_COLOR, BLENDFUNC_ADD) -- 254
			local rgb = HSVToColor((CurTime() * 38) % 360, 1, 1) -- 255
			surface.SetDrawColor(rgb.r, rgb.g, rgb.b, 255) -- 256
			if istable(self.noise) then -- 257
				local _list_0 = self.noise -- 258
				for _index_0 = 1, #_list_0 do -- 258
					local n = _list_0[_index_0] -- 258
					local _continue_0 = false -- 259
					repeat -- 259
						if not (type(n) == "IMaterial") then -- 259
							_continue_0 = true -- 259
							break -- 259
						end -- 259
						surface.SetMaterial(n) -- 260
						surface.DrawTexturedRect(0, 0, self.scrW, self.scrH) -- 261
						_continue_0 = true -- 259
					until true -- 261
					if not _continue_0 then -- 261
						break -- 261
					end -- 261
				end -- 261
			else -- 263
				surface.SetMaterial(self.noise) -- 263
				surface.DrawTexturedRect(0, 0, self.scrW, self.scrH) -- 264
			end -- 257
			render.OverrideBlend(false) -- 265
			render.OverrideDepthEnable(false) -- 266
			render.OverrideAlphaWriteEnable(false) -- 267
			return cam.End3D2D() -- 268
		end, -- 270
		OnRemove = function(self) -- 270
			if SERVER then -- 271
				local _list_0 = player.GetAll() -- 272
				for _index_0 = 1, #_list_0 do -- 272
					local ply = _list_0[_index_0] -- 272
					ply["pass_authed_" .. tostring(self:EntIndex())] = nil -- 272
				end -- 272
				gterm.OS:Call(self, "ShutDown", self) -- 273
			end -- 271
			if CLIENT then -- 274
				if CLIENT then -- 275
					gterm[self:EntIndex()] = nil -- 275
				end -- 275
			end -- 274
		end, -- 277
		Use = function(self, activator, caller) -- 277
			if self.locked then -- 278
				return -- 278
			end -- 278
			if self:GetActive() then -- 279
				if not IsValid(self:GetUser()) then -- 280
					self:SetUser(activator) -- 281
					net.Start("evilrp_terminal_activeconsole") -- 282
					net.WriteUInt(self:EntIndex(), 16) -- 283
					net.Send(activator) -- 284
					return gterm.OS:Call(self, "UserInit", activator) -- 285
				end -- 280
			elseif not self:GetWarmingUp() then -- 286
				return self:WarmUp() -- 287
			end -- 279
		end, -- 289
		Think = function(self) -- 289
			if not SERVER then -- 290
				return -- 290
			end -- 290
			local user = self:GetUser() -- 291
			if IsValid(user) then -- 292
				local dist = user:GetPos():Distance(self:GetPos()) -- 293
				if (not self:GetActive() and not self:GetWarmingUp()) or dist > 96 then -- 294
					net.Start("evilrp_terminal_endtyping") -- 295
					net.Send(user) -- 296
					self:SetUser(nil) -- 297
				end -- 294
			end -- 292
			return gterm.OS:Call(self, "Think") -- 298
		end, -- 300
		Interactions = { -- 301
			{ -- 301
				desc = "Huh?", -- 301
				func = (function() -- 301
					return lp:SendChat("GENERIC", "This is a command-based computer.<f=Spleen_Chat_Small>\nUSE to begin typing. Most systems have a <c=0,200,0>:help</c> command.\nThe ENTER key sends a written command.\nPressing ENTER with no text input will free you from this terrible thing.\nDespair makes it much harder to read the screen, and illiteracy makes it impossible.") -- 306
				end) -- 301
			} -- 301
		} -- 58
	} -- 58
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 306
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 58
			_base_0[_key_0] = _val_0 -- 58
		end -- 58
	end -- 306
	if _base_0.__index == nil then -- 58
		_base_0.__index = _base_0 -- 58
	end -- 306
	setmetatable(_base_0, _parent_0.__base) -- 58
	_class_0 = setmetatable({ -- 58
		__init = function(self, ...) -- 58
			return _class_0.__parent.__init(self, ...) -- 58
		end, -- 58
		__base = _base_0, -- 58
		__name = "Terminal", -- 58
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
	Terminal = _class_0 -- 58
end -- 306
local Public -- 309
do -- 309
	local _class_0 -- 309
	local _parent_0 = Terminal -- 309
	local _base_0 = { -- 309
		Model = Model("models/props_wasteland/controlroom_monitor001b.mdl"), -- 312
		Initialize = function(self) -- 312
			_class_0.__parent.__base.Initialize(self) -- 313
			self.os = "public" -- 314
		end, -- 316
		GetScreenPos = function(self) -- 316
			local ang = self:GetAngles() -- 317
			local offset = (ang:Up() * 1) + (ang:Forward() * 16.2) + (ang:Right() * 10) -- 318
			return self:GetPos() + offset -- 319
		end, -- 321
		GetScreenAngles = function(self) -- 321
			local ang = self:GetAngles() -- 322
			ang:RotateAroundAxis(ang:Forward(), 180) -- 324
			ang:RotateAroundAxis(ang:Right(), 282) -- 325
			ang:RotateAroundAxis(ang:Up(), 270) -- 326
			return ang -- 327
		end, -- 329
		scrW = 960, -- 330
		scrH = 820, -- 331
		max_chars = 74, -- 332
		max_lines = 26, -- 333
		screensaver = Material("halflife/lab1_cmpm3000"), -- 334
		noise = Material("effects/tvscreen_noise003a") -- 309
	} -- 309
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 334
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 309
			_base_0[_key_0] = _val_0 -- 309
		end -- 309
	end -- 334
	if _base_0.__index == nil then -- 309
		_base_0.__index = _base_0 -- 309
	end -- 334
	setmetatable(_base_0, _parent_0.__base) -- 309
	_class_0 = setmetatable({ -- 309
		__init = function(self, ...) -- 309
			return _class_0.__parent.__init(self, ...) -- 309
		end, -- 309
		__base = _base_0, -- 309
		__name = "Public", -- 309
		__parent = _parent_0 -- 309
	}, { -- 309
		__index = function(cls, name) -- 309
			local val = rawget(_base_0, name) -- 309
			if val == nil then -- 309
				local parent = rawget(cls, "__parent") -- 309
				if parent then -- 309
					return parent[name] -- 309
				end -- 309
			else -- 309
				return val -- 309
			end -- 309
		end, -- 309
		__call = function(cls, ...) -- 309
			local _self_0 = setmetatable({ }, _base_0) -- 309
			cls.__init(_self_0, ...) -- 309
			return _self_0 -- 309
		end -- 309
	}) -- 309
	_base_0.__class = _class_0 -- 309
	if _parent_0.__inherited then -- 309
		_parent_0.__inherited(_parent_0, _class_0) -- 309
	end -- 309
	Public = _class_0 -- 309
end -- 334
local Xombokom -- 335
do -- 335
	local _class_0 -- 335
	local _parent_0 = Terminal -- 335
	local _base_0 = { -- 335
		Model = Model("models/props_lab/labmonitor002a.mdl"), -- 337
		GetScreenPos = function(self) -- 337
			local ang = self:GetAngles() -- 338
			local offset = (ang:Up() * 5) + (ang:Forward() * 13) + (ang:Right() * 7.4) -- 339
			return self:GetPos() + offset -- 340
		end, -- 341
		GetScreenAngles = function(self) -- 341
			local ang = self:GetAngles() -- 342
			ang:RotateAroundAxis(ang:Forward(), 180) -- 344
			ang:RotateAroundAxis(ang:Right(), 270) -- 345
			ang:RotateAroundAxis(ang:Up(), 270) -- 346
			return ang -- 347
		end, -- 348
		Initialize = function(self) -- 348
			_class_0.__parent.__base.Initialize(self) -- 349
			self.os = "tyrant" -- 350
		end, -- 352
		scrW = 680, -- 353
		scrH = 600, -- 354
		max_lines = 18, -- 355
		max_chars = 50, -- 356
		screensaver = Material("models/props_lab/warp_sheet"), -- 357
		noise = Material("models/spawn_effect2") -- 335
	} -- 335
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 357
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 335
			_base_0[_key_0] = _val_0 -- 335
		end -- 335
	end -- 357
	if _base_0.__index == nil then -- 335
		_base_0.__index = _base_0 -- 335
	end -- 357
	setmetatable(_base_0, _parent_0.__base) -- 335
	_class_0 = setmetatable({ -- 335
		__init = function(self, ...) -- 335
			return _class_0.__parent.__init(self, ...) -- 335
		end, -- 335
		__base = _base_0, -- 335
		__name = "Xombokom", -- 335
		__parent = _parent_0 -- 335
	}, { -- 335
		__index = function(cls, name) -- 335
			local val = rawget(_base_0, name) -- 335
			if val == nil then -- 335
				local parent = rawget(cls, "__parent") -- 335
				if parent then -- 335
					return parent[name] -- 335
				end -- 335
			else -- 335
				return val -- 335
			end -- 335
		end, -- 335
		__call = function(cls, ...) -- 335
			local _self_0 = setmetatable({ }, _base_0) -- 335
			cls.__init(_self_0, ...) -- 335
			return _self_0 -- 335
		end -- 335
	}) -- 335
	_base_0.__class = _class_0 -- 335
	if _parent_0.__inherited then -- 335
		_parent_0.__inherited(_parent_0, _class_0) -- 335
	end -- 335
	Xombokom = _class_0 -- 335
end -- 357
local Polemarch -- 358
do -- 358
	local _class_0 -- 358
	local _parent_0 = Terminal -- 358
	local _base_0 = { -- 358
		Model = Model("models/props_lab/labmonitor002a.mdl"), -- 360
		GetScreenPos = function(self) -- 360
			local ang = self:GetAngles() -- 361
			local offset = (ang:Up() * 5) + (ang:Forward() * 13) + (ang:Right() * 7.4) -- 362
			return self:GetPos() + offset -- 363
		end, -- 364
		GetScreenAngles = function(self) -- 364
			local ang = self:GetAngles() -- 365
			ang:RotateAroundAxis(ang:Forward(), 180) -- 367
			ang:RotateAroundAxis(ang:Right(), 270) -- 368
			ang:RotateAroundAxis(ang:Up(), 270) -- 369
			return ang -- 370
		end, -- 371
		Initialize = function(self) -- 371
			_class_0.__parent.__base.Initialize(self) -- 372
			self.os = "polemarch" -- 373
		end, -- 375
		scrW = 680, -- 376
		scrH = 600, -- 377
		max_lines = 18, -- 378
		max_chars = 50, -- 379
		screensaver = Material("halflife/lab1_cmpm3000"), -- 380
		noise = Material("models/spawn_effect2") -- 358
	} -- 358
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 380
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 358
			_base_0[_key_0] = _val_0 -- 358
		end -- 358
	end -- 380
	if _base_0.__index == nil then -- 358
		_base_0.__index = _base_0 -- 358
	end -- 380
	setmetatable(_base_0, _parent_0.__base) -- 358
	_class_0 = setmetatable({ -- 358
		__init = function(self, ...) -- 358
			return _class_0.__parent.__init(self, ...) -- 358
		end, -- 358
		__base = _base_0, -- 358
		__name = "Polemarch", -- 358
		__parent = _parent_0 -- 358
	}, { -- 358
		__index = function(cls, name) -- 358
			local val = rawget(_base_0, name) -- 358
			if val == nil then -- 358
				local parent = rawget(cls, "__parent") -- 358
				if parent then -- 358
					return parent[name] -- 358
				end -- 358
			else -- 358
				return val -- 358
			end -- 358
		end, -- 358
		__call = function(cls, ...) -- 358
			local _self_0 = setmetatable({ }, _base_0) -- 358
			cls.__init(_self_0, ...) -- 358
			return _self_0 -- 358
		end -- 358
	}) -- 358
	_base_0.__class = _class_0 -- 358
	if _parent_0.__inherited then -- 358
		_parent_0.__inherited(_parent_0, _class_0) -- 358
	end -- 358
	Polemarch = _class_0 -- 358
	return _class_0 -- 380
end -- 380
