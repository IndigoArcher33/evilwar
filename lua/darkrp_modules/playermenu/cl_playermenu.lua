if not ECP then
	ECP = { }
end
local handframe = 1
local next_handframe = CurTime()
local hand_animation = false
local handframes = {
	Material("placenta/cursor/hand1.png"),
	Material("placenta/cursor/hand2.png"),
	Material("placenta/cursor/hand3.png"),
	Material("placenta/cursor/hand2.png")
}
local moused = false
get_handframe = function()
	local ct = CurTime()
	if ct > next_handframe then
		if not hand_animation then
			if handframe > 1 then
				next_handframe = ct + .2
				handframe = math.min(handframe + 1, #handframes)
				if handframe >= #handframes then
					handframe = 1
				end
			end
		else
			next_handframe = ct + .2
			handframe = math.min(handframe + 1, #handframes)
			if handframe >= #handframes then
				handframe = 1
			end
		end
	end
	return handframes[handframe]
end
GAMEMODE.CreatePlayerMenu = function(self)
	local lp = LocalPlayer()
	lp:EmitSound("placenta/ui/menu_open.wav")
	ECP.pmenu = vgui.Create("DFrame")
	local sw = ScrW()
	local sh = ScrH()
	do
		local _with_0 = ECP.pmenu
		_with_0:SetSize(ScrW(), ScrH())
		_with_0:Center()
		_with_0:SetTitle("")
		_with_0.lblTitle:SetFont("Spleen_Label")
		_with_0:MakePopup()
		_with_0.PerformLayout = evilrp_perform_layout
		_with_0:PerformLayout()
		_with_0:ShowCloseButton(false)
		_with_0:SetCursor("blank")
	end
	ECP.pmenu.OnClose = function(self)
		return lp:EmitSound("placenta/ui/menu_close.wav")
	end
	ECP.pmenu.content_pane = vgui.Create("DPanel", ECP.pmenu)
	do
		local _with_0 = ECP.pmenu.content_pane
		_with_0:SetPos(0, 0)
		_with_0:SetSize(sw, sh)
		_with_0:SetCursor("blank")
	end
	ECP.pmenu.content_pane.Paint = function(self)
		local hf = get_handframe()
		return draw.CustomCursor(self, hf)
	end
	ECP.pmenu.content_pane.PaintOver = function(self)
		moused = false
		if not self.menu_hover then
			self.menu_hover = {
				alpha = 0,
				text = ""
			}
		end
		local x, y = self:CursorPos()
		if ECP.pmenu.icons then
			local _list_0 = ECP.pmenu.icons
			for _index_0 = 1, #_list_0 do
				local i = _list_0[_index_0]
				if i:IsHovered() then
					moused = true
					hand_animation = true
					local sent = scripted_ents.Get(i.item.class)
					self.menu_hover.text = sent.PMRender(i.item)
					self.menu_hover.alpha = Lerp(0.05, self.menu_hover.alpha, 1)
					y = y + 32
				end
			end
		end
		local desp = (lp:GetDespair() * 0.01)
		local _list_0 = self.menu_hover.text
		for _index_0 = 1, #_list_0 do
			local t = _list_0[_index_0]
			if type(t) == "string" then
				local font = "Spleen_Label"
				local txt
				if not MUTATORS[MUTATOR_CHROMOPHOBIA].active then
					txt = "<rgb=1,1,30>" .. tostring(t)
				end
				local txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt), nil)
				local txt_w = txt_obj:GetWide()
				local txt_h = txt_obj:GetTall()
				txt_obj:Draw(x, y, self.menu_hover.alpha, TEXT_ALIGN_CENTER)
				y = y + (txt_h)
			else
				local font = t.font or "Spleen_Label"
				local txt = t.text
				if not MUTATORS[MUTATOR_CHROMOPHOBIA].active then
					txt = "<rgb=1,1,30>" .. tostring(txt)
				end
				local txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt), nil)
				local txt_w = txt_obj:GetWide()
				local txt_h = txt_obj:GetTall()
				txt_obj:Draw(x, y, cross_text_alpha, TEXT_ALIGN_CENTER)
				y = y + txt_h
				local bg = Color(0, 0, 0, self.menu_hover.alpha * 255)
			end
		end
		if not moused and self.menu_hover.alpha and self.menu_hover.alpha > 0 then
			self.menu_hover.alpha = Lerp(0.05, self.menu_hover.alpha, 0)
		end
	end
	ECP.pmenu.char_model = vgui.Create("DModelPanel", ECP.pmenu.content_pane)
	do
		local _with_0 = ECP.pmenu.char_model
		_with_0:SetModel(lp:GetModel())
		_with_0.EntReady = false
		_with_0.DoClick = function(self)
			local punches = {
				"npc/vort/foot_hit.wav",
				"weapons/crossbow/hitbod1.wav",
				"weapons/crossbow/hitbod2.wav"
			}
			surface.PlaySound(punches[math.random(1, #punches)])
			local ct = CurTime()
			self.next_grunt = self.next_grunt or ct
			local hurt_sounds
			do
				local _obj_0 = lp:getJobTable()
				hurt_sounds = _obj_0.hurt_sounds
			end
			if not (hurt_sounds and #hurt_sounds > 0) then
				return
			end
			if ct >= self.next_grunt then
				self.next_grunt = ct + math.Rand(0.5, 2.0)
				timer.Simple(FrameTime() * 3, function()
					local snd = hurt_sounds[math.random(1, #hurt_sounds)]
					return lp:EmitSound(snd, 80, math.random(95, 110))
				end)
			end
			self.FOV = 40
		end
		_with_0.DoRightClick = function(self)
			local equipment = lp:GetAllEquipment()
			local equip_dmenu = DermaMenu()
			if (not equipment) or not (#equipment > 0) then
				equip_dmenu:AddOption("No removable equipment!")
			else
				for _index_0 = 1, #equipment do
					local eq = equipment[_index_0]
					local opt = equip_dmenu:AddOption(tostring(eq.PrintName), function()
						lp:ConCommand("dequip " .. tostring(eq.EquipSlot))
						return ECP.pmenu:KILL()
					end)
					opt:SetIcon("icon16/disconnect.png")
				end
			end
			return equip_dmenu:Open()
		end
		_with_0.PaintOver = function(self)
			return draw.CustomCursor(self, get_handframe())
		end
		_with_0.Think = function(self)
			if not self.FOV then
				self.FOV = 35
			end
			if self:IsHovered() then
				hand_animation = true
			end
			self:SetColor(Color(255, 255, 255, 255))
			self.FOV = Lerp(0.1, self.FOV, 35)
			return self:SetFOV(self.FOV)
		end
		_with_0.PostDrawModel = function(self, ent)
			local outfits = part.Get(ent)
			if outfits then
				for k, v in pairs(outfits) do
					v:Draw()
				end
			end
		end
		_with_0.Entity.GetPlayerColor = function(self)
			lp = LocalPlayer()
			if (not lp) or (not lp:IsValid()) then
				return Vector(1, 1, 1)
			end
			local rainbow = lp:GetInfoNum("lfr_rainbow_playermodel", 1) == 1
			return lp:GetPlayerColor()
		end
		_with_0:SetColor(Color(255, 255, 255, 0))
		lp = LocalPlayer()
		local ent = _with_0.Entity
		ent:SetSkin(lp:GetSkin())
		for i = 1, 20 do
			ent:SetBodygroup(i, lp:GetBodygroup(i))
		end
		for i = 1, 20 do
			ent:SetSubMaterial(i, lp:GetSubMaterial(i))
		end
		local outfits = part.Get(lp)
		local appearance = outfits and outfits.appearance or nil
		if appearance then
			part.Add(ent, "appearance", appearance.Data)
		end
		_with_0:SetSize(200, 500)
		_with_0:SetPos((ECP.pmenu:GetWide() / 2 - _with_0:GetWide() / 2), ECP.pmenu:GetTall() / 5)
		_with_0:SetFOV(25)
		_with_0:SetCamPos(Vector(50, 0, 60))
		_with_0:SetLookAt(Vector(-80, 0, 10))
		_with_0:SetCursor("blank")
	end
	ECP.pmenu.Paint = function(self)
		local ct = CurTime()
		local font = "Spleen_Label"
		local desp = (lp:GetDespair() * 0.01)
		local alpha = 0.5 + (math.abs(math.sin(ct) * 0.5))
		local x = (self:GetWide() / 2) + (30 * math.sin(ct))
		local y = self:GetTall() * .125
		surface.SetFont(font)
		local name = lp:Name()
		local txt = "<rgb=1,10,60>" .. tostring(name)
		local txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt), nil)
		local txt_w = txt_obj:GetWide()
		local txt_h = txt_obj:GetTall()
		txt_obj:Draw(x, y, alpha, TEXT_ALIGN_CENTER)
		local list = lp:OddityList()
		if #list > 0 then
			x = (self:GetWide() / 4) * 3.25
			y = (self:GetTall() * .2) + (12 * math.cos(ct))
			txt = "i have problems such as"
			txt_obj = scribe.Parse("<stutter><rgb=0,10><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt), nil)
			txt_obj:Draw(x, y, alpha, TEXT_ALIGN_CENTER)
			txt_h = txt_obj:GetTall()
			y = y + txt_h
			local idx = 0
			for _index_0 = 1, #list do
				local oddity = list[_index_0]
				idx = idx + 1
				txt = oddity.name
				txt_obj = scribe.Parse("<stutter><rgb=0," .. tostring(15 * idx) .. "><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt), nil)
				txt_obj:Draw(x, y, alpha, TEXT_ALIGN_CENTER)
				txt_h = txt_obj:GetTall()
				y = y + txt_h
			end
		end
		local money = lp:getDarkRPVar("money")
		txt = "i have " .. tostring(money) .. " Bones in my body"
		txt_obj = scribe.Parse("<stutter><col=0,200,0><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt), nil)
		txt_w = txt_obj:GetWide()
		txt_h = txt_obj:GetTall()
		x = (self:GetWide() / 2) + (30 * math.cos(ct))
		y = self:GetTall() * .725
		txt_obj:Draw(x, y, alpha, TEXT_ALIGN_CENTER)
		local cells = lp:GetStemCells()
		txt = "i have " .. tostring(cells) .. " Stem Cells in my brain"
		txt_obj = scribe.Parse("<stutter><col=0,200,0><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt), nil)
		txt_w = txt_obj:GetWide()
		txt_h = txt_obj:GetTall()
		x = (self:GetWide() / 2) + (30 * math.cos(ct))
		y = self:GetTall() * .75
		txt_obj:Draw(x, y, alpha, TEXT_ALIGN_CENTER)
		local teeth = lp:GetTeeth()
		txt = "i have " .. tostring(teeth) .. " Teeth in my mouth"
		txt_obj = scribe.Parse("<stutter><col=0,200,0><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt), nil)
		txt_w = txt_obj:GetWide()
		txt_h = txt_obj:GetTall()
		x = (self:GetWide() / 2) + (30 * math.cos(ct))
		y = self:GetTall() * .75
		return txt_obj:Draw(x, y, alpha, TEXT_ALIGN_CENTER)
	end
	ECP.pmenu.KILL = function(self)
		self:Remove()
		self:OnClose()
		self = nil
		return gui.HideGameUI()
	end
	local rotspeed = 0.25
	local rotating = true
	local rotime = 0
	ECP.pmenu.Think = function(self)
		if not moused then
			rotime = rotime + FrameTime()
		end
		if self.icons then
			local angle = rotime * rotspeed % (2 * math.pi)
			local offset = ((2 * math.pi) / #table.GetKeys(self.icons))
			local idx = 0
			for k, v in pairs(self.icons) do
				local offset_angle = angle + (offset * (k - 1))
				local hx = math.cos(offset_angle) * (ScrW() * 0.2)
				local hy = math.sin(offset_angle) * (ScrH() * 0.35)
				local item = v.item
				if not moused then
					v:SetPos((self:GetWide() / 2.05) - hx, (self:GetTall() / 2.15) - hy)
				end
			end
		end
		local ct = CurTime()
		if not self.TryClose then
			self.TryClose = ct + 0.2
		end
		if ct >= self.TryClose then
			if not lp:Alive() then
				self:KILL()
			end
			if input.IsKeyDown(KEY_ESCAPE) then
				self:KILL()
			end
			if input.IsKeyDown(KEY_F3) then
				self:KILL()
			end
			if input.IsKeyDown(KEY_R) then
				self:KILL()
			end
			local gx = gui.MouseX()
			local gy = gui.MouseY()
			sw = ScrW()
			sh = ScrH()
			if gx < (sw * .2) then
				self:KILL()
			end
			if gy < (sh * .1) then
				self:KILL()
			end
			if gx > (sw * .8) then
				self:KILL()
			end
			if gy > (sh * .9) then
				return self:KILL()
			end
		end
	end
	return self:PMUpdateInventory()
end
hook.Add("HUDPaint", "evilrp_blur_playermenu", function()
	if ECP.pmenu and ECP.pmenu:IsValid() then
		draw.DrawBackgroundBlur(1)
	end
	return
end)
GAMEMODE.CreateEquipmentMenu = function(self)
	local lp = LocalPlayer()
	local frame = vgui.Create("DFrame")
	frame:SetSize(400, 200)
	frame:Center()
	frame:SetTitle("Yeah, take 'em off")
	frame:MakePopup()
	frame:SetSkin("EvilRP")
	for i = 1, 4 do
		local checkbox = vgui.Create("DCheckBox", frame)
		checkbox:SetPos(8, 16 + i * 24)
	end
end
