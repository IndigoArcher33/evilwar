AMBIENCE_COOLDOWN = AMBIENCE_COOLDOWN or 0
MUSIC = {
	songs = {
		living = {
			{
				name = "eclipsing",
				artist = "box",
				path = "dysphoria/music/idle/box/eclipsing.ogg",
				duration = (60 * 10) + 9
			},
			{
				name = "lucidity",
				artist = "box",
				path = "dysphoria/music/idle/box/lucidity.ogg",
				duration = (60 * 1) + 1
			},
			{
				name = "post awareness horrors",
				artist = "box",
				path = "dysphoria/music/idle/box/postawarenesshorrors.ogg",
				duration = (60 * 1) + 44
			},
			{
				name = "sun sinks",
				artist = "box",
				path = "dysphoria/music/idle/box/sunsinks.ogg",
				duration = (60 * 1) + 32
			},
			{
				name = "traipsing about although decline looms",
				artist = "box",
				path = "dysphoria/music/idle/box/traipsing.ogg",
				duration = (60 * 2) + 26
			}
		},
		dead = {
			{
				name = "Demon Engine",
				artist = "Ouroboros",
				path = "dysphoria/music/spectre/demonengine.ogg",
				duration = 481
			}
		},
		autostitcher = {
			{
				name = "White Awakening (Cable Hogue Soundtrack, #1)",
				artist = "Les Rallizes Dénudés",
				path = "dysphoria/music/whitewaking/cablehogue1.ogg",
				duration = 319
			},
			{
				name = "White Awakening (Cable Hogue Soundtrack, #2)",
				artist = "Les Rallizes Dénudés",
				path = "dysphoria/music/whitewaking/cablehogue2.ogg",
				duration = 400
			},
			{
				name = "White Awakening (December's Black Children)",
				artist = "Les Rallizes Dénudés",
				path = "dysphoria/music/whitewaking/december.ogg",
				duration = 297
			},
			{
				name = "White Awakening (Double Heads, Live)",
				artist = "Les Rallizes Dénudés",
				path = "dysphoria/music/whitewaking/doubleheads.ogg",
				duration = 382
			},
			{
				name = "White Awakening (Great White Wonder)",
				artist = "Les Rallizes Dénudés",
				path = "dysphoria/music/whitewaking/greatwhitewonder.ogg",
				duration = 335
			},
			{
				name = "White Awakening (Live at Housei University)",
				artist = "Les Rallizes Dénudés",
				path = "dysphoria/music/whitewaking/housei.ogg",
				duration = 502
			},
			{
				name = "White Awakening (Live 1972)",
				artist = "Les Rallizes Dénudés",
				path = "dysphoria/music/whitewaking/live72.ogg",
				duration = 388
			},
			{
				name = "White Awakening (Double Heads, Mars Studio)",
				artist = "Les Rallizes Dénudés",
				path = "dysphoria/music/whitewaking/marsstudiodoubleheads.ogg",
				duration = 398
			},
			{
				name = "White Awakening (Naked Diza Star)",
				artist = "Les Rallizes Dénudés",
				path = "dysphoria/music/whitewaking/nakeddizastar.ogg",
				duration = 353
			},
			{
				name = "White Awakening (Live at Meguro Rokumeikan, 1983)",
				artist = "Les Rallizes Dénudés",
				path = "dysphoria/music/whitewaking/rokumeikan83.ogg",
				duration = 661
			},
			{
				name = "White Awakening (Live at Meguro Rokumeikan, Aug. 1984)",
				artist = "Les Rallizes Dénudés",
				path = "dysphoria/music/whitewaking/rokumeikan84.ogg",
				duration = 653
			},
			{
				name = "White Awakening (Live at Meguro Rokumeikan, Apr. 1984)",
				artist = "Les Rallizes Dénudés",
				path = "dysphoria/music/whitewaking/rokumeikan84april.ogg",
				duration = 610
			},
			{
				name = "White Awakening (Live at Meguro Rokumeikan, 1987)",
				artist = "Les Rallizes Dénudés",
				path = "dysphoria/music/whitewaking/rokumeikan87.ogg",
				duration = 437
			},
			{
				name = "White Awakening (Studio and Soundboard, '73-77)",
				artist = "Les Rallizes Dénudés",
				path = "dysphoria/music/whitewaking/soundboard7377.ogg",
				duration = 301
			},
			{
				name = "White Awakening (The OZ Tapes)",
				artist = "Les Rallizes Dénudés",
				path = "dysphoria/music/whitewaking/theoztapes.ogg",
				duration = 231
			},
			{
				name = "White Awakening (Christmas Eve, 1994)",
				artist = "Les Rallizes Dénudés",
				path = "dysphoria/music/whitewaking/xmaseve94.ogg",
				duration = 584
			},
			{
				name = "White Awakening (Live at Yaneura Shibuya, 1976)",
				artist = "Les Rallizes Dénudés",
				path = "dysphoria/music/whitewaking/yaneura76.ogg",
				duration = 283
			},
			{
				name = "White Awakening (Live at Yaneura Shibuya, June 1979)",
				artist = "Les Rallizes Dénudés",
				path = "dysphoria/music/whitewaking/yaneura79.ogg",
				duration = 293
			},
			{
				name = "White Awakening (Live at Yaneura Shibuya, April 1979)",
				artist = "Les Rallizes Dénudés",
				path = "dysphoria/music/whitewaking/yaneura79april.ogg",
				duration = 284
			},
			{
				name = "White Awakening (Live at Yaneura Shibuya, 1980)",
				artist = "Les Rallizes Dénudés",
				path = "dysphoria/music/whitewaking/yaneura80.ogg",
				duration = 515
			},
			{
				name = "White Awakening/Enter The Mirror (Live at Yaneura Shibuya, 1981)",
				artist = "Les Rallizes Dénudés",
				path = "dysphoria/music/whitewaking/yaneura81.ogg",
				duration = 482
			}
		}
	},
	CreateAmbient = function(self)
		local vol = 0.666
		local songs = self.songs.living
		local lp = LocalPlayer()
		if not IsValid(lp) then
			return
		end
		local autostitcher = lp:GetNWEntity("evilrp_autostitcher", NULL)
		if IsValid(autostitcher) and autostitcher:GetPatient() == lp then
			songs = self.songs.autostitcher
		end
		if (not lp.Team) or lp:Team() == TEAM_GHOST then
			songs = self.songs.dead
		end
		local song = songs[math.random(1, #songs)]
		local path, duration = song.path, song.duration
		return sound.PlayFile("sound/" .. tostring(song.path), "noblock", function(amb)
			if IsValid(amb) then
				if IsValid(AMBIENCE) then
					AMBIENCE:Stop()
				end
				amb:SetVolume(vol)
				amb:Play()
				AMBIENCE = amb
				MsgC(Color(150, 150, 150), "Now playing ", Color(150, 220, 0), song.name, Color(150, 150, 150), ", by ", Color(150, 0, 150), song.artist, Color(150, 150, 150), "...\n")
				AMBIENCE_COOLDOWN = CurTime() + duration + math.random(6, 666)
			end
		end)
	end
}
if SERVER then
	util.AddNetworkString("evilrp_music_start")
	hook.Add("PlayerSpawn", "evilrp_music", function(ply)
		net.Start("evilrp_music_start")
		return net.Send(ply)
	end)
else
	net.Receive("evilrp_music_start", function(len, ply)
		if not timer.Exists("evilrp_ambient_music") then
			return timer.Create("evilrp_ambient_music", 5, 0, function()
				if AMBIENCE_COOLDOWN > CurTime() then
					return
				end
				return MUSIC:CreateAmbient()
			end)
		end
	end)
end
if CLIENT then
	if not table.IsEmpty(MUSIC.songs) then
		local _list_0 = MUSIC.songs
		for _index_0 = 1, #_list_0 do
			local data = _list_0[_index_0]
			util.PrecacheSound(data.path)
		end
	end
	local reset_music
	reset_music = function(ply)
		if IsValid(AMBIENCE) then
			AMBIENCE:Stop()
		end
		AMBIENCE_COOLDOWN = CurTime()
		return
	end
	return hook.Add("OnPlayerChangedTeam", "evilrp_reset_music", reset_music)
end
