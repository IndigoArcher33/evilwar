-- [yue]: darkrp_modules\music\sh_music.yue
AMBIENCE_COOLDOWN = AMBIENCE_COOLDOWN or 0 -- 2
MUSIC = { -- 6
	songs = { -- 7
		living = { -- 9
			{ -- 9
				name = "eclipsing", -- 9
				artist = "box", -- 10
				path = "dysphoria/music/idle/box/eclipsing.ogg", -- 11
				duration = (60 * 10) + 9 -- 12
			}, -- 9
			{ -- 13
				name = "lucidity", -- 13
				artist = "box", -- 14
				path = "dysphoria/music/idle/box/lucidity.ogg", -- 15
				duration = (60 * 1) + 1 -- 16
			}, -- 13
			{ -- 17
				name = "post awareness horrors", -- 17
				artist = "box", -- 18
				path = "dysphoria/music/idle/box/postawarenesshorrors.ogg", -- 19
				duration = (60 * 1) + 44 -- 20
			}, -- 17
			{ -- 21
				name = "sun sinks", -- 21
				artist = "box", -- 22
				path = "dysphoria/music/idle/box/sunsinks.ogg", -- 23
				duration = (60 * 1) + 32 -- 24
			}, -- 21
			{ -- 25
				name = "traipsing about although decline looms", -- 25
				artist = "box", -- 26
				path = "dysphoria/music/idle/box/traipsing.ogg", -- 27
				duration = (60 * 2) + 26 -- 28
			} -- 25
		}, -- 7
		dead = { -- 30
			{ -- 30
				name = "Ghost", -- 30
				artist = "Amanita", -- 31
				path = "placenta/music/ghost.ogg", -- 32
				duration = 114 -- 33
			} -- 30
		}, -- 29
		autostitcher = { -- 35
			{ -- 35
				name = "White Awakening (Cable Hogue Soundtrack, #1)", -- 35
				artist = "Les Rallizes Dénudés", -- 36
				path = "dysphoria/music/whitewaking/cablehogue1.ogg", -- 37
				duration = 319 -- 38
			}, -- 35
			{ -- 39
				name = "White Awakening (Cable Hogue Soundtrack, #2)", -- 39
				artist = "Les Rallizes Dénudés", -- 40
				path = "dysphoria/music/whitewaking/cablehogue2.ogg", -- 41
				duration = 400 -- 42
			}, -- 39
			{ -- 43
				name = "White Awakening (December's Black Children)", -- 43
				artist = "Les Rallizes Dénudés", -- 44
				path = "dysphoria/music/whitewaking/december.ogg", -- 45
				duration = 297 -- 46
			}, -- 43
			{ -- 47
				name = "White Awakening (Double Heads, Live)", -- 47
				artist = "Les Rallizes Dénudés", -- 48
				path = "dysphoria/music/whitewaking/doubleheads.ogg", -- 49
				duration = 382 -- 50
			}, -- 47
			{ -- 51
				name = "White Awakening (Great White Wonder)", -- 51
				artist = "Les Rallizes Dénudés", -- 52
				path = "dysphoria/music/whitewaking/greatwhitewonder.ogg", -- 53
				duration = 335 -- 54
			}, -- 51
			{ -- 55
				name = "White Awakening (Live at Housei University)", -- 55
				artist = "Les Rallizes Dénudés", -- 56
				path = "dysphoria/music/whitewaking/housei.ogg", -- 57
				duration = 502 -- 58
			}, -- 55
			{ -- 59
				name = "White Awakening (Live 1972)", -- 59
				artist = "Les Rallizes Dénudés", -- 60
				path = "dysphoria/music/whitewaking/live72.ogg", -- 61
				duration = 388 -- 62
			}, -- 59
			{ -- 63
				name = "White Awakening (Double Heads, Mars Studio)", -- 63
				artist = "Les Rallizes Dénudés", -- 64
				path = "dysphoria/music/whitewaking/marsstudiodoubleheads.ogg", -- 65
				duration = 398 -- 66
			}, -- 63
			{ -- 67
				name = "White Awakening (Naked Diza Star)", -- 67
				artist = "Les Rallizes Dénudés", -- 68
				path = "dysphoria/music/whitewaking/nakeddizastar.ogg", -- 69
				duration = 353 -- 70
			}, -- 67
			{ -- 71
				name = "White Awakening (Live at Meguro Rokumeikan, 1983)", -- 71
				artist = "Les Rallizes Dénudés", -- 72
				path = "dysphoria/music/whitewaking/rokumeikan83.ogg", -- 73
				duration = 661 -- 74
			}, -- 71
			{ -- 75
				name = "White Awakening (Live at Meguro Rokumeikan, Aug. 1984)", -- 75
				artist = "Les Rallizes Dénudés", -- 76
				path = "dysphoria/music/whitewaking/rokumeikan84.ogg", -- 77
				duration = 653 -- 78
			}, -- 75
			{ -- 79
				name = "White Awakening (Live at Meguro Rokumeikan, Apr. 1984)", -- 79
				artist = "Les Rallizes Dénudés", -- 80
				path = "dysphoria/music/whitewaking/rokumeikan84april.ogg", -- 81
				duration = 610 -- 82
			}, -- 79
			{ -- 83
				name = "White Awakening (Live at Meguro Rokumeikan, 1987)", -- 83
				artist = "Les Rallizes Dénudés", -- 84
				path = "dysphoria/music/whitewaking/rokumeikan87.ogg", -- 85
				duration = 437 -- 86
			}, -- 83
			{ -- 87
				name = "White Awakening (Studio and Soundboard, '73-77)", -- 87
				artist = "Les Rallizes Dénudés", -- 88
				path = "dysphoria/music/whitewaking/soundboard7377.ogg", -- 89
				duration = 301 -- 90
			}, -- 87
			{ -- 91
				name = "White Awakening (The OZ Tapes)", -- 91
				artist = "Les Rallizes Dénudés", -- 92
				path = "dysphoria/music/whitewaking/theoztapes.ogg", -- 93
				duration = 231 -- 94
			}, -- 91
			{ -- 95
				name = "White Awakening (Christmas Eve, 1994)", -- 95
				artist = "Les Rallizes Dénudés", -- 96
				path = "dysphoria/music/whitewaking/xmaseve94.ogg", -- 97
				duration = 584 -- 98
			}, -- 95
			{ -- 99
				name = "White Awakening (Live at Yaneura Shibuya, 1976)", -- 99
				artist = "Les Rallizes Dénudés", -- 100
				path = "dysphoria/music/whitewaking/yaneura76.ogg", -- 101
				duration = 283 -- 102
			}, -- 99
			{ -- 103
				name = "White Awakening (Live at Yaneura Shibuya, June 1979)", -- 103
				artist = "Les Rallizes Dénudés", -- 104
				path = "dysphoria/music/whitewaking/yaneura79.ogg", -- 105
				duration = 293 -- 106
			}, -- 103
			{ -- 107
				name = "White Awakening (Live at Yaneura Shibuya, April 1979)", -- 107
				artist = "Les Rallizes Dénudés", -- 108
				path = "dysphoria/music/whitewaking/yaneura79april.ogg", -- 109
				duration = 284 -- 110
			}, -- 107
			{ -- 111
				name = "White Awakening (Live at Yaneura Shibuya, 1980)", -- 111
				artist = "Les Rallizes Dénudés", -- 112
				path = "dysphoria/music/whitewaking/yaneura80.ogg", -- 113
				duration = 515 -- 114
			}, -- 111
			{ -- 115
				name = "White Awakening/Enter The Mirror (Live at Yaneura Shibuya, 1981)", -- 115
				artist = "Les Rallizes Dénudés", -- 116
				path = "dysphoria/music/whitewaking/yaneura81.ogg", -- 117
				duration = 482 -- 118
			} -- 115
		} -- 34
	}, -- 6
	CreateAmbient = function(self) -- 122
		local vol = 0.666 -- 123
		local songs = self.songs.living -- 124
		local lp = LocalPlayer() -- 125
		if not IsValid(lp) then -- 126
			return -- 126
		end -- 126
		local autostitcher = lp:GetNWEntity("evilrp_autostitcher", NULL) -- 127
		if IsValid(autostitcher) and autostitcher:GetPatient() == lp then -- 128
			songs = self.songs.autostitcher -- 129
		end -- 128
		if (not lp.Team) or lp:Team() == TEAM_GHOST then -- 130
			songs = self.songs.dead -- 131
		end -- 130
		local song = songs[math.random(1, #songs)] -- 133
		local path, duration = song.path, song.duration -- 134
		return sound.PlayFile("sound/" .. tostring(song.path), "noblock", function(amb) -- 135
			if IsValid(amb) then -- 136
				if IsValid(AMBIENCE) then -- 137
					AMBIENCE:Stop() -- 137
				end -- 137
				amb:SetVolume(vol) -- 139
				amb:Play() -- 140
				AMBIENCE = amb -- 141
				MsgC(Color(150, 150, 150), "Now playing ", Color(150, 220, 0), song.name, Color(150, 150, 150), ", by ", Color(150, 0, 150), song.artist, Color(150, 150, 150), "...\n") -- 143
				AMBIENCE_COOLDOWN = CurTime() + duration + math.random(6, 666) -- 154
			end -- 136
		end) -- 154
	end -- 122
} -- 5
if SERVER then -- 156
	util.AddNetworkString("evilrp_music_start") -- 157
	hook.Add("PlayerSpawn", "evilrp_music", function(ply) -- 158
		net.Start("evilrp_music_start") -- 159
		return net.Send(ply) -- 160
	end) -- 158
else -- 162
	net.Receive("evilrp_music_start", function(len, ply) -- 162
		if not timer.Exists("evilrp_ambient_music") then -- 163
			return timer.Create("evilrp_ambient_music", 5, 0, function() -- 164
				if AMBIENCE_COOLDOWN > CurTime() then -- 165
					return -- 165
				end -- 165
				return MUSIC:CreateAmbient() -- 166
			end) -- 166
		end -- 163
	end) -- 162
end -- 156
if CLIENT then -- 168
	if not table.IsEmpty(MUSIC.songs) then -- 169
		local _list_0 = MUSIC.songs -- 170
		for _index_0 = 1, #_list_0 do -- 170
			local data = _list_0[_index_0] -- 170
			util.PrecacheSound(data.path) -- 170
		end -- 170
	end -- 169
	local reset_music -- 171
	reset_music = function(ply) -- 171
		if IsValid(AMBIENCE) then -- 172
			AMBIENCE:Stop() -- 172
		end -- 172
		AMBIENCE_COOLDOWN = CurTime() -- 173
		return -- 174
	end -- 171
	return hook.Add("OnPlayerChangedTeam", "evilrp_reset_music", reset_music) -- 175
end -- 168
