-- [yue]: /mnt/c/Program Files (x86)/Steam/steamapps/common/GarrysMod/garrysmod/addons/DarkRPmodification/lua/darkrp_modules/weapons_evil/sh_ammocheck.yue
local ammo_check_bind -- 15
ammo_check_bind = function(ply, bind, down) -- 15
	local lp = LocalPlayer() -- 16
	local lpw = LocalPlayer():GetActiveWeapon() -- 17
	if (down and string.find(bind, "+reload") and lp:KeyDown(IN_USE)) then -- 18
		if (lpw and lpw:IsValid() and lpw ~= NULL) then -- 19
			if not (lpw.Firearm == true) then -- 20
				print("miaow") -- 21
				return true -- 22
			else -- 24
				lpw:CheckAmmo() -- 24
			end -- 20
		end -- 19
	end -- 18
	return -- 25
end -- 15
return hook.Add("PlayerBindPress", "evilrp_weapon_ammocheck", ammo_check_bind) -- 27
