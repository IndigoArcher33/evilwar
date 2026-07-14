local draw_ammo
draw_ammo = function()
	local ply = LocalPlayer()
	local ct = CurTime()
	local w = LocalPlayer():GetActiveWeapon()
	if (ply:InVehicle()) then
		return
	end
	if (w ~= NULL) then
		if (w.Firearm) then
			local clip = w:Clip1()
			local max = w.Primary.ClipSize
			local ammo = w:Ammo1()
			local drawclip = clip / max
			if (clip == 0) then
				drawclip = 0
			elseif (drawclip < 0.2 and clip ~= 0) then
				drawclip = 0.2
			elseif (drawclip > 0.8 and clip ~= max) then
				drawclip = 0.8
			else
				drawclip = math.max(0.2, math.Round(drawclip / 2, 1) * 2)
			end
			local x1, y1 = surface.GetTextSize(clip)
			local y2 = 16
			local x = 20
			local y = 40
			local width = ScrW() * 0.4
			local height = ScrH() * 0.05
			local alpha = 0
			if (w.ShowAmmoCheck and timer.TimeLeft("ShowAmmoCheck")) then
				alpha = 180 * (timer.TimeLeft("ShowAmmoCheck") / math.random(1.95, 2.05))
				if (timer.TimeLeft("ShowAmmoCheck") / math.random(1.8, 2.2)) % 0.2 == 0 then
					alpha = 0
				end
			end
			local ammoColor = Color(200 + math.max(0, 56 * math.sin(ct)), 100 + math.max(0, 56 * math.sin(ct)), 0, alpha)
			draw.RoundedBox(4, ScrW() - (width / 2) - x - 2, ScrH() - 40 - y, x + 8, y + 28, Color(0, 0, 0, alpha / 2))
			draw.RoundedBox(4, ScrW() - (width / 2) - x - 2, ScrH() - 38 - y, x + 4, (y + 24) * drawclip, ammoColor)
			local numMags = ammo / max
			local partial = numMags % 1 ~= 0
			local bargap = 16
			local barx = ScrW() - (width / 2) - x + 32
			local bary = ScrH() - 38 - y
			draw.RoundedBox(2, barx - 2, bary - 2, 12, 49, Color(0, 0, 0, alpha / 2))
			local n = math.floor(numMags)
			if numMags % 1 ~= 0 then
				n = n + 1
			end
			for i = 1, n do
				height = i == n and partial and 6 or 12
				draw.RoundedBox(0, barx, bary + (i - 1) * bargap, 8, height, ammoColor)
			end
		end
	end
end
return hook.Add("HUDPaint", "evilrp_hud_ammo", draw_ammo)
