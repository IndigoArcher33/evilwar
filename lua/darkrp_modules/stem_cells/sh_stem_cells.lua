local meta = FindMetaTable("Player")
for k, v in pairs({
	AddStemCells = function(self, amt)
		local c = self:GetStemCells()
		c = math.Clamp(c + amt, 0, 666)
		self:SetStemCells(c)
		local cells = "cells"
		if math.abs(amt) == 1 then
			cells = "cell"
		end
		local amt_str
		if amt == 1 then
			amt_str = "a"
		else
			amt_str = string.english_number(math.abs(amt))
		end
		if amt >= 0 then
			return self:Notify("<c=0,200,0>Gained " .. tostring(amt_str) .. " stem " .. tostring(cells) .. ".")
		else
			return self:Notify("<c=200,0,0>Lost " .. tostring(amt_str) .. " stem " .. tostring(cells) .. ".")
		end
	end,
	SetStemCells = function(self, amt)
		if SERVER then
			sql.Query("UPDATE evilrp_stem_cells SET Amount = '" .. tostring(amt) .. "' WHERE SteamID = '" .. tostring(self:SteamID64()) .. "'")
			return self:SetNWFloat("evilrp_stem_cells", amt)
		end
	end,
	GetStemCells = function(self)
		if SERVER then
			return tonumber(sql.Query("SELECT Amount FROM evilrp_stem_cells WHERE SteamID = '" .. tostring(self:SteamID64()) .. "'")[1].Amount)
		else
			return self:GetNWFloat("evilrp_stem_cells", 0)
		end
	end
}) do
	meta[k] = v
end
