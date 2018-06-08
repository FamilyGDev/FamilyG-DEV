Config                            = {}
Config.DrawDistance               = 100.0
Config.MaxInService               = -1
Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.Locale                     = 'fr'

Config.Zones = {

	PieceFarm = {
		Pos   = {x = 1184.2655, y = 2722.9626, z = 37.6234},
		Size  = {x = 1.8, y = 1.8, z = 0.2},
		Color = {r = 17, g = 206, b = 80},
		Name  = "5- Récolte pièces",
		Type  = 1
	},

	TraitementBillet = {
		Pos   = {x = -1553.8370, y = -580.6466, z = 32.9333},
		Size  = {x = 2.0, y = 2.0, z = 0.2},
		Color = {r = 17, g = 206, b = 80},
		Name  = "6- Traitement des pièces",
		Type  = 1
	},

	TraitementSacnumerotter = {
		Pos   = {x = -20.7425, y = -662.0417, z = 32.4804},
		Size  = {x = 2.0, y = 2.0, z = 0.2},
		Color = {r = 17, g = 206, b = 80},
		Name  = "7- Traitement des billets",
		Type  = 1
	},
	
	SellFarm = {
		Pos   = {x = 255.0518, y = 228.1508, z = 105.2868},
		Size  = {x = 1.5, y = 1.5, z = 0.2},
		Color = {r = 17, g = 206, b = 80},
		Name  = "8- Vente des Sacs Numerotter",
		Type  = 1
	},

	BrinksActions = {
		Pos   = {x = 8.2234, y = -658.5587, z = 32.4497},
		Size  = {x = 1.2, y = 1.2, z = 0.4},
		Color = {r = 17, g = 206, b = 80},
		Name  = "1- Point d'action",
		Type  = 0
	 },
	  
	VehicleSpawner = {
		Pos   = {x = 2.9004, y = -712.3111, z = 31.4806},
		Size = {x = 1.2, y = 1.2, z = 0.4},
		Color = {r = 17, g = 206, b = 80},
		Name  = "2- Garage véhicule de travail",
		Type  = 0
	},

	VehicleSpawnPoint = {
		Pos   = {x = -3.3841, y = -709.3856, z = 31.3380},
		Size  = {x = 1.2, y = 1.2, z = 0.4},
		Color = {r = 17, g = 206, b = 80},
		Heading = 328.156,
		Name  = "3- Spawn point",
		Type  = -1
	},

	VehicleDeleter = {
		Pos   = {x = -20.0622, y = -705.8746, z = 31.3381},
		Size  = {x = 4.0, y = 4.0, z = 0.3},
		Color = {r = 255, g = 0, b = 0},
		Name  = "4- Ranger son véhicule",
		Type  = 1
	}

}