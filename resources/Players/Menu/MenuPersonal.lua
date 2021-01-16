PlyGroup = ""
PlyWeight = ""
MdpPersonal = "Ntm"
invItems, invWeapon, invMoney, invSale, invBank, invJeton, PlySim = {}, {}, {}, {}, {}, {}, {}
DemarcheList = {"Classique","Arrogante","Blesse","Business","Casual","Choc","Determine","Depressif","Depressif F","Fatigue","Fier","Hobo","Hipster","Intimide","Impertinent","Mangeuse d'homme","Malheureux","Muscle","Petite course","Pressee","Sombre","Trop mange"}
GpsList = {"Supprimer le trajet","Agence d'interim","Auto école","Benny's","Hôpitale's","Parking central","Poste de police"}
VhcDoors = {"Capot","Coffre","Avant gauche","Avant droite","Arrière gauche","Arrière droite","Toutes"}
VhcWindows = {"Avant gauche","Avant droite","Arrière gauche","Arrière droite","Toutes"}
Display, Blip = false, false
MenuColour = {
	Banner = {
		R = 13,
		G = 24,
		B = 33,
		A = 255,
    },
    Background = {
        R = 13,
        G = 24,
        B = 33,
        A = 200,
    },
	Selection = {
		R = 123,
		G = 137,
		B = 138,
		A = 125,
	},
	Desc = {
		R = 13,
		G = 24,
		B = 33,
		A = 150,
	},
	Txt = {
		R = 191,
		G = 204,
		B = 148,
		A = 255,
	},
}
MenuFont = {
	Txt = 6,
	Title = 6,
	SubTitle = 6,
	Desc = 6,
}

