-- [yue]: darkrp_modules\jumpscares\sv_voice.yue
return hook.Add("PlayerCanHearPlayersVoice", "evilrp_disable_voice", function() -- 1
	return false -- 1
end) -- 1
