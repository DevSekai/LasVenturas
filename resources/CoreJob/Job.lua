Job = {
	MarkerDist = 8,
	PedDist = 2,
	MarkerType = 29,
	MarkerScale = 0.3,
	JobMarkerType = 24,
	JobMarkerScale = 0.5,
	MarkerR = 243,
	MarkerG = 255,
	MarkerB = 51,
	MarkerA = 75,
	AnimDict = "mini@strip_club@idles@bouncer@base",
	Anim = "base",
	MissionTxt = "",
	Interim = {
		{JobName = "Ouvrier", JobDesc = "Vous allez aider à la construction d'une maison.", Pos = vector3(-975.1649, 390.0791, 74.70691)},
		{JobName = "Pêcheur", JobDesc = "Vous allez pêcher du poisson.", Pos = vector3(-22.589008331299, 3036.5803222656, 40.9736328125)},
		{JobName = "Fermier", JobDesc = "Vous allez cultiver des pommes de terre.", Pos = vector3(2309.604, 4885.438, 41.79932)},
	},
	Coords = {
		{
			Type = "Interim",
			Label = "Agence d'intérim",
			Sprite = 498, 
			Scale = 1.0, 
			Color = 3, 
			Ped = "a_f_y_business_03",
		 	x = -268.8923, y = -956.2418, z = 31.21753, h = 209.76377868652
		},
		{
			Type = "Ouvrier",
			Label = "Mission intérim : Ouvrier",
			Sprite = 480, 
			Scale = 0.7, 
			Color = 62, 
			Ped = "s_m_y_construct_01",
		 	x = -975.1649, y = 390.0791, z = 74.70691, h = 348.6614074707
		},
		{
			Type = "Pêcheur",
			Label = "Mission intérim : Pêcheur",
			Sprite = 480, 
			Scale = 0.7, 
			Color = 62, 
			Ped = "s_m_m_autoshop_02",
			x = -22.589008331299, y = 3036.5803222656, z = 40.9736328125, h = 294.80316162109,
		},
		{
			Type = "Fermier",
			Label = "Mission intérim : Fermier",
			Sprite = 480, 
			Scale = 0.7, 
			Color = 62, 
			Ped = "s_m_m_dockwork_01",
			x = 2251.75390625, y = 5155.33203125, z = 57.8740234375, h = 240.94488525391,
		},
	},
	Ouvrier = {
		Count = 0,
		Anim = "WORLD_HUMAN_HAMMERING",
		Pos = {
			{x = -945.50769042969, y = 395.69671630859, z = 77.723022460938, h = 204.09449768066},
			{x = -940.37799072266, y = 395.0637512207, z = 77.723022460938, h = 25.511810302734},
			{x = -932.72967529297, y = 391.30548095703, z = 79.138427734375, h = 113.38581848145},
			{x = -936.73846435547, y = 401.90768432617, z = 79.138427734375, h = 110.55117797852},
			{x = -933.07250976563, y = 404.36044311523, z = 79.138427734375, h = 294.80316162109},
			{x = -931.85931396484, y = 400.70770263672, z = 82.019775390625, h = 201.25985717773},
			{x = -937.13403320313, y = 402.65933227539, z = 82.019775390625, h = 107.71652984619},
			{x = -937.05493164063, y = 393.41537475586, z = 81.227783203125, h = 204.09449768066},
			{x = -945.48132324219, y = 401.41976928711, z = 80.520141601563, h = 204.09449768066},
			{x = -941.88134765625, y = 396.52746582031, z = 77.723022460938, h = 209.76377868652},
			{x = -955.63519287109, y = 389.30108642578, z = 73.325317382813, h = 19.842517852783},
			{x = -951.67913818359, y = 383.30108642578, z = 73.325317382813, h = 204.09449768066},
		},
	},
	Pecheur = {
		Count = 0,
		Anim = "WORLD_HUMAN_STAND_FISHING",
		Pos = {
			{x = -47.591209411621, y = 3097.3713378906, z = 26.381713867188, h = 8.5039367675781},
			{x = -54.817577362061, y = 3099.1911621094, z = 26.263793945313, h = 354.33071899414},
			{x = -61.239555358887, y = 3102.5012207031, z = 26.533325195313, h = 345.82678222656},
			{x = -68.373626708984, y = 3102.9362792969, z = 26.145751953125, h = 11.338582038879},
			{x = -77.129669189453, y = 3101.4460449219, z = 26.583862304688, h = 8.5039367675781},
			{x = -84.817581176758, y = 3100.5627441406, z = 26.617553710938, h = 2.8346455097198},
			{x = -39.283515930176, y = 3101.4328613281, z = 26.971435546875, h = 8.5039367675781},
			{x = -35.156044006348, y = 3103.5693359375, z = 26.348022460938, h = 14.173227310181},
			{x = -25.542854309082, y = 3105.7846679688, z = 28.521606445313, h = 11.338582038879},
			{x = -17.881317138672, y = 3107.3010253906, z = 26.81982421875, h = 5.6692910194397},
			{x = -11.380214691162, y = 3106.7868652344, z = 27.207275390625, h = 348.6614074707},
			{x = -2.782413482666, y = 3107.5385742188, z = 26.904052734375, h = 2.8346455097198},
		},
	},
	Fermier = {
		Count = 0,
		Anim = "WORLD_HUMAN_GARDENER_PLANT",
		Pos = {
			{x = 2277.6791992188, y = 5139.7978515625, z = 53.425659179688, h = 215.43309020996},
			{x = 2286.1186523438, y = 5131.1079101563, z = 51.555297851563, h = 226.77166748047},
			{x = 2295.666015625, y = 5121.5209960938, z = 49.904052734375, h = 226.77166748047},
			{x = 2314.6286621094, y = 5103.033203125, z = 47.376586914063, h = 226.77166748047},
			{x = 2299.0549316406, y = 5134.2197265625, z = 51.420532226563, h = 45.354328155518},
			{x = 2289.1120605469, y = 5144.2153320313, z = 53.459350585938, h = 42.519683837891},
			{x = 2321.4196777344, y = 5127.7846679688, z = 49.213134765625, h = 223.93701171875},
			{x = 2342.5583496094, y = 5121.4418945313, z = 48.23583984375, h = 45.354328155518},
			{x = 2334.9626464844, y = 5129.5385742188, z = 48.75830078125, h = 42.519683837891},
			{x = 2324.5979003906, y = 5139.5737304688, z = 50.240966796875, h = 45.354328155518},
			{x = 2299.6220703125, y = 5163.9692382813, z = 56.84619140625, h = 45.354328155518},
			{x = 2298.2373046875, y = 5136.0, z = 51.706909179688, h = 201.25985717773},
		},
	},
	Wl = {
		Society_Money = 0,
		DuttyState = false,
		PlyInv = {},
		PlyReport = {},
		SctInv = {},
		Objects = {},
		["ambulance"] = {
			Btn = {
				{
					Type = "Separator",
					Label = "↓↓       ~g~Soins~s~       ↓↓",
				},
				{
					Type = "Button",
					Label = "Soigner la personne",
					Function = function()
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestPlayer == -1 or closestDistance > 1.5 then
							ESX.ShowNotification("Personne aux alentours")
						else
							TrgHealth = GetEntityHealth(GetPlayerPed(closestPlayer))
							if TrgHealth ~= 0 then
								TriggerServerEvent('HealPly', GetPlayerServerId(closestPlayer), false)
							else
								ESX.ShowNotification("La personne est inconsciente, des soins ne lui ferons rien.")
							end
						end
					end,
				},
				{
					Type = "Button",
					Label = "Réanimer la personne",
					Function = function()
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestPlayer == -1 or closestDistance > 1.5 then
							ESX.ShowNotification("Personne aux alentours")
						else
							TrgHealth = GetEntityHealth(GetPlayerPed(closestPlayer))
							if TrgHealth == 0 then
								TriggerServerEvent('RevivePly', GetPlayerServerId(closestPlayer), false)
							else
								ESX.ShowNotification("La personne est consciente, une réanimation ne lui fera rien.")
							end
						end
					end,
				},
				{
					Type = "Separator",
					Label = "↓↓       ~o~Utilitaires~s~       ↓↓",
				},
				{
					Type = "Button",
					Label = "Ecrire dans le dossier de la personne",
					Function = function()
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						--if closestPlayer == -1 or closestDistance > 1.5 then
							--ESX.ShowNotification("Personne aux alentours")
						--else
							Y, M, D, H, M, S = GetLocalTime()
							Input = KeyboardInput("Entre le rapport", "", 250)
							if Input ~= nil then
								Date = ""..D.."/"..M.."/"..Y.." ~ "..(H + 1).."/"..M..""
								TriggerServerEvent('NewReport', GetPlayerServerId(PlayerId()), Date, Input)
							else

							end
						--end
					end,
				},
				{
					Type = "Button",
					Label = "Consulter le dossier de la personne",
					Function = function()
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						--if closestPlayer == -1 or closestDistance > 1.5 then
							--ESX.ShowNotification("Personne aux alentours")
						--else
							ESX.TriggerServerCallback('GetJobReport', function(Report)
								Job.Wl.PlyReport = Report
							end, GetPlayerServerId(PlayerId()))
							RageUI.Visible(RMenu:Get("Job", "Mobil_Report"), not RageUI.Visible(RMenu:Get("Job", "Mobil_Report")))
						--end
					end,
				},
				{
					Type = "List",
					Label = "Objet",
					Index = 1,
					Table = {
						{Name = "Trousse de soin", Value = "xm_prop_x17_bag_med_01a"},
						{Name = "Sac mortuaire", Value = "xm_prop_body_bag"},
					},
					Function = function(Model)
						Coords = GetEntityCoords(PlayerPedId())
						Heading = GetEntityHeading(PlayerPedId())
						if not HasModelLoaded(GetHashKey(Model)) and IsModelInCdimage(GetHashKey(Model)) then
							RequestModel(GetHashKey(Model))
							while not HasModelLoaded(GetHashKey(Model)) do
								Citizen.Wait(1)
							end
						end
						Obj = CreateObject(GetHashKey(Model), Coords.x, Coords.y, Coords.z - 0.98, true, false, true)
						SetEntityHeading(Obj, Heading)
						table.insert(Job.Wl.Objects, Obj)
					end,
				},
			},
			Coords = {
				{
					MarkerType = 29,
					MarkerScale = 0.5,
					MarkerR = 243,
					MarkerG = 0,
					MarkerB = 51,
					MarkerA = 75,
					x = -219.30989074707, y = -979.26593017578, z = 29.482055664063,
					Type = "Chest",
				},
				{
					MarkerType = 29,
					MarkerScale = 0.5,
					MarkerR = 243,
					MarkerG = 0,
					MarkerB = 51,
					MarkerA = 75,
					x = -222.17141723633, y = -979.83294677734, z = 29.482055664063,
					Type = "Shop",
				},
				{
					MarkerType = 36,
					MarkerScale = 0.5,
					MarkerR = 243,
					MarkerG = 0,
					MarkerB = 51,
					MarkerA = 75,
					x = -221.20878601074, y = -975.03295898438, z = 29.482055664063,
					Type = "Garage",
				},
				{
					MarkerType = 36,
					MarkerScale = 0.5,
					MarkerR = 243,
					MarkerG = 0,
					MarkerB = 51,
					MarkerA = 75,
					x = -218.83515930176, y = -965.77581787109, z = 29.482055664063,
					Type = "DeleteCar",
				},
				{
					MarkerType = 22,
					MarkerScale = 0.5,
					MarkerR = 243,
					MarkerG = 0,
					MarkerB = 51,
					MarkerA = 75,
					x = -216.48791503906, y = -965.53845214844, z = 29.482055664063,
					Type = "Cloackroom",
				},
			},
			Items = {
				{Label = "Bandage", Value = "bandage", Price = 10, Limite = 10, Type = "Items"},
				{Label = "Défibrillateur", Value = "medikit", Price = 20, Limite = 10, Type = "Weapon"},
			},
			Vehicle = {
				Spawn = {x = -217.41098022461, y = -972.69891357422, z = 29.482055664063, h = 294.80316162109},
				["boss"] = {
					Value = {
						{Label = "Adder", Value = "adder"},
						{Label = "Blista", Value = "blista"},
					},
				},
			},
			Clothe = {
				["boss"] = {
					Value = {
						{
							Label = "Tenue d'ambulancier", 
							Value = {
								TshirtIndex = 1,
								TshirtIndex2 = 1,
								VesteIndex = 1,
								VesteIndex2 = 1,
								PantalonIndex2 = 1,
								ChaussureIndex = 1,
								ChaussureIndex2 = 1,
							},
						},
						{Label = "Police2", Value = "blista"},
					},
				},
			},
		},
		["police"] = {
			Btn = {
				{
					Type = "Separator",
					Label = "↓↓       ~g~Soins~s~       ↓↓",
				},
				{
					Type = "Button",
					Label = "Giffler la personne",
					Function = function()
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestPlayer == -1 or closestDistance > 1.5 then
							ESX.ShowNotification("Personne aux alentours")
						else
							TrgHealth = GetEntityHealth(GetPlayerPed(closestPlayer))
							if TrgHealth ~= 0 then
								TriggerServerEvent('HealPly', GetPlayerServerId(closestPlayer), false)
							else
								ESX.ShowNotification("La personne est inconsciente, des soins ne lui ferons rien.")
							end
						end
					end,
				},
				{
					Type = "Button",
					Label = "Taper la personne",
					Function = function()
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestPlayer == -1 or closestDistance > 1.5 then
							ESX.ShowNotification("Personne aux alentours")
						else
							TrgHealth = GetEntityHealth(GetPlayerPed(closestPlayer))
							if TrgHealth == 0 then
								TriggerServerEvent('RevivePly', GetPlayerServerId(closestPlayer), false)
							else
								ESX.ShowNotification("La personne est consciente, une réanimation ne lui fera rien.")
							end
						end
					end,
				},
				{
					Type = "Separator",
					Label = "↓↓       ~o~Utilitaires~s~       ↓↓",
				},
				{
					Type = "Button",
					Label = "Ecrire dans le dossier de la personne",
					Function = function()
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						--if closestPlayer == -1 or closestDistance > 1.5 then
							--ESX.ShowNotification("Personne aux alentours")
						--else
							Y, M, D, H, M, S = GetLocalTime()
							Input = KeyboardInput("Entre le rapport", "", 250)
							if Input ~= nil then
								Date = ""..D.."/"..M.."/"..Y.." ~ "..(H + 1).."/"..M..""
								TriggerServerEvent('NewJobReport', GetPlayerServerId(PlayerId()), Date, Input)
							else

							end
						--end
					end,
				},
				{
					Type = "Button",
					Label = "Consulter le dossier de la personne",
					Function = function()
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						--if closestPlayer == -1 or closestDistance > 1.5 then
							--ESX.ShowNotification("Personne aux alentours")
						--else
							ESX.TriggerServerCallback('GetJobReport', function(Report)
								Job.Wl.PlyReport = Report
							end, GetPlayerServerId(PlayerId()))
							RageUI.Visible(RMenu:Get("Job", "Mobil_Report"), not RageUI.Visible(RMenu:Get("Job", "Mobil_Report")))
						--end
					end,
				},
				{
					Type = "List",
					Label = "Objet",
					Index = 1,
					Table = {
						{Name = "Trousse de soin", Value = "xm_prop_x17_bag_med_01a"},
						{Name = "Sac mortuaire", Value = "xm_prop_body_bag"},
					},
					Function = function(Model)
						Coords = GetEntityCoords(PlayerPedId())
						Heading = GetEntityHeading(PlayerPedId())
						if not HasModelLoaded(GetHashKey(Model)) and IsModelInCdimage(GetHashKey(Model)) then
							RequestModel(GetHashKey(Model))
							while not HasModelLoaded(GetHashKey(Model)) do
								Citizen.Wait(1)
							end
						end
						Obj = CreateObject(GetHashKey(Model), Coords.x, Coords.y, Coords.z - 0.98, true, false, true)
						SetEntityHeading(Obj, Heading)
						table.insert(Job.Wl.Objects, Obj)
					end,
				},
			},
			Coords = {
				{
					MarkerType = 29,
					MarkerScale = 0.5,
					MarkerR = 243,
					MarkerG = 0,
					MarkerB = 51,
					MarkerA = 75,
					x = -219.30989074707, y = -979.26593017578, z = 29.482055664063,
					Type = "Chest",
				},
				{
					MarkerType = 29,
					MarkerScale = 0.5,
					MarkerR = 243,
					MarkerG = 0,
					MarkerB = 51,
					MarkerA = 75,
					x = -222.17141723633, y = -979.83294677734, z = 29.482055664063,
					Type = "Shop",
				},
				{
					MarkerType = 36,
					MarkerScale = 0.5,
					MarkerR = 243,
					MarkerG = 0,
					MarkerB = 51,
					MarkerA = 75,
					x = -221.20878601074, y = -975.03295898438, z = 29.482055664063,
					Type = "Garage",
				},
				{
					MarkerType = 36,
					MarkerScale = 0.5,
					MarkerR = 243,
					MarkerG = 0,
					MarkerB = 51,
					MarkerA = 75,
					x = -218.83515930176, y = -965.77581787109, z = 29.482055664063,
					Type = "DeleteCar",
				},
				{
					MarkerType = 22,
					MarkerScale = 0.5,
					MarkerR = 243,
					MarkerG = 0,
					MarkerB = 51,
					MarkerA = 75,
					x = -216.48791503906, y = -965.53845214844, z = 29.482055664063,
					Type = "Cloackroom",
				},
			},
			Items = {
				{Label = "Bandage", Value = "bandage", Price = 10, Limite = 10, Type = "Items"},
				{Label = "Défibrillateur", Value = "medikit", Price = 20, Limite = 10, Type = "Weapon"},
			},
			Vehicle = {
				Spawn = {x = -217.41098022461, y = -972.69891357422, z = 29.482055664063, h = 294.80316162109},
				["boss"] = {
					Value = {
						{Label = "Adder", Value = "adder"},
						{Label = "Blista", Value = "blista"},
					},
				},
			},
			Clothe = {
				["boss"] = {
					Value = {
						{
							Label = "Tenue d'ambulancier", 
							Value = {
								TshirtIndex = 1,
								TshirtIndex2 = 1,
								VesteIndex = 1,
								VesteIndex2 = 1,
								PantalonIndex2 = 1,
								ChaussureIndex = 1,
								ChaussureIndex2 = 1,
							},
						},
						{Label = "Police2", Value = "blista"},
					},
				},
			},
		},
	},
}