-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_customthings/categories.yue
DarkRP.createCategory({ -- 18
	name = "Scum of Liver Failure", -- 18
	categorises = "jobs", -- 19
	startExpanded = true, -- 20
	color = Color(200, 200, 0), -- 21
	canSee = function(ply) -- 22
		return true -- 22
	end, -- 22
	sortOrder = 100 -- 23
}) -- 17
DarkRP.createCategory({ -- 26
	name = "Citizens of Liver Failure", -- 26
	categorises = "jobs", -- 27
	startExpanded = true, -- 28
	color = Color(128, 64, 0), -- 29
	canSee = function(ply) -- 30
		return true -- 30
	end, -- 30
	sortOrder = 100 -- 31
}) -- 25
DarkRP.createCategory({ -- 34
	name = "Sanitar Squad", -- 34
	categorises = "jobs", -- 35
	startExpanded = true, -- 36
	color = Color(0, 200, 0), -- 37
	canSee = function(ply) -- 38
		return true -- 38
	end, -- 38
	sortOrder = 100 -- 39
}) -- 33
DarkRP.createCategory({ -- 42
	name = "Bureaukracy", -- 42
	categorises = "jobs", -- 43
	startExpanded = true, -- 44
	color = Color(200, 0, 0), -- 45
	canSee = function(ply) -- 46
		return true -- 46
	end, -- 46
	sortOrder = 100 -- 47
}) -- 41
DarkRP.createCategory({ -- 50
	name = "Other", -- 50
	categorises = "entities", -- 51
	startExpanded = true, -- 52
	color = Color(0, 107, 0, 255), -- 53
	canSee = fp({ -- 54
		fn.Id, -- 54
		true -- 54
	}), -- 54
	sortOrder = 255 -- 55
}) -- 49
DarkRP.createCategory({ -- 59
	name = "Other", -- 59
	categorises = "shipments", -- 60
	startExpanded = true, -- 61
	color = Color(0, 107, 0, 255), -- 62
	canSee = fp({ -- 63
		fn.Id, -- 63
		true -- 63
	}), -- 63
	sortOrder = 255 -- 64
}) -- 58
DarkRP.createCategory({ -- 68
	name = "Rifles", -- 68
	categorises = "shipments", -- 69
	startExpanded = true, -- 70
	color = Color(0, 107, 0, 255), -- 71
	canSee = fp({ -- 72
		fn.Id, -- 72
		true -- 72
	}), -- 72
	sortOrder = 100 -- 73
}) -- 67
DarkRP.createCategory({ -- 77
	name = "Shotguns", -- 77
	categorises = "shipments", -- 78
	startExpanded = true, -- 79
	color = Color(0, 107, 0, 255), -- 80
	canSee = fp({ -- 81
		fn.Id, -- 81
		true -- 81
	}), -- 81
	sortOrder = 101 -- 82
}) -- 76
DarkRP.createCategory({ -- 86
	name = "Snipers", -- 86
	categorises = "shipments", -- 87
	startExpanded = true, -- 88
	color = Color(0, 107, 0, 255), -- 89
	canSee = fp({ -- 90
		fn.Id, -- 90
		true -- 90
	}), -- 90
	sortOrder = 102 -- 91
}) -- 85
DarkRP.createCategory({ -- 95
	name = "Tools", -- 95
	categorises = "shipments", -- 96
	startExpanded = true, -- 97
	color = Color(0, 107, 0, 255), -- 98
	canSee = fp({ -- 99
		fn.Id, -- 99
		true -- 99
	}), -- 99
	sortOrder = 100 -- 100
}) -- 94
DarkRP.createCategory({ -- 104
	name = "Pistols", -- 104
	categorises = "shipments", -- 105
	startExpanded = true, -- 106
	color = Color(0, 107, 0, 255), -- 107
	canSee = fp({ -- 108
		fn.Id, -- 108
		true -- 108
	}), -- 108
	sortOrder = 100 -- 109
}) -- 103
DarkRP.createCategory({ -- 113
	name = "Submachine Guns", -- 113
	categorises = "shipments", -- 114
	startExpanded = true, -- 115
	color = Color(0, 107, 0, 255), -- 116
	canSee = fp({ -- 117
		fn.Id, -- 117
		true -- 117
	}), -- 117
	sortOrder = 100 -- 118
}) -- 112
DarkRP.createCategory({ -- 122
	name = "Other", -- 122
	categorises = "weapons", -- 123
	startExpanded = true, -- 124
	color = Color(0, 107, 0, 255), -- 125
	canSee = fp({ -- 126
		fn.Id, -- 126
		true -- 126
	}), -- 126
	sortOrder = 255 -- 127
}) -- 121
return DarkRP.createCategory({ -- 131
	name = "Other", -- 131
	categorises = "vehicles", -- 132
	startExpanded = true, -- 133
	color = Color(0, 107, 0, 255), -- 134
	canSee = fp({ -- 135
		fn.Id, -- 135
		true -- 135
	}), -- 135
	sortOrder = 255 -- 136
}) -- 137
