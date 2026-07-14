TAB_LOOC = 2 ^ 1
TAB_OOC = 2 ^ 2
TAB_IC = 2 ^ 3
TAB_ADMIN = 2 ^ 4
TAB_PM = 2 ^ 5
TAB_RADIO = 2 ^ 6
local meta = FindMetaTable("Player")
local speech_gestures = {
	"Gesture01",
	"Gesture05",
	"Gesture05NP",
	"Gesture06",
	"Gesture06NP",
	"Gesture07",
	"Gesture13",
	"E_g_shrug",
	"G_medurgent_mid",
	"G_righthandroll",
	"G_righthandheavy",
	"g_palm_out_l",
	"g_palm_out_high_l"
}
local speech_gestures_weapon = {
	"g_rifle_lhand",
	"g_rifle_lhand_low",
	"bg_accentup",
	"bg_up_l",
	"bg_up_r",
	"g_palm_out_high_l",
	"g_palm_up_high_l"
}
local nonweapon_holdtypes = {
	"camera",
	"duel",
	"knife",
	"melee",
	"melee2",
	"physgun",
	"slam",
	"normal",
	"grenade",
	"fist"
}
local nonweapon_holdtypes_array = { }
for _index_0 = 1, #nonweapon_holdtypes do
	local ht = nonweapon_holdtypes[_index_0]
	nonweapon_holdtypes_array[ht] = true
end
local speech_gesture_chance = 50
local speech_gesture_cooldown = 5
for k, v in pairs({
	SpeechGesture = function(self)
		local ct = CurTime()
		self.next_speech_gesture = self.next_speech_gesture or ct
		if not (math.random(1, 100) <= speech_gesture_chance) then
			return
		end
		if not (ct >= self.next_speech_gesture) then
			return
		end
		self.next_speech_gesture = ct + speech_gesture_cooldown
		local wep = self:GetActiveWeapon()
		local ht = "normal"
		if wep and IsValid(wep) then
			ht = wep:GetHoldType()
		end
		local anims = speech_gestures_weapon
		if nonweapon_holdtypes_array[ht] then
			anims = speech_gestures
		end
		local gest = anims[math.random(1, #anims)]
		return self:PlaySignal(gest, true)
	end,
	PlaySpeechSound = function(self, text, lvl)
		if lvl == nil then
			lvl = SNDLVL_65DB
		end
		local jt = self:getJobTable()
		local snd
		if jt.speech_sounds then
			local sounds = jt.speech_sounds
			do
				local _exp_0 = type(sounds)
				if "string" == _exp_0 then
					snd = sounds
				elseif "table" == _exp_0 then
					snd = sounds[math.random(1, #sounds)]
				elseif "function" == _exp_0 then
					snd = sounds(self)
				end
			end
		end
		self:SpeechGesture()
		self.speech_sound = CreateSound(self, snd)
		local _with_0 = self.speech_sound
		local pitch
		if jt.speech_pitch then
			do
				local _exp_0 = type(jt.speech_pitch)
				if "table" == _exp_0 then
					pitch = math.random(jt.speech_pitch[1], jt.speech_pitch[2])
				elseif "number" == _exp_0 then
					pitch = jt.speech_pitch
				else
					pitch = math.random(85, 115)
				end
			end
		else
			pitch = math.random(85, 115)
		end
		_with_0:PlayEx(0.8, pitch)
		return _with_0
	end
}) do
	meta[k] = v
end
