local ammo_check_bind
ammo_check_bind = function(ply, bind, down)
	local lp = LocalPlayer()
	local lpw = LocalPlayer():GetActiveWeapon()
	if (down and string.find(bind, "+reload") and lp:KeyDown(IN_USE)) then
		if (lpw and lpw:IsValid() and lpw ~= NULL) then
			if not (lpw.Firearm == true) then
				print("miaow")
				return true
			else
				lpw:CheckAmmo()
			end
		end
	end
	return
end
return hook.Add("PlayerBindPress", "evilrp_weapon_ammocheck", ammo_check_bind)
