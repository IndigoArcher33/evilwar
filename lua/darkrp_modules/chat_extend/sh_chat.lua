-- [yue]: darkrp_modules\chat_extend\sh_chat.yue
TAB_LOOC = 2 ^ 1 -- 1
TAB_OOC = 2 ^ 2 -- 2
TAB_IC = 2 ^ 3 -- 3
TAB_ADMIN = 2 ^ 4 -- 4
TAB_PM = 2 ^ 5 -- 5
TAB_RADIO = 2 ^ 6 -- 6
local meta = FindMetaTable("Player") -- 8
local speech_gestures = { -- 11
	"Gesture01", -- 11
	"Gesture05", -- 12
	"Gesture05NP", -- 13
	"Gesture06", -- 14
	"Gesture06NP", -- 15
	"Gesture07", -- 16
	"Gesture13", -- 17
	"E_g_shrug", -- 18
	"G_medurgent_mid", -- 19
	"G_righthandroll", -- 20
	"G_righthandheavy", -- 21
	"g_palm_out_l", -- 22
	"g_palm_out_high_l" -- 23
} -- 10
local speech_gestures_weapon = { -- 26
	"g_rifle_lhand", -- 26
	"g_rifle_lhand_low", -- 27
	"bg_accentup", -- 28
	"bg_up_l", -- 29
	"bg_up_r", -- 30
	"g_palm_out_high_l", -- 31
	"g_palm_up_high_l" -- 32
} -- 25
local nonweapon_holdtypes = { -- 35
	"camera", -- 35
	"duel", -- 36
	"knife", -- 37
	"melee", -- 38
	"melee2", -- 39
	"physgun", -- 40
	"slam", -- 41
	"normal", -- 42
	"grenade", -- 43
	"fist" -- 44
} -- 34
local nonweapon_holdtypes_array = { } -- 46
for _index_0 = 1, #nonweapon_holdtypes do -- 47
	local ht = nonweapon_holdtypes[_index_0] -- 47
	nonweapon_holdtypes_array[ht] = true -- 47
end -- 47
local speech_gesture_chance = 50 -- 49
local speech_gesture_cooldown = 5 -- 50
for k, v in pairs({ -- 53
	SpeechGesture = function(self) -- 53
		local ct = CurTime() -- 54
		self.next_speech_gesture = self.next_speech_gesture or ct -- 55
		if not (math.random(1, 100) <= speech_gesture_chance) then -- 56
			return -- 56
		end -- 56
		if not (ct >= self.next_speech_gesture) then -- 57
			return -- 57
		end -- 57
		self.next_speech_gesture = ct + speech_gesture_cooldown -- 58
		local wep = self:GetActiveWeapon() -- 59
		local ht = "normal" -- 60
		if wep and IsValid(wep) then -- 61
			ht = wep:GetHoldType() -- 62
		end -- 61
		local anims = speech_gestures_weapon -- 63
		if nonweapon_holdtypes_array[ht] then -- 64
			anims = speech_gestures -- 64
		end -- 64
		local gest = anims[math.random(1, #anims)] -- 65
		return self:PlaySignal(gest, true) -- 66
	end, -- 53
	PlaySpeechSound = function(self, text, lvl) -- 67
		if lvl == nil then -- 67
			lvl = SNDLVL_65DB -- 67
		end -- 67
		local jt = self:getJobTable() -- 68
		local snd -- 69
		if jt.speech_sounds then -- 70
			local sounds = jt.speech_sounds -- 71
			do -- 72
				local _exp_0 = type(sounds) -- 72
				if "string" == _exp_0 then -- 73
					snd = sounds -- 74
				elseif "table" == _exp_0 then -- 75
					snd = sounds[math.random(1, #sounds)] -- 76
				elseif "function" == _exp_0 then -- 77
					snd = sounds(self) -- 78
				end -- 78
			end -- 78
		end -- 70
		self:SpeechGesture() -- 79
		self.speech_sound = CreateSound(self, snd) -- 80
		local _with_0 = self.speech_sound -- 81
		local pitch -- 82
		if jt.speech_pitch then -- 83
			do -- 84
				local _exp_0 = type(jt.speech_pitch) -- 84
				if "table" == _exp_0 then -- 85
					pitch = math.random(jt.speech_pitch[1], jt.speech_pitch[2]) -- 86
				elseif "number" == _exp_0 then -- 87
					pitch = jt.speech_pitch -- 88
				else -- 90
					pitch = math.random(85, 115) -- 90
				end -- 90
			end -- 90
		else -- 92
			pitch = math.random(85, 115) -- 92
		end -- 83
		_with_0:PlayEx(0.8, pitch) -- 93
		return _with_0 -- 81
	end -- 67
}) do -- 94
	meta[k] = v -- 52
end -- 52
