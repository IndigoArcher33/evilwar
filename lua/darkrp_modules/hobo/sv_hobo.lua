local random = math.random
local sounds = {
	{
		range = 14,
		path = "npc/zombie/zombie_voice_idle"
	},
	{
		range = 6,
		path = "npc/zombie/zombie_pain"
	},
	{
		range = 3,
		path = "npc/zombie/zombie_alert"
	}
}
local truths = {
	"Life is life, but don't forget death.",
	"Help! Oh god, help!",
	"I'm getting scared.",
	"It hurts when I open my eyes.",
	"Upon this rock, his legend will never rot or decay.",
	"It didn't hurt a bit when they pulled my teeth out!",
	"Dinosaurs are my best friends.",
	"Through thick and thin, 'til the very end.",
	"In my mind, I'm dying.",
	"1962 was a long time ago.",
	"Sometimes, I dream about cheese.",
	"Congratulations.",
	"I can hear you grinning.",
	"He's right, you know.",
	"True story.",
	"You have to ask yourself if this is necessary.",
	"Failure is never an option.",
	"Failure is sometimes an option.",
	"Failure is always an option.",
	"Liver Failure Forever!",
	"Help? Please?",
	"A pure white awakening opens my eyes.",
	"Hey buddy!",
	"My soul is a cavern of lies.",
	"His life reduced to the length of a cigarette break.",
	"I don't want to talk about it.",
	"Doom.",
	"Despair.",
	"Demise.",
	"You can't trust me. I don't even trust myself.",
	"Reach for my neck, you'll get turned into an example.",
	"Call me insomniac.",
	"There's no room for rest when you're paving the road with blood.",
	"Migraine tried to split me.",
	"Crimson canvassing.",
	"My psyche's a slaughterhouse.",
	"They call me gravebringer.",
	"I'm birthing the next unanswered prayer.",
	"Caught a carnal tearing at my wounds.",
	"Let's just say he was gnawing by the end.",
	"Rainmakers can't touch my thunder.",
	"I am the STORM.",
	"Obsidian wraith.",
	"Radworms squirm in my core.",
	"They say the cyberware's too extensive.",
	"I tell them that it's never enough.",
	"I led my own witch hunt.",
	"Corpses in my basement, blood on every knife.",
	"They call me a psycho, and they're right.",
	"I'm the one who put it there.",
	"Cancerous culture.",
	"Still I sip the apocalypse.",
	"They said 'get a life', I said 'already got thirteen'.",
	"Hogged up in this scandal.",
	"Call me the night scum.",
	"Beware, for I am the reaper.",
	"Your time is borrowed, and I am here to collect.",
	"Unseen horror? That's me.",
	"I'm the terror no light can touch.",
	"Rage in my nerves.",
	"They tried to put me in the autostitcher. Now it rests in pieces.",
	"Out of my way! I'm drunk as hell!",
	"If you can't beat 'em, eat 'em.",
	"Fate has dealt a cruel hand.",
	"I haven't had meat like this since the meat wars.",
	"Out of the way, bitch! Get out of the way!",
	"I'll air this bitch out!",
	"I want my fuckin' bones!",
	"I'm not necessarily safe to be around.",
	"I don't give a fuck about none of this.",
	"I started this shit.",
	"Get out of my head!",
	"I want to die.",
	"I love you.",
	"Sometimes I dream about falling into the incinerator.",
	"Never kill yourself.",
	"Despite all of this, I think everything will be okay in the end.",
	"I hate all of you, I hate myself, I hate the dirt for making me.",
	"I can't stand the ringing in my ears anymore.",
	"Sometimes, the pain gets to you, and you can't help it.",
	"This is it, I just know it.",
	"Sometimes it feels like my eyes are cut and bleeding, but they aren't.",
	"When is it all going to end?",
	"We all love it here, don't we?",
	"There's no moral center in this country.",
	"This is a crazy world, filled with crazy people, and I hate it.",
	"I wish I was dead in the ground.",
	"This war in the mind must end.",
	"I'm sick all the time.",
	"I can't see anything when I wake up.",
	"I feel terrible.",
	"I feel awful.",
	"This whole world is just run by boneheads.",
	"All we can do is lay on the ground and shovel dirt into our mouths.",
	"These boneheads are out of control, and nobody's doing anything about it!",
	"Sotla's gaze, I can't fucking tell anymore.",
	"Something needs to be done.",
	"I can't see myself when I look in the mirror.",
	"If you're interested, I'd like to take you to the candy shop.",
	"You're with me, or you're against me.",
	"If the dealer is out of booze, I just don't know what I'm going to do.",
	"I need to salivate!",
	"There's too many of you, and I don't have enough time.",
	"Don't bring that Septian freak over to my house.",
	"Time is fleeting.",
	"That's not how that's supposed to taste."
}
local tell_the_truth
tell_the_truth = function(ply)
	if ply:EntIndex() == 0 then
		return
	end
	if not ply.nospamtime then
		ply.nospamtime = CurTime() - 2
	end
	if CurTime() < (ply.nospamtime + 3.3) then
		return
	end
	ply.nospamtime = CurTime()
	local snd = sounds[random(1, #sounds)]
	ply:EmitSound(tostring(snd.path) .. tostring(random(1, snd.range)) .. ".wav", 100, 100)
	local bar = truths[random(1, #truths)]
	return ply:ConCommand("say " .. tostring(bar))
end
return concommand.Add("tell_the_truth", tell_the_truth)
