local random, min = math.random, math.min
local hallucinations = {
	Material("placenta/postal1.png"),
	Material("placenta/postal2.png"),
	Material("placenta/postal3.png"),
	Material("placenta/postal4.png"),
	Material("placenta/postal5.png"),
	Material("placenta/postal6.png"),
	Material("placenta/postal7.png"),
	Material("placenta/postal8.png"),
	Material("placenta/postal9.png"),
	Material("placenta/postal10.png"),
	Material("placenta/postal11.png"),
	Material("placenta/postal12.png"),
	Material("placenta/postal13.png"),
	Material("placenta/postal14.png"),
	Material("placenta/postal15.png"),
	Material("placenta/postal16.png"),
	Material("placenta/postal17.png"),
	Material("placenta/postal18.png"),
	Material("placenta/postal19.png"),
	Material("placenta/postal20.png"),
	Material("placenta/postal21.png"),
	Material("placenta/postal22.png"),
	Material("placenta/postal23.png"),
	Material("placenta/postal24.png"),
	Material("placenta/postal25.png"),
	Material("placenta/postal26.png"),
	Material("placenta/postal27.png"),
	Material("placenta/eyes.png"),
	Material("placenta/eyes2.png"),
	Material("placenta/sisters.png"),
	Material("placenta/garalina.png"),
	Material("placenta/hands.png"),
	Material("placenta/claws.png"),
	Material("placenta/girl.png"),
	Material("placenta/shower.png"),
	Material("placenta/sisters.png"),
	Material("placenta/moviegoers.png"),
	Material("placenta/mary.png"),
	Material("placenta/watcher.png"),
	Material("placenta/sink.png"),
	Material("placenta/teeth.png"),
	Material("placenta/mask.png"),
	Material("placenta/hiding.png"),
	Material("placenta/door.png"),
	Material("placenta/comehome.png"),
	Material("placenta/seer.png"),
	Material("placenta/bestfriend.png"),
	Material("placenta/shadowpeople.png"),
	Material("placenta/soulseeker.png"),
	Material("placenta/furry.png"),
	Material("placenta/piercing.png"),
	Material("placenta/trauma.png"),
	Material("placenta/fear.png"),
	Material("placenta/joy.png"),
	Material("placenta/fallingaway.png"),
	Material("placenta/finaltrip.png"),
	Material("placenta/biter.png")
}
local scary_sounds = {
	"ambient/creatures/town_child_scream1.wav",
	"ambient/creatures/town_moan1.wav",
	"ambient/creatures/town_muffled_cry1.wav",
	"ambient/creatures/town_scared_breathing1.wav",
	"ambient/creatures/town_scared_breathing2.wav",
	"ambient/creatures/town_scared_sob1.wav",
	"ambient/creatures/town_scared_sob2.wav",
	"ambient/creatures/town_zombie_call1.wav",
	"placenta/tormented.wav",
	"placenta/frighten1.wav",
	"placenta/frighten2.wav",
	"placenta/frighten3.wav",
	"placenta/frighten4.wav",
	"placenta/comic1.ogg",
	"placenta/comic2.ogg",
	"placenta/comic3.ogg",
	"placenta/comic4.ogg"
}
local sotla = Material("placenta/sotla.png")
for k, v in pairs({
	Judgement = function(self, snd)
		self.HallucinateStart = CurTime()
		self.Hallucination = sotla
		self.HallucinateAlpha = 2.5
		local lp = LocalPlayer()
		util.ScreenShake(lp:GetPos(), 25, 5, 3, 5000)
		if snd then
			lp:EmitSound(snd, 60, random(60, 80))
		else
		end
		timer.Simple(0.2, function()
			return lp:SetDSP(28)
		end)
		return timer.Simple(0.5, function()
			return lp:SetDSP(0)
		end)
	end,
	Jumpscare = function(self, snd)
		for _index_0 = 1, #hallucinations do
			local v = hallucinations[_index_0]
			if type(v) == "number" then
				table.RemoveByValue(hallucinations, v)
			end
		end
		self.HallucinateStart = CurTime()
		self.Hallucination = table.Random(hallucinations)
		self.HallucinateDouble = true
		self.HallucinateAlpha = 1.5
		local lp = LocalPlayer()
		if snd then
			lp:EmitSound(snd, 60, random(60, 80))
		else
			lp:EmitSound("placenta/jumpscare" .. tostring(min(random(1, 7), 7)) .. ".wav", 60, random(60, 80))
		end
		timer.Simple(0.2, function()
			return lp:SetDSP(28)
		end)
		return timer.Simple(0.5, function()
			return lp:SetDSP(0)
		end)
	end,
	Frighten = function(self, snd)
		for _index_0 = 1, #hallucinations do
			local v = hallucinations[_index_0]
			if type(v) == "number" then
				table.RemoveByValue(hallucinations, v)
			end
		end
		self.HallucinateStart = CurTime()
		self.Hallucination = table.Random(hallucinations)
		self.HallucinateDouble = false
		self.HallucinateAlpha = 1
		local lp = LocalPlayer()
		if snd then
			lp:EmitSound(snd, 60, random(60, 80))
		else
			snd = table.Random(scary_sounds)
			lp:EmitSound(snd, 60, random(60, 80))
		end
		timer.Simple(0.2, function()
			return lp:SetDSP(28)
		end)
		return timer.Simple(0.5, function()
			return lp:SetDSP(0)
		end)
	end,
	DrawDamage = function(self)
		local lp = LocalPlayer()
		if self.FlashRedStart and lp:Alive() then
			local t = CurTime() - self.FlashRedStart
			local a = 0
			if t < .1 then
				a = .5
			elseif t > .6 then
				a = .5 - (t - .1)
			end
			if a > 0 then
				surface.SetDrawColor(128, 0, 0, 255 * a)
				surface.DrawRect(0, 0, ScrW(), ScrH())
			end
		end
		if self.HallucinateStart then
			local t = CurTime() - self.HallucinateStart
			local a = 0
			local contrast = 0
			local blur = 0
			local cmod = 0
			local rmod = 0
			if t < .1 then
				a = 1
				if self.HallucinateAlpha then
					a = self.HallucinateAlpha
				end
			elseif t < 5 then
				a = 1 - ((t - 0.1) / 2)
				if self.HallucinateAlpha then
					a = self.HallucinateAlpha - ((t - 0.1) / 2)
				end
			end
			if a > 0 then
				surface.SetMaterial(self.Hallucination)
				surface.SetDrawColor(255, 255, 255, 255 * a)
				surface.DrawTexturedRect(0, 0, ScrW(), ScrH())
			end
			if t < .1 then
				contrast = 3
			elseif t < 6 then
				contrast = 3 - (t - 2)
			end
			if contrast > 0 and (self.HallucinateAlpha > 1) then
				DrawSharpen(contrast, contrast * 10)
			end
			if t < .1 then
				blur = 1
			elseif t < 6 then
				blur = 1 - (t - 2)
			end
			if blur > 0 then
				return DrawMotionBlur(blur, .3, .01)
			end
		end
	end
}) do
	GAMEMODE[k] = v
end
net.Receive("evilrp_frighten", function(len)
	return GAMEMODE:Frighten()
end)
net.Receive("evilrp_jumpscare", function(len)
	return GAMEMODE:Jumpscare()
end)
net.Receive("evilrp_judgement", function(len)
	return GAMEMODE:Judgement()
end)
net.Receive("evilrp_flashred", function(len)
	GAMEMODE.FlashRedStart = CurTime()
end)
hook.Add("HUDPaint", "evilrp_draw_damage", function()
	GAMEMODE:DrawDamage()
	return
end)
local shut_up = {
	"Shut up.",
	"Up yours.",
	"Be QUIET.",
	"Nobody wants to hear your voice.",
	"Voice chat is disabled forever.",
	"No.",
	"Shh.",
	"Silence.",
	"I have no mouth and I must scream.",
	"You are so... talk so much.",
	"Your voice is so <wiggle>fucking</wiggle> irritating."
}
return hook.Add("PlayerStartVoice", "evilrp_no_voice_chat", function()
	GAMEMODE:Frighten()
	local shut = shut_up[math.random(#shut_up)]
	lp:SendChat("ERROR", shut)
	return true
end)
