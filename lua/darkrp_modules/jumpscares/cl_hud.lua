-- [yue]: darkrp_modules\jumpscares\cl_hud.yue
local random, min = math.random, math.min -- 1
local hallucinations = { -- 4
	Material("placenta/postal1.png"), -- 4
	Material("placenta/postal2.png"), -- 5
	Material("placenta/postal3.png"), -- 6
	Material("placenta/postal4.png"), -- 7
	Material("placenta/postal5.png"), -- 8
	Material("placenta/postal6.png"), -- 9
	Material("placenta/postal7.png"), -- 10
	Material("placenta/postal8.png"), -- 11
	Material("placenta/postal9.png"), -- 12
	Material("placenta/postal10.png"), -- 13
	Material("placenta/postal11.png"), -- 14
	Material("placenta/postal12.png"), -- 15
	Material("placenta/postal13.png"), -- 16
	Material("placenta/postal14.png"), -- 17
	Material("placenta/postal15.png"), -- 18
	Material("placenta/postal16.png"), -- 19
	Material("placenta/postal17.png"), -- 20
	Material("placenta/postal18.png"), -- 21
	Material("placenta/postal19.png"), -- 22
	Material("placenta/postal20.png"), -- 23
	Material("placenta/postal21.png"), -- 24
	Material("placenta/postal22.png"), -- 25
	Material("placenta/postal23.png"), -- 26
	Material("placenta/postal24.png"), -- 27
	Material("placenta/postal25.png"), -- 28
	Material("placenta/postal26.png"), -- 29
	Material("placenta/postal27.png"), -- 30
	Material("placenta/eyes.png"), -- 31
	Material("placenta/eyes2.png"), -- 32
	Material("placenta/sisters.png"), -- 33
	Material("placenta/garalina.png"), -- 34
	Material("placenta/hands.png"), -- 35
	Material("placenta/claws.png"), -- 36
	Material("placenta/girl.png"), -- 37
	Material("placenta/shower.png"), -- 38
	Material("placenta/sisters.png"), -- 39
	Material("placenta/moviegoers.png"), -- 40
	Material("placenta/mary.png"), -- 41
	Material("placenta/watcher.png"), -- 42
	Material("placenta/sink.png"), -- 43
	Material("placenta/teeth.png"), -- 44
	Material("placenta/mask.png"), -- 45
	Material("placenta/hiding.png"), -- 46
	Material("placenta/door.png"), -- 47
	Material("placenta/comehome.png"), -- 48
	Material("placenta/seer.png"), -- 49
	Material("placenta/bestfriend.png"), -- 50
	Material("placenta/shadowpeople.png"), -- 51
	Material("placenta/soulseeker.png"), -- 52
	Material("placenta/furry.png"), -- 53
	Material("placenta/piercing.png"), -- 54
	Material("placenta/trauma.png"), -- 55
	Material("placenta/fear.png"), -- 56
	Material("placenta/joy.png"), -- 57
	Material("placenta/fallingaway.png"), -- 58
	Material("placenta/finaltrip.png"), -- 59
	Material("placenta/biter.png") -- 60
} -- 3
local scary_sounds = { -- 64
	"ambient/creatures/town_child_scream1.wav", -- 64
	"ambient/creatures/town_moan1.wav", -- 65
	"ambient/creatures/town_muffled_cry1.wav", -- 66
	"ambient/creatures/town_scared_breathing1.wav", -- 67
	"ambient/creatures/town_scared_breathing2.wav", -- 68
	"ambient/creatures/town_scared_sob1.wav", -- 69
	"ambient/creatures/town_scared_sob2.wav", -- 70
	"ambient/creatures/town_zombie_call1.wav", -- 71
	"placenta/tormented.wav", -- 72
	"placenta/frighten1.wav", -- 73
	"placenta/frighten2.wav", -- 74
	"placenta/frighten3.wav", -- 75
	"placenta/frighten4.wav", -- 76
	"placenta/comic1.ogg", -- 77
	"placenta/comic2.ogg", -- 78
	"placenta/comic3.ogg", -- 79
	"placenta/comic4.ogg" -- 80
} -- 63
local sotla = Material("placenta/sotla.png") -- 82
for k, v in pairs({ -- 84
	Judgement = function(self, snd) -- 84
		self.HallucinateStart = CurTime() -- 85
		self.Hallucination = sotla -- 86
		self.HallucinateAlpha = 2.5 -- 87
		local lp = LocalPlayer() -- 89
		util.ScreenShake(lp:GetPos(), 25, 5, 3, 5000) -- 90
		if snd then -- 91
			lp:EmitSound(snd, 60, random(60, 80)) -- 92
		else -- 94
		end -- 91
		timer.Simple(0.2, function() -- 97
			return lp:SetDSP(28) -- 97
		end) -- 97
		return timer.Simple(0.5, function() -- 98
			return lp:SetDSP(0) -- 98
		end) -- 98
	end, -- 84
	Jumpscare = function(self, snd) -- 101
		for _index_0 = 1, #hallucinations do -- 104
			local v = hallucinations[_index_0] -- 104
			if type(v) == "number" then -- 105
				table.RemoveByValue(hallucinations, v) -- 105
			end -- 105
		end -- 105
		self.HallucinateStart = CurTime() -- 107
		self.Hallucination = table.Random(hallucinations) -- 108
		self.HallucinateDouble = true -- 109
		self.HallucinateAlpha = 1.5 -- 110
		local lp = LocalPlayer() -- 112
		if snd then -- 114
			lp:EmitSound(snd, 60, random(60, 80)) -- 115
		else -- 117
			lp:EmitSound("placenta/jumpscare" .. tostring(min(random(1, 7), 7)) .. ".wav", 60, random(60, 80)) -- 118
		end -- 114
		timer.Simple(0.2, function() -- 120
			return lp:SetDSP(28) -- 120
		end) -- 120
		return timer.Simple(0.5, function() -- 121
			return lp:SetDSP(0) -- 121
		end) -- 121
	end, -- 101
	Frighten = function(self, snd) -- 123
		for _index_0 = 1, #hallucinations do -- 126
			local v = hallucinations[_index_0] -- 126
			if type(v) == "number" then -- 127
				table.RemoveByValue(hallucinations, v) -- 127
			end -- 127
		end -- 127
		self.HallucinateStart = CurTime() -- 129
		self.Hallucination = table.Random(hallucinations) -- 130
		self.HallucinateDouble = false -- 131
		self.HallucinateAlpha = 1 -- 132
		local lp = LocalPlayer() -- 134
		if snd then -- 136
			lp:EmitSound(snd, 60, random(60, 80)) -- 137
		else -- 139
			snd = table.Random(scary_sounds) -- 139
			lp:EmitSound(snd, 60, random(60, 80)) -- 140
		end -- 136
		timer.Simple(0.2, function() -- 142
			return lp:SetDSP(28) -- 142
		end) -- 142
		return timer.Simple(0.5, function() -- 143
			return lp:SetDSP(0) -- 143
		end) -- 143
	end, -- 123
	DrawDamage = function(self) -- 144
		local lp = LocalPlayer() -- 145
		if self.FlashRedStart and lp:Alive() then -- 146
			local t = CurTime() - self.FlashRedStart -- 147
			local a = 0 -- 148
			if t < .1 then -- 150
				a = .5 -- 151
			elseif t > .6 then -- 152
				a = .5 - (t - .1) -- 153
			end -- 150
			if a > 0 then -- 155
				surface.SetDrawColor(128, 0, 0, 255 * a) -- 156
				surface.DrawRect(0, 0, ScrW(), ScrH()) -- 157
			end -- 155
		end -- 146
		if self.HallucinateStart then -- 159
			local t = CurTime() - self.HallucinateStart -- 160
			local a = 0 -- 161
			local contrast = 0 -- 162
			local blur = 0 -- 163
			local cmod = 0 -- 164
			local rmod = 0 -- 165
			if t < .1 then -- 167
				a = 1 -- 168
				if self.HallucinateAlpha then -- 169
					a = self.HallucinateAlpha -- 169
				end -- 169
			elseif t < 5 then -- 170
				a = 1 - ((t - 0.1) / 2) -- 171
				if self.HallucinateAlpha then -- 172
					a = self.HallucinateAlpha - ((t - 0.1) / 2) -- 172
				end -- 172
			end -- 167
			if a > 0 then -- 174
				surface.SetMaterial(self.Hallucination) -- 175
				surface.SetDrawColor(255, 255, 255, 255 * a) -- 176
				surface.DrawTexturedRect(0, 0, ScrW(), ScrH()) -- 177
			end -- 174
			if t < .1 then -- 179
				contrast = 3 -- 180
			elseif t < 6 then -- 181
				contrast = 3 - (t - 2) -- 182
			end -- 179
			if contrast > 0 and (self.HallucinateAlpha > 1) then -- 184
				DrawSharpen(contrast, contrast * 10) -- 185
			end -- 184
			if t < .1 then -- 187
				blur = 1 -- 188
			elseif t < 6 then -- 189
				blur = 1 - (t - 2) -- 190
			end -- 187
			if blur > 0 then -- 192
				return DrawMotionBlur(blur, .3, .01) -- 193
			end -- 192
		end -- 159
	end -- 144
}) do -- 194
	GAMEMODE[k] = v -- 83
