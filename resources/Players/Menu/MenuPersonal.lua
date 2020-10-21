PlyGroup = ""
PlyWeight = ""
MdpPersonal = "Ntm"
invItems, invWeapon, invMoney, invSale, invBank, invJeton = {}, {}, {}, {}, {}, {}
DemarcheList = {"~y~Classique~s~","~y~Arrogante~s~","~y~Blesse~s~","~y~Business~s~","~y~Casual~s~","~y~Choc~s~","~y~Determine~s~","~y~Depressif~s~","~y~Depressif F~s~","~y~Fatigue~s~","~y~Fier~s~","~y~Hobo~s~","~y~Hipster~s~","~y~Intimide~s~","~y~Impertinent~s~","~y~Mangeuse d'homme~s~","~y~Malheureux~s~","~y~Muscle~s~","~y~Petite course~s~","~y~Pressee~s~","~y~Sombre~s~","~y~Trop mange~s~"}
GpsList = {"~y~Supprimer le trajet~s~","~y~Agence d'interim~s~","~y~Auto école~s~","~y~Benny's~s~","~y~Hôpitale's~s~","~y~Parking central~s~","~y~Poste de police~s~"}
VhcDoors = {"~y~Capot~s~","~y~Coffre~s~","~y~Avant gauche~s~","~y~Avant droite~s~","~y~Arrière gauche~s~","~y~Arrière droite~s~","~y~Toutes~s~"}
VhcWindows = {"~y~Avant gauche~s~","~y~Avant droite~s~","~y~Arrière gauche~s~","~y~Arrière droite~s~","~y~Toutes~s~"}
Display, Blip = false, false

RMenu.Add('Personnal', 'Principal', RageUI.CreateMenu("", "", nil, nil, "root_cause", "banner"), true)
RMenu:Get('Personnal', 'Principal'):SetSubtitle("~y~Menu personnel")
RMenu:Get('Personnal', 'Principal'):DisplayGlare(false);

RMenu.Add('Personnal', 'Inventory', RageUI.CreateSubMenu(RMenu:Get('Personnal', 'Principal'), "", ""))
RMenu:Get('Personnal', 'Inventory'):SetSubtitle("~y~Inventaire")
RMenu:Get('Personnal', 'Inventory'):DisplayGlare(false);

RMenu.Add('Personnal', 'Weaponry', RageUI.CreateSubMenu(RMenu:Get('Personnal', 'Principal'), "", ""))
RMenu:Get('Personnal', 'Weaponry'):SetSubtitle("~y~Gestion des armes")
RMenu:Get('Personnal', 'Weaponry'):DisplayGlare(false);

RMenu.Add('Personnal', 'Wallet', RageUI.CreateSubMenu(RMenu:Get('Personnal', 'Principal'), "", ""))
RMenu:Get('Personnal', 'Wallet'):SetSubtitle("~y~Porte-feuille")
RMenu:Get('Personnal', 'Wallet'):DisplayGlare(false);

RMenu.Add('Personnal', 'Vehicle', RageUI.CreateSubMenu(RMenu:Get('Personnal', 'Principal'), "", ""))
RMenu:Get('Personnal', 'Vehicle'):SetSubtitle("~y~Gestion du véhicule")
RMenu:Get('Personnal', 'Vehicle'):DisplayGlare(false);

RMenu.Add('Personnal', 'Divers', RageUI.CreateSubMenu(RMenu:Get('Personnal', 'Principal'), "", ""))
RMenu:Get('Personnal', 'Divers'):SetSubtitle("~y~Divers")
RMenu:Get('Personnal', 'Divers'):DisplayGlare(false);

RMenu.Add('Personnal', 'Clothe', RageUI.CreateSubMenu(RMenu:Get('Personnal', 'Principal'), "", ""))
RMenu:Get('Personnal', 'Clothe'):SetSubtitle("~y~Vêtements")
RMenu:Get('Personnal', 'Clothe'):DisplayGlare(false);

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		if IsControlJustReleased(1, 166) then
			ESX.TriggerServerCallback('getUsergroup', function(Group)
				PlyGroup = Group
				RageUI.Visible(RMenu:Get('Personnal', 'Principal'), not RageUI.Visible(RMenu:Get('Personnal', 'Principal')))
			end)
		end
		if 	RageUI.Visible(RMenu:Get('Personnal', 'Principal')) or 
			RageUI.Visible(RMenu:Get('Personnal', 'Inventory')) or
			RageUI.Visible(RMenu:Get('Personnal', 'Weaponry')) or
			RageUI.Visible(RMenu:Get('Personnal', 'Wallet')) or
			RageUI.Visible(RMenu:Get('Personnal', 'Divers')) or
			RageUI.Visible(RMenu:Get('Personnal', 'Vehicle')) and IsPedSittingInAnyVehicle(PlayerPedId()) or
			RageUI.Visible(RMenu:Get('Personnal', 'Clothe'))
		then
			OpenPersonalMenu()
		end 
	end
