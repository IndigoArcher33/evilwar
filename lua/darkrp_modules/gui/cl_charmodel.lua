-- [yue]: /home/corpse/gmodserver/garrysmod/addons/darkrpmodification/lua/darkrp_modules/gui/cl_charmodel.yue
local PANEL = { } -- 1
AccessorFunc(PANEL, "AllowManipulation", "AllowManipulation") -- 3
AccessorFunc(PANEL, "CamPosRange", "CamPosRange") -- 5
AccessorFunc(PANEL, "LookAtRange", "LookAtRange") -- 6
AccessorFunc(PANEL, "FOVRange", "FOVRange") -- 7
AccessorFunc(PANEL, "BaseYaw", "BaseYaw") -- 9
AccessorFunc(PANEL, "Player", "Player") -- 10
for k, v in pairs({ -- 13
	Init = function(self) -- 13
		self:SetCamPosRange({ -- 14
			Vector(100, 0, 50), -- 14
			Vector(50, 0, 64) -- 14
		}) -- 14
		self:SetLookAtRange({ -- 15
			Vector(0, 0, 36), -- 15
			Vector(0, 0, 64) -- 15
		}) -- 15
		self:SetFOVRange({ -- 16
			45, -- 16
			25 -- 16
		}) -- 16
		self:SetBaseYaw(0) -- 17
		self.MouseYaw = 0 -- 18
		self.YawAdd = 0 -- 19
		self.Zoom = 0.6 -- 20
	end, -- 13
	SetPlayer = function(self, ply) -- 25
		self.Player = ply -- 27
		self:SetModel(ply:GetModel()) -- 28
		for i = 0, 9 do -- 29
			self.Entity:SetBodygroup(i, self.Player:GetBodygroup(i)) -- 30
		end -- 30
		self.Entity:SetSkin(self.Player:GetSkin()) -- 31
		self.Entity.GetPlayerColor = function() -- 32
			return self.Player:GetPlayerColor() -- 32
		end -- 32
	end, -- 25
	SetEntity = function(self, ent) -- 33
		DModelPanel.SetEntity(self, ent) -- 34
		ent.PanelLayoutDone = false -- 35
	end, -- 33
	SetModel = function(self, mdl) -- 36
		local cycle = 0 -- 37
		if IsValid(self.Entity) then -- 38
			cycle = self.Entity:GetCycle() -- 39
			if self.Entity:GetModel() == mdl then -- 41
				return -- 41
			end -- 41
		end -- 38
		DModelPanel.SetModel(self, mdl) -- 42
		return self.Entity:SetCycle(cycle) -- 43
	end, -- 36
	GetCameraTarget = function(self) -- 55
		local pos = LerpVector(self.Zoom, unpack(self.CamPosRange)) -- 56
		local look = LerpVector(self.Zoom, unpack(self.LookAtRange)) -- 57
		local fov = Lerp(self.Zoom, unpack(self.FOVRange)) -- 58
		local ratio = self:GetWide() / self:GetTall() -- 59
		return self.Entity:GetPos() + pos, self.Entity:GetPos() + look, fov * ratio -- 60
	end, -- 55
	LayoutEntity = function(self, ent) -- 61
		local pos, look, fov = self:GetCameraTarget() -- 62
		if not ent.PanelLayoutDone then -- 63
			ent.PanelLayoutDone = true -- 64
			self:SetCamPos(pos) -- 65
			self:SetLookAt(look) -- 66
			self:SetFOV(fov) -- 67
			ent:SetAngles(Angle(0, self:GetBaseYaw(), 0)) -- 68
		end -- 63
		self:SetCamPos(self:GetCamPos():Approach(pos, 10)) -- 69
		self:SetLookAt(self:GetLookAt():Approach(look, 10)) -- 70
		self:SetFOV(math.ApproachSpeed(self:GetFOV(), fov, 10)) -- 71
		local ang = Angle(0, self:GetBaseYaw(), 0) -- 72
		if self.Dragging then -- 73
			self.MouseYaw = self.MouseYaw + self:GetMouseDrag() -- 74
		end -- 73
		self.YawAdd = math.ApproachSpeed(self.YawAdd, self.MouseYaw, 30) -- 75
		ang:Sub(Angle(0, self.YawAdd, 0)) -- 76
		local att = ent:GetAttachment(ent:LookupAttachment("eyes")) -- 77
		local height = att.Pos.z or 64 -- 78
		local dir = att.Ang:Forward() or ent:GetForward() -- 79
		ent:SetAngles(ang) -- 80
		return ent:SetEyeTarget(Vector(0, 0, height) + dir * 50) -- 81
	end, -- 61
	OnMouseWheeled = function(self, delta) -- 82
		if delta > 0 then -- 83
			self.Zoom = math.Approach(self.Zoom, 1, .2) -- 84
		else -- 86
			self.Zoom = math.Approach(self.Zoom, 0, .2) -- 86
		end -- 83
	end, -- 82
	GetMouseDrag = function(self) -- 87
		if not self.Dragging then -- 88
			return 0 -- 88
		end -- 88
		local offset = gui.MouseX() - self.DragStart -- 89
		local diff = self.LastDrag - offset -- 90
		self.LastDrag = offset -- 91
		return diff -- 92
	end, -- 87
	OnMousePressed = function(self, mouse) -- 93
		if self.AllowManipulation then -- 94
			if mouse == MOUSE_LEFT then -- 95
				self:MouseCapture(true) -- 96
				self.Dragging = true -- 97
				self.DragStart = gui.MouseX() -- 98
				self.LastDrag = 0 -- 99
			else -- 101
				self.YawAdd = math.NormalizeAngle(self.YawAdd) -- 101
				self.MouseYaw = 0 -- 102
			end -- 95
		end -- 94
	end, -- 93
	OnMouseReleased = function(self) -- 103
		self:MouseCapture(false) -- 104
		self.Dragging = false -- 105
	end -- 103
}) do -- 106
	PANEL[k] = v -- 12
end -- 12
return derma.DefineControl("EvilRP_CharacterModel", "", PANEL, "DModelPanel") -- 108