end -- 83
net.Receive("evilrp_frighten", function(len) -- 196
	return GAMEMODE:Frighten() -- 196
end) -- 196
net.Receive("evilrp_jumpscare", function(len) -- 197
	return GAMEMODE:Jumpscare() -- 197
end) -- 197
net.Receive("evilrp_judgement", function(len) -- 198
	return GAMEMODE:Judgement() -- 198
end) -- 198
net.Receive("evilrp_flashred", function(len) -- 199
	GAMEMODE.FlashRedStart = CurTime() -- 199
end) -- 199
hook.Add("HUDPaint", "evilrp_draw_damage", function() -- 201
	GAMEMODE:DrawDamage() -- 202
	return -- 203
end) -- 201
local shut_up = { -- 206
	"Shut up.", -- 206
	"Up yours.", -- 207
	"Be QUIET.", -- 208
	"Nobody wants to hear your voice.", -- 209
	"Voice chat is disabled forever.", -- 210
	"No.", -- 211
	"Shh.", -- 212
	"Silence.", -- 213
	"I have no mouth and I must scream.", -- 214
	"You are so... talk so much.", -- 215
	"Your voice is so <wiggle>fucking</wiggle> irritating." -- 216
} -- 205
return hook.Add("PlayerStartVoice", "evilrp_no_voice_chat", function() -- 219
	GAMEMODE:Frighten() -- 220
	local shut = shut_up[math.random(#shut_up)] -- 221
	lp:SendChat("ERROR", shut) -- 222
	return true -- 223
end) -- 223
