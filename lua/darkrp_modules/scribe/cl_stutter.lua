local gibberish = {
	"#",
	"@",
	"&",
	"%",
	"$",
	"/",
	"<",
	">",
	";"
}
local text_effects = {
	upper = function(char)
		return string.upper(char)
	end
}
local COMPONENT = {
	Name = {
		"stutter"
	},
	Initialize = function(self) end,
	Push = function(self)
		return self:AddTextModifier()
	end,
	Pop = function(self)
		return self:RemoveTextModifier()
	end,
	GetDespair = function(self)
		local lp = LocalPlayer()
		if lp:Team() == TEAM_GHOST then
			return 0
		end
		return lp:GetDespair()
	end,
	ModifyText = function(self, part, text)
		local desp = self:GetDespair()
		local str = string.Explode("", text)
		for index, char in ipairs(str) do
			if math.Maybe(1 + 5 * (desp / 23)) then
				str[index] = table.Random(text_effects)(char)
			end
		end
		return table.concat(str)
	end
}
return scribe.Register(COMPONENT)
