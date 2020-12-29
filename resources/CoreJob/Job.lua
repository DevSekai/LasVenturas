Job = {
	DeathTimer = 1000,
	Respawn = {
		Coords = vector3(365.53845214844, -569.9736328125, 28.791259765625),
		Heading = 68.031494140625,
		Anim = "move_m@injured",
		AnimDuration = 30 * 1000,
	},
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
	ListIndex = 1,
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
		Trg = {
			Account = {},
			Inventory = {},
			Loadout = {},
		},
		TrgIdentity = {},
		CarOwner = {},
		JobList = {
			{JobName = "ambulance", JobLabel = "EMS"},
			{JobName = "police", JobLabel = "LSPD"},
			{JobName = "mecano", JobLabel = "Mecano"},
			{JobName = "weazel", JobLabel = "Weazel News"},
			{JobName = "unicorn", JobLabel = "Vanilla Unicorn"},
			{JobName = "tequilala", JobLabel = "Tequi La La"},
			{JobName = "gouv", JobLabel = "Gouvernement"},
			{JobName = "dog", JobLabel = "Legion Dog"},
		},
		JobBtn = function()
            RageUI.Item.Checkbox("Prise/Fin de service", "", Job.Wl.DuttyState, {}, {
                onSelected = function(Index, Items)
                    Job.Wl.DuttyState = not Job.Wl.DuttyState
                    TriggerServerEvent("OnDutty", Job.Wl.DuttyState)
                end,
            })
            if Job.Wl.DuttyState then
				if PlayerData.job.grade_name == "boss" then
					RageUI.Item.Button("Actions entreprise", nil, {}, true, {
						onSelected = function(Index, Items)
							ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(Money)
								Job.Wl.Society_Money = Money
							end, PlayerData.job.name)
						end,
					},RMenu:Get("Job", "Mobil_Society"))
				end
                RageUI.Item.Button("Facturation", "", {}, true, {
                    onSelected = function(Index, Items)
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        if closestPlayer == -1 or closestDistance > 1.5 then
                            ESX.ShowNotification("Personne aux alentours")
                        else
                            Input = KeyboardInput("Montant de la facture", "", 20)
                            if tonumber(Input) ~= nil then
                                TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_'..PlayerData.job.name, 'Facture', tonumber(Input))
                            else
                                ESX.ShowNotification("Utilisation invalide.")
                            end
                        end
                    end,
                })
                Job.Wl[PlayerData.job.name].Btn()
            end
		end,
		["ambulance"] = {
			Btn = function()
				RageUI.Item.Separator("↓↓       ~g~Soins~s~       ↓↓")
				RageUI.Item.Button("Soigner la personne", nil, {}, true, {
					onSelected = function(Index, Items)
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
				})
				RageUI.Item.Button("Réanimer la personne", nil, {}, true, {
					onSelected = function(Index, Items)
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
				})
				RageUI.Item.Separator("↓↓       ~o~Utilitaires~s~       ↓↓")
				RageUI.Item.Button("Ecrire dans le dossier de la personne", nil, {}, true, {
					onSelected = function(Index, Items)
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestPlayer == -1 or closestDistance > 1.5 then
							ESX.ShowNotification("Personne aux alentours")
						else
							Y, M, D, H, M, S = GetLocalTime()
							Input = KeyboardInput("Entre le rapport", "", 250)
							if Input ~= nil then
								Date = ""..D.."/"..M.."/"..Y.." ~ "..(H + 1).."/"..M..""
								TriggerServerEvent('NewJobReport', GetPlayerServerId(closestPlayer), Date, Input)
							else
								ESX.ShowNotification("Utilisation invalide.")
							end
						end
					end,
				})
				RageUI.Item.Button("Consulter le dossier de la personne", nil, {}, true, {
					onSelected = function(Index, Items)
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestPlayer == -1 or closestDistance > 1.5 then
							ESX.ShowNotification("Personne aux alentours")
						else
							ESX.TriggerServerCallback('GetJobReport', function(Report)
								Job.Wl.PlyReport = Report
								RageUI.Visible(RMenu:Get("Job", "Mobil_Report"), not RageUI.Visible(RMenu:Get("Job", "Mobil_Report")))
							end, GetPlayerServerId(closestPlayer))
						end
					end,
				})
				RageUI.Item.List("Objets", {
					{Name = "Trousse de soin", Value = "xm_prop_x17_bag_med_01a"},
					{Name = "Sac mortuaire", Value = "xm_prop_body_bag"},
				}, Job.ListIndex, nil, {}, true, {
					onSelected = function(Index, Items)
						Job.ListIndex = Index
						Coords = GetEntityCoords(PlayerPedId())
						Heading = GetEntityHeading(PlayerPedId())
						TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_BUM_BIN', 0, true)
						Citizen.Wait(2000)
						ClearPedTasksImmediately(PlayerPedId())
						if not HasModelLoaded(GetHashKey(Items.Value)) and IsModelInCdimage(GetHashKey(Items.Value)) then
							RequestModel(GetHashKey(Items.Value))
							while not HasModelLoaded(GetHashKey(Items.Value)) do
								Citizen.Wait(1)
							end
						end
						Obj = CreateObject(GetHashKey(Items.Value), Coords.x, Coords.y, Coords.z - 0.98, true, false, true)
						SetEntityHeading(Obj, Heading)
						table.insert(Job.Wl.Objects, Obj)
					end,
				})
			end,
			Coords = {
				{
					MarkerType = 29,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = 327.1252746582, y = -595.68792724609, z = 28.791259765625,
					Type = "Chest",
				},
				{
					MarkerType = 29,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = 330.71209716797, y = -580.61535644531, z = 28.791259765625,
					Type = "Shop",
				},
				{
					MarkerType = 36,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = 315.94287109375, y = -558.96264648438, z = 28.740600585938,
					Type = "Garage",
				},
				{
					MarkerType = 1,
					MarkerScale = 3.0,
					MarkerR = 255,
					MarkerG = 0,
					MarkerB = 0,
					MarkerA = 125,
					x = 328.76043701172, y = -558.1318359375, z = 28.740600585938 - 1,
					Type = "DeleteCar",
				},
				{
					MarkerType = 22,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = 336.0, y = -580.33843994141, z = 28.791259765625,
					Type = "Cloackroom",
				},
			},
			Items = {
				{Label = "Bandage", Value = "bandage", Price = 10, Limite = 10, Type = "Items"},
				{Label = "Défibrillateur", Value = "medikit", Price = 20, Limite = 10, Type = "Weapon"},
			},
			Vehicle = {
				Spawn = {x = 316.8923034668, y = -548.32086181641, z = 28.0498046875, h = 269.29135131836},
				["boss"] = {
					Value = {
						{Label = "Ambulance", Value = "ambulance"},
					},
				},
				["expert"] = {
					Value = {
						{Label = "Ambulance", Value = "ambulance"},
					},
				},
				["medium"] = {
					Value = {
						{Label = "Ambulance", Value = "ambulance"},
					},
				},
				["recrue"] = {
					Value = {
						{Label = "Ambulance", Value = "ambulance"},
					},
				},
			},
			Clothe = {
				["boss"] = {
					Value = {
						{
							Label = "Tenue de service", 
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
					},
				},
				["expert"] = {
					Value = {
						{
							Label = "Tenue de service", 
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
					},
				},
				["medium"] = {
					Value = {
						{
							Label = "Tenue de service", 
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
					},
				},
				["recrue"] = {
					Value = {
						{
							Label = "Tenue de service", 
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
					},
				},
			},
		},
		["mecano"] = {
			Btn = function()
				RageUI.Item.Separator("↓↓       ~g~Réparations~s~       ↓↓")
				RageUI.Item.Button("Réparer le véhicule", nil, {}, true, {
					onSelected = function(Index, Items)
						local Vehicle   = ESX.Game.GetVehicleInDirection()
						local Coords    = GetEntityCoords(PlayerPedId())
						if IsPedSittingInAnyVehicle(PlayerPedId()) then
							ESX.ShowNotification("Vous ne pouvez pas faire depuis le véhicule.")
							return
						end
						if DoesEntityExist(Vehicle) then
							TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_BUM_BIN', 0, true)
							Citizen.Wait(20000)
							SetVehicleFixed(Vehicle)
							SetVehicleDeformationFixed(Vehicle)
							SetVehicleUndriveable(Vehicle, false)
							SetVehicleEngineOn(Vehicle, true, true)
							ClearPedTasksImmediately(PlayerPedId())
							ESX.ShowNotification("Le véhicule est réparer.")
						else
							ESX.ShowNotification("Il n'y a pas de véhicule autour.")
						end
					end,
				})
				RageUI.Item.Button("Nettoyer le véhicule", nil, {}, true, {
					onSelected = function(Index, Items)
						local Vehicle   = ESX.Game.GetVehicleInDirection()
						local Coords    = GetEntityCoords(PlayerPedId())
						if IsPedSittingInAnyVehicle(PlayerPedId()) then
							ESX.ShowNotification("Vous ne pouvez pas faire depuis le véhicule.")
							return
						end
						if DoesEntityExist(Vehicle) then
							TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_BUM_BIN', 0, true)
							Citizen.Wait(10000)
							SetVehicleDirtLevel(vehicle, 0)
							ClearPedTasksImmediately(PlayerPedId())
							ESX.ShowNotification("Le véhicule est propre.")
						else
							ESX.ShowNotification("Il n'y a pas de véhicule autour.")
						end
					end,
				})
				RageUI.Item.Separator("↓↓       ~o~Utilitaires~s~       ↓↓")
				RageUI.Item.Button("Mettre en fourrière", nil, {}, true, {
					onSelected = function(Index, Items)
						local Vehicle   = ESX.Game.GetVehicleInDirection()
						local Coords    = GetEntityCoords(PlayerPedId())
						if IsPedSittingInAnyVehicle(PlayerPedId()) then
							ESX.ShowNotification("Vous ne pouvez pas faire depuis le véhicule.")
							return
						end
						if DoesEntityExist(Vehicle) then
							ESX.Game.DeleteVehicle(Vehicle)
							ESX.ShowNotification("Le véhicule a était mis en fourrière.")
						else
							ESX.ShowNotification("Il n'y a pas de véhicule autour.")
						end
					end,
				})
				RageUI.Item.List("Objets", {
					{Name = "Caisse a outils", Value = "prop_toolchest_01"},
					{Name = "Cône de signalisation", Value = "prop_roadcone02a"},
				}, Job.ListIndex, nil, {}, true, {
					onSelected = function(Index, Items)
						Job.ListIndex = Index
						Coords = GetEntityCoords(PlayerPedId())
						Heading = GetEntityHeading(PlayerPedId())
						TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_BUM_BIN', 0, true)
						Citizen.Wait(2000)
						ClearPedTasksImmediately(PlayerPedId())
						if not HasModelLoaded(GetHashKey(Items.Value)) and IsModelInCdimage(GetHashKey(Items.Value)) then
							RequestModel(GetHashKey(Items.Value))
							while not HasModelLoaded(GetHashKey(Items.Value)) do
								Citizen.Wait(1)
							end
						end
						Obj = CreateObject(GetHashKey(Items.Value), Coords.x, Coords.y, Coords.z - 0.98, true, false, true)
						SetEntityHeading(Obj, Heading)
						table.insert(Job.Wl.Objects, Obj)
					end,
				})
			end,
			Coords = {
				{
					MarkerType = 29,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = -196.21977233887, y = -1340.017578125, z = 34.890869140625,
					Type = "Chest",
				},
				{
					MarkerType = 29,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = -211.01538085938, y = -1324.0219726563, z = 30.257202148438,
					Type = "Stand",
				},
				{
					MarkerType = 36,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = -187.76702880859, y = -1319.0637207031, z = 31.301879882813,
					Type = "Garage",
				},
				{
					MarkerType = 1,
					MarkerScale = 3.0,
					MarkerR = 255,
					MarkerG = 0,
					MarkerB = 0,
					MarkerA = 125,
					x = -183.01977539063, y = -1325.8154296875, z = 31.217529296875 - 1,
					Type = "DeleteCar",
				},
				{
					MarkerType = 22,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = -197.09010314941, y = -1332.4088134766, z = 30.880615234375,
					Type = "Cloackroom",
				},
			},
			Vehicle = {
				Spawn = {x = -183.01977539063, y = -1316.7427978516, z = 30.644653320313, h = 357.16534423828},
				["boss"] = {
					Value = {
						{Label = "SlamVan", Value = "slamvan"},
					},
				},
				["expert"] = {
					Value = {
						{Label = "SlamVan", Value = "slamvan"},
					},
				},
				["medium"] = {
					Value = {
						{Label = "SlamVan", Value = "slamvan"},
					},
				},
				["recrue"] = {
					Value = {
						{Label = "SlamVan", Value = "slamvan"},
					},
				},
			},
			Clothe = {
				["boss"] = {
					Value = {
						{
							Label = "Tenue de service", 
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
					},
				},
				["expert"] = {
					Value = {
						{
							Label = "Tenue de service", 
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
					},
				},
				["medium"] = {
					Value = {
						{
							Label = "Tenue de service", 
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
					},
				},
				["recrue"] = {
					Value = {
						{
							Label = "Tenue de service", 
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
					},
				},
			},
		},
		["police"] = {
			Btn = function()
				RageUI.Item.Separator("↓↓       ~g~Intéraction~s~       ↓↓")
				RageUI.Item.Button("Fouiller la personne", nil, {}, true, {
					onSelected = function(Index, Items)
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestPlayer == -1 or closestDistance > 1.5 then
							ESX.ShowNotification("Personne aux alentours")
						else
							Job.Wl.Trg.Account = {}
							Job.Wl.Trg.Loadout = {}
							Job.Wl.Trg.Inventory = {}
							ESX.TriggerServerCallback('getOtherPlayerData', function(Data)
								for i=1, #Data.accounts, 1 do
									if Data.accounts[i].money > 0 then
										table.insert(Job.Wl.Trg.Account, {
											label    = ESX.Math.Round(Data.accounts[i].money),
											value    = 'money',
											itemType = 'item_account',
											amount   = Data.accounts[i].money
										})
										break
									end
								end
								for i=1, #Data.weapons, 1 do
									table.insert(Job.Wl.Trg.Loadout, {
										label    = ESX.GetWeaponLabel(Data.weapons[i].name),
										value    = Data.weapons[i].name,
										itemType = 'item_weapon',
										amount   = Data.weapons[i].ammo
									})
								end
								for i=1, #Data.inventory, 1 do
									if Data.inventory[i].count > 0 then
										table.insert(Job.Wl.Trg.Inventory, {
											label    = Data.inventory[i].label,
											value    = Data.inventory[i].name,
											itemType = 'item_standard',
											amount   = Data.inventory[i].count
										})
									end
								end
							end, GetPlayerServerId(closestPlayer))
						end
					end,
				},RMenu:Get("Job", "Mobil_TrgInv"))
				RageUI.Item.Button("Vérifier l'identité", nil, {}, true, {
					onSelected = function(Index, Items)
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestPlayer == -1 or closestDistance > 1.5 then
							ESX.ShowNotification("Personne aux alentours")
						else
							ESX.TriggerServerCallback('getIdentity', function(Data)
								Job.Wl.TrgIdentity = Data
								RageUI.Visible(RMenu:Get("Job", "Mobil_TrgIdt"), not RageUI.Visible(RMenu:Get("Job", "Mobil_TrgIdt")))
							end, GetPlayerServerId(closestPlayer))
						end
					end,
				})
				RageUI.Item.Button("Menotter/Démenotter la personne", nil, {}, true, {
					onSelected = function(Index, Items)
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestPlayer == -1 or closestDistance > 1.5 then
							ESX.ShowNotification("Personne aux alentours")
						else
							TriggerServerEvent('Handcuffed', GetPlayerServerId(closestPlayer))
						end
					end,
				})
				RageUI.Item.Button("Mettre dans le véhicule", nil, {}, true, {
					onSelected = function(Index, Items)
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestPlayer == -1 or closestDistance > 1.5 then
							ESX.ShowNotification("Personne aux alentours")
						else
							TriggerServerEvent('InCarOut', GetPlayerServerId(closestPlayer))
						end
					end,
				})
				RageUI.Item.Button("Sortir du véhicule", nil, {}, true, {
					onSelected = function(Index, Items)
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestPlayer == -1 or closestDistance > 1.5 then
							ESX.ShowNotification("Personne aux alentours.")
						else
							TriggerServerEvent('InCarOut', GetPlayerServerId(closestPlayer))
						end
					end,
				})
				RageUI.Item.Button("Vérifier le véhicule", nil, {}, true, {
					onSelected = function(Index, Items)
						local Coords = GetEntityCoords(PlayerPedId())
						if IsAnyVehicleNearPoint(Coords, 5.0) then
							local Vehicle = GetClosestVehicle(Coords, 5.0, 0, 71)
							if DoesEntityExist(Vehicle) then
								ESX.TriggerServerCallback('getCarOwner', function(Data)
									if Data then
										Job.Wl.CarOwner = Data
										RageUI.Visible(RMenu:Get("Job", "Mobil_CarOwner"), not RageUI.Visible(RMenu:Get("Job", "Mobil_CarOwner")))
									else
										ESX.ShowNotification("Le véhicule est volé.")
									end
								end, GetVehicleNumberPlateText(Vehicle))
							end
						else
							ESX.ShowNotification("Pas de véhicule aux alentours.")
						end
					end,
				})
				RageUI.Item.Separator("↓↓       ~o~Utilitaires~s~       ↓↓")
				RageUI.Item.Button("Ecrire dans le cassier de la personne", nil, {}, true, {
					onSelected = function(Index, Items)
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestPlayer == -1 or closestDistance > 1.5 then
							ESX.ShowNotification("Personne aux alentours")
						else
							Y, M, D, H, M, S = GetLocalTime()
							Input = KeyboardInput("Entre le rapport", "", 250)
							if Input ~= nil then
								Date = ""..D.."/"..M.."/"..Y.." ~ "..(H + 1).."/"..M..""
								TriggerServerEvent('NewJobReport', GetPlayerServerId(closestPlayer), Date, Input)
							else
								ESX.ShowNotification("Utilisation invalide.")
							end
						end
					end,
				})
				RageUI.Item.Button("Consulter le cassier de la personne", nil, {}, true, {
					onSelected = function(Index, Items)
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestPlayer == -1 or closestDistance > 1.5 then
							ESX.ShowNotification("Personne aux alentours")
						else
							ESX.TriggerServerCallback('GetJobReport', function(Report)
								Job.Wl.PlyReport = Report
								RageUI.Visible(RMenu:Get("Job", "Mobil_Report"), not RageUI.Visible(RMenu:Get("Job", "Mobil_Report")))
							end, GetPlayerServerId(closestPlayer))
						end
					end,
				})
				RageUI.Item.List("Demande de renfort", {
					{Name = "~g~Code 1~s~", Value = "Low"},
					{Name = "~y~Code 2~s~", Value = "Mid"},
					{Name = "~o~Code 3~s~", Value = "High"},
					{Name = "~r~Code 4~s~", Value = "Xtrem"},
				}, Job.ListIndex, nil, {}, true, {
					onSelected = function(Index, Items)
						Job.ListIndex = Index
						Coords = GetEntityCoords(PlayerPedId())
						TriggerServerEvent("JobRenfort", Coords, Items.Value)
					end,
				})
				RageUI.Item.List("Objets", {
					{Name = "Cône de signalisation", Value = "prop_roadcone02a"},
					{Name = "Barrière", Value = "prop_barrier_work05"},
					{Name = "Herses", Value = "p_ld_stinger_s"},
				}, Job.ListIndex, nil, {}, true, {
					onSelected = function(Index, Items)
						Job.ListIndex = Index
						Coords = GetEntityCoords(PlayerPedId())
						Heading = GetEntityHeading(PlayerPedId())
						TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_BUM_BIN', 0, true)
						Citizen.Wait(2000)
						ClearPedTasksImmediately(PlayerPedId())
						if not HasModelLoaded(GetHashKey(Items.Value)) and IsModelInCdimage(GetHashKey(Items.Value)) then
							RequestModel(GetHashKey(Items.Value))
							while not HasModelLoaded(GetHashKey(Items.Value)) do
								Citizen.Wait(1)
							end
						end
						Obj = CreateObject(GetHashKey(Items.Value), Coords.x, Coords.y, Coords.z - 0.98, true, false, true)
						SetEntityHeading(Obj, Heading)
						table.insert(Job.Wl.Objects, Obj)
					end,
				})
			end,
			Coords = {
				{
					MarkerType = 29,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = 474.13186645508, y = -1007.0373535156, z = 34.216796875,
					Type = "Chest",
				},
				{
					MarkerType = 29,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = 485.19561767578, y = -1005.9165039063, z = 25.724487304688,
					Type = "Shop",
				},
				{
					MarkerType = 36,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = 462.61978149414, y = -978.09228515625, z = 25.775146484375,
					Type = "Garage",
				},
				{
					MarkerType = 1,
					MarkerScale = 3.0,
					MarkerR = 255,
					MarkerG = 0,
					MarkerB = 0,
					MarkerA = 125,
					x = 453.86373901367, y = -975.01977539063, z = 25.724487304688 - 1,
					Type = "DeleteCar",
				},
				{
					MarkerType = 22,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = 473.38021850586, y = -987.70550537109, z = 25.724487304688,
					Type = "Cloackroom",
				},
			},
			Items = {
				{Label = "Lampe torche", Value = "flashlight", Price = 250, Limite = 1, Type = "Weapon"},
				{Label = "Matraque", Value = "nightstick", Price = 500, Limite = 1, Type = "Weapon"},
			},
			Vehicle = {
				Spawn = {x = 458.0439453125, y = -981.11206054688, z = 25.320190429688, h = 119.0551071167},
				["boss"] = {
					Value = {
						{Label = "Police", Value = "police"},
						{Label = "Police2", Value = "police2"},
						{Label = "Police3", Value = "police3"},
						{Label = "Police4", Value = "police4"},
						{Label = "Fbi", Value = "fbi"},
						{Label = "Fbi2", Value = "fbi2"},
					},
				},
				["expert2"] = {
					Value = {
						{Label = "Police", Value = "police"},
						{Label = "Police2", Value = "police2"},
						{Label = "Police3", Value = "police3"},
						{Label = "Fbi", Value = "fbi"},
					},
				},
				["expert"] = {
					Value = {
						{Label = "Police", Value = "police"},
						{Label = "Police2", Value = "police2"},
						{Label = "Police3", Value = "police3"},
						{Label = "Fbi", Value = "fbi"},
					},
				},
				["medium"] = {
					Value = {
						{Label = "Police", Value = "police"},
						{Label = "Police2", Value = "police2"},
						{Label = "Police3", Value = "police3"},
					},
				},
				["recrue"] = {
					Value = {
						{Label = "Police", Value = "police"},
						{Label = "Police2", Value = "police2"},
					},
				},
			},
			Clothe = {
				["boss"] = {
					Value = {
						{
							Label = "Tenue banalisé",
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
						{
							Label = "Tenue d'intervention",
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
						{
							Label = "Tenue de service",
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
					},
				},
				["expert2"] = {
					Value = {
						{
							Label = "Tenue banalisé",
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
						{
							Label = "Tenue d'intervention",
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
						{
							Label = "Tenue de service",
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
					},
				},
				["expert"] = {
					Value = {
						{
							Label = "Tenue banalisé",
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
						{
							Label = "Tenue d'intervention",
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
						{
							Label = "Tenue de service",
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
					},
				},
				["medium"] = {
					Value = {
						{
							Label = "Tenue d'intervention",
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
						{
							Label = "Tenue de service",
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
					},
				},
				["recrue"] = {
					Value = {
						{
							Label = "Tenue de service",
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
					},
				},
			},
		},
		["weazel"] = {
			Toggle = {
				["Caméra"] = false,
				["Micro"] = false,
				["Perche"] = false,
			},
			Btn = function()
				RageUI.Item.Separator("↓↓       ~o~Utilitaires~s~       ↓↓")
				RageUI.Item.Button("Diffuser une annonce", nil, {}, true, {
					onSelected = function(Index, Items)
						Desc = KeyboardInput("Description de l'annonce", "", 255)
						if Desc then
							TriggerServerEvent("Job:Annonce", Desc)
						end
					end,
				})
				RageUI.Item.List("Objets", {
					{Name = "Caméra", Model = "prop_v_cam_01", Dict = "missfinale_c2mcs_1", Anim = "fin_c2_mcs_1_camman"},
					{Name = "Micro", Model = "p_ing_microphonel_01", Dict = "missheistdocksprep1hold_cellphone", Anim = "hold_cellphone"},
					{Name = "Perche", Model = "prop_v_bmike_01", Dict = "missfra1", Anim = "mcs2_crew_idle_m_boom"},
				}, Job.ListIndex, nil, {}, true, {
					onSelected = function(Index, Items)
						Job.ListIndex = Index
						if not Job.Wl[PlayerData.job.name].Toggle[Items.Name] then
							RequestModel(GetHashKey(Items.Model))
							while not HasModelLoaded(GetHashKey(Items.Model)) do
								Citizen.Wait(100)
							end
							
							local PlyCoords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.0, -5.0)
							Objects = CreateObject(GetHashKey(Items.Model), PlyCoords.x, PlyCoords.y, PlyCoords.z, 1, 1, 1)
							Citizen.Wait(1000)
							AttachEntityToEntity(Objects, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
							while not HasAnimDictLoaded(Items.Dict) do
								RequestAnimDict(Items.Dict)
								Citizen.Wait(0)
							end
							TaskPlayAnim(PlayerPedId(), 1.0, -1, -1, 50, 0, 0, 0, 0)
							TaskPlayAnim(PlayerPedId(), Items.Dict, Items.Anim, 1.0, -1, -1, 50, 0, 0, 0, 0)
							Job.Wl[PlayerData.job.name].Toggle[Items.Name] = true
						else
							ClearPedSecondaryTask(PlayerPedId())
							DetachEntity(Objects, 1, 1)
							DeleteEntity(Objects)
							Job.Wl[PlayerData.job.name].Toggle[Items.Name] = false
						end
					end,
				})
			end,
			Coords = {
				{
					MarkerType = 29,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = -583.42419433594, y = -928.70770263672, z = 28.15087890625,
					Type = "Chest",
				},
				{
					MarkerType = 36,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = -558.39562988281, y = -933.48132324219, z = 23.854248046875,
					Type = "Garage",
				},
				{
					MarkerType = 1,
					MarkerScale = 3.0,
					MarkerR = 255,
					MarkerG = 0,
					MarkerB = 0,
					MarkerA = 125,
					x = -557.78900146484, y = -925.33184814453, z = 23.854248046875 - 1,
					Type = "DeleteCar",
				},
				{
					MarkerType = 22,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = -585.13848876953, y = -938.49230957031, z = 23.854248046875,
					Type = "Cloackroom",
				},
			},
			Vehicle = {
				Spawn = {x = -556.48352050781, y = -929.03735351563, z = 23.2138671875, h = 269.29135131836},
				["boss"] = {
					Value = {
						{Label = "Rumpo", Value = "rumpo"},
					},
				},
				["expert"] = {
					Value = {
						{Label = "Rumpo", Value = "rumpo"},
					},
				},
				["medium"] = {
					Value = {
						{Label = "Rumpo", Value = "rumpo"},
					},
				},
				["recrue"] = {
					Value = {
						{Label = "Rumpo", Value = "rumpo"},
					},
				},
			},
			Clothe = {
				["boss"] = {
					Value = {
						{
							Label = "Tenue de service", 
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
					},
				},
				["expert"] = {
					Value = {
						{
							Label = "Tenue de service", 
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
					},
				},
				["medium"] = {
					Value = {
						{
							Label = "Tenue de service", 
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
					},
				},
				["recrue"] = {
					Value = {
						{
							Label = "Tenue de service", 
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
					},
				},
			},
		},
		["unicorn"] = {
			Btn = function()
				RageUI.Item.Separator("↓↓       ~o~Utilitaires~s~       ↓↓")
				RageUI.Item.List("Objets", {
					{Name = "Rubalise", Value = "vw_prop_vw_barrier_rope_01a"},
				}, Job.ListIndex, nil, {}, true, {
					onSelected = function(Index, Items)
						Job.ListIndex = Index
						Coords = GetEntityCoords(PlayerPedId())
						Heading = GetEntityHeading(PlayerPedId())
						TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_BUM_BIN', 0, true)
						Citizen.Wait(2000)
						ClearPedTasksImmediately(PlayerPedId())
						if not HasModelLoaded(GetHashKey(Items.Value)) and IsModelInCdimage(GetHashKey(Items.Value)) then
							RequestModel(GetHashKey(Items.Value))
							while not HasModelLoaded(GetHashKey(Items.Value)) do
								Citizen.Wait(1)
							end
						end
						Obj = CreateObject(GetHashKey(Items.Value), Coords.x, Coords.y, Coords.z - 0.98, true, false, true)
						SetEntityHeading(Obj, Heading)
						table.insert(Job.Wl.Objects, Obj)
					end,
				})
			end,
			Coords = {
				{
					MarkerType = 29,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = 93.112091064453, y = -1292.0571289063, z = 29.263061523438,
					Type = "Chest",
				},
				{
					MarkerType = 36,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = 175.37142944336, y = -1279.1340332031, z = 29.229248046875,
					Type = "Garage",
				},
				{
					MarkerType = 1,
					MarkerScale = 3.0,
					MarkerR = 255,
					MarkerG = 0,
					MarkerB = 0,
					MarkerA = 125,
					x = 164.42637634277, y = -1284.2769775391, z = 28.605834960938 - 1,
					Type = "DeleteCar",
				},
				{
					MarkerType = 22,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = 107.73626708984, y = -1305.3231201172, z = 28.757568359375,
					Type = "Cloackroom",
				},
				{
					MarkerType = 22,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = 129.21759033203, y = -1281.2043457031, z = 29.263061523438,
					Type = "Shop",
				},
				{
					MarkerType = 22,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = 129.86373901367, y = -1284.6329345703, z = 29.263061523438,
					Type = "Crafting",
				},
			},
			Items = {
				{Label = "Sirop", Value = "sirop", Price = 1, Limite = 10, Type = "Items"},
				{Label = "Liqueur", Value = "liqueur", Price = 2, Limite = 10, Type = "Items"},
			},
			Vehicle = {
				Spawn = {x = 164.42637634277, y = -1284.2769775391, z = 28.605834960938, h = 90.708656311035},
				["boss"] = {
					Value = {
						{Label = "Patriot2", Value = "patriot2"},
					},
				},
				["expert"] = {
					Value = {
						{Label = "Patriot2", Value = "patriot2"},
					},
				},
				["medium"] = {
					Value = {
						{Label = "Patriot2", Value = "patriot2"},
					},
				},
				["recrue"] = {
					Value = {
						{Label = "Patriot2", Value = "patriot2"},
					},
				},
			},
			Clothe = {
				["boss"] = {
					Value = {
						{
							Label = "Tenue de service", 
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
					},
				},
				["expert"] = {
					Value = {
						{
							Label = "Tenue de service", 
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
					},
				},
				["medium"] = {
					Value = {
						{
							Label = "Tenue de service", 
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
					},
				},
				["recrue"] = {
					Value = {
						{
							Label = "Tenue de service", 
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
					},
				},
			},
		},
		["tequilala"] = {
			Btn = function()
				RageUI.Item.Separator("↓↓       ~o~Utilitaires~s~       ↓↓")
				RageUI.Item.List("Objets", {
					{Name = "Rubalise", Value = "vw_prop_vw_barrier_rope_01a"},
				}, Job.ListIndex, nil, {}, true, {
					onSelected = function(Index, Items)
						Job.ListIndex = Index
						Coords = GetEntityCoords(PlayerPedId())
						Heading = GetEntityHeading(PlayerPedId())
						TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_BUM_BIN', 0, true)
						Citizen.Wait(2000)
						ClearPedTasksImmediately(PlayerPedId())
						if not HasModelLoaded(GetHashKey(Items.Value)) and IsModelInCdimage(GetHashKey(Items.Value)) then
							RequestModel(GetHashKey(Items.Value))
							while not HasModelLoaded(GetHashKey(Items.Value)) do
								Citizen.Wait(1)
							end
						end
						Obj = CreateObject(GetHashKey(Items.Value), Coords.x, Coords.y, Coords.z - 0.98, true, false, true)
						SetEntityHeading(Obj, Heading)
						table.insert(Job.Wl.Objects, Obj)
					end,
				})
			end,
			Coords = {
				{
					MarkerType = 29,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = -568.43078613281, y = 291.30990600586, z = 79.172119140625,
					Type = "Chest",
				},
				{
					MarkerType = 36,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = -565.35821533203, y = 298.27252197266, z = 83.064453125,
					Type = "Garage",
				},
				{
					MarkerType = 1,
					MarkerScale = 3.0,
					MarkerR = 255,
					MarkerG = 0,
					MarkerB = 0,
					MarkerA = 125,
					x = -563.27471923828, y = 303.13845825195, z = 82.542114257813 - 1,
					Type = "DeleteCar",
				},
				{
					MarkerType = 22,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = -566.90112304688, y = 279.89010620117, z = 82.96337890625,
					Type = "Cloackroom",
				},
				{
					MarkerType = 22,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = -562.27252197266, y = 288.55383300781, z = 82.17138671875,
					Type = "Shop",
				},
				{
					MarkerType = 22,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = -562.0087890625, y = 286.33847045898, z = 82.17138671875,
					Type = "Crafting",
				},
			},
			Items = {
				{Label = "Tonic", Value = "tonic", Price = 2, Limite = 10, Type = "Items"},
				{Label = "Redbull", Value = "redbull", Price = 2, Limite = 10, Type = "Items"},
			},
			Vehicle = {
				Spawn = {x = -563.27471923828, y = 303.13845825195, z = 82.542114257813, h = 266.45669555664},
				["boss"] = {
					Value = {
						{Label = "Patriot2", Value = "patriot2"},
					},
				},
				["expert"] = {
					Value = {
						{Label = "Patriot2", Value = "patriot2"},
					},
				},
				["medium"] = {
					Value = {
						{Label = "Patriot2", Value = "patriot2"},
					},
				},
				["recrue"] = {
					Value = {
						{Label = "Patriot2", Value = "patriot2"},
					},
				},
			},
			Clothe = {
				["boss"] = {
					Value = {
						{
							Label = "Tenue de service", 
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
					},
				},
				["expert"] = {
					Value = {
						{
							Label = "Tenue de service", 
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
					},
				},
				["medium"] = {
					Value = {
						{
							Label = "Tenue de service", 
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
					},
				},
				["recrue"] = {
					Value = {
						{
							Label = "Tenue de service", 
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
					},
				},
			},
		},
		["gouv"] = {
			Btn = function()
				RageUI.Item.Separator("↓↓       ~o~Utilitaires~s~       ↓↓")
				RageUI.Item.Button("Diffuser une annonce", nil, {}, true, {
					onSelected = function(Index, Items)
						Desc = KeyboardInput("Description de l'annonce", "", 255)
						if Desc then
							TriggerServerEvent("Job:Annonce", Desc)
						end
					end,
				})
			end,
			Coords = {
				{
					MarkerType = 29,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = -545.18243408203, y = -201.95603942871, z = 47.410278320313,
					Type = "Chest",
				},
				{
					MarkerType = 36,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = -586.28570556641, y = -174.43516540527, z = 37.95751953125,
					Type = "Garage",
				},
				{
					MarkerType = 1,
					MarkerScale = 3.0,
					MarkerR = 255,
					MarkerG = 0,
					MarkerB = 0,
					MarkerA = 125,
					x = -579.45495605469, y = -170.3208770752, z = 37.182373046875 - 1,
					Type = "DeleteCar",
				},
				{
					MarkerType = 22,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = -541.50329589844, y = -192.79119873047, z = 47.410278320313,
					Type = "Cloackroom",
				},
			},
			Vehicle = {
				Spawn = {x = -579.45495605469, y = -170.3208770752, z = 37.182373046875, h = 294.80316162109},
				["boss"] = {
					Value = {
						{Label = "Washington", Value = "washington"},
					},
				},
				["expert"] = {
					Value = {
						{Label = "Washington", Value = "washington"},
					},
				},
				["medium"] = {
					Value = {
						{Label = "Washington", Value = "washington"},
					},
				},
				["recrue"] = {
					Value = {
						{Label = "Washington", Value = "washington"},
					},
				},
			},
			Clothe = {
				["boss"] = {
					Value = {
						{
							Label = "Tenue de service", 
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
					},
				},
				["expert"] = {
					Value = {
						{
							Label = "Tenue de service", 
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
					},
				},
				["medium"] = {
					Value = {
						{
							Label = "Tenue de service", 
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
					},
				},
				["recrue"] = {
					Value = {
						{
							Label = "Tenue de service", 
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
					},
				},
			},
		},
		["dog"] = {
			Btn = function()
			end,
			Coords = {
				{
					MarkerType = 29,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = 43.12088394165, y = -1005.3362426758, z = 29.279907226563,
					Type = "Chest",
				},
				{
					MarkerType = 36,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = 39.890113830566, y = -1009.6219482422, z = 29.482055664063,
					Type = "Garage",
				},
				{
					MarkerType = 1,
					MarkerScale = 3.0,
					MarkerR = 255,
					MarkerG = 0,
					MarkerB = 0,
					MarkerA = 125,
					x = 42.606597900391, y = -1012.852722168, z = 29.482055664063 - 1,
					Type = "DeleteCar",
				},
				{
					MarkerType = 22,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = 42.290111541748, y = -1007.6703491211, z = 29.279907226563,
					Type = "Crafting",
				},
				{
					MarkerType = 29,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = 45.665939331055, y = -1009.0812988281, z = 29.279907226563,
					Type = "Shop",
				},
			},
			Items = {
				{Label = "Cola", Value = "cola", Price = 1, Limite = 10, Type = "Items"},
				{Label = "Sprunk", Value = "sprunk", Price = 2, Limite = 10, Type = "Items"},
			},
			Vehicle = {
				Spawn = {x = 40.430770874023, y = -1014.4088134766, z = 29.21240234375, h = 73.700782775879},
				["boss"] = {
					Value = {
						{Label = "Faggio", Value = "faggio"},
					},
				},
				["expert"] = {
					Value = {
						{Label = "Faggio", Value = "faggio"},
					},
				},
				["medium"] = {
					Value = {
						{Label = "Faggio", Value = "faggio"},
					},
				},
				["recrue"] = {
					Value = {
						{Label = "Faggio", Value = "faggio"},
					},
				},
			},
			Clothe = {
				["boss"] = {
					Value = {
						{
							Label = "Tenue de service", 
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
					},
				},
				["expert"] = {
					Value = {
						{
							Label = "Tenue de service", 
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
					},
				},
				["medium"] = {
					Value = {
						{
							Label = "Tenue de service", 
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
					},
				},
				["recrue"] = {
					Value = {
						{
							Label = "Tenue de service", 
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
					},
				},
			},
		},
		--NewJob
	},
	Crafting = {
		List = {
			["tequilala"] = {
				{Name = "Préparer un Jeagerbomb", Value = "jeargerbomb", First = false, Time = 10000, Dict = "anim@amb@business@weed@weed_sorting_seated@", Anim = "sorter_right_sort_v3_sorter02"},
				{Name = "Préparer un Gin tonic", Value = "gintonic", First = false, Time = 10000, Dict = "anim@amb@business@weed@weed_sorting_seated@", Anim = "sorter_right_sort_v3_sorter02"},
				{Name = "Servir du Jeager", Value = "jeager", First = true, Time = 10000, Dict = "anim@amb@business@weed@weed_sorting_seated@", Anim = "sorter_right_sort_v3_sorter02"},
				{Name = "Servir du Gin", Value = "gin", First = true, Time = 10000, Dict = "anim@amb@business@weed@weed_sorting_seated@", Anim = "sorter_right_sort_v3_sorter02"},
			},
			["unicorn"] = {
				{Name = "Préparer un Kirr", Value = "kirr", First = false, Time = 10000, Dict = "anim@amb@business@weed@weed_sorting_seated@", Anim = "sorter_right_sort_v3_sorter02"},
				{Name = "Préparer un Sex on the beatch", Value = "sexonthebeatch", First = false, Time = 10000, Dict = "anim@amb@business@weed@weed_sorting_seated@", Anim = "sorter_right_sort_v3_sorter02"},
				{Name = "Servir du Champagne", Value = "champagne", First = true, Time = 10000, Dict = "anim@amb@business@weed@weed_sorting_seated@", Anim = "sorter_right_sort_v3_sorter02"},
				{Name = "Servir de la Vodka", Value = "vodka", First = true, Time = 10000, Dict = "anim@amb@business@weed@weed_sorting_seated@", Anim = "sorter_right_sort_v3_sorter02"},
			},
			["dog"] = {
				{Name = "Cuire les saucisses", Value = "saucisse", First = true, Time = 10000, Dict = "anim@amb@business@weed@weed_sorting_seated@", Anim = "sorter_right_sort_v3_sorter02"},
				{Name = "Couper le pain à hot-dog", Value = "hotdogbread", First = true, Time = 10000, Dict = "anim@amb@business@weed@weed_sorting_seated@", Anim = "sorter_right_sort_v3_sorter02"},
				{Name = "Couper les pommes de terre", Value = "patate", First = true, Time = 10000, Dict = "anim@amb@business@weed@weed_sorting_seated@", Anim = "sorter_right_sort_v3_sorter02"},
				{Name = "Cuire les frites", Value = "frite", First = false, Time = 10000, Dict = "anim@amb@business@weed@weed_sorting_seated@", Anim = "sorter_right_sort_v3_sorter02"},
				{Name = "Préparer le hot-dog", Value = "hotdog", First = false, Time = 10000, Dict = "anim@amb@business@weed@weed_sorting_seated@", Anim = "sorter_right_sort_v3_sorter02"},
			},
		},
		Btn = function()
			RageUI.Item.Separator("↓↓       ~o~Ingrédients~s~       ↓↓")
			for _,v in pairs (Job.Crafting.List[PlayerData.job.name]) do
				if v.First then
					RageUI.Item.Button(v.Name, nil, {}, true, {
						onSelected = function(Index, Items)
							TriggerServerEvent("Job:Craft", v)
						end,
					})
				end
			end
			RageUI.Item.Separator("↓↓       ~o~Recette~s~       ↓↓")
			for _,v in pairs (Job.Crafting.List[PlayerData.job.name]) do
				if not v.First then
					RageUI.Item.Button(v.Name, nil, {}, true, {
						onSelected = function(Index, Items)
							TriggerServerEvent("Job:Craft", v)
						end,
					})
				end
			end
			RageUI.Item.Button("Retour", nil, {}, true, {
				onSelected = function(Index, Items)
					FreezeEntityPosition(PlayerPedId(), false)
					RageUI.CloseAll()
					InMenu = false
				end,
			})
		end,
		Function = function(Items)
			RequestAnimDict(Items.Dict)
			while not HasAnimDictLoaded(Items.Dict) do
				Citizen.Wait(0)
			end
			TaskPlayAnim(PlayerPedId(), Items.Dict, Items.Anim, 8.0, -8, -1, 49, 0, 0, 0, 0)
			Citizen.Wait(Items.Time)
			ClearPedTasksImmediately(PlayerPedId())
		end,
	},
	Stand = {
		Buyed = false,
		LastProps = {},
		FinalPrice = 0,
		Divide = {
			[0] = 2.0, --Compacts
			[1] = 1.3, --Sedans
			[2] = 1.0, --SUVs
			[3] = 0.9, --Coupes
			[4] = 1.2, --Muscle
			[5] = 0.5, --Sports Classics
			[6] = 1.0, --Sports
			[7] = 0.5, --Super
			[8] = 1.5, --Motorcycles
			[9] = 1.6, --Off-road
			[12] = 1.0, --Vans
			[13] = 5.0, --Cycles
		},
		Price = {
			["Color"] = 500,
			["Wheels"] = 500,
			["Moteur"] = 500,
			["Turbo"] = 500,
			["Transmission"] = 500,
			["Suspension"] = 500,
			["Frein"] = 500,
			["Autocollants"] = 500,
			["Fenêtres"] = 500,
			["Réservoir"] = 500,
			["Prise d'air"] = 500,
			["Antenne"] = 500,
			["Entretoise"] = 500,
			["Flitre a air"] = 500,
			["Block moteur"] = 500,
			["Suspenssion hydraulique"] = 500,
			["Coffre"] = 500,
			["Haut parleurs"] = 500,
			["Plaques"] = 500,
			["Levier de vitesse"] = 500,
			["Volant"] = 500,
			["Sièges"] = 500,
			["Portières"] = 500,
			["Habitacle"] = 500,
			["Tableau de bord"] = 500,
			["Accessoires"] = 500,
			["Intèrieur"] = 500,
			["Support de plaque"] = 500,
			["Toît"] = 500,
			["Ailes"] = 500,
			["Capot"] = 500,
			["Grille"] = 500,
			["Arceau"] = 500,
			["Échappement"] = 500,
			["Bas de caisse"] = 500,
			["Pare chocs arrière"] = 500,
			["Pare chocs avant"] = 500,
			["Spoiler"] = 500,
			["Windows"] = 500,
			["Horn"] = 500,
			["Plate"] = 500,
			["Headlight"] = 500,
		},
		ColorBtn = function()
			RageUI.Item.List("Couleur principale", Job.Stand.Color.Table, 1, nil, {}, true, {
				onSelected = function(Index, Items)
					Job.Stand.Color.Found = Job.Stand.Color[Items.Name]
					RageUI.Visible(RMenu:Get("Job", "Primary_Color"), true)
				end,
			})
			RageUI.Item.List("Couleur secondaire", Job.Stand.Color.Table, 1, nil, {}, true, {
				onSelected = function(Index, Items)
					Job.Stand.Color.Found = Job.Stand.Color[Items.Name]
					RageUI.Visible(RMenu:Get("Job", "Secondary_Color"), true)
				end,
			})
			RageUI.Item.List("Nacrage", Job.Stand.Color.Table, 1, nil, {}, true, {
				onSelected = function(Index, Items)
					Job.Stand.Color.Found = Job.Stand.Color[Items.Name]
					RageUI.Visible(RMenu:Get("Job", "Pearless_Color"), true)
				end,
			})
		end,
		PrimaryBtn = function()
			CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
			CrtVhcClass = GetVehicleClass(CrtVhc)
			Primary, Secondary = GetVehicleColours(CrtVhc)
			for _,v in pairs (Job.Stand.Color.Found) do
				RageUI.Item.Button(v.Name, "", {}, true, {
					onActive = function(Index, Items)
						if Primary ~= v.Value then
							SetVehicleColours(CrtVhc , v.Value, Secondary)
						end
					end,
					onSelected = function(Index, Items)
						TriggerServerEvent('RefreshPrice', (Job.Stand.Price["Color"] / Job.Stand.Divide[CrtVhcClass]))
						RageUI.GoBack()
					end,
				})
			end
		end,
		SecondaryBtn = function()
			CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
			CrtVhcClass = GetVehicleClass(CrtVhc)
			Primary, Secondary = GetVehicleColours(CrtVhc)
			for _,v in pairs (Job.Stand.Color.Found) do
				RageUI.Item.Button(v.Name, "", {}, true, {
					onActive = function(Index, Items)
						if Secondary ~= v.Value then
							SetVehicleColours(CrtVhc , Primary, v.Value)
						end
					end,
					onSelected = function(Index, Items)
						TriggerServerEvent('RefreshPrice', (Job.Stand.Price["Color"] / Job.Stand.Divide[CrtVhcClass]))
						RageUI.GoBack()
					end,
				})
			end
		end,
		PearlessBtn  = function()
			CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
			CrtVhcClass = GetVehicleClass(CrtVhc)
			Pearl, Wheel = GetVehicleExtraColours(CrtVhc)
			for _,v in pairs (Job.Stand.Color.Found) do
				RageUI.Item.Button(v.Name, "", {}, true, {
					onActive = function(Index, Items)
						if Pearl ~= v.Value then
							SetVehicleExtraColours(CrtVhc, v.Value, Wheel)
						end
					end,
					onSelected = function(Index, Items)
						TriggerServerEvent('RefreshPrice', (Job.Stand.Price["Color"] / Job.Stand.Divide[CrtVhcClass]))
						RageUI.GoBack()
					end,
				})
			end
		end,
		WheelColorBtn  = function()
			CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
			CrtVhcClass = GetVehicleClass(CrtVhc)
			Pearl, Wheel = GetVehicleExtraColours(CrtVhc)
			for _,v in pairs (Job.Stand.Color.Found) do
				RageUI.Item.Button(v.Name, "", {}, true, {
					onActive = function(Index, Items)
						if Pearl ~= v.Value then
							SetVehicleExtraColours(CrtVhc, Pearl, v.Value)
						end
					end,
					onSelected = function(Index, Items)
						TriggerServerEvent('RefreshPrice', (Job.Stand.Price["Color"] / Job.Stand.Divide[CrtVhcClass]))
						RageUI.GoBack()
					end,
				})
			end
		end,
		Btn = function()
			RageUI.Item.Button("Estéthique", "", {}, true, {
			},RMenu:Get('Job', 'Stand_Custom'))
			RageUI.Item.Button("Performance", "", {}, true, {
			},RMenu:Get('Job', 'Stand_Perfs'))
		end,
		WheelsBtn = function()
			CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
			CrtVhcClass = GetVehicleClass(CrtVhc)
			RageUI.Item.List("Type de roue", {
					{Name = "Sport", Value = 0},
					{Name = "Suv", Value = 3},
					{Name = "Offroad", Value = 4},
					{Name = "Tuning", Value = 5},
					{Name = "Luxe", Value = 7},
					{Name = "Lowride", Value = 2},
					{Name = "Muscle", Value = 1},
				}, 1, nil, {}, true, {
				onSelected = function(Index, Items)
					Job.Stand.Wheels.Found = Job.Stand.Wheels[Items.Name]
					SetVehicleWheelType(CrtVhc, Items.Value)
					RageUI.Visible(RMenu:Get("Job", "Wheels_Found"), not RageUI.Visible(RMenu:Get("Job", "Wheels_Found")))
				end,
			})
			RageUI.Item.List("Couleur des jantes", Job.Stand.Color.Table, 1, nil, {}, true, {
				onSelected = function(Index, Items)
					Job.Stand.Color.Found = Job.Stand.Color[Items.Name]
					RageUI.Visible(RMenu:Get("Job", "Wheels_Color"), true)
					TriggerServerEvent('RefreshPrice', (Job.Stand.Price["Wheels"] / Job.Stand.Divide[CrtVhcClass]))
				end,
			})
			RageUI.Item.List("Couleur de la fumée", Job.Stand.Wheels.Smoke, 1, nil, {}, true, {
				onSelected = function(Index, Items)
					ToggleVehicleMod(CrtVhc, 20, true)
					SetVehicleTyreSmokeColor(CrtVhc, Items.Value[1], Items.Value[2], Items.Value[3])
					TriggerServerEvent('RefreshPrice', (Job.Stand.Price["Wheels"] / Job.Stand.Divide[CrtVhcClass]))
				end,
			})
		end,
		WheelsTypeBtn = function()
			CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
			CrtVhcClass = GetVehicleClass(CrtVhc)
			CrtWheelFront = GetVehicleMod(CrtVhc, 23)
			CrtWheelBack = GetVehicleMod(CrtVhc, 24)
			for _,v in pairs (Job.Stand.Wheels.Found) do
				RageUI.Item.Button(v.Name, "", {}, true, {
					onActive = function(Index, Items)
						if CrtWheelFront ~= v.Value then
							SetVehicleMod(CrtVhc, 23, v.Value, false)
						elseif CrtWheelBack ~= v.Value then
							SetVehicleMod(CrtVhc, 24, v.Value, false) 
						end
					end,
					onSelected = function(Index, Items)
						TriggerServerEvent('RefreshPrice', (Job.Stand.Price["Wheels"] / Job.Stand.Divide[CrtVhcClass]))
						RageUI.GoBack()
					end,
				})
			end
		end,
		Wheels = {
			Found = {},
			Smoke = {
				{Value = {255, 255, 255}, Name = "Blanc"},
				{Value = {255, 0, 0}, Name = "Rouge"},
				{Value = {255, 150, 0}, Name = "Orange"},
				{Value = {255, 255, 0}, Name = "Jaune"},
				{Value = {150, 255, 0}, Name = "Vert rally"},
				{Value = {0, 255, 0}, Name = "Vert"},
				{Value = {0, 255, 150}, Name = "Turquoise"},
				{Value = {0, 255, 150}, Name = "Bleu rally"},
				{Value = {0, 0, 255}, Name = "Bleu"},
				{Value = {150, 0, 255}, Name = "Mauve"},
				{Value = {255, 0, 255}, Name = "Rose"},
			},
			["Sport"] = {
				{Value = -1, Name = "Aucun"},
				{Value = 0, Name = "Inferno"},
				{Value = 1, Name = "Deepfive"},
				{Value = 2, Name = "Lozspeed"},
				{Value = 3, Name = "Diamondcut"},
				{Value = 4, Name = "Chrono"},
				{Value = 5, Name = "Ferocirr"},
				{Value = 6, Name = "Fiftynine"},
				{Value = 7, Name = "Mercie"},
				{Value = 8, Name = "Synthéticz"},
				{Value = 9, Name = "Organictyped"},
				{Value = 10, Name = "Endov1"},
				{Value = 11, Name = "Duper7"},
				{Value = 12, Name = "Uzer"},
				{Value = 13, Name = "Groundride"},
				{Value = 14, Name = "Spacer"},
				{Value = 15, Name = "Venum"},
				{Value = 16, Name = "Cosmo"},
				{Value = 17, Name = "Dashvip"},
				{Value = 18, Name = "Icekid"},
				{Value = 19, Name = "Ruffled"},
				{Value = 20, Name = "Wangermaster"},
				{Value = 21, Name = "Superfive"},
				{Value = 22, Name = "Endov2"},
				{Value = 23, Name = "Slitix"},
			},
			["Suv"] = {
				{Value = -1, Name = "Aucun"},
				{Value = 0, Name = "Vip"},
				{Value = 1, Name = "Benefactor"},
				{Value = 2, Name = "Cosmo"},
				{Value = 3, Name = "Bippu"},
				{Value = 4, Name = "Royalsix"},
				{Value = 5, Name = "Fagorm"},
				{Value = 6, Name = "Deluxe"},
				{Value = 7, Name = "Icedout"},
				{Value = 8, Name = "Cognscenti"},
				{Value = 9, Name = "Lozspeedten"},
				{Value = 10, Name = "Supernova"},
				{Value = 11, Name = "Obeyrs"},
				{Value = 12, Name = "Lozspeedballer"},
				{Value = 13, Name = "Extra vaganzo"},
				{Value = 14, Name = "Splitix"},
				{Value = 15, Name = "Empowered"},
				{Value = 16, Name = "Sunrize"},
				{Value = 17, Name = "Dashvip"},
				{Value = 18, Name = "Cutter"},
			},
			["Offroad"] = {
				{Value = -1, Name = "Aucun"},
				{Value = 0, Name = "Raider"},
				{Value = 1, Name = "Mudslinger"},
				{Value = 2, Name = "Nevis"},
				{Value = 3, Name = "Cairngorm"},
				{Value = 4, Name = "Amazon"},
				{Value = 5, Name = "Challenger"},
				{Value = 6, Name = "Dunebasher"},
				{Value = 7, Name = "Fivestar"},
				{Value = 8, Name = "Rockcrawler"},
				{Value = 9, Name = "Milspecsteelie"},
			},
			["Tuning"] = {
				{Value = -1, Name = "Aucun"},
				{Value = 0, Name = "Cosmo"},
				{Value = 1, Name = "Supermesh"},
				{Value = 2, Name = "Outsider"},
				{Value = 3, Name = "Rollas"},
				{Value = 4, Name = "Driffmeister"},
				{Value = 5, Name = "Slicer"},
				{Value = 6, Name = "Elquatro"},
				{Value = 7, Name = "Dubbed"},
				{Value = 8, Name = "Fivestar"},
				{Value = 9, Name = "Slideways"},
				{Value = 10, Name = "Apex"},
				{Value = 11, Name = "Stancedeg"},
				{Value = 12, Name = "Countersteer"},
				{Value = 13, Name = "Endov1"},
				{Value = 14, Name = "Endov2dish"},
				{Value = 15, Name = "Guppez"},
				{Value = 16, Name = "Chokadori"},
				{Value = 17, Name = "Chicane"},
				{Value = 18, Name = "Saisoku"},
				{Value = 19, Name = "Dishedeight"},
				{Value = 20, Name = "Fujiwara"},
				{Value = 21, Name = "Zokusha"},
				{Value = 22, Name = "Battlevill"},
				{Value = 23, Name = "Rallymaster"},
			},
			["Luxe"] = {
				{Value = -1, Name = "Aucun"},
				{Value = 0, Name = "Shadow"},
				{Value = 1, Name = "Hyper"},
				{Value = 2, Name = "Blade"},
				{Value = 3, Name = "Diamond"},
				{Value = 4, Name = "Supagee"},
				{Value = 5, Name = "Chromaticz"},
				{Value = 6, Name = "Merciechilp"},
				{Value = 7, Name = "Obeyrs"},
				{Value = 8, Name = "GtChrome"},
				{Value = 9, Name = "Cheetahr"},
				{Value = 10, Name = "Solar"},
				{Value = 11, Name = "Splitten"},
				{Value = 12, Name = "Dashvip"},
				{Value = 13, Name = "Lozspeedten"},
				{Value = 14, Name = "Carboninferno"},
				{Value = 15, Name = "Carbonshadow"},
				{Value = 16, Name = "Carbonz"},
				{Value = 17, Name = "Carbonsolar"},
				{Value = 18, Name = "Carboncheetahr"},
				{Value = 19, Name = "Carbonsracer"},
			},
			["Lowrider"] = {
				{Value = -1, Name = "Aucun"},
				{Value = 0, Name = "Flare"},
				{Value = 1, Name = "Wired"},
				{Value = 2, Name = "Triplegolds"},
				{Value = 3, Name = "Bigworm"},
				{Value = 4, Name = "Sevenfives"},
				{Value = 5, Name = "Splitsix"},
				{Value = 6, Name = "Freshmesh"},
				{Value = 7, Name = "Leadsled"},
				{Value = 8, Name = "Turbine"},
				{Value = 9, Name = "Superfin"},
				{Value = 10, Name = "Classicrod"},
				{Value = 11, Name = "Dollar"},
				{Value = 12, Name = "Dukes"},
				{Value = 13, Name = "Lowfive"},
				{Value = 14, Name = "Gooch"},
			},
			["Muscle"] = {
				{Value = -1, Name = "Aucun"},
				{Value = 0, Name = "Classicfive"},
				{Value = 1, Name = "Dukes"},
				{Value = 2, Name = "Musclefreak"},
				{Value = 3, Name = "Kracka"},
				{Value = 4, Name = "Azrea"},
				{Value = 5, Name = "Mecha"},
				{Value = 6, Name = "Blacktop"},
				{Value = 7, Name = "Dragspl"},
				{Value = 8, Name = "Revolver"},
				{Value = 9, Name = "Classicrod"},
				{Value = 10, Name = "Spooner"},
				{Value = 11, Name = "Fivestar"},
				{Value = 12, Name = "Oldschool"},
				{Value = 13, Name = "Eljefe"},
				{Value = 14, Name = "Dodman"},
				{Value = 15, Name = "Sixgun"},
				{Value = 16, Name = "Mercenary"},
			},
		},
		CustomBtn = function()
			CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
			CrtVhcClass = GetVehicleClass(CrtVhc)
			RageUI.Item.Button("Peinture", "", {}, true, {
			},RMenu:Get('Job', 'Stand_Color'))
			RageUI.Item.Button("Roue", "", {}, true, {
			},RMenu:Get('Job', 'Stand_Wheels'))
			RageUI.Item.List("Fenêtres", Job.Stand.Windows.Table, Job.Stand.Windows.Index, nil, {}, true, {
				onSelected = function(Index, Items)
					SetVehicleWindowTint(CrtVhc, Items.Value) 
					TriggerServerEvent('RefreshPrice', (Job.Stand.Price["Windows"] / Job.Stand.Divide[CrtVhcClass]))
				end,
				onListChange = function(Index, Items)
					SetVehicleWindowTint(CrtVhc, Items.Value) 
				end,
			})
			RageUI.Item.List("Klaxon", Job.Stand.Horn.Table, Job.Stand.Horn.Index, nil, {}, true, {
				onSelected = function(Index, Items)
					SetVehicleMod(CrtVhc, 14, Items.Value, false) 
					TriggerServerEvent('RefreshPrice', (Job.Stand.Price["Horn"] / Job.Stand.Divide[CrtVhcClass]))
				end,
				onListChange = function(Index, Items)
					SetVehicleMod(CrtVhc, 14, Items.Value, false) 
				end,
			})
			RageUI.Item.List("Couleur des plaques", Job.Stand.Plate.Table, Job.Stand.Plate.Index, nil, {}, true, {
				onSelected = function(Index, Items)
					SetVehicleNumberPlateTextIndex(CrtVhc, Items.Value)
					TriggerServerEvent('RefreshPrice', (Job.Stand.Price["Plate"] / Job.Stand.Divide[CrtVhcClass]))
				end,
				onListChange = function(Index, Items)
					SetVehicleNumberPlateTextIndex(CrtVhc, Items.Value)
				end,
			})
			RageUI.Item.List("Phares", Job.Stand.Headlight.Table, Job.Stand.Headlight.Index, nil, {}, true, {
				onSelected = function(Index, Items)
					ToggleVehicleMod(CrtVhc,  22, Items.Value)
					TriggerServerEvent('RefreshPrice', (Job.Stand.Price["Headlight"] / Job.Stand.Divide[CrtVhcClass]))
				end,
				onListChange = function(Index, Items)
					ToggleVehicleMod(CrtVhc,  22, Items.Value)
				end,
			})
			for _,v in pairs (Job.Stand.Mods.Custom) do
				Mods = {}
				for i = 0 , GetNumVehicleMods(CrtVhc, v.Value), 1 do
					if i ~= nil then
						modelName = GetLabelText(GetModTextLabel(CrtVhc, v.Value, i))
						if modelName == "NULL" then
							modelName = "Aucun"
						end
						Mods[i] = {Value = i, Name = modelName}
					end
				end
				RageUI.Item.List(v.Name, Mods, v.Index or 0, nil, {}, true, {
					onSelected = function(Index, Items)
						v.Index = Index
						SetVehicleMod(CrtVhc,  v.Value, Items.Value)
						TriggerServerEvent('RefreshPrice', (Job.Stand.Price[v.Name] / Job.Stand.Divide[CrtVhcClass]))
					end,
					onListChange = function(Index, Items)
						v.Index = Index
						SetVehicleMod(CrtVhc,  v.Value, Items.Value)
					end,
				})
			end
		end,
		PerfsBtn = function()
			CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
			CrtVhcClass = GetVehicleClass(CrtVhc)
			for _,v in pairs (Job.Stand.Mods.Perfs) do
				RageUI.Item.List(v.Name, v.Table, v.Index or 1, nil, {}, true, {
					onSelected = function(Index, Items)
						v.Index = Index
						SetVehicleMod(CrtVhc,  v.Value, Items.Value)
						TriggerServerEvent('RefreshPrice', (Job.Stand.Price[v.Name] / Job.Stand.Divide[CrtVhcClass]))
					end,
					onListChange = function(Index, Items)
						v.Index = Index
						SetVehicleMod(CrtVhc,  v.Value, Items.Value)
					end,
				})
			end
		end,
		Mods = {
			Perfs = {
				{Value = 11, Name = "Moteur", Table = 
					{
						{Name = "Level 1", Value = 0},
						{Name = "Level 2", Value = 1},
						{Name = "Level 3", Value = 2},
					},
				},
				{Value = 18, Name = "Turbo", Table = 
					{
						{Name = "Avec", Value = 0},
						{Name = "Sans", Value = 1},
					}
				},
				{Value = 13, Name = "Transmission", Table = 
					{
						{Name = "Level 1", Value = 0},
						{Name = "Level 2", Value = 1},
						{Name = "Level 3", Value = 2},
					}
				},
				{Value = 15, Name = "Suspension", Table = 
					{
						{Name = "Level 1", Value = 0},
						{Name = "Level 2", Value = 1},
						{Name = "Level 3", Value = 2},
						{Name = "Level 4", Value = 3},
					}
				},
				{Value = 12, Name = "Frein", Table = 
					{
						{Name = "Level 1", Value = 0},
						{Name = "Level 2", Value = 1},
						{Name = "Level 3", Value = 2},
					}
				},
			},
			Custom = {
				{Value = 48, Name = "Autocollants"},
				{Value = 46, Name = "Fenêtres"},
				{Value = 45, Name = "Réservoir"},
				{Value = 44, Name = "Prise d'air"},
				{Value = 43, Name = "Antenne"},
				{Value = 41, Name = "Entretoise"},
				{Value = 40, Name = "Flitre a air"},
				{Value = 39, Name = "Block moteur"},
				{Value = 38, Name = "Suspenssion hydraulique"},
				{Value = 37, Name = "Coffre"},
				{Value = 36, Name = "Haut parleurs"},
				{Value = 35, Name = "Plaques"},
				{Value = 34, Name = "Levier de vitesse"},
				{Value = 33, Name = "Volant"},
				{Value = 32, Name = "Sièges"},
				{Value = 31, Name = "Portières"},
				{Value = 30, Name = "Habitacle"},
				{Value = 29, Name = "Tableau de bord"},
				{Value = 28, Name = "Accessoires"},
				{Value = 27, Name = "Intèrieur"},
				{Value = 25, Name = "Support de plaque"},
				{Value = 10, Name = "Toît"},
				{Value = 8, Name = "Ailes"},
				{Value = 7, Name = "Capot"},
				{Value = 6, Name = "Grille"},
				{Value = 5, Name = "Arceau"},
				{Value = 4, Name = "Échappement"},
				{Value = 3, Name = "Bas de caisse"},
				{Value = 2, Name = "Pare chocs arrière"},
				{Value = 1, Name = "Pare chocs avant"},
				{Value = 0, Name = "Spoiler"},
			},
		},
		Windows = {
			Index = 1,
			Table = {
				{Value = false, Name = "Classique"},
				{Value = 1, Name = "Pure black"},
				{Value = 2, Name = "Fumée foncé"},
				{Value = 3, Name = "Fumée clair"},
				{Value = 4, Name = "Limousine"},
				{Value = 5, Name = "Vert"},
			},
		},
		Horn = {
			Index = 1,
			Table = {
				{Value = 0, Name = "Truck Horn"},
				{Value = 1, Name = "Cop Horn"},
				{Value = 2, Name = "Clown Horn"},
				{Value = 3, Name = "Musical Horn 1"},
				{Value = 4, Name = "Musical Horn 2"},
				{Value = 5, Name = "Musical Horn 3"},
				{Value = 6, Name = "Musical Horn 4"},
				{Value = 7, Name = "Musical Horn 5"},
				{Value = 8, Name = "Sad Trombone"},
				{Value = 9, Name = "Classical Horn 1"},
				{Value = 10, Name = "Classical Horn 2"},
				{Value = 11, Name = "Classical Horn 3"},
				{Value = 12, Name = "Classical Horn 4"},
				{Value = 13, Name = "Classical Horn 5"},
				{Value = 14, Name = "Classical Horn 6"},
				{Value = 15, Name = "Classical Horn 7"},
				{Value = 16, Name = "Scale - Do"},
				{Value = 17, Name = "Scale - Re"},
				{Value = 18, Name = "Scale - Mi"},
				{Value = 19, Name = "Scale - Fa"},
				{Value = 20, Name = "Scale - Sol"},
				{Value = 21, Name = "Scale - La"},
				{Value = 22, Name = "Scale - Ti"},
				{Value = 23, Name = "Scale - Do"},
				{Value = 24, Name = "Jazz Horn 1"},
				{Value = 25, Name = "Jazz Horn 2"},
				{Value = 26, Name = "Jazz Horn 3"},
				{Value = 27, Name = "Jazz Horn Loop"},
				{Value = 28, Name = "Star Spangled Banner 1"},
				{Value = 29, Name = "Star Spangled Banner 2"},
				{Value = 30, Name = "Star Spangled Banner 3"},
				{Value = 31, Name = "Star Spangled Banner 4"},
				{Value = 32, Name = "Classical Horn 8 Loop"},
				{Value = 33, Name = "Classical Horn 9 Loop"},
				{Value = 34, Name = "Classical Horn 10 Loop"},
				{Value = 35, Name = "Classical Horn 8"},
				{Value = 36, Name = "Classical Horn 9"},
				{Value = 37, Name = "Classical Horn 10"},
				{Value = 38, Name = "Funeral Loop"},
				{Value = 39, Name = "Funeral"},
				{Value = 40, Name = "Spooky Loop"},
				{Value = 41, Name = "Spooky"},
				{Value = 42, Name = "San Andreas Loop"},
				{Value = 43, Name = "San Andreas"},
				{Value = 44, Name = "Liberty City Loop"},
				{Value = 45, Name = "Liberty City"},
				{Value = 46, Name = "Festive 1 Loop"},
				{Value = 47, Name = "Festive 1"},
				{Value = 48, Name = "Festive 2 Loop"},
				{Value = 49, Name = "Festive 2"},
				{Value = 50, Name = "Festive 3 Loop"},
				{Value = 51, Name = "Festive 3"},
			},
		},
		Plate = {
			Index = 1,
			Table = {
				{Value = 0, Name = 'Bleu sur blanc'},
				{Value = 1, Name = 'Jaune sur noir'},
				{Value = 2, Name = 'Jaune sur bleu'},
				{Value = 3, Name = 'Bleu sur blanc 2'},
				{Value = 4, Name = 'Bleu sur blanc 3'},
			},
		},
		Headlight = {
			Index = 1,
			Table = {
				{Value = false, Name = 'Classique'},
				{Value = true, Name = 'Xenon'},
			},
		},
		Color = {
			Found = {},
			Table = {
				{Name = "Blanc", Value = 1},
				{Name = "Gris", Value = 2},
				{Name = "Noir", Value = 3},
				{Name = "Marron", Value = 4},
				{Name = "Rouge", Value = 5},
				{Name = "Rose", Value = 6},
				{Name = "Violet", Value = 7},
				{Name = "Jaune", Value = 8},
				{Name = "Orange", Value = 9},
				{Name = "Vert", Value = 10},
				{Name = "Bleu", Value = 11},
				{Name = "Chrome", Value = 12},
				{Name = "Or", Value = 13},
			},
			["Blanc"] = {
				{Value = 106, Name = "Vanille"},
				{Value = 107, Name = "Crême"},
				{Value = 111, Name = "Blanc"},
				{Value = 112, Name = "Blanc polaire"},
				{Value = 113, Name = "Beige"},
				{Value = 121, Name = "Blacn mat"},
				{Value = 122, Name = "Neige"},
				{Value = 131, Name = "Cotton"},
				{Value = 132, Name = "Albâtre"},
				{Value = 134, Name = "Blanc pure"},
			},
			["Gris"] = {
				{Value = 4, Name = "Gris"},
				{Value = 5, Name = "Argent"},
				{Value = 6, Name = "Gris métallisé"},
				{Value = 7, Name = "Acier laminé"},
				{Value = 8, Name = "Gris foncé"},
				{Value = 9, Name = "Gris rocheux"},
				{Value = 10, Name = "Gris nuit"},
				{Value = 13, Name = "Aluminium"},
				{Value = 14, Name = "Gris mat"},
				{Value = 17, Name = "Gris clair"},
				{Value = 18, Name = "Gris bitume"},
				{Value = 19, Name = "Gris béton"},
				{Value = 20, Name = "Argent sombre"},
				{Value = 22, Name = "Magnésite"},
				{Value = 23, Name = "Nickel"},
				{Value = 24, Name = "Zinc"},
				{Value = 25, Name = "Dolomite"},
				{Value = 26, Name = "Argent bleuté"},
				{Value = 66, Name = "Titane"},
				{Value = 93, Name = "Acier bleu"},
				{Value = 144, Name = "Champagne"},
				{Value = 156, Name = "Gris chasseur"},
			},
			["Noir"] = {
				{Value = 0, Name = "Noir"},
				{Value = 1, Name = "Graphite"},
				{Value = 2, Name = "Noir métallisé"},
				{Value = 3, Name = "Noir acier"},
				{Value = 11, Name = "Anthracite"},
				{Value = 12, Name = "Noir mat"},
				{Value = 15, Name = "Nuit sombre"},
				{Value = 16, Name = "Noir profond"},
				{Value = 21, Name = "Pétrol"},
				{Value = 147, Name = "Carbon"},
			},
			["Marron"] = {
				{Value = 45, Name = "Cuivre"},
				{Value = 47, Name = "Marron clair"},
				{Value = 48, Name = "Marron foncé"},
				{Value = 90, Name = "Bronze"},
				{Value = 94, Name = "Marron métallisé"},
				{Value = 95, Name = "Café"},
				{Value = 96, Name = "Terre cuite"},
				{Value = 97, Name = "Marbre"},
				{Value = 98, Name = "Sable"},
				{Value = 99, Name = "Sépia"},
				{Value = 100, Name = "Bison"},
				{Value = 101, Name = "Palmier"},
				{Value = 102, Name = "Caramel"},
				{Value = 103, Name = "Rouille"},
				{Value = 104, Name = "Chataigne"},
				{Value = 105, Name = "Noisette"},
				{Value = 108, Name = "Coquillage"},
				{Value = 109, Name = "Acajou"},
				{Value = 110, Name = "Chaudron"},
				{Value = 114, Name = "Blond"},
				{Value = 115, Name = "Gravier"},
				{Value = 116, Name = "Terre"},
			},
			["Rouge"] = {
				{Value = 27, Name = "Rouge"},
				{Value = 28, Name = "Rouge turin"},
				{Value = 29, Name = "Coquelicot"},
				{Value = 30, Name = "Rouge cuivré"},
				{Value = 31, Name = "Rouge cardinal"},
				{Value = 32, Name = "Rouge brique"},
				{Value = 33, Name = "Grenat"},
				{Value = 34, Name = "Pourpre"},
				{Value = 35, Name = "Framboise"},
				{Value = 39, Name = "Rouge mat"},
				{Value = 40, Name = "Rouge foncé"},
				{Value = 43, Name = "Rouge pulpeux"},
				{Value = 44, Name = "Rouge brillant"},
				{Value = 46, Name = "Rouge pâle"},
				{Value = 143, Name = "Rouge vin"},
				{Value = 150, Name = "Rouge volcano"},
			},
			["Rose"] = {
				{Value = 135, Name = "Rose"},
				{Value = 136, Name = "Saumon"},
				{Value = 137, Name = "Rose bonbon"},
			},
			["Violet"] = {
				{Value = 71, Name = "Indigo"},
				{Value = 72, Name = "Violet profond"},
				{Value = 76, Name = "Violet foncé"},
				{Value = 81, Name = "Améthyste"},
				{Value = 142, Name = "Violet mystique"},
				{Value = 145, Name = "Saumon métallisé"},
				{Value = 148, Name = "Violet mat"},
				{Value = 149, Name = "Violet profond mat"},
			},
			["Jaune"] = {
				{Value = 42, Name = "Jaune"},
				{Value = 88, Name = "Jaune blé"},
				{Value = 89, Name = "Jaune rally"},
				{Value = 91, Name = "Jaune clair"},
				{Value = 126, Name = "Jaune pâle"},
			},
			["Orange"] = {
				{Value = 36, Name = "Orange"},
				{Value = 38, Name = "Tangerine"},
				{Value = 41, Name = "Orange mat"},
				{Value = 123, Name = "Orange clair"},
				{Value = 124, Name = "Pèche"},
				{Value = 130, Name = "Citrouille"},
				{Value = 138, Name = "Orange lamborghini"},
			},
			["Vert"] = {
				{Value = 49, Name = "Vert foncé"},
				{Value = 50, Name = "Vert rally"},
				{Value = 51, Name = "Vert sapin"},
				{Value = 52, Name = "Vert olive"},
				{Value = 53, Name = "Vert clair"},
				{Value = 55, Name = "Vert lime"},
				{Value = 56, Name = "Vert forêt"},
				{Value = 57, Name = "Vert pelouse"},
				{Value = 58, Name = "Vert impérial"},
				{Value = 59, Name = "Vert bouteille"},
				{Value = 92, Name = "Vert citrus"},
				{Value = 125, Name = "Vert anis"},
				{Value = 128, Name = "Vert kaki"},
				{Value = 133, Name = "Vert army"},
				{Value = 151, Name = "Vert sombre"},
				{Value = 152, Name = "Vert chasseur"},
				{Value = 155, Name = "Amarylisse"},
			},
			["Bleu"] = {
				{Value = 54, Name = "Topaze"},
				{Value = 60, Name = "Bleu clair"},
				{Value = 61, Name = "Bleu galaxy"},
				{Value = 63, Name = "Bleu foncé"},
				{Value = 64, Name = "Bleu azur"},
				{Value = 65, Name = "Bleu marine"},
				{Value = 67, Name = "Lapis lazuli"},
				{Value = 68, Name = "Bleu diamant"},
				{Value = 69, Name = "Bleu surfeur"},
				{Value = 70, Name = "Bleu pastel"},
				{Value = 73, Name = "Bleu céleste"},
				{Value = 74, Name = "Bleu rally"},
				{Value = 75, Name = "Bleu cyan"},
				{Value = 77, Name = "Cobalt"},
				{Value = 78, Name = "Bleu électrique"},
				{Value = 79, Name = "Bleu horizon"},
				{Value = 80, Name = "Bleu métallisé"},
				{Value = 82, Name = "Aigue marine"},
				{Value = 83, Name = "Bleu agathe"},
				{Value = 84, Name = "Zirconium"},
				{Value = 85, Name = "Spinelle"},
				{Value = 86, Name = "Tourmaline"},
				{Value = 87, Name = "Bleu paradis"},
				{Value = 127, Name = "Bubble gum"},
				{Value = 140, Name = "Bleu minuit"},
				{Value = 141, Name = "Bleu interdit"},
				{Value = 146, Name = "Bleu glacier"},
			},
			["Chrome"] = {
				{Value = 117, Name = "Chrome"},
				{Value = 118, Name = "Chrome brossé"},
				{Value = 119, Name = "Chrome noir"},
				{Value = 120, Name = "Aluminium brossé"},
			},
			["Or"] = {
				{Value = 37, Name = "Or"},
				{Value = 158, Name = "Or pure"},
				{Value = 159, Name = "Or brossé"},
				{Value = 160, Name = "Or clair"},
			},
		},
	},
}