RMenu.Add('Personnal', 'Principal', RageUI.CreateMenu("", "Menu personnel", nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Personnal', 'Principal'):DisplayGlare(false);
RMenu:Get('Personnal', 'Principal').Closed = function()
	InMenu = false
	RageUI.CloseAll()
end

RMenu.Add('Personnal', 'Inventory', RageUI.CreateSubMenu(RMenu:Get('Personnal', 'Principal'), "", "Inventaire"))
RMenu:Get('Personnal', 'Inventory'):DisplayGlare(false);

RMenu.Add('Personnal', 'Weaponry', RageUI.CreateSubMenu(RMenu:Get('Personnal', 'Principal'), "", "Gestion des armes"))
RMenu:Get('Personnal', 'Weaponry'):DisplayGlare(false);

RMenu.Add('Personnal', 'Wallet', RageUI.CreateSubMenu(RMenu:Get('Personnal', 'Principal'), "", "Porte-feuille"))
RMenu:Get('Personnal', 'Wallet'):DisplayGlare(false);

RMenu.Add('Personnal', 'SimCard', RageUI.CreateSubMenu(RMenu:Get('Personnal', 'Principal'), "", "Cartes sims"))
RMenu:Get('Personnal', 'SimCard'):DisplayGlare(false);

RMenu.Add('Personnal', 'Vehicle', RageUI.CreateSubMenu(RMenu:Get('Personnal', 'Principal'), "", "Gestion du véhicule"))
RMenu:Get('Personnal', 'Vehicle'):DisplayGlare(false);

RMenu.Add('Personnal', 'Clothe', RageUI.CreateSubMenu(RMenu:Get('Personnal', 'Principal'), "", "Vêtements"))
RMenu:Get('Personnal', 'Clothe'):DisplayGlare(false);

RMenu.Add('Personnal', 'Animations', RageUI.CreateSubMenu(RMenu:Get('Personnal', 'Principal'), "", "Animations"))
RMenu:Get('Personnal', 'Animations'):DisplayGlare(false);

RMenu.Add('Personnal', 'AnimList', RageUI.CreateSubMenu(RMenu:Get('Personnal', 'Animations'), "", "Animations disponnible"))
RMenu:Get('Personnal', 'AnimList'):DisplayGlare(false);

RMenu.Add('Personnal', 'Divers', RageUI.CreateSubMenu(RMenu:Get('Personnal', 'Principal'), "", "Réglages"))
RMenu:Get('Personnal', 'Divers'):DisplayGlare(false);

RMenu.Add('Personnal', 'Divers_Menu', RageUI.CreateSubMenu(RMenu:Get('Personnal', 'Divers'), "", "Réglages menu"))
RMenu:Get('Personnal', 'Divers_Menu'):DisplayGlare(false);

RMenu.Add('Personnal', 'Divers_Menu_Colour', RageUI.CreateSubMenu(RMenu:Get('Personnal', 'Divers_Menu'), "", "Couleur menu"))
RMenu:Get('Personnal', 'Divers_Menu_Colour'):DisplayGlare(false);

RMenu.Add('Personnal', 'Divers_Menu_Colour_Title', RageUI.CreateSubMenu(RMenu:Get('Personnal', 'Divers_Menu_Colour'), "", "Couleur titre"))
RMenu:Get('Personnal', 'Divers_Menu_Colour_Title'):DisplayGlare(false);

RMenu.Add('Personnal', 'Divers_Menu_Colour_Bgd', RageUI.CreateSubMenu(RMenu:Get('Personnal', 'Divers_Menu_Colour'), "", "Couleur background"))
RMenu:Get('Personnal', 'Divers_Menu_Colour_Bgd'):DisplayGlare(false);

RMenu.Add('Personnal', 'Divers_Menu_Colour_Nav', RageUI.CreateSubMenu(RMenu:Get('Personnal', 'Divers_Menu_Colour'), "", "Couleur selection"))
RMenu:Get('Personnal', 'Divers_Menu_Colour_Nav'):DisplayGlare(false);

RMenu.Add('Personnal', 'Divers_Menu_Colour_Txt', RageUI.CreateSubMenu(RMenu:Get('Personnal', 'Divers_Menu_Colour'), "", "Couleur texte"))
RMenu:Get('Personnal', 'Divers_Menu_Colour_Txt'):DisplayGlare(false);

RMenu.Add('Personnal', 'Divers_Menu_Style', RageUI.CreateSubMenu(RMenu:Get('Personnal', 'Divers_Menu'), "", "Style menu"))
RMenu:Get('Personnal', 'Divers_Menu_Style'):DisplayGlare(false);

RegisterCommand('OpenPersonal', function()
	if not InMenu then
		OpenPersonalMenu()
	else
		InMenu = false
		RageUI.CloseAll()
	end
end, false)

RegisterKeyMapping('OpenPersonal', 'Menu personnel', 'keyboard', 'F5')

CrtAnimCat = {}
CrtAnimFunc = nil

function OpenPersonalMenu()
	InMenu = true
	RageUI.Visible(RMenu:Get('Personnal', 'Principal'), not RageUI.Visible(RMenu:Get('Personnal', 'Principal')))
	while InMenu do
		Citizen.Wait(0)

		RageUI.IsVisible(RMenu:Get('Personnal', 'Principal'), function()
			RageUI.Item.Separator("[Votre ID] : "..GetPlayerServerId(PlayerId()))
			RageUI.Item.Button("Inventaire", "Vous y trouverez tout ce que vous avez dans les poches.", {RightLabel = "→→→"}, true, {
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
			RageUI.Item.Button("Gestion des armes", "Vos armes, a ne pas utiliser n'importe comment.", {RightLabel = "→→→"}, true, {
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
			RageUI.Item.Button("Porte-feuille", "Vous y trouverez vos informations personnel et votre argent.", {RightLabel = "→→→"}, true, {
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
						end
					end)
				end,
			},RMenu:Get('Personnal', 'Wallet'))
			RageUI.Item.Button("Vêtements", "Si vous achetez des vêtements vous les trouverez ici.", {RightLabel = "→→→"}, true, {
				onSelected = function ()
					ESX.TriggerServerCallback("getAccessoire", function(Acces)
						Accessoires = Acces
						RageUI.Visible(RMenu:Get('Personnal', 'Clothe'), not RageUI.Visible(RMenu:Get('Personnal', 'Clothe')))
					end)
				end,
			})
			RageUI.Item.Button("Mes cartes sim", "Vous serviras à mener une double vie.", {RightLabel = "→→→"}, true, {
				onSelected = function ()
					PlySim = {}
					ESX.TriggerServerCallback("esx_cartesim:GetList", function(Data)
						for _,v in pairs(Data) do
							table.insert(PlySim, {label = tostring(v.number), value = v})
						end
					end)
				end,
			},RMenu:Get('Personnal', 'SimCard'))
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
			RageUI.Item.Button("Animations", "Differents animations, afin d'ambiancer vos scènes.", {RightLabel = "→→→"}, true, {
			},RMenu:Get('Personnal', 'Animations'))
			if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
				RageUI.Item.Button("Gestion du véhicule", "Interaction avec votre véhicule.", {RightLabel = "→→→"}, true, {
				},RMenu:Get('Personnal', 'Vehicle'))
			end
			RageUI.Item.Button("Réglages divers", "Différents réglages afin de personnalisé sont experience de jeux.", {RightLabel = "→→→"}, true, {
			},RMenu:Get('Personnal', 'Divers'))
		end)
	
		RageUI.IsVisible(RMenu:Get('Personnal', 'Inventory'), function()
			RageUI.Item.Separator("["..PlyWeight.." Kg / 24 Kg]")
			for _,v in pairs (invItems) do
				RageUI.Item.List("["..v.label.."] x"..v.count, {"~o~Utiliser~s~","~g~Donner~s~","~r~Jeter~s~"}, 1, nil, {}, true, {
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
		
		RageUI.IsVisible(RMenu:Get('Personnal', 'SimCard'), function()
			RageUI.Item.Button("Actualiser le téléphone", nil, {RightLabel = "→→→"}, true, {
				onSelected = function(Index, Items)
					TriggerServerEvent('gcPhone:allUpdate')
				end,
			})
			for _,v in pairs (PlySim) do
				RageUI.Item.List("["..v.label.."]", {"~o~Utiliser~s~","~g~Donner~s~","~r~Jeter~s~"}, v.Index or 1, nil, {}, true, {
					onSelected = function(Index, Items)
						itemName = v.value
						if Index == 1 then
							TriggerServerEvent('esx_cartesim:sim_use', v.value.number)
							ESX.ShowNotification("Vous avez ~g~activé la carte SIM avec le numéro : ~p~" .. v.value.number)
							Citizen.Wait(1000)
							TriggerServerEvent('gcPhone:allUpdate')
						elseif Index == 2 then
							local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
							if closestPlayer == -1 or closestDistance > 3.0 then
								ESX.ShowNotification('~r~Aucun joueur à proximité !')
							else
								TriggerServerEvent('esx_cartesim:sim_give', v.value.number, GetPlayerServerId(closestPlayer))
							end
							Citizen.Wait(1000)
							TriggerServerEvent('gcPhone:allUpdate')
						else
							TriggerServerEvent('esx_cartesim:sim_delete', v.value.number)
							ESX.ShowNotification("Vous avez ~r~jeté la carte SIM avec le numéro : ~p~" .. v.value.number)
							Citizen.Wait(1000)
							TriggerServerEvent('gcPhone:allUpdate')
						end
					end,
				})
			end
		end)
	
		RageUI.IsVisible(RMenu:Get('Personnal', 'Clothe'), function()
			Result = Accessoires
			   for i = 1, #Result, 1 do
				RageUI.Item.List("["..Result[i].Label.."]", {"~o~Equiper~s~","~o~Enlever~s~","~o~Renommer~s~","~g~Donner~s~","~r~Jeter~s~"}, 1, nil, {}, true, {
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
				RageUI.Item.List("["..v.label.."]", {"~g~Donner~s~","~r~Jeter~s~"}, 1, nil, {}, true, {
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
			RageUI.Item.Separator("[Métier] : "..PlayerData.job.label.." [Grade] : "..PlayerData.job.grade_label)
			if ESX.PlayerData.job2.name ~= "unemployed2" then
				RageUI.Item.Separator("[Métier] : "..PlayerData.job2.label.." [Grade] : "..PlayerData.job2.grade_label)
			end
			for _,v in pairs (invBank) do
				RageUI.Item.Separator("["..v.label.."] : "..v.amount.." $")
			end
			for _,v in pairs (invMoney) do
				RageUI.Item.List("["..v.label.."] : ~g~"..v.amount.." $~s~", {"~g~Donner~s~","~r~Jeter~s~"}, 1, nil, {}, true, {
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
				RageUI.Item.List("["..v.label.."] : ~o~"..v.amount.." jetons~s~", {"~g~Donner~s~","~r~Jeter~s~"}, 1, nil, {}, true, {
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
				RageUI.Item.List("["..v.label.."] : ~r~"..v.amount.." $~s~", {"~g~Donner~s~","~r~Jeter~s~"}, 1, nil, {}, true, {
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
			if CarModel then RageUI.Item.Separator("[Modèle] : "..CarModel) end
			if CarHealth then RageUI.Item.Separator("[Etat du véhicule] : "..CarHealth.."%") end
			if CarPlate then RageUI.Item.Separator("[Plaque d'immatriculation] : "..CarPlate) end
			RageUI.Item.Checkbox("[Limiteur de vitesse] : "..LimitateurState, "", Limitateur, {}, {
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
			RageUI.Item.Checkbox("[Etat moteur] : "..Engine, "", EngineState, {}, {
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
			RageUI.Item.List("[Ouvrir une porte]", VhcDoors, 1, nil, {}, true, {
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
			RageUI.Item.List("[Fermer une porte]", VhcDoors, 1, nil, {}, true, {
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
			RageUI.Item.List("[Ouvrir une fenêtre]", VhcWindows, 1, nil, {}, true, {
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
			RageUI.Item.List("[Fermer une fenêtre]", VhcWindows, 1, nil, {}, true, {
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

		RageUI.IsVisible(RMenu:Get('Personnal', 'Animations'), function()
			RageUI.Item.List("Humeur", AnimList.Expressions, 1, nil, {}, true, {
				onSelected = function(Index, Items)
					SetFacialIdleAnimOverride(PlayerPedId(), Items.Value, 0)
				end,
			})
			RageUI.Item.List("Démarche", AnimList.Demarches, 1, nil, {}, true, {
				onSelected = function(Index, Items)
					StartDemarche(Items.Value)
				end,
			})
			for _,v in pairs (AnimList.List) do 
				RageUI.Item.Button(v.Label, nil, {}, true, {
					onSelected = function(Index, Items)
						CrtAnimCat = v.Table
						CrtAnimFunc = _
					end,
				},RMenu:Get('Personnal', 'AnimList'))
			end
		end)

		RageUI.IsVisible(RMenu:Get('Personnal', 'AnimList'), function()
			for _,v in pairs (CrtAnimCat) do
				RageUI.Item.Button(v[3], nil, {}, true, {
					onSelected = function(Index, Items)
						OnEmotePlay(v[1], v[2], v.AnimationOptions)
					end,
				})
			end
		end)

		RageUI.IsVisible(RMenu:Get('Personnal', 'Divers'), function()
			RageUI.Item.Button("Modifier le menu", "Réglage du design des menu.", {}, true, {
				onSelected = function(Index, Items)
				end,
			},RMenu:Get('Personnal', 'Divers_Menu'))
			RageUI.Item.Button("Réinitialiser le menu", "Réinitialiser les réglages du menu.", {}, true, {
				onSelected = function(Index, Items)
					TriggerEvent("RageUI:Reset:Setting")
				end,
			})
			RageUI.Item.Button("Sauvegarder le menu", "Sauvegarder les réglages actuel du menu.", {}, true, {
				onSelected = function(Index, Items)
					TriggerEvent("RageUI:Save:Setting")
					ESX.ShowNotification("La template à était sauvegarder.")
				end,
			})
		end)

		RageUI.IsVisible(RMenu:Get('Personnal', 'Divers_Menu'), function()
			RageUI.Item.List("Thèmes", {
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
			RageUI.Item.Button("Personnalisé", "Choix de la couleur des menu.", {}, true, {
				onSelected = function(Index, Items)
				end,
			},RMenu:Get('Personnal', 'Divers_Menu_Colour'))
			RageUI.Item.Button("Style", "Choix du style des menu.", {}, true, {
				onSelected = function(Index, Items)
				end,
			},RMenu:Get('Personnal', 'Divers_Menu_Style'))
		end)

		RageUI.IsVisible(RMenu:Get('Personnal', 'Divers_Menu_Style'), function()
			IndexBis = nil
			Font = {
				{Name = "ChaletLondon", Value = 0},
				{Name = "HouseScript", Value = 1},
				{Name = "Monospace", Value = 2},
				{Name = "CharletColonge", Value = 4},
				{Name = "Pricedown", Value = 7},
			}
			RageUI.Item.Separator("Titre")
			RageUI.Item.List("Choix de la police", Font, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					IndexBis = Index
					MenuFont.Title = Items.Value
					TriggerEvent("RageUI:Update:Style:Title", Items.Value)
				end,
			})
			RageUI.Item.Separator("Sous titre")
			RageUI.Item.List("Choix de la police", Font, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					IndexBis = Index
					MenuFont.SubTitle = Items.Value
					TriggerEvent("RageUI:Update:Style:SubTitle", Items.Value)
				end,
			})
			RageUI.Item.Separator("Description")
			RageUI.Item.List("Choix de la police", Font, 1, "Ceci est la déscription.", {}, true, {
				onListChange = function(Index, Items)
					IndexBis = Index
					MenuFont.Desc = Items.Value
					TriggerEvent("RageUI:Update:Style:Desc", Items.Value)
				end,
			})
			RageUI.Item.Separator("Autres")
			RageUI.Item.List("Choix de la police", Font, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuFont.Txt = Items.Value
					TriggerEvent("RageUI:Update:Style:Txt", Items.Value)
				end,
			})
		end)

		RageUI.IsVisible(RMenu:Get('Personnal', 'Divers_Menu_Colour'), function()
			RGBA = {}
			for i = 1 , 255 ,1 do
				RGBA[i] = i
			end
			RageUI.Item.Separator("Couleur de la bannière")
			RageUI.Item.List("Rouge", RGBA, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Banner.R = Index
					TriggerEvent("RageUI:Update:Colour:Banner", MenuColour.Banner)
				end,
			})
			RageUI.Item.List("Vert", RGBA, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Banner.G = Index
					TriggerEvent("RageUI:Update:Colour:Banner", MenuColour.Banner)
				end,
			})
			RageUI.Item.List("Bleu", RGBA, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Banner.B = Index
					TriggerEvent("RageUI:Update:Colour:Banner", MenuColour.Banner)
				end,
			})
			RageUI.Item.List("Opacité", RGBA, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Banner.A = Index
					TriggerEvent("RageUI:Update:Colour:Banner", MenuColour.Banner)
				end,
			})

			RageUI.Item.Separator("Couleur du background")
			RageUI.Item.List("Rouge", RGBA, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Background.R = Index
					TriggerEvent("RageUI:Update:Colour:Background", MenuColour.Background)
				end,
			})
			RageUI.Item.List("Vert", RGBA, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Background.G = Index
					TriggerEvent("RageUI:Update:Colour:Background", MenuColour.Background)
				end,
			})
			RageUI.Item.List("Bleu", RGBA, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Background.B = Index
					TriggerEvent("RageUI:Update:Colour:Background", MenuColour.Background)
				end,
			})
			RageUI.Item.List("Opacité", RGBA, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Background.A = Index
					TriggerEvent("RageUI:Update:Colour:Background", MenuColour.Background)
				end,
			})

			RageUI.Item.Separator("Couleur de la sélection")
			RageUI.Item.List("Rouge", RGBA, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Selection.R = Index
					TriggerEvent("RageUI:Update:Colour:Selection", MenuColour.Selection)
				end,
			})
			RageUI.Item.List("Vert", RGBA, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Selection.G = Index
					TriggerEvent("RageUI:Update:Colour:Selection", MenuColour.Selection)
				end,
			})
			RageUI.Item.List("Bleu", RGBA, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Selection.B = Index
					TriggerEvent("RageUI:Update:Colour:Selection", MenuColour.Selection)
				end,
			})
			RageUI.Item.List("Opacité", RGBA, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Selection.A = Index
					TriggerEvent("RageUI:Update:Colour:Selection", MenuColour.Selection)
				end,
			})

			RageUI.Item.Separator("Couleur de la description")
			RageUI.Item.List("Rouge", RGBA, 1, "Ceci est la déscription.", {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Desc.R = Index
					TriggerEvent("RageUI:Update:Colour:Desc", MenuColour.Desc)
				end,
			})
			RageUI.Item.List("Vert", RGBA, 1, "Ceci est la déscription.", {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Desc.G = Index
					TriggerEvent("RageUI:Update:Colour:Desc", MenuColour.Desc)
				end,
			})
			RageUI.Item.List("Bleu", RGBA, 1, "Ceci est la déscription.", {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Desc.B = Index
					TriggerEvent("RageUI:Update:Colour:Desc", MenuColour.Desc)
				end,
			})
			RageUI.Item.List("Opacité", RGBA, 1, "Ceci est la déscription.", {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Desc.A = Index
					TriggerEvent("RageUI:Update:Colour:Desc", MenuColour.Desc)
				end,
			})
			
			RageUI.Item.Separator("Couleur du texte")
			RageUI.Item.List("Rouge", RGBA, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Txt.R = Index
					TriggerEvent("RageUI:Update:Colour:Txt", MenuColour.Txt)
				end,
			})
			RageUI.Item.List("Vert", RGBA, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Txt.G = Index
					TriggerEvent("RageUI:Update:Colour:Txt", MenuColour.Txt)
				end,
			})
			RageUI.Item.List("Bleu", RGBA, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Txt.B = Index
					TriggerEvent("RageUI:Update:Colour:Txt", MenuColour.Txt)
				end,
			})
			RageUI.Item.List("Opacité", RGBA, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					MenuColour.Txt.A = Index
					TriggerEvent("RageUI:Update:Colour:Txt", MenuColour.Txt)
				end,
			})
		end)
	end
end