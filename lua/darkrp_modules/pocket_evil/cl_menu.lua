local meta = FindMetaTable("Player")
if not GAMEMODE.pocket then
	GAMEMODE.pocket = { }
end
net.Receive("EvilRP_Pocket", function()
	GAMEMODE.pocket = net.ReadTable()
	return GAMEMODE:PMUpdateInventory()
end)
for k, v in pairs({
	getPocketItems = function(self)
		if self ~= LocalPlayer() then
			return nil
		end
		return GAMEMODE.pocket
	end,
	GetPocketItems = function(self)
		if self ~= LocalPlayer() then
			return nil
		end
		return GAMEMODE.pocket
	end
}) do
	meta[k] = v
end
GAMEMODE.PMUpdateInventory = function(self)
	if not (ECP.pmenu and ECP.pmenu:IsValid() and ECP.pmenu.content_pane and ECP.pmenu.content_pane:IsValid()) then
		return
	end
	if ECP.pmenu.icons then
		local _list_0 = ECP.pmenu.icons
		for _index_0 = 1, #_list_0 do
			local i = _list_0[_index_0]
			if i.shadows then
				local _list_1 = i.shadows
				for _index_1 = 1, #_list_1 do
					local s = _list_1[_index_1]
					if s[1]:IsValid() then
						s[1]:Remove()
					end
				end
			end
			if i:IsValid() then
				i:Remove()
			end
			if i.Label and i.Label:IsValid() then
				i.Label:Remove()
			end
		end
	end
	local items = GAMEMODE.pocket
	local ct = CurTime()
	local angle = ct * 0.25 % (2 * math.pi)
	local offset = ((2 * math.pi) / #items)
	ECP.pmenu.icons = { }
	local idx = 0
	for k, v in pairs(GAMEMODE.pocket) do
		idx = idx + 1
		local item = v
		local icon = vgui.Create("DModelPanel", ECP.pmenu.content_pane)
		do
			icon:SetModel(item.model)
			icon:SetCursor("blank")
			icon:SetSize(64, 64)
			local a, b = icon.Entity:GetModelBounds()
			icon:SetFOV(10)
			local abs = math.abs
			icon:SetCamPos(Vector(abs(a.x), abs(a.y), abs(a.z)) * 5)
			icon:SetLookAt((a + b) / 2)
			local offset_angle = angle + (offset * (idx - 1))
			local hx = math.cos(offset_angle) * 400
			local hy = math.sin(offset_angle) * 400
			icon:SetPos((ECP.pmenu:GetWide() / 2.05) - hx, (ECP.pmenu:GetTall() / 2.2) - hy)
			icon:SetDrawOnTop(true)
			icon.DoClick = function(self)
				net.Start("EvilRP_spawnPocket")
				net.WriteFloat(k)
				net.WriteBool(true)
				net.SendToServer()
				GAMEMODE.pocket[k] = nil
				return ECP.pmenu:KILL()
			end
			icon.DoRightClick = function(self)
				net.Start("EvilRP_spawnPocket")
				net.WriteFloat(k)
				net.WriteBool(false)
				net.SendToServer()
				GAMEMODE.pocket[k] = nil
				return GAMEMODE:PMUpdateInventory()
			end
			icon.PaintOver = function(self)
				draw.CustomCursor(self, get_handframe())
				if ECP.pmenu.content_pane.menu_hover then
					local mh = ECP.pmenu.content_pane.menu_hover
					local col = HSVToColor((CurTime() * 38) % 360, 1, 1)
					col.a = mh.alpha * 255
					surface.SetTextColor(col)
					local x, y = self:CursorPos()
					y = y + 32
					local desp = lp:GetDespair() * 0.01
					local _list_0 = mh.text
					for _index_0 = 1, #_list_0 do
						local t = _list_0[_index_0]
						if type(t) == "string" then
							local txt = t
							local font = "Spleen_Label"
							if not MUTATORS[MUTATOR_CHROMOPHOBIA].active then
								txt = "<rgb=1,1,30>" .. tostring(txt)
							end
							local txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt), nil)
							local txt_w = txt_obj:GetWide()
							local txt_h = txt_obj:GetTall()
							txt_obj:Draw(x, y, 1, TEXT_ALIGN_CENTER)
							y = y + txt_h
						else
							local font = t.font or "Spleen_Label"
							local txt = t.text
							if not MUTATORS[MUTATOR_CHROMOPHOBIA].active then
								txt = "<rgb=1,1,30>" .. tostring(txt)
							end
							local txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt), nil)
							local txt_w = txt_obj:GetWide()
							local txt_h = txt_obj:GetTall()
							txt_obj:Draw(x, y, 1, TEXT_ALIGN_CENTER)
							y = y + txt_h
						end
					end
				end
			end
			icon.item = item
		end
		do
			local _obj_0 = ECP.pmenu.icons
			_obj_0[#_obj_0 + 1] = icon
		end
	end
end
