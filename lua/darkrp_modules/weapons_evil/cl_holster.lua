-- [yue]: darkrp_modules\weapons_evil\cl_holster.yue
local toggle_holster_pressed -- 1
local toggle_holster_think -- 2
toggle_holster_think = function(self) -- 2
	if not toggle_holster_pressed then -- 3
		toggle_holster_pressed = false -- 3
	end -- 3
	if vgui.CursorVisible() then -- 4
		toggle_holster_pressed = false -- 5
		return -- 6
	end -- 4
	if input.IsKeyDown(KEY_B) and not toggle_holster_pressed then -- 7
		local lp = LocalPlayer() -- 8
		if not lp:Alive() then -- 9
			return -- 9
		end -- 9
		toggle_holster_pressed = true -- 10
		local wep = lp:GetActiveWeapon() -- 11
		if wep == NULL then -- 12
			return -- 12
		end -- 12
		if not wep.SetLower then -- 13
			return -- 13
		end -- 13
		net.Start("evilrp_toggle_holster") -- 14
		net.SendToServer() -- 15
	elseif not input.IsKeyDown(KEY_B) and toggle_holster_pressed then -- 16
		toggle_holster_pressed = false -- 17
	end -- 7
	return -- 18
end -- 2
return hook.Add("Think", "evilrp_whip_it_out", toggle_holster_think) -- 20
