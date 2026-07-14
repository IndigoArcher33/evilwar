local meta = FindMetaTable("Player")
for k, v in pairs({
	CanUseMachines = function(self)
		return true
	end
}) do
	meta[k] = v
end
