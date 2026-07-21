-- [yue]: darkrp_customthings\categories.yue
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
	name = "Wasteland", -- 26
	categorises = "jobs", -- 27
	startExpanded = true, -- 28
	color = Color(200, 200, 0), -- 29
	canSee = function(ply) -- 30
		return true -- 30
	end, -- 30
	sortOrder = 100 -- 31
}) -- 25
DarkRP.createCategory({ -- 35
	name = "Royalists", -- 35
	categorises = "jobs", -- 36
	startExpanded = true, -- 37
	color = Color(128, 64, 0), -- 38
	canSee = function(ply) -- 39
		return true -- 39
	end, -- 39
	sortOrder = 100 -- 40
}) -- 34
DarkRP.createCategory({ -- 43
	name = "Sanitar Squad", -- 43
	categorises = "jobs", -- 44
	startExpanded = true, -- 45
	color = Color(0, 200, 0), -- 46
	canSee = function(ply) -- 47
		return true -- 47
	end, -- 47
	sortOrder = 100 -- 48
}) -- 42
DarkRP.createCategory({ -- 51
	name = "Bureaukracy", -- 51
	categorises = "jobs", -- 52
	startExpanded = true, -- 53
	color = Color(200, 0, 0), -- 54
	canSee = function(ply) -- 55
		return true -- 55
	end, -- 55
	sortOrder = 100 -- 56
}) -- 50
DarkRP.createCategory({ -- 59
	name = "Other", -- 59
	categorises = "entities", -- 60
	startExpanded = true, -- 61
	color = Color(0, 107, 0, 255), -- 62
	canSee = fp({ -- 63
		fn.Id, -- 63
		true -- 63
	}), -- 63
	sortOrder = 255 -- 64
}) -- 58
DarkRP.createCategory({ -- 68
	name = "Other", -- 68
	categorises = "shipments", -- 69
	startExpanded = true, -- 70
	color = Color(0, 107, 0, 255), -- 71
	canSee = fp({ -- 72
		fn.Id, -- 72
		true -- 72
	}), -- 72
	sortOrder = 255 -- 73
}) -- 67
DarkRP.createCategory({ -- 77
	name = "Rifles", -- 77
	categorises = "shipments", -- 78
	startExpanded = true, -- 79
	color = Color(0, 107, 0, 255), -- 80
	canSee = fp({ -- 81
		fn.Id, -- 81
		true -- 81
	}), -- 81
	sortOrder = 100 -- 82
}) -- 76
DarkRP.createCategory({ -- 86
	name = "Shotguns", -- 86
	categorises = "shipments", -- 87
	startExpanded = true, -- 88
	color = Color(0, 107, 0, 255), -- 89
	canSee = fp({ -- 90
		fn.Id, -- 90
		true -- 90
	}), -- 90
	sortOrder = 101 -- 91
}) -- 85
DarkRP.createCategory({ -- 95
	name = "Snipers", -- 95
	categorises = "shipments", -- 96
	startExpanded = true, -- 97
	color = Color(0, 107, 0, 255), -- 98
	canSee = fp({ -- 99
		fn.Id, -- 99
		true -- 99
	}), -- 99
	sortOrder = 102 -- 100
}) -- 94
DarkRP.createCategory({ -- 104
	name = "Tools", -- 104
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
	name = "Pistols", -- 113
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
	name = "Submachine Guns", -- 122
	categorises = "shipments", -- 123
	startExpanded = true, -- 124
	color = Color(0, 107, 0, 255), -- 125
	canSee = fp({ -- 126
		fn.Id, -- 126
		true -- 126
	}), -- 126
	sortOrder = 100 -- 127
}) -- 121
DarkRP.createCategory({ -- 131
	name = "Other", -- 131
	categorises = "weapons", -- 132
	startExpanded = true, -- 133
	color = Color(0, 107, 0, 255), -- 134
	canSee = fp({ -- 135
		fn.Id, -- 135
		true -- 135
	}), -- 135
	sortOrder = 255 -- 136
}) -- 130
return DarkRP.createCategory({ -- 140
	name = "Other", -- 140
	categorises = "vehicles", -- 141
	startExpanded = true, -- 142
	color = Color(0, 107, 0, 255), -- 143
	canSee = fp({ -- 144
		fn.Id, -- 144
		true -- 144
	}), -- 144
	sortOrder = 255 -- 145
}) -- 146
