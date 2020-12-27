Storage = {
	InMenu = false,
	MenuDesc = "Véhicules disponible",
	FinalPrice = 0,
	ShopsIn = {},
	ShopsOut = {},
	BuyOut = {},
	LastVhc = {},
    CarChoosent = {},
    CarOut = {},
	CarIn = {},
	CrtWeight = 0,
	PlayerCars = {},
	RentalCars = {
		{Label = "Faggio", Value = "faggio", Price = math.random(100, 500)},
		{Label = "Blista", Value = "blista", Price = math.random(500, 1000)},
		{Label = "Fusilade", Value = "fusilade", Price = math.random(1000, 2000)},
	},
	Ply_Inv = {},
    Vhc_Inv = {},
    CrtWeight = 0,
    Pressed = false,
    Trunk = {
        MaxWeight = {
            [0] = 150000, --Compact
            [1] = 150000, --Sedan
            [2] = 150000, --SUV
            [3] = 150000, --Coupes
            [4] = 150000, --Muscle
            [5] = 150000, --Sports Classics
            [6] = 150000, --Sports
            [7] = 150000, --Super
            [8] = 150000, --Motorcycles
            [9] = 150000, --Off-road
            [10] = 150000, --Industrial
            [11] = 150000, --Utility
            [12] = 150000, --Vans
            [13] = 150000, --Cycles
            [14] = 150000, --Boats
            [15] = 150000, --Helicopters
            [16] = 150000, --Planes
            [17] = 150000, --Service
            [18] = 150000, --Emergency
            [19] = 150000, --Military
            [20] = 150000, --Commercial
            [21] = 150000, --Trains
        },
        Weight = {
            ["phone"] = 1000,
            ["silencieux"] = 1000,
            ["serflex"] = 1000,
            ["saucisse"] = 1000,
            ["sandiwch"] = 1000,
            ["headbag"] = 1000,
            ["policeradio"] = 1000,
            ["patate"] = 1000,
            ["hotdogbread"] = 1000,
            ["bread"] = 1000,
            ["hotdog"] = 1000,
            ["bulletproof"] = 1000,
            ["frite"] = 1000,
            ["water"] = 1000,
            ["medikit"] = 1000,
            ["corde"] = 1000,
            ["coca"] = 1000,
            ["sim"] = 1000,
            ["bandage"] = 1000,
        },
    },
}