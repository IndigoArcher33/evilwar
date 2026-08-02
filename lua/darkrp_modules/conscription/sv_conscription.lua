-- [yue]: darkrp_modules\conscription\sv_conscription.yue
conscript = function(ply) -- 2
	if not (ply:Team() == TEAM_PRIVATE) then -- 3
		return -- 3
	end -- 3
	local fate = TEAM_CONSCRIPT -- 4
	ply:Notify("<c=200,0,0> WAR IS HELL") -- 5
	ply:AddMoney(100) -- 6
	ply:AddDespair(-20) -- 7
	ply:ScreenFade(SCREENFADE.IN, Color(255, 0, 0), 2.5, 0) -- 8
	ply:changeTeam(fate) -- 9
	ply:Reflect() -- 10
	local snd = table.Random(RPExtraTeams[fate].become_sounds) -- 11
	ply:EmitSound(snd) -- 12
	return ply:EmitSound("npc/stalker/go_alert2.wav", 140, 40, 0.2) -- 13
end -- 2
