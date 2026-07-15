-- [yue]: darkrp_modules\teeth\sh_teeth.yue
local meta = FindMetaTable("Player") -- 1
for k, v in pairs({ -- 4
	AddTeeth = function(self, amt) -- 4
		local c = self:GetStemCells() -- 5
		c = math.Clamp(c + amt, 0, 666) -- 6
		self:SetStemCells(c) -- 7
		local teeth = "teeth" -- 8
		if math.abs(amt) == 1 then -- 9
			teeth = "tooth" -- 9
		end -- 9
		local amt_str -- 10
		if amt == 1 then -- 11
			amt_str = "a" -- 12
		else -- 14
			amt_str = string.english_number(math.abs(amt)) -- 14
		end -- 11
		if amt >= 0 then -- 15
			return self:Notify("<c=0,200,0>Gained " .. tostring(amt_str) .. " " .. tostring(teeth) .. ".") -- 16
		else -- 18
			return self:Notify("<c=200,0,0>Lost " .. tostring(amt_str) .. " " .. tostring(teeth) .. ".") -- 18
		end -- 15
	end, -- 4
	SetTeeth = function(self, amt) -- 19
		if SERVER then -- 20
			sql.Query("UPDATE evilrp_teeth SET Amount = '" .. tostring(amt) .. "' WHERE SteamID = '" .. tostring(self:SteamID64()) .. "'") -- 21
			return self:SetNWFloat("evilrp_teeth", amt) -- 22
		end -- 20
	end, -- 19
	GetTeeth = function(self) -- 23
		if SERVER then -- 24
			return tonumber(sql.Query("SELECT Amount FROM evilrp_teeth WHERE SteamID = '" .. tostring(self:SteamID64()) .. "'")[1].Amount) -- 25
		else -- 27
			return self:GetNWFloat("evilrp_teeth", 0) -- 27
		end -- 24
	end -- 23
}) do -- 28
	meta[k] = v -- 2
end -- 2
