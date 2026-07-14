local tell_the_truth_hook
tell_the_truth_hook = function(ply, bind, pressed)
	local wep = LocalPlayer():GetActiveWeapon()
	if ply == LocalPlayer() and wep:IsValid() and string.find(string.lower(bind), "attack2") and wep:GetClass() == "weapon_bugbait" then
		return LocalPlayer():ConCommand("tell_the_truth")
	end
end
return hook.Add("PlayerBindPress", "evilrp_tell_the_truth", tell_the_truth_hook)
