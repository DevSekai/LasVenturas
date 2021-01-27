InMenu = false
GpsList = {"Supprimer le trajet","Agence d'interim","Auto école","Benny's","Hôpitale's","Parking central","Poste de police"}
VhcDoors = {"Capot","Coffre","Avant gauche","Avant droite","Arrière gauche","Arrière droite","Toutes"}
VhcWindows = {"Avant gauche","Avant droite","Arrière gauche","Arrière droite","Toutes"}
invItems, invWeapon, invWallet, PlySim, crtIndex, onItems, CrtAnimCat, Accessoires= {}, {}, {}, {}, {}, {}, {}, {}
cashIndex, dirtyIndex, CrtAnimFunc, saleIndex = 1, 1, nil, 1

main = RageUI.CreateMenu("", "Menu personnel")
main.Closed = function()
    InMenu = false
    onItems = {}
end
loadout =  RageUI.CreateSubMenu(main, "", "Gestion des armes")
inventory = RageUI.CreateSubMenu(main, "", "Inventaire")
wallet =  RageUI.CreateSubMenu(main, "", "Porte-feuille")
wallet.Closed = function()
    cashIndex = 1
    dirtyIndex = 1
end
vehicle = RageUI.CreateSubMenu(main, "", "Gestion du véhicule")
divers = RageUI.CreateSubMenu(main, "", "Réglages")
animations = RageUI.CreateSubMenu(main, "", "Animations")
animList = RageUI.CreateSubMenu(animations, "", "Animations")
diver_menu = RageUI.CreateSubMenu(divers, "", "Réglages menu")
diver_menu_colour = RageUI.CreateSubMenu(diver_menu, "", "Couleur menu")
diver_menu_style = RageUI.CreateSubMenu(diver_menu, "", "Style menu")

RegisterCommand('OpenPersonal', function()
    if not InMenu then
        OpenPersonalMenu()
    else
        InMenu = false
        RageUI.CloseAll()
    end
end, false)

RegisterKeyMapping('OpenPersonal', 'Menu personnel', 'keyboard', 'F5')