end)

function OpenPersonalMenu()
	RageUI.IsVisible(RMenu:Get('Personnal', 'Principal'), function()
		RageUI.Item.Separator("[~y~Votre ID~s~] : "..GetPlayerServerId(PlayerId()))
		RageUI.Item.Separator("[~y~Joueurs connecté~s~] : "..NetworkIsPlayerActive().." / 128")
        RageUI.Item.Button("Inventaire", "", {}, true, {
        	onSelected = function()
				invItems = {}
			    ESX.TriggerServerCallback('getPlayerInventory', function(inventory)
					for i=1, #inventory.items, 1 do
					    local item = inventory.items[i]
					    PlyWeight = item.count * item.weight
					    if item.count > 0 then
					        table.insert(invItems, {label = item.label, count = item.count, type = 'item_standard', value = item.name, usable = item.usable, removable = item.canRemove})
					    end
					end
				end)
			end,
        },RMenu:Get('Personnal', 'Inventory'))
        RageUI.Item.Button("Gestion des armes", "", {}, true, {
        	onSelected = function()
				invWeapon = {}
			    ESX.TriggerServerCallback('getPlayerInventory', function(loadout)
					for i=1, #loadout.weapons, 1 do
					    local weapon = loadout.weapons[i]
						table.insert(invWeapon, {label = ESX.GetWeaponLabel(weapon.name), value = weapon.name, itemType = 'item_weapon', amount = weapon.ammo})
					end
				end)
			end,
        },RMenu:Get('Personnal', 'Weaponry'))
        RageUI.Item.Button("Porte-feuille", "", {}, true, {
        	onSelected = function()
				invMoney = {}
				invSale = {}
				invBank = {}
				invJeton = {}
			    ESX.TriggerServerCallback('getPlayerInventory', function(money)
					for i=1, #money.accounts, 1 do
						if money.accounts[i].name == 'money' and money.accounts[i].money > 0 then
							table.insert(invMoney, {label = "Cash", value = 'money', itemType = 'item_account', amount = money.accounts[i].money})
						end
						if money.accounts[i].name == 'black_money' and money.accounts[i].money > 0 then
							table.insert(invSale, {label = "Sale", value = 'black_money', itemType = 'item_account', amount = money.accounts[i].money})
						end
						if money.accounts[i].name == 'bank' and money.accounts[i].money > 0 then
							table.insert(invBank, {label = "Compte bancaire", value = 'bank', itemType = 'item_account', amount = money.accounts[i].money})
						end
						if money.accounts[i].name == 'jeton' and money.accounts[i].money > 0 then
							table.insert(invJeton, {label = "Diamond's Casino", value = 'jeton', itemType = 'item_account', amount = money.accounts[i].money})
						end
					end
				end)
			end,
        },RMenu:Get('Personnal', 'Wallet'))
	    RageUI.Item.Button("Vêtements", "", {}, true, {
	    	onSelected = function ()
			    ESX.TriggerServerCallback("getAccessoire", function(Acces)
			        Accessoires = Acces
			        RageUI.Visible(RMenu:Get('Personnal', 'Clothe'), not RageUI.Visible(RMenu:Get('Personnal', 'Clothe')))
			    end)
	    	end,
	    })
		RageUI.Item.List("Démarches", DemarcheList, 1, nil, {}, true, {
			onSelected = function(Index, Items)
				if Index == 1 then StartDemarche("move_m@confident")
				elseif Index == 2 then StartDemarche("move_f@arrogant@a")
				elseif Index == 3 then StartDemarche("move_m@injured")
				elseif Index == 4 then StartDemarche("move_m@business@a")
				elseif Index == 5 then StartDemarche("move_m@casual@a")
				elseif Index == 6 then StartDemarche("move_m@shocked@a")
				elseif Index == 7 then StartDemarche("move_m@brave@a")
				elseif Index == 8 then StartDemarche("move_m@depressed@a")
				elseif Index == 9 then StartDemarche("move_f@depressed@a")
				elseif Index == 10 then StartDemarche("move_m@buzzed")
				elseif Index == 11 then StartDemarche("move_m@money")
				elseif Index == 12 then StartDemarche("move_m@hobo@a")
				elseif Index == 13 then StartDemarche("move_m@hipster@a")
				elseif Index == 14 then StartDemarche("move_m@hurry@a")
				elseif Index == 15 then StartDemarche("move_f@sassy")
				elseif Index == 16 then StartDemarche("move_f@maneater")
				elseif Index == 17 then StartDemarche("move_m@sad@a")
				elseif Index == 18 then StartDemarche("move_m@muscle@a")
				elseif Index == 19 then StartDemarche("move_m@quick")
				elseif Index == 20 then StartDemarche("move_m@hurry_butch@a")
				elseif Index == 21 then StartDemarche("move_m@shadyped@a")
				else StartDemarche("move_m@fat@a")
				end
			end,
		})
		RageUI.Item.List("Gps rapide", GpsList, 1, nil, {}, true, {
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
        if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
	        RageUI.Item.Button("Gestion du véhicule", "", {}, true, {
	        },RMenu:Get('Personnal', 'Vehicle'))
        end
	    RageUI.Item.Button("Divers", "", {}, true, {
	    },RMenu:Get('Personnal', 'Divers'))
    end)

	RageUI.IsVisible(RMenu:Get('Personnal', 'Inventory'), function()
	    RageUI.Item.Separator("[~y~"..PlyWeight.."~s~ Kg / ~y~24~s~ Kg]")
	    for _,v in pairs (invItems) do
			RageUI.Item.List("~s~[~y~"..v.label.."~s~] x"..v.count, {"~y~Utiliser~s~","~g~Donner~s~","~r~Jeter~s~"}, 1, nil, {}, true, {
				onSelected = function(Index, Items)
					itemName = v.value
					if Index == 1 then
						if v.removable then
							if v.usable then
								TriggerServerEvent('UseItem', MdpPersonal, itemName)
								RageUI.GoBack()
							else
								ESX.ShowNotification("Cette objet n'est pas utilisable")
							end
						else
							ESX.ShowNotification("Vous ne pouvez pas effectuez cette action")
						end
					elseif Index == 2 then
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestDistance ~= -1 and closestDistance <= 3 then
							local closestPed = GetPlayerPed(closestPlayer)
							local QuantiteToGive = KeyboardInput("Quantité", 20)
							if tonumber(QuantiteToGive) ~= nil then
								if tonumber(QuantiteToGive) <= v.count then
									TriggerServerEvent('GiveItem', GetPlayerServerId(closestPlayer), MdpPersonal, itemName, tonumber(QuantiteToGive))
									RageUI.GoBack()
								else
									ESX.ShowNotification("Quantité invalide.")
								end
							end
						else
							ESX.ShowNotification('Il n\'y a personne aux alentours.')
						end
					else
						if v.removable then
							local QuantiteToTrash = KeyboardInput("Quantité", 20)
							if tonumber(QuantiteToTrash) ~= nil then
								if tonumber(QuantiteToTrash) <= v.count then
									TriggerServerEvent('RemoveItem', MdpPersonal, itemName, tonumber(QuantiteToTrash))
									RageUI.GoBack()
								else
									ESX.ShowNotification("Quantité invalide.")
								end
							end
						else
							ESX.ShowNotification("Vous ne pouvez pas effectuez cette action")
						end
					end
				end,
			})
	    end
    end)

	RageUI.IsVisible(RMenu:Get('Personnal', 'Clothe'), function()
		Result = Accessoires
       	for i = 1, #Result, 1 do
	        RageUI.Item.List("~s~[~y~"..Result[i].Label.."~s~]", {"~y~Equiper~s~","~y~Enlever~s~","~y~Renommer~s~","~g~Donner~s~","~r~Jeter~s~"}, 1, nil, {}, true, {
				onSelected = function(Index, Items)
					Acces = json.decode(Result[i].Stuff)
					PlyPed = GetPlayerPed(-1)
                    First = Acces.Index
                    Second = Acces.Color
                    Type = Result[i].Type
	                Label = Result[i].Label
	                Id = Result[i].Id
	                Resulta = Result[i]
	                if Index == 1 then
	                	AccessoiresOn(Type, First, Second)
	                elseif Index == 2 then
	                	AccessoiresOff(Type)
	                elseif Index == 3 then
	                	NewLabel = KeyboardInput("Nouveau nom", 20)
	                	if NewLabel ~= nil then
		                	TriggerServerEvent('RenameAcc', MdpPersonal, Id, NewLabel)
	                        RageUI.GoBack()
		                else
		                	ESX.ShowNotification("Usage invalide.")
		                end
		            elseif Index == 4 then
		            	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        local closestPed = GetPlayerPed(closestPlayer)

                        if closestPlayer ~= -1 and closestDistance < 3.0 then
                            TriggerServerEvent('GiveAcc', MdpPersonal, GetPlayerServerId(closestPlayer), Id)
	                        RageUI.GoBack()
                        else
                            ESX.ShowNotification("Aucun joueurs aux alentours.")
                        end
                    else
                        TriggerServerEvent('DelAcc', MdpPersonal, Id)
	                    RageUI.GoBack()
		            end
				end,
			})
        end
    end)

	RageUI.IsVisible(RMenu:Get('Personnal', 'Weaponry'), function()
	    for _,v in pairs (invWeapon) do
			RageUI.Item.List("~s~[~y~"..v.label.."~s~] x"..v.amount, {"~g~Donner~s~","~r~Jeter~s~"}, 1, nil, {}, true, {
				onSelected = function(Index, Items)
					if Index == 1 then
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestDistance ~= -1 and closestDistance <= 3 then
							TriggerServerEvent('GiveWeapon', GetPlayerServerId(closestDistance), MdpPersonal, v.label, v.value, v.amount)
							RageUI.GoBack()
						else
							ESX.ShowNotification('Il n\'y a personne aux alentours.')
						end
					else
						TriggerServerEvent('RemoveWeapon', MdpPersonal, v.value, v.amount)
						RageUI.GoBack()
					end
				end,
			})
	    end
    end)

	RageUI.IsVisible(RMenu:Get('Personnal', 'Wallet'), function()
	    RageUI.Item.Separator("[~y~Métier~s~] : "..ESX.PlayerData.job.label.." [~y~Grade~s~] : "..ESX.PlayerData.job.grade_label)
	    for _,v in pairs (invBank) do
		    RageUI.Item.Separator("[~y~"..v.label.."~s~] : "..v.amount.." $")
		end
	    for _,v in pairs (invMoney) do
			RageUI.Item.List("	~s~[~y~"..v.label.."~s~] : "..v.amount.." $", {"~g~Donner~s~","~r~Jeter~s~"}, 1, nil, {}, true, {
				onSelected = function(Index, Items)
					local Amount = KeyboardInput("Quantité", 20)
					if tonumber(Amount) ~= nil then
						if tonumber(Amount) <= v.amount then
							if Index == 1 then
								local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
								if closestDistance ~= -1 and closestDistance <= 3 then
									TriggerServerEvent('GiveMoney', GetPlayerServerId(closestDistance), MdpPersonal, v.value, tonumber(Amount))
									RageUI.GoBack()
								else
									ESX.ShowNotification('Il n\'y a personne aux alentours.')
								end
							else
								TriggerServerEvent('RemoveMoney', MdpPersonal, v.value, tonumber(Amount))
								RageUI.GoBack()
							end
						else
							ESX.ShowNotification("Quantité invalide.")
						end
					else
						ESX.ShowNotification("Mauvaise utilisation.")
					end
				end,
			})
	    end
	    for _,v in pairs (invJeton) do
			RageUI.Item.List("	~s~[~y~"..v.label.."~s~] : "..v.amount.." jetons", {"~g~Donner~s~","~r~Jeter~s~"}, 1, nil, {}, true, {
				onSelected = function(Index, Items)
					local Amount = KeyboardInput("Quantité", 20)
					if tonumber(Amount) ~= nil then
						if tonumber(Amount) <= v.amount then
							if Index == 1 then
								local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
								if closestDistance ~= -1 and closestDistance <= 3 then
									TriggerServerEvent('GiveMoney', GetPlayerServerId(closestDistance), MdpPersonal, v.value, tonumber(Amount))
									RageUI.GoBack()
								else
									ESX.ShowNotification('Il n\'y a personne aux alentours.')
								end
							else
								TriggerServerEvent('RemoveMoney', MdpPersonal, v.value, tonumber(Amount))
								RageUI.GoBack()
							end
						else
							ESX.ShowNotification("Quantité invalide.")
						end
					else
						ESX.ShowNotification("Mauvaise utilisation.")
					end
				end,
			})
	    end
	    for _,v in pairs (invSale) do
			RageUI.Item.List("	~s~[~y~"..v.label.."~s~] : "..v.amount.." $", {"~g~Donner~s~","~r~Jeter~s~"}, 1, nil, {}, true, {
				onSelected = function(Index, Items)
					local Amount = KeyboardInput("Quantité", 20)
					if tonumber(Amount) ~= nil then
						if tonumber(Amount) <= v.amount then
							if Index == 1 then
								local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
								if closestDistance ~= -1 and closestDistance <= 3 then
									TriggerServerEvent('GiveMoney', GetPlayerServerId(closestDistance), MdpPersonal, v.value, tonumber(Amount))
									RageUI.GoBack()
								else
									ESX.ShowNotification('Il n\'y a personne aux alentours.')
								end
							else
								TriggerServerEvent('RemoveMoney', MdpPersonal, v.value, tonumber(Amount))
								RageUI.GoBack()
							end
						else
							ESX.ShowNotification("Quantité invalide.")
						end
					else
						ESX.ShowNotification("Mauvaise utilisation.")
					end
				end,
			})
	    end
    end)

	RageUI.IsVisible(RMenu:Get('Personnal', 'Vehicle'), function()
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
	    if CarModel then RageUI.Item.Separator("[~y~Modèle~s~] : "..CarModel) end
	    if CarHealth then RageUI.Item.Separator("[~y~Etat du véhicule~s~] : "..CarHealth.."%") end
	    if CarPlate then RageUI.Item.Separator("[~y~Plaque d'immatriculation~s~] : "..CarPlate) end
		RageUI.Item.Checkbox("~s~	[~y~Limiteur de vitesse~s~] : "..LimitateurState, "", Limitateur, {}, {
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
		RageUI.Item.Checkbox("~s~	[~y~Etat moteur~s~] : "..Engine, "", EngineState, {}, {
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
		RageUI.Item.List("	~s~[~y~Ouvrir une porte~s~]", VhcDoors, 1, nil, {}, true, {
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
		RageUI.Item.List("	~s~[~y~Fermer une porte~s~]", VhcDoors, 1, nil, {}, true, {
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
		RageUI.Item.List("	~s~[~y~Ouvrir une fenêtre~s~]", VhcWindows, 1, nil, {}, true, {
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
		RageUI.Item.List("	~s~[~y~Fermer une fenêtre~s~]", VhcWindows, 1, nil, {}, true, {
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

	RageUI.IsVisible(RMenu:Get('Personnal', 'Divers'), function()
		RageUI.Item.Checkbox("[~y~Afficher/Cacher HUD~s~]", "", false, {}, {
			onSelected = function(Index)
				if not Display then
					Annee, Mois, Jour, Heure, Minute, Seconde = GetLocalTime()
			        SendNUIMessage({
			        	Display = true,
			        	ServId = "Votre ID : "..GetPlayerServerId(PlayerId()),
						DateTime = "Date : "..Jour.."/"..Mois.."/"..Annee.." Heure : "..Heure + 2 ..":"..Minute,
						Hunger = PlyStatut.Hunger,
						Thrist = PlyStatut.Thrist
			        })
			        DisplayRadar(false)
			        HudHiden = true
			        Display = true
			    else
					Annee, Mois, Jour, Heure, Minute, Seconde = GetLocalTime()
			        SendNUIMessage({
			        	Display = false,
			        	ServId = "Votre ID : "..GetPlayerServerId(PlayerId()),
						DateTime = "Date : "..Jour.."/"..Mois.."/"..Annee.." Heure : "..Heure + 2 ..":"..Minute,
						Hunger = PlyStatut.Hunger,
						Thrist = PlyStatut.Thrist
			        })
			        DisplayRadar(true)
			        HudHiden = false
			        Display = false
			    end
			end,
		})
		RageUI.Item.Checkbox("[~y~Afficher/Cacher blips~s~]", "", true, {}, {
			onSelected = function(Index)
				if not Blip then
			    	TriggerEvent('DeleteAllBlip')
			    	Blip = true
			    else
					TriggerEvent('ShowAllBlip')
			        Blip = false
			    end
			end,
		})
    end)
end