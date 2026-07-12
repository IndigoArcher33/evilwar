-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/pocket_evil/cl_menu.yue
local meta = FindMetaTable("Player") -- 1
if not GAMEMODE.pocket then -- 3
	GAMEMODE.pocket = { } -- 3
end -- 3
net.Receive("EvilRP_Pocket", function() -- 4
	GAMEMODE.pocket = net.ReadTable() -- 5
	return GAMEMODE:PMUpdateInventory() -- 6
end) -- 4
for k, v in pairs({ -- 9
	getPocketItems = function(self) -- 9
		if self ~= LocalPlayer() then -- 10
			return nil -- 10
		end -- 10
		return GAMEMODE.pocket -- 11
	end, -- 9
	GetPocketItems = function(self) -- 12
		if self ~= LocalPlayer() then -- 13
			return nil -- 13
		end -- 13
		return GAMEMODE.pocket -- 14
	end -- 12
}) do -- 15
	meta[k] = v -- 8
end -- 8
GAMEMODE.PMUpdateInventory = function(self) -- 17
	if not (ECP.pmenu and ECP.pmenu:IsValid() and ECP.pmenu.content_pane and ECP.pmenu.content_pane:IsValid()) then -- 18
		return -- 18
	end -- 18
	if ECP.pmenu.icons then -- 19
		local _list_0 = ECP.pmenu.icons -- 20
		for _index_0 = 1, #_list_0 do -- 20
			local i = _list_0[_index_0] -- 20
			if i.shadows then -- 21
				local _list_1 = i.shadows -- 22
				for _index_1 = 1, #_list_1 do -- 22
					local s = _list_1[_index_1] -- 22
					if s[1]:IsValid() then -- 23
						s[1]:Remove() -- 23
					end -- 23
				end -- 23
			end -- 21
			if i:IsValid() then -- 24
				i:Remove() -- 24
			end -- 24
			if i.Label and i.Label:IsValid() then -- 25
				i.Label:Remove() -- 25
			end -- 25
		end -- 25
	end -- 19
	local items = GAMEMODE.pocket -- 27
	local ct = CurTime() -- 28
	local angle = ct * 0.25 % (2 * math.pi) -- 29
	local offset = ((2 * math.pi) / #items) -- 30
	ECP.pmenu.icons = { } -- 31
	local idx = 0 -- 32
	for k, v in pairs(GAMEMODE.pocket) do -- 33
		idx = idx + 1 -- 34
		local item = v -- 35
		local icon = vgui.Create("DModelPanel", ECP.pmenu.content_pane) -- 36
		do -- 37
			icon:SetModel(item.model) -- 38
			icon:SetCursor("blank") -- 39
			icon:SetSize(64, 64) -- 41
			local a, b = icon.Entity:GetModelBounds() -- 43
			icon:SetFOV(10) -- 44
			local abs = math.abs -- 45
			icon:SetCamPos(Vector(abs(a.x), abs(a.y), abs(a.z)) * 5) -- 46
			icon:SetLookAt((a + b) / 2) -- 47
			local offset_angle = angle + (offset * (idx - 1)) -- 49
			local hx = math.cos(offset_angle) * 400 -- 50
			local hy = math.sin(offset_angle) * 400 -- 51
			icon:SetPos((ECP.pmenu:GetWide() / 2.05) - hx, (ECP.pmenu:GetTall() / 2.2) - hy) -- 52
			icon:SetDrawOnTop(true) -- 53
			icon.DoClick = function(self) -- 55
				net.Start("EvilRP_spawnPocket") -- 56
				net.WriteFloat(k) -- 57
				net.WriteBool(true) -- 58
				net.SendToServer() -- 59
				GAMEMODE.pocket[k] = nil -- 60
				return ECP.pmenu:KILL() -- 61
			end -- 55
			icon.DoRightClick = function(self) -- 63
				net.Start("EvilRP_spawnPocket") -- 64
				net.WriteFloat(k) -- 65
				net.WriteBool(false) -- 66
				net.SendToServer() -- 67
				GAMEMODE.pocket[k] = nil -- 68
				return GAMEMODE:PMUpdateInventory() -- 70
			end -- 63
			icon.PaintOver = function(self) -- 71
				draw.CustomCursor(self, get_handframe()) -- 72
				if ECP.pmenu.content_pane.menu_hover then -- 73
					local mh = ECP.pmenu.content_pane.menu_hover -- 74
					local col = HSVToColor((CurTime() * 38) % 360, 1, 1) -- 75
					col.a = mh.alpha * 255 -- 76
					surface.SetTextColor(col) -- 77
					local x, y = self:CursorPos() -- 78
					y = y + 32 -- 79
					local desp = lp:GetDespair() * 0.01 -- 80
					local _list_0 = mh.text -- 81
					for _index_0 = 1, #_list_0 do -- 81
						local t = _list_0[_index_0] -- 81
						if type(t) == "string" then -- 82
							local txt = t -- 83
							local font = "Spleen_Label" -- 84
							if not MUTATORS[MUTATOR_CHROMOPHOBIA].active then -- 86
								txt = "<rgb=1,1,30>" .. tostring(txt) -- 86
							end -- 86
							local txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt), nil) -- 87
							local txt_w = txt_obj:GetWide() -- 88
							local txt_h = txt_obj:GetTall() -- 89
							txt_obj:Draw(x, y, 1, TEXT_ALIGN_CENTER) -- 91
							y = y + txt_h -- 93
						else -- 95
							local font = t.font or "Spleen_Label" -- 95
							local txt = t.text -- 96
							if not MUTATORS[MUTATOR_CHROMOPHOBIA].active then -- 98
								txt = "<rgb=1,1,30>" .. tostring(txt) -- 98
							end -- 98
							local txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt), nil) -- 99
							local txt_w = txt_obj:GetWide() -- 100
							local txt_h = txt_obj:GetTall() -- 101
							txt_obj:Draw(x, y, 1, TEXT_ALIGN_CENTER) -- 103
							y = y + txt_h -- 105
						end -- 82
					end -- 105
				end -- 73
			end -- 71
			icon.item = item -- 107
		end -- 37
		local _obj_0 = ECP.pmenu.icons -- 109
		_obj_0[#_obj_0 + 1] = icon -- 109
	end -- 109
end -- 17
