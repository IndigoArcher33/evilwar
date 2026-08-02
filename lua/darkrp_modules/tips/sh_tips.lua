-- [yue]: darkrp_modules\tips\sh_tips.yue
local hints = { -- 2
	"Despair distorts your vision and the stability of text.", -- 2
	"As a ghost, pressing R will teleport you somewhere else, such as if you get stuck.", -- 3
	"As a ghost, you can fly by jumping while holding SHIFT.", -- 4
	"It's only a crime if the authorities see it.", -- 5
	"Right click on a fallen body with empty hands in order to pick it up.", -- 6
	"Your needs are not suggestions; maxing out any of them will kill you.", -- 7
	"Under some circumstances, death may incur loss of stem cells.", -- 8
	"You can be horrible, but it can mean even more to be friendly.", -- 9
	"Death will not lower your needs in the majority of cases.", -- 10
	"Pressing F4 or opening the context menu (on the C key by default) can bring up multiple options for interacting with some objects.", -- 11
	"It's better to be interesting than perfect.", -- 12
	"It's better to be pissed off than pissed on.", -- 13
	"There's no use crying over spilled blood.", -- 14
	"Press F3 to access your inventory; inside, left clicking on an item will use it while right clicking on one will drop it.", -- 15
	"You can estimate your remaining ammo for an equipped weapon by holding the USE key and pressing your RELOAD key.", -- 16
	"When the world shakes and howls, that means the game's code was altered -- something changed.", -- 17
	"Stem cells are kept between the world's reincarnations, unlike your bones and your items. They're nice to have and painful to lose.", -- 18
	"You don't have to be the one to push the buttons; stocking the facilities is arguably more helpful.", -- 19
	"Admin abuse can, will, and does happen.", -- 20
	"Press B to whip it out.", -- 21
	"Voice communication is permanently disabled.", -- 22
	"Does this game offend your senses? It has a variety of options you can customize. Try opening the developer's console and look for console variables that begin with <c=0,200,0>lfr_<c=0,200,200>." -- 23
} -- 1
if CLIENT then -- 25
	CreateClientConVar("lfr_hints", 1, true, true, "Toggle whether hints display each time you become a ghost.") -- 26
end -- 25
local meta = FindMetaTable("Player") -- 28
meta.TakeAHint = function(self) -- 30
	return self:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,200,200>" .. tostring(hints[math.random(#hints)])) -- 31
end -- 30
meta.Reflect = function(self) -- 33
	local job = RPExtraTeams[self:Team()] -- 34
	if job and isfunction(job.Reflect) then -- 35
		return job.Reflect(self) -- 35
	end -- 35
end -- 33
hook.Add("PlayerSpawn", "evilrp_hints", function(ply) -- 38
	if not (ply:GetInfoNum("lfr_hints", 1) == 1) then -- 39
		return -- 39
	end -- 39
	return timer.Simple(3, function() -- 40
		if not (ply and IsValid(ply)) then -- 41
			return -- 41
		end -- 41
		if not ply:Alive() then -- 42
			return -- 42
		end -- 42
		if not ply.got_first_hint then -- 43
			ply.got_first_hint = true -- 44
			ply:SendChat("GENERIC", "<f=Spleen_Chat><c=128,128,128> You are a ghost, a lost soul in this forsaken world. You can teleport to certain areas with the R key, find a body to possess.") -- 45
			return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,100,100>[ <c=0,200,200>You can press F1 to receive information on your current fate in life, at any time. <c=0,100,100>]") -- 46
		end -- 43
	end) -- 46
end) -- 38
return hook.Add("ShowHelp", "evilrp_hints", function(ply) -- 48
	if not SERVER then -- 49
		return -- 49
	end -- 49
	if not ply:Alive() then -- 50
		return -- 50
	end -- 50
	if ply:Team() == TEAM_GHOST then -- 51
		return ply:TakeAHint() -- 52
	else -- 54
		return ply:Reflect() -- 54
	end -- 51
end) -- 54
