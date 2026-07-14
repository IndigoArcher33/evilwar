-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/gui/cl_scoreboard.yue
SCOREBOARD_SHOW = 0 -- 2
SCOREBOARD_HIDDEN = 1 -- 4
SCOREBOARD_SKIP = 2 -- 6
local PANEL = { } -- 9
AccessorFunc(PANEL, "Alt", "Alt") -- 10
for k, v in pairs({ -- 13
	Init = function(self) -- 13
		self.Icon = self:Add("EvilRP_CharacterModel") -- 14
		do -- 16
			local _with_0 = self:Add("DButton") -- 16
			self.Badge = _with_0 -- 16
			_with_0:Dock(RIGHT) -- 17
			_with_0:SetText("") -- 18
			_with_0.Paint = function() end -- 19
			_with_0.DoClick = function() end -- 20
		end -- 16
		local _with_0 = self:Add("DButton") -- 23
		self.Examine = _with_0 -- 23
		_with_0:Dock(FILL) -- 24
		_with_0:SetText("") -- 25
		_with_0.Paint = function() end -- 26
		_with_0.DoClick = function() end -- 27
		_with_0.DoRightClick = function() -- 28
			if not lp:IsAdmin() then -- 29
				return -- 29
			end -- 29
		end -- 28
		return _with_0 -- 23
	end, -- 13
	SetPlayer = function(self, ply) -- 32
		self.Player = ply -- 33
		self.Team = ply:Team() -- 34
		local _with_0 = self.Icon -- 35
		_with_0:SetPlayer(ply) -- 36
		_with_0.Zoom = 1 -- 37
		_with_0:SetBaseYaw(20) -- 38
		return _with_0 -- 35
	end, -- 32
	IsInvalid = function(self) -- 40
		if not IsValid(self.Player) then -- 41
			return true -- 41
		end -- 41
		if self.Player:Team() ~= self.Team then -- 42
			return true -- 42
		end -- 42
		if self.State == SCOREBOARD_SKIP then -- 43
			return true -- 43
		end -- 43
		return false -- 44
	end, -- 40
	Think = function(self) -- 53
		if self:IsInvalid() then -- 55
			self:Remove() -- 56
			return -- 57
		end -- 55
	end, -- 53
	PerformLayout = function(self, w, h) -- 59
		self.Icon:SetPos(1, 1) -- 60
		return self.Icon:SetSize(h - 2, h - 2) -- 61
	end, -- 59
	Paint = function(self, w, h) -- 63
		return derma.SkinHook("Paint", "ScoreboardEntry", self, w, h) -- 63
	end -- 63
}) do -- 64
	PANEL[k] = v -- 12
end -- 12
derma.DefineControl("EvilRP_ScoreboardEntry", "", PANEL, "Panel") -- 66
PANEL = { } -- 69
AccessorFunc(PANEL, "Team", "Team") -- 71
local color_bg = ColorAlpha(Color("evilrp_primary"), 10) -- 73
local color_txt = Color("evilrp_normal") -- 74
for k, v in pairs({ -- 77
	Init = function(self) -- 77
		self:DockPadding(0, 50, 0, 0) -- 78
		self.Players = { } -- 79
		self.Empty = false -- 80
	end, -- 77
	Think = function(self) -- 82
		local players = team.GetPlayers(self.Team) -- 83
		if (#players == 0 and not self.Empty) or (#players > 0 and self.Empty) then -- 84
			self:InvalidateLayout() -- 85
		end -- 84
		table.sort(players, function(a, b) -- 86
			return a:Name() < b:Name() -- 86
		end) -- 86
		local alt = true -- 87
		for k, ply in ipairs(players) do -- 88
			local panel = self.Players[ply] or self:AddPlayer(ply) -- 90
			panel:SetAlt(alt) -- 91
			if panel:GetZPos() ~= k then -- 92
				panel:SetZPos(k) -- 92
			end -- 92
			alt = not alt -- 93
		end -- 94
	end, -- 82
	AddPlayer = function(self, ply) -- 95
		local panel = self:Add("EvilRP_ScoreboardEntry") -- 96
		panel:Dock(TOP) -- 98
		panel:SetTall(60) -- 99
		panel:SetPlayer(ply) -- 100
		self.Players[ply] = panel -- 101
		return panel -- 102
	end, -- 95
	OnChildRemoved = function(self, child) -- 104
		self.Players[child.Player] = nil -- 104
	end, -- 104
	PerformLayout = function(self, w, h) -- 106
		self.Empty = table.Count(self.Players) == 0 -- 107
		if self.Empty then -- 108
			self:SetTall(0) -- 109
			return -- 110
		end -- 108
		h = 50 -- 111
		local _list_0 = self:GetChildren() -- 112
		for _index_0 = 1, #_list_0 do -- 112
			local c = _list_0[_index_0] -- 112
			h = h + c:GetTall() -- 112
		end -- 112
		return self:SetTall(h) -- 113
	end, -- 106
	Paint = function(self, w, h) -- 115
		draw.SimpleText(team.GetName(self.Team), "Spleen_Label", 10, 25, color_txt, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER) -- 119
		return draw.SimpleText(tostring(#team.GetPlayers(self.Team)) .. "/" .. tostring(player.GetCount()), "Spleen_Label", w - 10, 25, color_txt, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER) -- 120
	end -- 115
}) do -- 121
	PANEL[k] = v -- 76
end -- 76
derma.DefineControl("EvilRP_ScoreboardTeam", "", PANEL, "Panel") -- 123
PANEL = { } -- 126
local teams_internal = table.Lookup({ -- 128
	TEAM_CONNECTING, -- 128
	TEAM_UNASSIGNED, -- 129
	TEAM_SPECTATOR -- 130
}) -- 127
for k, v in pairs({ -- 134
	Init = function(self) -- 134
		self:SetSize(620, ScreenScale(200)) -- 135
		self:DockPadding(0, 50, 0, 0) -- 136
		self:MakePopup() -- 137
		self:Center() -- 138
		self:SetKeyboardInputEnabled(false) -- 139
		self.Players = self:Add("DScrollPanel") -- 140
		self.Players:Dock(FILL) -- 141
		for index, data in pairs(team.GetAllTeams()) do -- 142
			local _continue_0 = false -- 143
			repeat -- 143
				if teams_internal[index] then -- 143
					_continue_0 = true -- 143
					break -- 143
				end -- 143
				local header = self.Players:Add("EvilRP_ScoreboardTeam") -- 144
				header:SetTeam(index) -- 145
				header:SetZPos(index) -- 146
				header:Dock(TOP) -- 147
				_continue_0 = true -- 143
			until true -- 147
			if not _continue_0 then -- 147
				break -- 147
			end -- 147
		end -- 147
	end, -- 134
	Paint = function(self, w, h) -- 149
		return derma.SkinHook("Paint", "Scoreboard", self, w, h) -- 149
	end -- 149
}) do -- 150
	PANEL[k] = v -- 133
end -- 133
derma.DefineControl("EvilRP_Scoreboard", "", PANEL, "EvilRP_Frame") -- 152
return GUI.Register("Scoreboard", (function() -- 154
	return vgui.Create("EvilRP_Scoreboard") -- 154
end), true) -- 154
