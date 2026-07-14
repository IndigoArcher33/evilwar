SCOREBOARD_SHOW = 0
SCOREBOARD_HIDDEN = 1
SCOREBOARD_SKIP = 2
local PANEL = { }
AccessorFunc(PANEL, "Alt", "Alt")
for k, v in pairs({
	Init = function(self)
		self.Icon = self:Add("EvilRP_CharacterModel")
		do
			local _with_0 = self:Add("DButton")
			self.Badge = _with_0
			_with_0:Dock(RIGHT)
			_with_0:SetText("")
			_with_0.Paint = function() end
			_with_0.DoClick = function() end
		end
		local _with_0 = self:Add("DButton")
		self.Examine = _with_0
		_with_0:Dock(FILL)
		_with_0:SetText("")
		_with_0.Paint = function() end
		_with_0.DoClick = function() end
		_with_0.DoRightClick = function()
			if not lp:IsAdmin() then
				return
			end
		end
		return _with_0
	end,
	SetPlayer = function(self, ply)
		self.Player = ply
		self.Team = ply:Team()
		local _with_0 = self.Icon
		_with_0:SetPlayer(ply)
		_with_0.Zoom = 1
		_with_0:SetBaseYaw(20)
		return _with_0
	end,
	IsInvalid = function(self)
		if not IsValid(self.Player) then
			return true
		end
		if self.Player:Team() ~= self.Team then
			return true
		end
		if self.State == SCOREBOARD_SKIP then
			return true
		end
		return false
	end,
	Think = function(self)
		if self:IsInvalid() then
			self:Remove()
			return
		end
	end,
	PerformLayout = function(self, w, h)
		self.Icon:SetPos(1, 1)
		return self.Icon:SetSize(h - 2, h - 2)
	end,
	Paint = function(self, w, h)
		return derma.SkinHook("Paint", "ScoreboardEntry", self, w, h)
	end
}) do
	PANEL[k] = v
end
derma.DefineControl("EvilRP_ScoreboardEntry", "", PANEL, "Panel")
PANEL = { }
AccessorFunc(PANEL, "Team", "Team")
local color_bg = ColorAlpha(Color("evilrp_primary"), 10)
local color_txt = Color("evilrp_normal")
for k, v in pairs({
	Init = function(self)
		self:DockPadding(0, 50, 0, 0)
		self.Players = { }
		self.Empty = false
	end,
	Think = function(self)
		local players = team.GetPlayers(self.Team)
		if (#players == 0 and not self.Empty) or (#players > 0 and self.Empty) then
			self:InvalidateLayout()
		end
		table.sort(players, function(a, b)
			return a:Name() < b:Name()
		end)
		local alt = true
		for k, ply in ipairs(players) do
			local panel = self.Players[ply] or self:AddPlayer(ply)
			panel:SetAlt(alt)
			if panel:GetZPos() ~= k then
				panel:SetZPos(k)
			end
			alt = not alt
		end
	end,
	AddPlayer = function(self, ply)
		local panel = self:Add("EvilRP_ScoreboardEntry")
		panel:Dock(TOP)
		panel:SetTall(60)
		panel:SetPlayer(ply)
		self.Players[ply] = panel
		return panel
	end,
	OnChildRemoved = function(self, child)
		self.Players[child.Player] = nil
	end,
	PerformLayout = function(self, w, h)
		self.Empty = table.Count(self.Players) == 0
		if self.Empty then
			self:SetTall(0)
			return
		end
		h = 50
		local _list_0 = self:GetChildren()
		for _index_0 = 1, #_list_0 do
			local c = _list_0[_index_0]
			h = h + c:GetTall()
		end
		return self:SetTall(h)
	end,
	Paint = function(self, w, h)
		draw.SimpleText(team.GetName(self.Team), "Spleen_Label", 10, 25, color_txt, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		return draw.SimpleText(tostring(#team.GetPlayers(self.Team)) .. "/" .. tostring(player.GetCount()), "Spleen_Label", w - 10, 25, color_txt, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
	end
}) do
	PANEL[k] = v
end
derma.DefineControl("EvilRP_ScoreboardTeam", "", PANEL, "Panel")
PANEL = { }
local teams_internal = table.Lookup({
	TEAM_CONNECTING,
	TEAM_UNASSIGNED,
	TEAM_SPECTATOR
})
for k, v in pairs({
	Init = function(self)
		self:SetSize(620, ScreenScale(200))
		self:DockPadding(0, 50, 0, 0)
		self:MakePopup()
		self:Center()
		self:SetKeyboardInputEnabled(false)
		self.Players = self:Add("DScrollPanel")
		self.Players:Dock(FILL)
		for index, data in pairs(team.GetAllTeams()) do
			if teams_internal[index] then
				goto _continue_0
			end
			do
				local header = self.Players:Add("EvilRP_ScoreboardTeam")
				header:SetTeam(index)
				header:SetZPos(index)
				header:Dock(TOP)
			end
			::_continue_0::
		end
	end,
	Paint = function(self, w, h)
		return derma.SkinHook("Paint", "Scoreboard", self, w, h)
	end
}) do
	PANEL[k] = v
end
derma.DefineControl("EvilRP_Scoreboard", "", PANEL, "EvilRP_Frame")
return GUI.Register("Scoreboard", (function()
	return vgui.Create("EvilRP_Scoreboard")
end), true)
