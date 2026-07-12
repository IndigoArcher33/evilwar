-- [yue]: /home/danku/darkrpmodification/lua/darkrp_modules/hobo/sv_hobo.yue
local random = math.random -- 1
local sounds = { -- 4
	{ -- 4
		range = 14, -- 4
		path = "npc/zombie/zombie_voice_idle" -- 5
	}, -- 4
	{ -- 6
		range = 6, -- 6
		path = "npc/zombie/zombie_pain" -- 7
	}, -- 6
	{ -- 8
		range = 3, -- 8
		path = "npc/zombie/zombie_alert" -- 9
	} -- 8
} -- 3
local truths = { -- 12
	"Life is life, but don't forget death.", -- 12
	"Help! Oh god, help!", -- 13
	"I'm getting scared.", -- 14
	"It hurts when I open my eyes.", -- 15
	"Upon this rock, his legend will never rot or decay.", -- 16
	"It didn't hurt a bit when they pulled my teeth out!", -- 17
	"Dinosaurs are my best friends.", -- 18
	"Through thick and thin, 'til the very end.", -- 19
	"In my mind, I'm dying.", -- 20
	"1962 was a long time ago.", -- 21
	"Sometimes, I dream about cheese.", -- 22
	"Congratulations.", -- 23
	"I can hear you grinning.", -- 24
	"He's right, you know.", -- 25
	"True story.", -- 26
	"You have to ask yourself if this is necessary.", -- 27
	"Failure is never an option.", -- 28
	"Failure is sometimes an option.", -- 29
	"Failure is always an option.", -- 30
	"Liver Failure Forever!", -- 31
	"Help? Please?", -- 32
	"A pure white awakening opens my eyes.", -- 33
	"Hey buddy!", -- 34
	"My soul is a cavern of lies.", -- 35
	"His life reduced to the length of a cigarette break.", -- 36
	"I don't want to talk about it.", -- 37
	"Doom.", -- 38
	"Despair.", -- 39
	"Demise.", -- 40
	"You can't trust me. I don't even trust myself.", -- 41
	"Reach for my neck, you'll get turned into an example.", -- 42
	"Call me insomniac.", -- 43
	"There's no room for rest when you're paving the road with blood.", -- 44
	"Migraine tried to split me.", -- 45
	"Crimson canvassing.", -- 46
	"My psyche's a slaughterhouse.", -- 47
	"They call me gravebringer.", -- 48
	"I'm birthing the next unanswered prayer.", -- 49
	"Caught a carnal tearing at my wounds.", -- 50
	"Let's just say he was gnawing by the end.", -- 51
	"Rainmakers can't touch my thunder.", -- 52
	"I am the STORM.", -- 53
	"Obsidian wraith.", -- 54
	"Radworms squirm in my core.", -- 55
	"They say the cyberware's too extensive.", -- 56
	"I tell them that it's never enough.", -- 57
	"I led my own witch hunt.", -- 58
	"Corpses in my basement, blood on every knife.", -- 59
	"They call me a psycho, and they're right.", -- 60
	"I'm the one who put it there.", -- 61
	"Cancerous culture.", -- 62
	"Still I sip the apocalypse.", -- 63
	"They said 'get a life', I said 'already got thirteen'.", -- 64
	"Hogged up in this scandal.", -- 65
	"Call me the night scum.", -- 66
	"Beware, for I am the reaper.", -- 67
	"Your time is borrowed, and I am here to collect.", -- 68
	"Unseen horror? That's me.", -- 69
	"I'm the terror no light can touch.", -- 70
	"Rage in my nerves.", -- 71
	"They tried to put me in the autostitcher. Now it rests in pieces.", -- 72
	"Out of my way! I'm drunk as hell!", -- 73
	"If you can't beat 'em, eat 'em.", -- 74
	"Fate has dealt a cruel hand.", -- 75
	"I haven't had meat like this since the meat wars.", -- 76
	"Out of the way, bitch! Get out of the way!", -- 77
	"I'll air this bitch out!", -- 78
	"I want my fuckin' bones!", -- 79
	"I'm not necessarily safe to be around.", -- 80
	"I don't give a fuck about none of this.", -- 81
	"I started this shit.", -- 82
	"Get out of my head!", -- 83
	"I want to die.", -- 84
	"I love you.", -- 85
	"Sometimes I dream about falling into the incinerator.", -- 86
	"Never kill yourself.", -- 87
	"Despite all of this, I think everything will be okay in the end.", -- 88
	"I hate all of you, I hate myself, I hate the dirt for making me.", -- 89
	"I can't stand the ringing in my ears anymore.", -- 90
	"Sometimes, the pain gets to you, and you can't help it.", -- 91
	"This is it, I just know it.", -- 92
	"Sometimes it feels like my eyes are cut and bleeding, but they aren't.", -- 93
	"When is it all going to end?", -- 94
	"We all love it here, don't we?", -- 95
	"There's no moral center in this country.", -- 96
	"This is a crazy world, filled with crazy people, and I hate it.", -- 97
	"I wish I was dead in the ground.", -- 98
	"This war in the mind must end.", -- 99
	"I'm sick all the time.", -- 100
	"I can't see anything when I wake up.", -- 101
	"I feel terrible.", -- 102
	"I feel awful.", -- 103
	"This whole world is just run by boneheads.", -- 104
	"All we can do is lay on the ground and shovel dirt into our mouths.", -- 105
	"These boneheads are out of control, and nobody's doing anything about it!", -- 106
	"Sotla's gaze, I can't fucking tell anymore.", -- 107
	"Something needs to be done.", -- 108
	"I can't see myself when I look in the mirror.", -- 109
	"If you're interested, I'd like to take you to the candy shop.", -- 110
	"You're with me, or you're against me.", -- 111
	"If the dealer is out of booze, I just don't know what I'm going to do.", -- 112
	"I need to salivate!", -- 113
	"There's too many of you, and I don't have enough time.", -- 114
	"Don't bring that Septian freak over to my house.", -- 115
	"Time is fleeting.", -- 116
	"That's not how that's supposed to taste." -- 117
} -- 11
local tell_the_truth -- 120
tell_the_truth = function(ply) -- 120
	if ply:EntIndex() == 0 then -- 121
		return -- 121
	end -- 121
	if not ply.nospamtime then -- 122
		ply.nospamtime = CurTime() - 2 -- 122
	end -- 122
	if CurTime() < (ply.nospamtime + 3.3) then -- 128
		return -- 128
	end -- 128
	ply.nospamtime = CurTime() -- 130
	local snd = sounds[random(1, #sounds)] -- 132
	ply:EmitSound(tostring(snd.path) .. tostring(random(1, snd.range)) .. ".wav", 100, 100) -- 133
	local bar = truths[random(1, #truths)] -- 135
	return ply:ConCommand("say " .. tostring(bar)) -- 136
end -- 120
return concommand.Add("tell_the_truth", tell_the_truth) -- 138
