local meta = FindMetaTable("Player")
for k, v in pairs({
	AddTeeth = function(self, amt)
		local c = self:GetStemCells()
		c = math.Clamp(c + amt, 0, 666)
		self:SetStemCells(c)
		local teeth = "teeth"
		if math.abs(amt) == 1 then
			teeth = "tooth"
		end
		local amt_str
		if amt == 1 then
			amt_str = "a"
		else
			amt_str = string.english_number(math.abs(amt))
		end
		if amt >= 0 then
			return self:Notify("<c=0,200,0>Gained " .. tostring(amt_str) .. " " .. tostring(teeth) .. ".")
		else
			return self:Notify("<c=200,0,0>Lost " .. tostring(amt_str) .. " " .. tostring(teeth) .. ".")
		end
	end,
	SetTeeth = function(self, amt)
		if SERVER then
			sql.Query("UPDATE evilrp_teeth SET Amount = '" .. tostring(amt) .. "' WHERE SteamID = '" .. tostring(self:SteamID64()) .. "'")
			return self:SetNWFloat("evilrp_teeth", amt)
		end
	end,
	GetTeeth = function(self)
		if SERVER then
			return tonumber(sql.Query("SELECT Amount FROM evilrp_teeth WHERE SteamID = '" .. tostring(self:SteamID64()) .. "'")[1].Amount)
		else
			return self:GetNWFloat("evilrp_teeth", 0)
		end
	end
}) do
	meta[k] = v
end
