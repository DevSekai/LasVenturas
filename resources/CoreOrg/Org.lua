Org = {
	MarkerDist = 8,
	PedDist = 2,
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
			{JobName = "ballas", JobLabel = "Ballas"},
			{JobName = "vagos", JobLabel = "Vagos"},
		},
		JobBtn = function()
			if PlayerData.job2.grade_name == "boss" then
				RageUI.Item.Button("Actions gang", nil, {}, true, {
					onSelected = function(Index, Items)
						ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(Money)
							Org.Wl.Society_Money = Money
						end, PlayerData.job2.name)
					end,
				},RMenu:Get("Org", "Mobil_Society"))
			end
		end,
		["ballas"] = {
			Btn = function()
				RageUI.Item.Separator("↓↓       ~g~Intéraction~s~       ↓↓")
			end,
			Coords = {
				{
					MarkerType = 29,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = 212.09671020508, y = -1013.6043701172, z = 29.296752929688,
					Type = "Chest",
				},
				{
					MarkerType = 36,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = 214.16703796387, y = -1009.5032958984, z = 29.263061523438,
					Type = "Garage",
				},
				{
					MarkerType = 1,
					MarkerScale = 3.0,
					MarkerR = 255,
					MarkerG = 0,
					MarkerB = 0,
					MarkerA = 125,
					x = 217.63516235352, y = -1005.1120605469, z = 29.1787109375 - 1,
					Type = "DeleteCar",
				},
				{
					MarkerType = 22,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = 220.72088623047, y = -1001.4197998047, z = 29.094482421875,
					Type = "Cloackroom",
				},
			},
			Vehicle = {
				Spawn = {x = 224.49230957031, y = -997.35821533203, z = 29.1787109375, h = 317.48031616211},
				["boss"] = {
					Value = {
						{Label = "Adder", Value = "adder"},
						{Label = "Blista", Value = "blista"},
					},
				},
				["expert"] = {
					Value = {
						{Label = "Adder", Value = "adder"},
						{Label = "Blista", Value = "blista"},
					},
				},
				["medium"] = {
					Value = {
						{Label = "Adder", Value = "adder"},
						{Label = "Blista", Value = "blista"},
					},
				},
				["recrue"] = {
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
		["vagos"] = {
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
						{Label = "Adder", Value = "adder"},
						{Label = "Blista", Value = "blista"},
					},
				},
				["expert2"] = {
					Value = {
						{Label = "Adder", Value = "adder"},
						{Label = "Blista", Value = "blista"},
					},
				},
				["expert"] = {
					Value = {
						{Label = "Adder", Value = "adder"},
						{Label = "Blista", Value = "blista"},
					},
				},
				["medium"] = {
					Value = {
						{Label = "Adder", Value = "adder"},
						{Label = "Blista", Value = "blista"},
					},
				},
				["recrue"] = {
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
		--NewJob
	},
}