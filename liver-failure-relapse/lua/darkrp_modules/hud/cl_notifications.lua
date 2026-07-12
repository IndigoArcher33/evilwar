-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/hud/cl_notifications.yue
local _obj_0 = GAMEMODE -- 1
_obj_0.notifications = _obj_0.notifications or { } -- 1
GAMEMODE.AddNotification = function(self, text, col) -- 3
	if text:find("\n") then -- 4
		local expl = text:Explode("\n") -- 5
		for i = 1, #expl do -- 6
			self:AddNotification(expl[i], col) -- 6
		end -- 6
		return -- 7
	end -- 4
	local n = 0 -- 8
	local _list_0 = self.notifications -- 9
	for _index_0 = 1, #_list_0 do -- 9
		local m = _list_0[_index_0] -- 9
		local _list_1 = self.notifications -- 10
		for _index_1 = 1, #_list_1 do -- 10
			local v = _list_1[_index_1] -- 10
			if v[3] == n then -- 11
				n = v[3] + 1 -- 11
			end -- 11
		end -- 11
	end -- 11
	surface.PlaySound("ui/buttonrollover.wav") -- 12
	local _obj_1 = self.notifications -- 13
	_obj_1[#_obj_1 + 1] = { -- 13
		text, -- 13
		CurTime(), -- 13
		n -- 13
	} -- 13
end -- 3
local font_notifications = "Spleen_Label" -- 15
local draw_notifications -- 17
draw_notifications = function() -- 17
	local notifications = GAMEMODE.notifications -- 18
	for k, v in pairs(notifications) do -- 19
		local _continue_0 = false -- 20
		repeat -- 20
			local txt, t, n = v[1], v[2], v[3] -- 20
			local ct = CurTime() -- 21
			if ct - t > 10 then -- 22
				table.remove(notifications, k) -- 23
				_continue_0 = true -- 24
				break -- 24
			end -- 22
			local desp = lp:GetDespair() * 0.01 -- 25
			local txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(10 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font_notifications) .. "><wave=" .. tostring(4 * desp) .. "," .. tostring(3.66 * desp) .. ",2>" .. tostring(txt), nil) -- 26
			local w, h = txt_obj:GetSize() -- 27
			local x = ScrW() - 22 - w -- 28
			local y = ScrH() - 180 - (n * h) -- 29
			local a = 1 -- 30
			local elapsed = ct - t -- 31
			if elapsed < 0.5 then -- 32
				a = elapsed / 0.5 -- 33
			elseif elapsed > 3 then -- 34
				a = math.max(0, 1 - (ct - t - 3) / 2) -- 35
			end -- 32
			txt_obj:Draw(x, y, a) -- 36
			_continue_0 = true -- 20
		until true -- 36
		if not _continue_0 then -- 36
			break -- 36
		end -- 36
	end -- 36
end -- 17
return hook.Add("HUDPaint", "evilrp_notifications", draw_notifications) -- 38
