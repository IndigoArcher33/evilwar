local toggle_holster_pressed
local toggle_holster_think
toggle_holster_think = function(self)
	if not toggle_holster_pressed then
		toggle_holster_pressed = false
	end
	if vgui.CursorVisible() then
		toggle_holster_pressed = false
		return
	end
	if input.IsKeyDown(KEY_B) and not toggle_holster_pressed then
		local lp = LocalPlayer()
		if not lp:Alive() then
			return
		end
		toggle_holster_pressed = true
		local wep = lp:GetActiveWeapon()
		if wep == NULL then
			return
		end
		if not wep.SetLower then
			return
		end
		net.Start("evilrp_toggle_holster")
		net.SendToServer()
	elseif not input.IsKeyDown(KEY_B) and toggle_holster_pressed then
		toggle_holster_pressed = false
	end
	return
end
return hook.Add("Think", "evilrp_whip_it_out", toggle_holster_think)
