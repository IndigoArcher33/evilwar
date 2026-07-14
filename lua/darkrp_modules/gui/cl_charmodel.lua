local PANEL = { }
AccessorFunc(PANEL, "AllowManipulation", "AllowManipulation")
AccessorFunc(PANEL, "CamPosRange", "CamPosRange")
AccessorFunc(PANEL, "LookAtRange", "LookAtRange")
AccessorFunc(PANEL, "FOVRange", "FOVRange")
AccessorFunc(PANEL, "BaseYaw", "BaseYaw")
AccessorFunc(PANEL, "Player", "Player")
for k, v in pairs({
	Init = function(self)
		self:SetCamPosRange({
			Vector(100, 0, 50),
			Vector(50, 0, 64)
		})
		self:SetLookAtRange({
			Vector(0, 0, 36),
			Vector(0, 0, 64)
		})
		self:SetFOVRange({
			45,
			25
		})
		self:SetBaseYaw(0)
		self.MouseYaw = 0
		self.YawAdd = 0
		self.Zoom = 0.6
	end,
	SetPlayer = function(self, ply)
		self.Player = ply
		self:SetModel(ply:GetModel())
		for i = 0, 9 do
			self.Entity:SetBodygroup(i, self.Player:GetBodygroup(i))
		end
		self.Entity:SetSkin(self.Player:GetSkin())
		self.Entity.GetPlayerColor = function()
			return self.Player:GetPlayerColor()
		end
	end,
	SetEntity = function(self, ent)
		DModelPanel.SetEntity(self, ent)
		ent.PanelLayoutDone = false
	end,
	SetModel = function(self, mdl)
		local cycle = 0
		if IsValid(self.Entity) then
			cycle = self.Entity:GetCycle()
			if self.Entity:GetModel() == mdl then
				return
			end
		end
		DModelPanel.SetModel(self, mdl)
		return self.Entity:SetCycle(cycle)
	end,
	GetCameraTarget = function(self)
		local pos = LerpVector(self.Zoom, unpack(self.CamPosRange))
		local look = LerpVector(self.Zoom, unpack(self.LookAtRange))
		local fov = Lerp(self.Zoom, unpack(self.FOVRange))
		local ratio = self:GetWide() / self:GetTall()
		return self.Entity:GetPos() + pos, self.Entity:GetPos() + look, fov * ratio
	end,
	LayoutEntity = function(self, ent)
		local pos, look, fov = self:GetCameraTarget()
		if not ent.PanelLayoutDone then
			ent.PanelLayoutDone = true
			self:SetCamPos(pos)
			self:SetLookAt(look)
			self:SetFOV(fov)
			ent:SetAngles(Angle(0, self:GetBaseYaw(), 0))
		end
		self:SetCamPos(self:GetCamPos():Approach(pos, 10))
		self:SetLookAt(self:GetLookAt():Approach(look, 10))
		self:SetFOV(math.ApproachSpeed(self:GetFOV(), fov, 10))
		local ang = Angle(0, self:GetBaseYaw(), 0)
		if self.Dragging then
			self.MouseYaw = self.MouseYaw + self:GetMouseDrag()
		end
		self.YawAdd = math.ApproachSpeed(self.YawAdd, self.MouseYaw, 30)
		ang:Sub(Angle(0, self.YawAdd, 0))
		local att = ent:GetAttachment(ent:LookupAttachment("eyes"))
		local height = att.Pos.z or 64
		local dir = att.Ang:Forward() or ent:GetForward()
		ent:SetAngles(ang)
		return ent:SetEyeTarget(Vector(0, 0, height) + dir * 50)
	end,
	OnMouseWheeled = function(self, delta)
		if delta > 0 then
			self.Zoom = math.Approach(self.Zoom, 1, .2)
		else
			self.Zoom = math.Approach(self.Zoom, 0, .2)
		end
	end,
	GetMouseDrag = function(self)
		if not self.Dragging then
			return 0
		end
		local offset = gui.MouseX() - self.DragStart
		local diff = self.LastDrag - offset
		self.LastDrag = offset
		return diff
	end,
	OnMousePressed = function(self, mouse)
		if self.AllowManipulation then
			if mouse == MOUSE_LEFT then
				self:MouseCapture(true)
				self.Dragging = true
				self.DragStart = gui.MouseX()
				self.LastDrag = 0
			else
				self.YawAdd = math.NormalizeAngle(self.YawAdd)
				self.MouseYaw = 0
			end
		end
	end,
	OnMouseReleased = function(self)
		self:MouseCapture(false)
		self.Dragging = false
	end
}) do
	PANEL[k] = v
end
return derma.DefineControl("EvilRP_CharacterModel", "", PANEL, "DModelPanel")
