local FoodRot
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = (function()
			local _accum_0 = { }
			local _len_0 = 1
			for i = 1, 3 do
				_accum_0[_len_0] = "weapons/bugbait/bugbait_squeeze" .. tostring(i) .. ".wav"
				_len_0 = _len_0 + 1
			end
			return _accum_0
		end)(),
		level = SNDLVL_50dB
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "FoodRot",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	FoodRot = _class_0
end
local Submit_Food
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = (function()
			local _accum_0 = { }
			local _len_0 = 1
			for i = 1, 4 do
				_accum_0[_len_0] = "npc/barnacle/barnacle_pull" .. tostring(i) .. ".wav"
				_len_0 = _len_0 + 1
			end
			return _accum_0
		end)()
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Submit_Food",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Submit_Food = _class_0
end
local Food
do
	local _class_0
	local _parent_0 = ITEM
	local _base_0 = {
		SetupDataTables = function(self)
			_class_0.__parent.__base.SetupDataTables(self)
			return self:NetworkVar("Bool", "Rotten")
		end,
		PrintName = "Food",
		Model = Model("models/props_junk/garbage_plasticbottle002a.mdl"),
		Category = "EvilRP: Food",
		Spawnable = true,
		Interesting = true,
		Sound = Sound("npc/barnacle/barnacle_crunch2.wav"),
		SubmitSound = "Submit_Food",
		Hunger = 0,
		Thirst = 0,
		Despair = 0,
		HealthAdd = 0,
		CookTime = 0,
		RotTime = 0,
		Eat = function(self, ply)
			if CLIENT then
				return
			end
			local amt
			if self.Hunger then
				amt = self.Hunger
				if isfunction(amt) then
					amt = amt()
				end
				ply:AddHunger(amt)
			end
			if self.Thirst then
				amt = self.Thirst
				if isfunction(amt) then
					amt = amt()
				end
				ply:AddThirst(amt)
			end
			if self.Despair then
				amt = self.Despair
				if isfunction(amt) then
					amt = amt()
				end
				ply:AddDespair(amt)
			end
			if self.HealthAdd then
				amt = self.HealthAdd
				if isfunction(amt) then
					amt = amt()
				end
				if amt > 0 then
					ply:SetHealth(math.min(ply:Health() + amt, ply:GetMaxHealth()))
				elseif amt < 0 then
					ply:TakeDamage(-amt)
				end
			end
			if not self.PersistAfterEat then
				return self:Trash()
			end
		end,
		OnUseFinish = function(self, ply)
			_class_0.__parent.__base.OnUseFinish(self, ply)
			return self:Eat(ply)
		end,
		OnSpawned = function(self)
			_class_0.__parent.__base.OnSpawned(self)
			self:SetRotten(false)
			if self.RotTime > 0 then
				self.RotsIn = CurTime() + self.RotTime
			end
			return
		end,
		Think = function(self)
			_class_0.__parent.__base.Think(self)
			if CLIENT then
				return
			end
			if self.RotsIn and (not self:GetRotten()) and self.RotsIn < CurTime() then
				return self:Rot()
			end
		end,
		Rot = function(self)
			self:SetRotten(true)
			self:SetColor(Color(100, 0, 150))
			return self:EmitSound("FoodRot")
		end
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Food",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Food = _class_0
end
local SlopSkull
do
	local _class_0
	local _parent_0 = Food
	local _base_0 = {
		PrintName = "Slop Skull",
		Model = Model("models/Gibs/HGIBS.mdl"),
		Hunger = -10,
		Description = "A bloody, festering human skull.\nThe brain is still largely intact.",
		RotTime = 120,
		UseText = {
			"munches and crunches on a slop skull.",
			"slurps the brain matter out of a slop skull.",
			"digs around in a slop skull with their tongue.",
			"ravenously consumes a slop skull.",
			"gets pink sludge everywhere while eating a slop skull.",
			"scours a slop skull for brainmeat.",
			"cracks open a slop skull and slurps the brains out."
		},
		Precursor = {
			biomass = 1
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "SlopSkull",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	SlopSkull = _class_0
end
local Paper
do
	local _class_0
	local _parent_0 = Food
	local _base_0 = {
		PrintName = "Paper",
		Model = Model("models/props_lab/papersheet001a.mdl"),
		Hunger = -7,
		Thirst = 10,
		Description = "A dirty scrap of used paper.\nThe writing is too faint to make out.",
		UseText = {
			"chokes down a sheet of paper.",
			"tears up and eats a sheet of paper.",
			"chews the paper into a stiff pulp and swallows.",
			"struggles to swallow a dry sheet of paper.",
			"eats paper.",
			"crumples up some paper and struggles to chew it.",
			"munches on a piece of paper."
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Paper",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Paper = _class_0
end
local RibBone
do
	local _class_0
	local _parent_0 = Food
	local _base_0 = {
		PrintName = "Dry Rib",
		Model = Model("models/Gibs/hgibs_rib.mdl"),
		Hunger = -8,
		HealthAdd = -7,
		RotTime = 240,
		Description = "A lone human rib.\nYou could chew the marrow out, but it'd probably hurt.",
		UseText = {
			"breaks a tooth chewing on a rib bone.",
			"sucks marrow and bone shards from the rib.",
			"cuts up their throat eating a rib bone.",
			"bleeds from the mouth as they eat a rib bone.",
			"eats a bone, like a vulture.",
			"chokes on the broken points of a rib bone."
		},
		Precursor = {
			biomass = 1
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "RibBone",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	RibBone = _class_0
end
local Skin
do
	local _class_0
	local _parent_0 = Food
	local _base_0 = {
		PrintName = "Skin",
		Description = "A greasy patch of some kind of hide.\nIt would probably taste nasty.",
		Model = Model("models/gibs/antlion_gib_small_2.mdl"),
		HealthAdd = function(self)
			return (math.random(10, 20))
		end
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Skin",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Skin = _class_0
end
local Abortion
do
	local _class_0
	local _parent_0 = Food
	local _base_0 = {
		PrintName = "Abortion",
		Model = Model("models/props_c17/doll01.mdl"),
		Hunger = -23,
		Thirst = -20,
		HealthAdd = 20,
		RotTime = 240,
		Description = "An artificial baby that never got the chance to be born.\nDelicious.",
		UseText = {
			"eats a baby.",
			"rips apart an abortion and eats the pieces.",
			"bites the head off an abortion and swallows the rest.",
			"chews an abortion into pink paste.",
			"tears chunks off an abortion until it's all gone.",
			"eats an abortion, baby blood dribbling down their neck.",
			"eats an abortion legs-first."
		},
		Eat = function(self, ply)
			_class_0.__parent.__base.Eat(self, ply)
			if CLIENT then
				return
			end
			return ply:AddStemCells(1)
		end
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Abortion",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Abortion = _class_0
end
local LiveBaby
do
	local _class_0
	local _parent_0 = Food
	local _base_0 = {
		PrintName = "Live baby",
		Model = Model("models/props_c17/doll01.mdl"),
		Hunger = -52,
		Thirst = -47,
		HealthAdd = 40,
		RotTime = 480,
		Description = "An artifical baby, born paralyzed below the eyes.\nIt will know nothing but fear and pain.",
		UseText = {
			"eats a living infant.",
			"chews the head off a live baby and drinks its blood.",
			"eats a baby alive.",
			"eats a live baby and tastes its tears.",
			"rips apart a living baby and eats the pieces.",
			"tears open a live baby and feeds on its entrails.",
			"eats a live baby as it cries silently."
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "LiveBaby",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	LiveBaby = _class_0
end
local SoyLoaf
do
	local _class_0
	local _parent_0 = Food
	local _base_0 = {
		PrintName = "Soylent Loaf",
		Model = Model("models/leakgibs/antlion_gib_small_3.mdl"),
		Hunger = -15,
		Thirst = 3,
		Despair = 5,
		Description = "A chewy loaf of dried Long Pig byproducts.\nLoathsome food, but it'll keep for a century.",
		Price = 20,
		UseText = {
			"gnaws at a soylent loaf.",
			"chokes down a soylent loaf.",
			"struggles to eat a soylent loaf.",
			"chomps on a loaf of mummified meat.",
			"grinds their teeth on a soylent loaf.",
			"chews off a chunk from a soylent loaf.",
			"eats some soylent, like a good citizen should."
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "SoyLoaf",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	SoyLoaf = _class_0
end
local SlopBowl
do
	local _class_0
	local _parent_0 = Food
	local _base_0 = {
		PrintName = "Slop Bowl",
		Model = Model("models/props_c17/metalPot001a.mdl"),
		Hunger = -30,
		Thirst = 4,
		Despair = 15,
		Description = "A festering pot that oozes a disgusting liquid.\nIt seems oddly comforting.",
		CookTime = 10,
		Price = 20,
		UseText = {
			"enjoys the slop.",
			"chokes while consuming slop.",
			"struggles to eat a slop bowl.",
			"chomps on some slop.",
			"begrudgingly eats a spoonful of slop.",
			"consumes slop."
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "SlopBowl",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	SlopBowl = _class_0
end
local Boot
do
	local _class_0
	local _parent_0 = Food
	local _base_0 = {
		PrintName = "Boot",
		Model = Model("models/props_junk/Shoe001a.mdl"),
		AddHealth = -4,
		Hunger = -5,
		Thirst = 40,
		Despair = 40,
		Description = "A dirty old boot, nearly fallen apart.",
		UseText = {
			"chews on a nasty boot!",
			"chokes on an old boot.",
			"gnaws a boot to shreds.",
			"shoves a boot in their mouth!",
			"eats a rotten leather boot.",
			"devours a dirty old boot!",
			"eats a boot."
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Boot",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Boot = _class_0
end
local MoldMelon
do
	local _class_0
	local _parent_0 = Food
	local _base_0 = {
		PrintName = "Mold Melon",
		Model = Model("models/gibs/antlionegg01_chunk01c.mdl"),
		AddHealth = 5,
		Hunger = function(self)
			return (math.random(-10, -18))
		end,
		Description = "A pithy husk of fruit, fully colonized by white mold.",
		Price = 25,
		UseText = {
			"eats a moldy melon.",
			"devours a moldy chunk of melon.",
			"munches on a mold melon.",
			"feasts on a fungus fruit.",
			"tears into some mold melon.",
			"crunches up a mold melon.",
			"chows down on a mold melon."
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "MoldMelon",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	MoldMelon = _class_0
end
local DrinkFluid
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = (function()
			local _accum_0 = { }
			local _len_0 = 1
			for i = 1, 2 do
				_accum_0[_len_0] = "npc/barnacle/barnacle_gulp" .. tostring(i) .. ".wav"
				_len_0 = _len_0 + 1
			end
			return _accum_0
		end)(),
		level = SNDLVL_65DB
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "DrinkFluid",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	DrinkFluid = _class_0
end
local Drink
do
	local _class_0
	local _parent_0 = Food
	local _base_0 = {
		PrintName = "Drink",
		Sound = "DrinkFluid"
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Drink",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Drink = _class_0
end
local FearBeer
do
	local _class_0
	local _parent_0 = Drink
	local _base_0 = {
		PrintName = "Fear Beer",
		Model = Model("models/props_junk/garbage_glassbottle001a.mdl"),
		Thirst = -12,
		Despair = -15,
		Description = "A bottle of foul off-yellow liquid.\n'BEER' is hand-written on the label.",
		Price = 60,
		TrashClass = "trash/bottle/fearbeer",
		ImpactThreshold = 256,
		UseText = {
			"chugs a fear beer.",
			"downs a bottle of piss beer.",
			"drinks a ratty bottle of brew.",
			"quaffs a beer and grimaces.",
			"takes a swig of fear beer and shivers.",
			"guzzles a fear beer.",
			"chokes down some piss beer."
		},
		Initialize = function(self)
			_class_0.__parent.__base.Initialize(self)
			if SERVER then
				return self:PrecacheGibs()
			end
		end,
		OnTakeDamage = function(self, dmg)
			_class_0.__parent.__base.OnTakeDamage(self, dmg)
			local types = DMG_CLUB + DMG_SLASH + DMG_BULLET + DMG_CRUSH
			if dmg:GetDamage() > 10 and dmg:IsDamageType(types) then
				self:Shatter(dmg:GetDamageForce())
			end
			if attacker and IsValid(attacker) and attacker:IsPlayer() then
				if attacker:HasOddity(ODDITY_DELINQUENCY) then
					return attacker:AddDespair(-math.random(2, 4))
				end
			end
		end,
		PhysicsCollide = function(self, data)
			_class_0.__parent.__base.PhysicsCollide(self, data)
			if CLIENT then
				return
			end
			if data.Speed > self.ImpactThreshold then
				if data.HitEntity and IsValid(data.HitEntity) then
					local attacker = self:GetNWEntity("evilrp_submitter")
					local dmg = DamageInfo()
					dmg:SetDamage(25)
					if IsValid(attacker) then
						dmg:SetAttacker(attacker)
					end
					dmg:SetInflictor(self)
					dmg:SetDamageType(DMG_SLASH)
					dmg:SetDamagePosition(data.HitPos)
					data.HitEntity:TakeDamageInfo(dmg)
				end
				local force = data.OurNewVelocity
				return self:Shatter(force)
			end
		end,
		Shatter = function(self, force)
			if self.broken then
				return
			end
			self.broken = true
			local pos = self:GetPos()
			local _list_0 = player.GetAll()
			for _index_0 = 1, #_list_0 do
				local ply = _list_0[_index_0]
				if not ply:HasOddity(ODDITY_DELINQUENCY) then
					goto _continue_0
				end
				if ply:CanSee(self) and ply:LookingInDirection(pos) then
					ply:AddDespair(-math.random(2, 4))
				end
				::_continue_0::
			end
			do
				local ed = EffectData()
				ed:SetStart(pos)
				ed:SetOrigin(pos)
				ed:SetScale(8)
				util.Effect("GlassImpact", ed, true, true)
			end
			self:EmitSound("BottleSmash")
			self:GibBreakServer(force)
			return self:Remove()
		end
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "FearBeer",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	FearBeer = _class_0
end
local SmearBeer
do
	local _class_0
	local _parent_0 = Drink
	local _base_0 = {
		PrintName = "Smear Beer",
		Model = Model("models/props_junk/garbage_glassbottle003a.mdl"),
		Thirst = -12,
		Despair = -35,
		Description = "A bottle of cloudy, greyish red booze.\nThe label is obscured with a smear of old blood.",
		Price = 95,
		TrashClass = "trash/bottle",
		ImpactThreshold = 256,
		UseText = {
			"chugs a smear beer.",
			"downs a bottle of red brew.",
			"drinks a cloudy bottle of beer.",
			"quaffs a smear beer and shivers.",
			"takes a swig of smear beer.",
			"guzzles a bloody beer.",
			"nurses a bottle of blood beer."
		},
		Initialize = function(self)
			_class_0.__parent.__base.Initialize(self)
			if SERVER then
				return self:PrecacheGibs()
			end
		end,
		OnTakeDamage = function(self, dmg)
			_class_0.__parent.__base.OnTakeDamage(self, dmg)
			local types = DMG_CLUB + DMG_SLASH + DMG_BULLET + DMG_CRUSH
			if dmg:GetDamage() > 10 and dmg:IsDamageType(types) then
				self:Shatter(dmg:GetDamageForce())
			end
			if attacker and IsValid(attacker) and attacker:IsPlayer() then
				if attacker:HasOddity(ODDITY_DELINQUENCY) then
					return attacker:AddDespair(-math.random(2, 4))
				end
			end
		end,
		PhysicsCollide = function(self, data)
			_class_0.__parent.__base.PhysicsCollide(self, data)
			if CLIENT then
				return
			end
			if data.Speed > self.ImpactThreshold then
				if data.HitEntity and IsValid(data.HitEntity) then
					local attacker = self:GetNWEntity("evilrp_submitter")
					local dmg = DamageInfo()
					dmg:SetDamage(25)
					if IsValid(attacker) then
						dmg:SetAttacker(attacker)
					end
					dmg:SetInflictor(self)
					dmg:SetDamageType(DMG_SLASH)
					dmg:SetDamagePosition(data.HitPos)
					data.HitEntity:TakeDamageInfo(dmg)
				end
				local force = data.OurNewVelocity
				return self:Shatter(force)
			end
		end,
		Shatter = function(self, force)
			if self.broken then
				return
			end
			self.broken = true
			local pos = self:GetPos()
			local _list_0 = player.GetAll()
			for _index_0 = 1, #_list_0 do
				local ply = _list_0[_index_0]
				if not ply:HasOddity(ODDITY_DELINQUENCY) then
					goto _continue_0
				end
				if ply:CanSee(self) and ply:LookingInDirection(pos) then
					ply:AddDespair(-math.random(2, 4))
				end
				::_continue_0::
			end
			do
				local ed = EffectData()
				ed:SetStart(pos)
				ed:SetOrigin(pos)
				ed:SetScale(8)
				util.Effect("GlassImpact", ed, true, true)
			end
			self:EmitSound("BottleSmash")
			self:GibBreakServer(force)
			return self:Remove()
		end
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "SmearBeer",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	SmearBeer = _class_0
end
local Shake
do
	local _class_0
	local _parent_0 = Drink
	local _base_0 = {
		PrintName = "Soylent Shake",
		Model = Model("models/props_junk/garbage_milkcarton001a.mdl"),
		Thirst = -40,
		Hunger = -40,
		Despair = 30,
		Description = "A jug full of partially blended human remains.\nIt's warm and chunky.",
		Price = 120,
		TrashClass = "trash/plastic/shake",
		UseText = {
			"chokes down a soylent shake.",
			"slurps up a soylent shake.",
			"swigs blended peoplemeat and shudders.",
			"struggles down a jug of human sludge.",
			"shoots back a bad protein shake.",
			"guzzles a meat smoothie.",
			"quaffs an entire soylent shake."
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Shake",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Shake = _class_0
end
local Twitchel
do
	local _class_0
	local _parent_0 = Drink
	local _base_0 = {
		PrintName = "Twitchel",
		Model = Model("models/props_junk/garbage_plasticbottle003a.mdl"),
		Thirst = -44,
		Hunger = 6,
		Despair = 6,
		Description = "A bottle of refreshingly lukewarm, cloudy green drink.",
		Price = 80,
		TrashClass = "trash/plastic/twitchel",
		UseText = {
			"necks a bottle of twitchel.",
			"can't get enough of that green stuff.",
			"sucks down a bottle of twitchel.",
			"sips up their twitchel.",
			"pours twitchel down their throat.",
			"drinks a bottle of twitchel.",
			"slurps up a green drink."
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Twitchel",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Twitchel = _class_0
end
local TakeMeds
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = (function()
			local _accum_0 = { }
			local _len_0 = 1
			for i = 1, 3 do
				_accum_0[_len_0] = "npc/zombie/zombie_pain" .. tostring(i) .. ".wav"
				_len_0 = _len_0 + 1
			end
			return _accum_0
		end)()
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "TakeMeds",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	TakeMeds = _class_0
end
local Medicine
do
	local _class_0
	local _parent_0 = Food
	local _base_0 = {
		PrintName = "Medicine",
		Sound = "TakeMeds"
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Medicine",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Medicine = _class_0
end
local Pills
do
	local _class_0
	local _parent_0 = Medicine
	local _base_0 = {
		PrintName = "Pills",
		Model = Model("models/props_lab/jar01b.mdl"),
		AddHealth = function(self)
			return (math.random(-15, -30))
		end,
		Hunger = function(self)
			return (math.random(30, 50))
		end,
		Thirst = function(self)
			return (math.random(30, 60))
		end,
		Despair = function(self)
			return (math.random(-60, -100))
		end,
		Description = "A white plastic bottle, full of random pills.",
		Price = 125,
		TrashClass = "trash/plastic/pills",
		UseText = {
			"throws a mess of pills into eir mouth.",
			"consumes the whole contents of a pill bottle.",
			"devours handfuls of scary-looking pills.",
			"chokes down some strange pills.",
			"takes eir medicine, like a good citizen should.",
			"swallows a mouthful of pills.",
			"takes an excessive dose of colorful pills.",
			"tosses back an entire bottle of pills.",
			"throws back a bottle of mystery pills."
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Pills",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Pills = _class_0
end
local TimeGas
do
	local _class_0
	local _parent_0 = Medicine
	local _base_0 = {
		PrintName = "Time Gas",
		Model = Model("models/props_wasteland/prison_sinkchunk001e.mdl"),
		Sound = (function()
			local _accum_0 = { }
			local _len_0 = 1
			for i = 2, 3 do
				_accum_0[_len_0] = "npc/fast_zombie/idle" .. tostring(i)
				_len_0 = _len_0 + 1
			end
			return _accum_0
		end)(),
		AddHealth = function(self)
			return (math.random(20, 40))
		end,
		Hunger = function(self)
			return (math.random(10, 20))
		end,
		Thirst = function(self)
			return (math.random(20, 30))
		end,
		Despair = function(self)
			return (math.random(0, 10))
		end,
		Description = "An inhaler of time acceleration gas.\nSpeeds up healing, and dying.",
		Price = 100,
		TrashClass = "trash/inhaler",
		UseText = {
			"breathes in some time gas.",
			"huffs a healing gas.",
			"isn't yet tired of the time gas.",
			"inhales a big cloud of time gas.",
			"takes a deep breath of time gas.",
			"drags in a lungful of time gas.",
			"sniffs up a cloud of time gas.",
			"huffs time gas from the rusty inhaler."
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "TimeGas",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	TimeGas = _class_0
end
local Bleach
do
	local _class_0
	local _parent_0 = Medicine
	local _base_0 = {
		PrintName = "Chlorine",
		Model = Model("models/props_junk/garbage_plasticbottle002a"),
		Sound = "DrinkFluid",
		AddHealth = function(self)
			return (math.random(75, 99))
		end,
		Hunger = 70,
		Thirst = 70,
		Despair = 70,
		Description = "A jug full of bleach.",
		Price = 100,
		TrashClass = "trash/plastic/bleach",
		UseText = {
			"drinks bleach.",
			"chugs an entire fucking jug of chlorine.",
			"unscrews a jug of bleach and pours it down the hatch.",
			"chokes down gulp after gulp of chlorine bleach."
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Bleach",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Bleach = _class_0
end
local Ambrosia
do
	local _class_0
	local _parent_0 = Food
	local _base_0 = {
		PrintName = "Ambrosia",
		Model = Model("models/Gibs/HGIBS.mdl"),
		Hunger = -100,
		Thirst = -100,
		Despair = -100,
		HealthAdd = 100,
		Description = "A food made for gods.",
		RotTime = 0,
		UseText = {
			"indulges in some ambrosia."
		},
		Eat = function(self, ply)
			_class_0.__parent.__base.Eat(self, ply)
			if CLIENT then
				return
			end
			return ply:AddStemCells(5)
		end
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Ambrosia",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Ambrosia = _class_0
end
local SloppyRibs
do
	local _class_0
	local _parent_0 = Food
	local _base_0 = {
		PrintName = "Sloppy Ribs",
		Model = Model("models/vel/evilwar/sloppyribs.mdl"),
		Hunger = -28,
		Thirst = -4,
		Despair = 5,
		Description = "Fresh ribs from an unknown source, now glazed in slop! \n They look delicious.",
		CookTime = 10,
		Price = 115,
		UseText = {
			"devours all of the flesh and slop on the rib, then throws it away.",
			"munches on the rib, and then licks the glaze off his hands.",
			"gobbles down the rib, and spits out the bone."
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "SloppyRibs",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	SloppyRibs = _class_0
end
local EyeballNoodles
do
	local _class_0
	local _parent_0 = Food
	local _base_0 = {
		PrintName = "Eyeball Noodles",
		Model = Model("models/vel/evilwar/eyenoodle.mdl"),
		Hunger = -40,
		Thirst = -5,
		Despair = 10,
		Description = "A traditional Lymphomian dish, usually served to go. \n The texture is an acquired taste.",
		CookTime = 8,
		Price = 130,
		UseText = {
			"slurps all of the noodles.",
			"slurps the noodles, gagging at the wet crunch of the eyeball.",
			"eats the noodles, and then spits out the eyeball.",
			"gags on the noodles, and then throws out the eyeball."
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "EyeballNoodles",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	EyeballNoodles = _class_0
end
local PaperMache
local _class_0
local _parent_0 = Food
local _base_0 = {
	PrintName = "Paper Mache",
	Model = Model("models/props_junk/garbage_bag001a.mdl"),
	Hunger = -10,
	Thirst = -10,
	Despair = 15,
	Description = "An old crumpled paper. \n now it's watered down into a little ball.",
	CookTime = 3,
	Price = 30,
	UseText = {
		"stoves the paper mache into his mouth, gagging horribly.",
		"forces the paper down his throat, throwing up slightly",
		"rips apart the paper mache, eating small pieces at a time.",
		"looks miserable trying to eat watered down paper."
	}
}
for _key_0, _val_0 in pairs(_parent_0.__base) do
	if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
		_base_0[_key_0] = _val_0
	end
end
if _base_0.__index == nil then
	_base_0.__index = _base_0
end
setmetatable(_base_0, _parent_0.__base)
_class_0 = setmetatable({
	__init = function(self, ...)
		return _class_0.__parent.__init(self, ...)
	end,
	__base = _base_0,
	__name = "PaperMache",
	__parent = _parent_0
}, {
	__index = function(cls, name)
		local val = rawget(_base_0, name)
		if val == nil then
			local parent = rawget(cls, "__parent")
			if parent then
				return parent[name]
			end
		else
			return val
		end
	end,
	__call = function(cls, ...)
		local _self_0 = setmetatable({ }, _base_0)
		cls.__init(_self_0, ...)
		return _self_0
	end
})
_base_0.__class = _class_0
if _parent_0.__inherited then
	_parent_0.__inherited(_parent_0, _class_0)
end
PaperMache = _class_0
return _class_0