function OpenPersonalMenu()
	RageUI.Visible(main, true)
	InMenu = true
	while InMenu do
		Citizen.Wait(0)

		RageUI.IsVisible(main, function()
			RageUI.Item.Separator("[Votre ID] : "..GetPlayerServerId(PlayerId()))
			RageUI.Item.Button("~r~>~s~  Inventaire", "Vous y trouverez tout ce que vous avez dans les poches.", {}, true, {
				onSelected = function()
					invItems = {}
					ESX.TriggerServerCallback('xPlayer:getUserInventory', function(data)
						for i=1, #data, 1 do
							local item = data[i]
							if item.count > 0 then
								table.insert(invItems, {label = item.label, count = item.count, type = 'item_standard', value = item.name, usable = item.usable, removable = item.canRemove})
							end
						end
					end)
					PlySim = {}
					ESX.TriggerServerCallback("esx_cartesim:GetList", function(Data)
						for _,v in pairs(Data) do
							table.insert(PlySim, {label = tostring(v.number), value = v})
						end
					end)
					ESX.TriggerServerCallback("xPlayer:getAccessoire", function(Acces)
						Accessoires = Acces
					end)
				end,
			},inventory)
			RageUI.Item.Button("~r~>~s~  Gestion des armes", "Vos armes, a ne pas utiliser n'importe comment.", {}, true, {
				onSelected = function()
					invWeapon = {}
					ESX.TriggerServerCallback('xPlayer:getUserLoadout', function(data)
						for i=1, #data, 1 do
							local weapon = data[i]
							table.insert(invWeapon, {label = ESX.GetWeaponLabel(weapon.name), value = weapon.name, itemType = 'item_weapon', amount = weapon.ammo})
						end
					end)
				end,
			},loadout)
			RageUI.Item.Button("~r~>~s~  Porte-feuille", "Vous y trouverez vos informations personnel et votre argent.", {}, true, {
				onSelected = function()
					ESX.TriggerServerCallback('xPlayer:getUserAccounts', function(data)
						invWallet = data
					end)
				end,
			},wallet)
			RageUI.Item.Button("~r~>~s~  Animations", "Differents animations, afin d'ambiancer vos scènes.", {}, true, {
			},animations)
			if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
				RageUI.Item.Button("~r~>~s~  Gestion du véhicule", "Interaction avec votre véhicule.", {}, true, {
				},vehicle)
			end
			RageUI.Item.Button("~r~>~s~  Divers", "Différents réglages et fonctionnalité afin de personnalisé sont experience de jeux.", {}, true, {
			},divers)
		end)
	
		RageUI.IsVisible(inventory, function()
            RageUI.Item.Separator("Objets")
			for _,v in pairs (invItems) do
                MaxCount = {}
                for i = 0 , v.count, 1 do
                    MaxCount[i] = "~y~"..i.."~s~"
                end
				RageUI.Item.List("~r~>~s~  "..v.label, MaxCount, v.index or 1, nil, {}, true, {
					onSelected = function(Index, Items)
                        v.index = Index
                        if itemName ~= v.value then
                            onItems = {}
                            itemName = v.value
                        end
                        if not onItems[v.value] then
                            onItems = {}
                            onItems[v.value] = true
                        else
                            onItems[v.value] = false
                        end
                    end,
                    onListChange = function(Index, Items)
                        v.index = Index
                        crtIndex[v.value] = Index
                    end,
                })
                if onItems[v.value] then
                    if v.usable then
                        RageUI.Item.Button("   ~y~>~s~ Utiliser", nil, {}, true, {
                            onSelected = function(Index, Items)
                                TriggerServerEvent('xPlayer:UseItem', itemName)
                            end,
                        })
                    end
					if v.removable then
                        RageUI.Item.Button("   ~y~>~s~ Donner", nil, {}, true, {
                            onSelected = function(Index, Items)
                                TriggerServerEvent('xPlayer:GiveItem', GetPlayerServerId(closestPlayer), itemName, crtIndex[itemName])
                            end,
                        })
                        RageUI.Item.Button("   ~y~>~s~ Jeter", nil, {}, true, {
                            onSelected = function(Index, Items)
                                TriggerServerEvent('xPlayer:RemoveItem', itemName, crtIndex[itemName])
                            end,
                        })
                    end
                end
			end
            RageUI.Item.Separator("Cartes sim")
            for _,v in pairs (PlySim) do
                RageUI.Item.Button("~r~>~s~  "..v.label, nil, {}, true, {
                    onSelected = function(Index, Items)
                        if not onItems[v.value] then
                            onItems = {}
                            onItems[v.value] = true
                        else
                            onItems[v.value] = false
                        end
                    end,
                })
                if onItems[v.value] then
                    RageUI.Item.Button("   ~y~>~s~ Utiliser", nil, {}, true, {
                        onSelected = function(Index, Items)
                            TriggerServerEvent('esx_cartesim:sim_use', v.value.number)
                            ESX.ShowNotification("Vous avez ~g~activé la carte SIM avec le numéro : ~p~" .. v.value.number)
                            Citizen.Wait(1000)
                            TriggerServerEvent('gcPhone:allUpdate')
                        end,
                    })
                    RageUI.Item.Button("   ~y~>~s~ Donner", nil, {}, true, {
                        onSelected = function(Index, Items)
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
							if closestPlayer == -1 or closestDistance > 3.0 then
								ESX.ShowNotification('~r~Aucun joueur à proximité !')
							else
								TriggerServerEvent('esx_cartesim:sim_give', v.value.number, GetPlayerServerId(closestPlayer))
							end
							Citizen.Wait(1000)
							TriggerServerEvent('gcPhone:allUpdate')
                        end,
                    })
                    RageUI.Item.Button("   ~y~>~s~ Jeter", nil, {}, true, {
                        onSelected = function(Index, Items)
                            TriggerServerEvent('esx_cartesim:sim_delete', v.value.number)
							ESX.ShowNotification("Vous avez ~r~jeté la carte SIM avec le numéro : ~p~" .. v.value.number)
							Citizen.Wait(1000)
							TriggerServerEvent('gcPhone:allUpdate')
                        end,
                    })
                end
            end
            RageUI.Item.Separator("Vêtements")
            for _,v in pairs (Accessoires) do
                RageUI.Item.Button("~r~>~s~  "..v.Label, nil, {}, true, {
                    onSelected = function(Index, Items)
                        Acces = json.decode(v.Stuff)
						PlyPed = GetPlayerPed(-1)
						First = Acces.Index
						Second = Acces.Color
						Type = v.Type
						Label = v.Label
						Id = v.Id
                        Resulta = v
                        if not onItems[v.Label] then
                            onItems = {}
                            onItems[v.Label] = true
                        else
                            onItems[v.Label] = false
                        end
                    end,
                })
                if onItems[v.Label] then
                    RageUI.Item.Button("   ~y~>~s~ Utiliser", nil, {}, true, {
                        onSelected = function(Index, Items)
                            AccessoiresOn(Type, First, Second)
                        end,
                    })
                    RageUI.Item.Button("   ~y~>~s~ Enlever", nil, {}, true, {
                        onSelected = function(Index, Items)
                            AccessoiresOff(Type)
                        end,
                    })
                    RageUI.Item.Button("   ~y~>~s~ Renommer", nil, {}, true, {
                        onSelected = function(Index, Items)
                            NewLabel = KeyboardInput("Nouveau nom", 20)
							if NewLabel ~= nil then
								TriggerServerEvent('xPlayer:RenameAcc', Id, NewLabel)
								RageUI.GoBack()
							else
								ESX.ShowNotification("Usage invalide.")
							end
                        end,
                    })
                    RageUI.Item.Button("   ~y~>~s~ Donner", nil, {}, true, {
                        onSelected = function(Index, Items)
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
							local closestPed = GetPlayerPed(closestPlayer)
	
							if closestPlayer ~= -1 and closestDistance < 3.0 then
								TriggerServerEvent('xPlayer:GiveAcc', GetPlayerServerId(closestPlayer), Id)
								RageUI.GoBack()
							else
								ESX.ShowNotification("Aucun joueurs aux alentours.")
							end
                        end,
                    })
                    RageUI.Item.Button("   ~y~>~s~ Jeter", nil, {}, true, {
                        onSelected = function(Index, Items)
                            TriggerServerEvent('xPlayer:DelAcc', Id)
							RageUI.GoBack()
                        end,
                    })
                end
			end
		end)
	
		RageUI.IsVisible(loadout, function()
            for _,v in pairs (invWeapon) do
                RageUI.Item.Button("~r~>~s~  "..v.label, nil, {}, true, {
                    onSelected = function(Index, Items)
                        if not onItems[v.label] then
                            onItems = {}
                            onItems[v.label] = true
                        else
                            onItems[v.label] = false
                        end
                    end,
                })
                if onItems[v.label] then
                    RageUI.Item.Button("   ~y~>~s~ Donner", nil, {}, true, {
                        onSelected = function(Index, Items)
							local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
							if closestDistance ~= -1 and closestDistance <= 3 then
								TriggerServerEvent('xPlayer:GiveWeapon', GetPlayerServerId(closestDistance), v.label, v.value, v.amount)
								RageUI.GoBack()
							else
								ESX.ShowNotification('Il n\'y a personne aux alentours.')
							end
                        end,
                    })
                    RageUI.Item.Button("   ~y~>~s~ Jeter", nil, {}, true, {
                        onSelected = function(Index, Items)
							TriggerServerEvent('xPlayer:RemoveWeapon', v.value, v.amount)
							RageUI.GoBack()
                        end,
                    })
                end
			end
		end)
	
		RageUI.IsVisible(wallet, function()
			for _,v in pairs (invWallet) do
				if v.money > 0 then
					RageUI.Item.Button("~r~>~s~  "..v.label, nil, {RightLabel = "~g~"..v.money.."$"}, true, {
						onSelected = function(Index, Items)
							if not onItems[v.name] then
								onItems = {}
								onItems[v.name] = true
							else
								onItems[v.name] = false
							end
						end,
					})
					if onItems[v.name] then
						if v.name ~= "bank" then
							RageUI.Item.Button("   ~y~>~s~ Donner", nil, {}, true, {
								onSelected = function(Index, Items)
									local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
									if closestDistance ~= -1 and closestDistance <= 3 then
										TriggerServerEvent('xPlayer:GiveMoney', GetPlayerServerId(closestDistance), v.name, cashIndex)
										RageUI.GoBack()
									else
										ESX.ShowNotification('Il n\'y a personne aux alentours.')
									end
								end,
							})
							RageUI.Item.Button("   ~y~>~s~ Jeter", nil, {}, true, {
								onSelected = function(Index, Items)
									TriggerServerEvent('xPlayer:RemoveMoney', v.name, cashIndex)
									RageUI.GoBack()
								end,
							})
						end
					end
				end
			end
			RageUI.Item.Button("~r~>~s~  Carte d'identité", nil, {}, true, {
				onSelected = function(Index, Items)
					if not onItems["idcard"] then
						onItems = {}
						onItems["idcard"] = true
					else
						onItems["idcard"] = false
					end
				end,
			})
			if onItems["idcard"] then
				RageUI.Item.Button("   ~y~>~s~ Regarder", nil, {}, true, {
					onSelected = function(Index, Items)
						TriggerEvent("xPlayer:Card:Id:Look")
					end,
				})
				RageUI.Item.Button("   ~y~>~s~ Montrer", nil, {}, true, {
					onSelected = function(Index, Items)
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestDistance ~= -1 and closestDistance <= 3 then
							TriggerServerEvent('xPlayer:Card:Id:Show', GetPlayerServerId(closestDistance))
						else
							ESX.ShowNotification('Il n\'y a personne aux alentours.')
						end
					end,
				})
			end
		end)
	
		RageUI.IsVisible(vehicle, function()
			plyInVeh = GetVehiclePedIsIn(PlayerPedId(), false)
			if plyInVeh then
				CarPlate = GetVehicleNumberPlateText(plyInVeh)
				CarHealth = GetEntityHealth(plyInVeh) / 10
				CarModel = GetDisplayNameFromVehicleModel(GetEntityModel(plyInVeh))
				ActualSpeed = math.floor(GetEntitySpeed(plyInVeh)* 3.6 + 0.5)
				EngineState = GetIsVehicleEngineRunning(plyInVeh)
				if EngineState then
					Engine = "[~g~Allumer~s~]"
				else
					Engine = "[~r~Eteind~s~]"
				end
				if not Limitateur then
					LimitateurState = ActualSpeed.." Km/H [~r~Désactiver~s~]"
				else
					LimitateurState = ActualSpeed.." Km/H [~g~Activer~s~]"
				end
			end
			if CarModel then RageUI.Item.Separator("[Modèle] : "..CarModel) end
			if CarHealth then RageUI.Item.Separator("[Etat du véhicule] : "..CarHealth.."%") end
			if CarPlate then RageUI.Item.Separator("[Plaque d'immatriculation] : "..CarPlate) end
			RageUI.Item.Checkbox("~r~>~s~  Limiteur de vitesse : "..LimitateurState, "", Limitateur, {}, {
				onSelected = function(Index)
					if IsPedSittingInAnyVehicle(PlayerPedId()) then
						Limitateur = not Limitateur
						plyVeh = GetVehiclePedIsIn(PlayerPedId(), false)
						RegulSpeed = GetEntitySpeed(plyVeh)
						if not Limitateur then
							maxSpeed = GetVehicleHandlingFloat(plyInVeh,"CHandlingData","fInitialDriveMaxFlatVel")
							SetVehicleMaxSpeed(plyVeh, maxSpeed)
						else
							SetVehicleMaxSpeed(plyVeh, RegulSpeed)
						end
					end
				end,
			})
			RageUI.Item.Checkbox("~r~>~s~  Etat moteur : "..Engine, "", EngineState, {}, {
				onSelected = function(Index)
					if IsPedSittingInAnyVehicle(PlayerPedId()) then
						plyVeh = GetVehiclePedIsIn(PlayerPedId(), false)
						if EngineState then
							SetVehicleEngineOn(plyVeh, false, false, true)
							SetVehicleUndriveable(plyVeh, true)
						else
							SetVehicleEngineOn(plyVeh, true, false, true)
							SetVehicleUndriveable(plyVeh, false)
						end
					end
				end,
			})
			RageUI.Item.List("~r~>~s~  Ouvrir une porte", VhcDoors, 1, nil, {}, true, {
				onSelected = function(Index, Items)
					if IsPedSittingInAnyVehicle(PlayerPedId()) then
						plyVeh = GetVehiclePedIsIn(PlayerPedId(), false)
						if Index == 1 then SetVehicleDoorOpen(plyVeh, 4, false, false)
						elseif Index == 2 then SetVehicleDoorOpen(plyVeh, 5, false, false)
						elseif Index == 3 then SetVehicleDoorOpen(plyVeh, 0, false, false)
						elseif Index == 4 then SetVehicleDoorOpen(plyVeh, 1, false, false)
						elseif Index == 5 then SetVehicleDoorOpen(plyVeh, 2, false, false)
						elseif Index == 6 then SetVehicleDoorOpen(plyVeh, 3, false, false)
						else 
							SetVehicleDoorOpen(plyVeh, 0, false, false)
							SetVehicleDoorOpen(plyVeh, 1, false, false)
							SetVehicleDoorOpen(plyVeh, 2, false, false)
							SetVehicleDoorOpen(plyVeh, 3, false, false)
							SetVehicleDoorOpen(plyVeh, 4, false, false)
							SetVehicleDoorOpen(plyVeh, 5, false, false)
						end
					end
				end,
			})
			RageUI.Item.List("~r~>~s~  Fermer une porte", VhcDoors, 1, nil, {}, true, {
				onSelected = function(Index, Items)
					if IsPedSittingInAnyVehicle(PlayerPedId()) then
						plyVeh = GetVehiclePedIsIn(PlayerPedId(), false)
						if Index == 1 then SetVehicleDoorShut(plyVeh, 4, false, false)
						elseif Index == 2 then SetVehicleDoorShut(plyVeh, 5, false, false)
						elseif Index == 3 then SetVehicleDoorShut(plyVeh, 0, false, false)
						elseif Index == 4 then SetVehicleDoorShut(plyVeh, 1, false, false)
						elseif Index == 5 then SetVehicleDoorShut(plyVeh, 2, false, false)
						elseif Index == 6 then SetVehicleDoorShut(plyVeh, 3, false, false)
						else 
							SetVehicleDoorShut(plyVeh, 0, false, false)
							SetVehicleDoorShut(plyVeh, 1, false, false)
							SetVehicleDoorShut(plyVeh, 2, false, false)
							SetVehicleDoorShut(plyVeh, 3, false, false)
							SetVehicleDoorShut(plyVeh, 4, false, false)
							SetVehicleDoorShut(plyVeh, 5, false, false)
						end
					end
				end,
			})
			RageUI.Item.List("~r~>~s~  Ouvrir une fenêtre", VhcWindows, 1, nil, {}, true, {
				onSelected = function(Index, Items)
					if IsPedSittingInAnyVehicle(PlayerPedId()) then
						plyVeh = GetVehiclePedIsIn(PlayerPedId(), false)
						if Index == 1 then RollDownWindow(plyVeh, 0)
						elseif Index == 2 then RollDownWindow(plyVeh, 1)
						elseif Index == 3 then RollDownWindow(plyVeh, 2)
						elseif Index == 4 then RollDownWindow(plyVeh, 3)
						else 
							RollDownWindows(plyVeh)
						end
					end
				end,
			})
			RageUI.Item.List("~r~>~s~  Fermer une fenêtre", VhcWindows, 1, nil, {}, true, {
				onSelected = function(Index, Items)
					if IsPedSittingInAnyVehicle(PlayerPedId()) then
						plyVeh = GetVehiclePedIsIn(PlayerPedId(), false)
						if Index == 1 then RollUpWindow(plyVeh, 0)
						elseif Index == 2 then RollUpWindow(plyVeh, 1)
						elseif Index == 3 then RollUpWindow(plyVeh, 2)
						elseif Index == 4 then RollUpWindow(plyVeh, 3)
						else 
							RollUpWindow(plyVeh, 0)
							RollUpWindow(plyVeh, 1)
							RollUpWindow(plyVeh, 2)
							RollUpWindow(plyVeh, 3)
						end
					end
				end,
			})
		end)

		RageUI.IsVisible(animations, function()
			RageUI.Item.List("~r~>~s~  Humeur", AnimList.Expressions, 1, nil, {}, true, {
				onSelected = function(Index, Items)
					SetFacialIdleAnimOverride(PlayerPedId(), Items.Value, 0)
				end,
			})
			RageUI.Item.List("~r~>~s~  Démarche", AnimList.Demarches, 1, nil, {}, true, {
				onSelected = function(Index, Items)
					StartDemarche(Items.Value)
				end,
			})
			RageUI.Item.Button("~r~>~s~  Annuler l'animation", nil, {}, true, {
				onSelected = function(Index, Items)
					ClearPedTasksImmediately(PlayerPedId())
					DestroyAllProps()
				end,
			})
			for _,v in pairs (AnimList.List) do 
				RageUI.Item.Button("~r~>~s~  "..v.Label, nil, {}, true, {
					onSelected = function(Index, Items)
						CrtAnimCat = v.Table
						CrtAnimFunc = _
					end,
				},animList)
			end
		end)

		RageUI.IsVisible(animList, function()
			for _,v in pairs (CrtAnimCat) do
				RageUI.Item.Button("~r~>~s~  "..v[3], nil, {}, true, {
					onSelected = function(Index, Items)
						OnEmotePlay(v[1], v[2], v.AnimationOptions)
					end,
				})
			end
		end)

		RageUI.IsVisible(divers, function()
			RageUI.Item.List("~r~>~s~  Gps rapide", GpsList, 1, "Différents points d'intérêts.", {}, true, {
				onSelected = function(Index, Items)
					if Index == 1 then DeleteWaypoint()
					elseif Index == 2 then SetNewWaypoint(-244.84, -998.24)
					elseif Index == 3 then SetNewWaypoint(230.16, -1394.87)
					elseif Index == 4 then SetNewWaypoint(-208.12, -1301.74)
					elseif Index == 5 then SetNewWaypoint(380.06, -599.4)
					elseif Index == 6 then SetNewWaypoint(-284.52, -895.84)
					else SetNewWaypoint(401.41, -979.64)
					end
				end,
            })
            RageUI.Item.Checkbox("~r~>~s~  Cacher le HUD", "Cache le HUD.", false, {}, {
                onChecked = function(Index, Items)
                    TriggerEvent("Hud:HideHud")
                end,
                onUnChecked = function(Index, Items)
                    TriggerEvent("Hud:DisplayHud")
                end,
            })
			RageUI.Item.Button("~r~>~s~  Modifier le menu", "Réglage du design des menu.", {}, true, {
				onSelected = function(Index, Items)
				end,
			},diver_menu)
		end)

		RageUI.IsVisible(diver_menu, function()
			RageUI.Item.List("~r~>~s~  Thèmes", {
				{Name = "Default", Value = MenuTheme.Default},
				{Name = "Marron", Value = MenuTheme.Brown},
				{Name = "Rouge", Value = MenuTheme.Red},
				{Name = "Orange", Value = MenuTheme.Orange},
				{Name = "Jaune", Value = MenuTheme.Yellow},
				{Name = "Vert", Value = MenuTheme.Green},
				{Name = "Turquoise", Value = MenuTheme.Bgreen},
				{Name = "Bleu", Value = MenuTheme.Blue},
				{Name = "Violet", Value = MenuTheme.Purple},
				{Name = "Rose", Value = MenuTheme.Pink},
			}, 1, "Vous pouvez choisir un thème puis le personnalisé si vous le souhaitez.", {}, true, {
				onListChange = function(Index, Items)
					Index = Index
					MenuColour = Items.Value
					TriggerEvent("RageUI:Refresh:Theme", MenuColour)
				end,
			})
			RageUI.Item.Button("~r~>~s~  Personnalisé", "Choix de la couleur des menu.", {}, true, {
				onSelected = function(Index, Items)
				end,
			},diver_menu_colour)
			RageUI.Item.Button("~r~>~s~  Style", "Choix du style des menu.", {}, true, {
				onSelected = function(Index, Items)
				end,
            },diver_menu_style)
            RageUI.Item.Separator("")
			RageUI.Item.Button("~r~>~s~  Sauvegarder le menu", "Sauvegarder les réglages actuel du menu.", {}, true, {
				onSelected = function(Index, Items)
					TriggerEvent("RageUI:Save:Setting")
					ESX.ShowNotification("La template à était sauvegarder.")
				end,
			})
			RageUI.Item.Button("~r~>~s~  Réinitialiser le menu", "Réinitialiser les réglages du menu.", {}, true, {
				onSelected = function(Index, Items)
					TriggerEvent("RageUI:Reset:Setting")
				end,
			})
		end)

		RageUI.IsVisible(diver_menu_style, function()
			IndexBis = nil
			Font = {
				{Name = "ChaletLondon", Value = 0},
				{Name = "HouseScript", Value = 1},
				{Name = "Monospace", Value = 2},
				{Name = "CharletColonge", Value = 4},
				{Name = "Pricedown", Value = 7},
			}
			RageUI.Item.Separator("Titre")
			RageUI.Item.List("~r~>~s~  Choix de la police", Font, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					IndexBis = Index
					MenuFont.Title = Items.Value
					TriggerEvent("RageUI:Update:Style:Title", Items.Value)
				end,
			})
			RageUI.Item.Separator("Sous titre")
			RageUI.Item.List("~r~>~s~  Choix de la police", Font, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					IndexBis = Index
					MenuFont.SubTitle = Items.Value
					TriggerEvent("RageUI:Update:Style:SubTitle", Items.Value)
				end,
			})
			RageUI.Item.Separator("Description")
			RageUI.Item.List("~r~>~s~  Choix de la police", Font, 1, "Ceci est la déscription.", {}, true, {
				onListChange = function(Index, Items)
					IndexBis = Index
					MenuFont.Desc = Items.Value
					TriggerEvent("RageUI:Update:Style:Desc", Items.Value)
				end,
			})
			RageUI.Item.Separator("Autres")
			RageUI.Item.List("~r~>~s~  Choix de la police", Font, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuFont.Txt = Items.Value
					TriggerEvent("RageUI:Update:Style:Txt", Items.Value)
				end,
			})
		end)

		RageUI.IsVisible(diver_menu_colour, function()
			RGBA = {}
			for i = 1 , 255 ,1 do
				RGBA[i] = i
			end
			RageUI.Item.Separator("Couleur de la bannière")
			RageUI.Item.List("~r~>~s~  Rouge", RGBA, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Banner.R = Index
					TriggerEvent("RageUI:Update:Colour:Banner", MenuColour.Banner)
				end,
			})
			RageUI.Item.List("~g~>~s~  Vert", RGBA, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Banner.G = Index
					TriggerEvent("RageUI:Update:Colour:Banner", MenuColour.Banner)
				end,
			})
			RageUI.Item.List("~b~>~s~  Bleu", RGBA, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Banner.B = Index
					TriggerEvent("RageUI:Update:Colour:Banner", MenuColour.Banner)
				end,
			})
			RageUI.Item.List("~u~>~s~  Opacité", RGBA, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Banner.A = Index
					TriggerEvent("RageUI:Update:Colour:Banner", MenuColour.Banner)
				end,
			})

			RageUI.Item.Separator("Couleur du background")
			RageUI.Item.List("~r~>~s~  Rouge", RGBA, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Background.R = Index
					TriggerEvent("RageUI:Update:Colour:Background", MenuColour.Background)
				end,
			})
			RageUI.Item.List("~g~>~s~  Vert", RGBA, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Background.G = Index
					TriggerEvent("RageUI:Update:Colour:Background", MenuColour.Background)
				end,
			})
			RageUI.Item.List("~b~>~s~  Bleu", RGBA, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Background.B = Index
					TriggerEvent("RageUI:Update:Colour:Background", MenuColour.Background)
				end,
			})
			RageUI.Item.List("~u~>~s~  Opacité", RGBA, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Background.A = Index
					TriggerEvent("RageUI:Update:Colour:Background", MenuColour.Background)
				end,
			})

			RageUI.Item.Separator("Couleur de la sélection")
			RageUI.Item.List("~r~>~s~  Rouge", RGBA, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Selection.R = Index
					TriggerEvent("RageUI:Update:Colour:Selection", MenuColour.Selection)
				end,
			})
			RageUI.Item.List("~g~>~s~  Vert", RGBA, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Selection.G = Index
					TriggerEvent("RageUI:Update:Colour:Selection", MenuColour.Selection)
				end,
			})
			RageUI.Item.List("~b~>~s~  Bleu", RGBA, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Selection.B = Index
					TriggerEvent("RageUI:Update:Colour:Selection", MenuColour.Selection)
				end,
			})
			RageUI.Item.List("~u~>~s~  Opacité", RGBA, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Selection.A = Index
					TriggerEvent("RageUI:Update:Colour:Selection", MenuColour.Selection)
				end,
			})

			RageUI.Item.Separator("Couleur de la description")
			RageUI.Item.List("~r~>~s~  Rouge", RGBA, 1, "Ceci est la déscription.", {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Desc.R = Index
					TriggerEvent("RageUI:Update:Colour:Desc", MenuColour.Desc)
				end,
			})
			RageUI.Item.List("~g~>~s~  Vert", RGBA, 1, "Ceci est la déscription.", {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Desc.G = Index
					TriggerEvent("RageUI:Update:Colour:Desc", MenuColour.Desc)
				end,
			})
			RageUI.Item.List("~b~>~s~  Bleu", RGBA, 1, "Ceci est la déscription.", {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Desc.B = Index
					TriggerEvent("RageUI:Update:Colour:Desc", MenuColour.Desc)
				end,
			})
			RageUI.Item.List("~u~>~s~  Opacité", RGBA, 1, "Ceci est la déscription.", {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Desc.A = Index
					TriggerEvent("RageUI:Update:Colour:Desc", MenuColour.Desc)
				end,
			})
			
			RageUI.Item.Separator("Couleur du texte")
			RageUI.Item.List("~r~>~s~  Rouge", RGBA, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Txt.R = Index
					TriggerEvent("RageUI:Update:Colour:Txt", MenuColour.Txt)
				end,
			})
			RageUI.Item.List("~g~>~s~  Vert", RGBA, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Txt.G = Index
					TriggerEvent("RageUI:Update:Colour:Txt", MenuColour.Txt)
				end,
			})
			RageUI.Item.List("~b~>~s~  Bleu", RGBA, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Txt.B = Index
					TriggerEvent("RageUI:Update:Colour:Txt", MenuColour.Txt)
				end,
			})
			RageUI.Item.List("~u~>~s~  Opacité", RGBA, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Txt.A = Index
					TriggerEvent("RageUI:Update:Colour:Txt", MenuColour.Txt)
				end,
			})
		end)
	end
end