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
			{JobName = "marabunta", JobLabel = "Marabunta"},
			{JobName = "families", JobLabel = "Families"},
			{JobName = "lost", JobLabel = "Lost MC"},
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
			},
			RMenu:Get("Job", "Mobil_TrgInv"))
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
			RageUI.Item.List("Objets", {
				{Name = "Cône de signalisation", Value = "prop_roadcone02a"},
				{Name = "Barrière", Value = "prop_barrier_work05"},
				{Name = "Herses", Value = "p_ld_stinger_s"},
			}, Org.ListIndex or 1, nil, {}, true, {
				onSelected = function(Index, Items)
					Org.ListIndex = Index
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
		["ballas"] = {
			Coords = {
				{
					MarkerType = 29,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = 119.02417755127, y = -1966.3912353516, z = 21.326782226563,
					Type = "Chest",
				},
				{
					MarkerType = 36,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = 101.03736877441, y = -1965.3099365234, z = 20.838134765625,
					Type = "Garage",
				},
				{
					MarkerType = 1,
					MarkerScale = 3.0,
					MarkerR = 255,
					MarkerG = 0,
					MarkerB = 0,
					MarkerA = 125,
					x = 102.5274810791, y = -1957.2395019531, z = 20.06298828125 - 1,
					Type = "DeleteCar",
				},
				{
					MarkerType = 22,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = 117.52088165283, y = -1963.5428466797, z = 21.326782226563,
					Type = "Cloackroom",
				},
			},
			Vehicle = {
				Spawn = {x = 102.5274810791, y = -1957.2395019531, z = 20.06298828125, h = 357.16534423828},
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
		["families"] = {
			Coords = {
				{
					MarkerType = 29,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = -134.61099243164, y = -1609.2791748047, z = 35.025634765625,
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
					x = -100.70769500732, y = -1586.8088378906, z = 30.830078125 - 1,
					Type = "DeleteCar",
				},
				{
					MarkerType = 22,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = -140.8747253418, y = -1608.7384033203, z = 35.025634765625,
					Type = "Cloackroom",
				},
			},
			Vehicle = {
				Spawn = {x = -100.70769500732, y = -1586.8088378906, z = 30.830078125, h = 289.13385009766},
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
		["marabunta"] = {
			Coords = {
				{
					MarkerType = 29,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = 1436.716, y = -1489.187, z = 66.61902,
					Type = "Chest",
				},
				{
					MarkerType = 36,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = 1423.516, y = -1501.886, z = 60.94067,
					Type = "Garage",
				},
				{
					MarkerType = 1,
					MarkerScale = 3.0,
					MarkerR = 255,
					MarkerG = 0,
					MarkerB = 0,
					MarkerA = 125,
					x = 1423.516, y = -1501.886, z = 60.94067 - 1,
					Type = "DeleteCar",
				},
				{
					MarkerType = 22,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = 1440.066, y = -1482.62, z = 66.61902,
					Type = "Cloackroom",
				},
			},
			Vehicle = {
				Spawn = {x = 1422.554, y = -1505.802, z = 60.26672, h = 317.48031616211},
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
			Coords = {
				{
					MarkerType = 29,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = 332.8747253418, y = -2013.1384277344, z = 22.388305664063,
					Type = "Chest",
				},
				{
					MarkerType = 36,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = 270.052734375, y = -2014.6549072266, z = 19.372192382813,
					Type = "Garage",
				},
				{
					MarkerType = 1,
					MarkerScale = 3.0,
					MarkerR = 255,
					MarkerG = 0,
					MarkerB = 0,
					MarkerA = 125,
					x = 272.76922607422, y = -2015.8681640625, z = 18.681274414063 - 1,
					Type = "DeleteCar",
				},
				{
					MarkerType = 22,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = 357.33627319336, y = -2032.9055175781, z = 22.388305664063,
					Type = "Cloackroom",
				},
			},
			Vehicle = {
				Spawn = {x = 272.76922607422, y = -2015.8681640625, z = 18.681274414063, h = 235.27560424805},
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
		["lost"] = {
			Coords = {
				{
					MarkerType = 29,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = 976.76043701172, y = -103.56922912598, z = 74.841796875,
					Type = "Chest",
				},
				{
					MarkerType = 36,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = 985.84613037109, y = -138.44834899902, z = 73.08935546875,
					Type = "Garage",
				},
				{
					MarkerType = 1,
					MarkerScale = 3.0,
					MarkerR = 255,
					MarkerG = 0,
					MarkerB = 0,
					MarkerA = 125,
					x = 979.35821533203, y = -134.42637634277, z = 72.769287109375 - 1,
					Type = "DeleteCar",
				},
				{
					MarkerType = 22,
					MarkerScale = 0.5,
					MarkerR = 255,
					MarkerG = 255,
					MarkerB = 255,
					MarkerA = 255,
					x = 981.03295898438, y = -97.64835357666, z = 74.841796875,
					Type = "Cloackroom",
				},
			},
			Vehicle = {
				Spawn = {x = 979.35821533203, y = -134.42637634277, z = 72.769287109375, h = 56.692909240723},
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