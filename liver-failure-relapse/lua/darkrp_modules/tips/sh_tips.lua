-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/tips/sh_tips.yue
local hints = { -- 2
	"Despair distorts your vision and the stability of text.", -- 2
	"As a ghost, pressing R will teleport you somewhere else, such as if you get stuck.", -- 3
	"As a ghost, you can fly by jumping while holding SHIFT.", -- 4
	"It's only a crime if the authorities see it.", -- 5
	"Right click on a fallen body with empty hands in order to pick it up.", -- 6
	"Your needs are not suggestions; maxing out any of them will kill you.", -- 7
	"Death incurs a loss of a stem cell. Under more regrettable circumstances, you'll lose more than one.", -- 8
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
hook.Add("PlayerSpawn", "evilrp_hints", function(ply) -- 33
	if not (ply:GetInfoNum("lfr_hints", 1) == 1) then -- 34
		return -- 34
	end -- 34
	return timer.Simple(3, function() -- 35
		if not (ply and IsValid(ply)) then -- 36
			return -- 36
		end -- 36
		if not ply:Alive() then -- 37
			return -- 37
		end -- 37
		if not (ply:Team() == TEAM_GHOST) then -- 38
			return -- 38
		end -- 38
		ply:TakeAHint() -- 39
		if not ply.got_first_hint then -- 40
			ply.got_first_hint = true -- 41
			ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,100,100>[ <c=0,200,200>You can change whether you receive these hints with console variable <c=0,200,0>lfr_hints<c=0,200,200>. <c=0,100,100>]") -- 42
			return ply:SendChat("GENERIC", "<f=Spleen_Chat_Small><c=0,100,100>[ <c=0,200,200>While a ghost, you can press F1 to take another hint. <c=0,100,100>]") -- 43
		end -- 40
	end) -- 43
end) -- 33
return hook.Add("ShowHelp", "evilrp_hints", function(ply) -- 45
	if not SERVER then -- 46
		return -- 46
	end -- 46
	if not (ply:Team() == TEAM_GHOST) then -- 47
		return -- 47
	end -- 47
	if not ply:Alive() then -- 48
		return -- 48
	end -- 48
	return ply:TakeAHint() -- 49
end) -- 49
