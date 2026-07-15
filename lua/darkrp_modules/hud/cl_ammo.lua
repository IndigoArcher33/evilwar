-- [yue]: darkrp_modules\hud\cl_ammo.yue
local draw_ammo -- 1
draw_ammo = function() -- 1
	local ply = LocalPlayer() -- 2
	local ct = CurTime() -- 3
	local w = LocalPlayer():GetActiveWeapon() -- 5
	if (ply:InVehicle()) then -- 7
		return -- 8
	end -- 7
	if (w ~= NULL) then -- 10
		if (w.Firearm) then -- 11
			local clip = w:Clip1() -- 12
			local max = w.Primary.ClipSize -- 13
			local ammo = w:Ammo1() -- 14
			local drawclip = clip / max -- 15
			if (clip == 0) then -- 17
				drawclip = 0 -- 18
			elseif (drawclip < 0.2 and clip ~= 0) then -- 20
				drawclip = 0.2 -- 21
			elseif (drawclip > 0.8 and clip ~= max) then -- 23
				drawclip = 0.8 -- 24
			else -- 27
				drawclip = math.max(0.2, math.Round(drawclip / 2, 1) * 2) -- 27
			end -- 17
			local x1, y1 = surface.GetTextSize(clip) -- 29
			local y2 = 16 -- 30
			local x = 20 -- 31
			local y = 40 -- 32
			local width = ScrW() * 0.4 -- 33
			local height = ScrH() * 0.05 -- 34
			local alpha = 0 -- 35
			if (w.ShowAmmoCheck and timer.TimeLeft("ShowAmmoCheck")) then -- 37
				alpha = 180 * (timer.TimeLeft("ShowAmmoCheck") / math.random(1.95, 2.05)) -- 38
				if (timer.TimeLeft("ShowAmmoCheck") / math.random(1.8, 2.2)) % 0.2 == 0 then -- 40
					alpha = 0 -- 41
				end -- 40
			end -- 37
			local ammoColor = Color(200 + math.max(0, 56 * math.sin(ct)), 100 + math.max(0, 56 * math.sin(ct)), 0, alpha) -- 43
			draw.RoundedBox(4, ScrW() - (width / 2) - x - 2, ScrH() - 40 - y, x + 8, y + 28, Color(0, 0, 0, alpha / 2)) -- 44
			draw.RoundedBox(4, ScrW() - (width / 2) - x - 2, ScrH() - 38 - y, x + 4, (y + 24) * drawclip, ammoColor) -- 45
			local numMags = ammo / max -- 47
			local partial = numMags % 1 ~= 0 -- 48
			local bargap = 16 -- 49
			local barx = ScrW() - (width / 2) - x + 32 -- 50
			local bary = ScrH() - 38 - y -- 51
			draw.RoundedBox(2, barx - 2, bary - 2, 12, 49, Color(0, 0, 0, alpha / 2)) -- 52
			local n = math.floor(numMags) -- 53
			if numMags % 1 ~= 0 then -- 55
				n = n + 1 -- 56
			end -- 55
			for i = 1, n do -- 58
				height = i == n and partial and 6 or 12 -- 59
				draw.RoundedBox(0, barx, bary + (i - 1) * bargap, 8, height, ammoColor) -- 60
			end -- 61
		end -- 11
	end -- 10
end -- 1
return hook.Add("HUDPaint", "evilrp_hud_ammo", draw_ammo) -- 63
