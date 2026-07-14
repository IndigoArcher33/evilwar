local meta = FindMetaTable("Player")
for k, v in pairs({
	payDay = function(self)
		return false
	end
}) do
	meta[k] = v
end
