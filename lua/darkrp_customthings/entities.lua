-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_customthings/entities.yue
DarkRP.createEntity("Drug lab", { -- 3
	ent = "drug_lab", -- 3
	model = "models/props_lab/crematorcase.mdl", -- 4
	price = 666, -- 5
	max = 3, -- 6
	cmd = "buydruglab", -- 7
	allowed = { -- 8
		TEAM_GANG, -- 8
		TEAM_MOB -- 8
	} -- 8
}) -- 2
DarkRP.createEntity("Money printer", { -- 12
	ent = "money_printer", -- 12
	model = "models/props_c17/consolebox01a.mdl", -- 13
	price = 666, -- 14
	max = 2, -- 15
	cmd = "buymoneyprinter" -- 16
}) -- 11
DarkRP.createEntity("Tip Jar", { -- 21
	ent = "darkrp_tip_jar", -- 21
	model = "models/props_lab/jar01a.mdl", -- 22
	price = 50, -- 23
	max = 2, -- 24
	cmd = "tipjar", -- 25
	allowTools = true -- 26
}) -- 20
if not DarkRP.disabledDefaults["modules"]["hungermod"] then -- 29
	return DarkRP.createEntity("Microwave", { -- 31
		ent = "microwave", -- 31
		model = "models/props/cs_office/microwave.mdl", -- 32
		price = 400, -- 33
		max = 1, -- 34
		cmd = "buymicrowave", -- 35
		allowed = TEAM_COOK -- 36
	}) -- 37
end -- 29
