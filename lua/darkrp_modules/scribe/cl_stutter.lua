-- [yue]: darkrp_modules\scribe\cl_stutter.yue
local gibberish = { -- 2
	"#", -- 2
	"@", -- 2
	"&", -- 2
	"%", -- 3
	"$", -- 3
	"/", -- 3
	"<", -- 4
	">", -- 4
	";" -- 4
} -- 1
local text_effects = { -- 8
	upper = function(char) -- 8
		return string.upper(char) -- 8
	end -- 8
} -- 7
local COMPONENT = { -- 13
	Name = { -- 13
		"stutter" -- 13
	}, -- 13
	Initialize = function(self) end, -- 15
	Push = function(self) -- 17
		return self:AddTextModifier() -- 17
	end, -- 17
	Pop = function(self) -- 19
		return self:RemoveTextModifier() -- 19
	end, -- 19
	GetDespair = function(self) -- 21
		local lp = LocalPlayer() -- 22
		if lp:Team() == TEAM_GHOST then -- 23
			return 0 -- 23
		end -- 23
		return lp:GetDespair() -- 24
	end, -- 21
	ModifyText = function(self, part, text) -- 26
		local desp = self:GetDespair() -- 27
		local str = string.Explode("", text) -- 28
		for index, char in ipairs(str) do -- 29
			if math.Maybe(1 + 5 * (desp / 23)) then -- 30
				str[index] = table.Random(text_effects)(char) -- 31
			end -- 30
		end -- 31
		return table.concat(str) -- 32
	end -- 26
} -- 12
return scribe.Register(COMPONENT) -- 34
