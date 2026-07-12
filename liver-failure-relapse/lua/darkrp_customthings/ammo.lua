-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_customthings/ammo.yue
DarkRP.createAmmoType("pistol", { -- 2
	name = "Pistol ammo", -- 2
	model = "models/Items/BoxSRounds.mdl", -- 3
	price = 30, -- 4
	amountGiven = 24 -- 5
}) -- 1
DarkRP.createAmmoType("357", { -- 9
	name = "Magnum ammo", -- 9
	model = "models/Items/357ammo.mdl", -- 10
	price = 50, -- 11
	amountGiven = 24 -- 12
}) -- 8
DarkRP.createAmmoType("buckshot", { -- 16
	name = "Shotgun ammo", -- 16
	model = "models/Items/BoxBuckshot.mdl", -- 17
	price = 50, -- 18
	amountGiven = 8 -- 19
}) -- 15
DarkRP.createAmmoType("ar2", { -- 23
	name = "Rifle ammo", -- 23
	model = "models/Items/BoxMRounds.mdl", -- 24
	price = 80, -- 25
	amountGiven = 30 -- 26
}) -- 22
return DarkRP.createAmmoType("smg1", { -- 30
	name = "SMG ammo", -- 30
	model = "models/Items/BoxMRounds.mdl", -- 31
	price = 20, -- 32
	amountGiven = 30 -- 33
}) -- 34
