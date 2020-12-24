RMenu.Add('Job', 'Interim', RageUI.CreateMenu("", "Missions disponnible", nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Job', 'Interim'):DisplayGlare(false);
RMenu:Get('Job', 'Interim').Closable = false;

RMenu.Add('Job', 'Ouvrier', RageUI.CreateMenu("", "Prise de service", nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Job', 'Ouvrier'):DisplayGlare(false);
RMenu:Get('Job', 'Ouvrier').Closable = false;

RMenu.Add('Job', 'Pêcheur', RageUI.CreateMenu("", "Prise de service", nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Job', 'Pêcheur'):DisplayGlare(false);
RMenu:Get('Job', 'Pêcheur').Closable = false;

RMenu.Add('Job', 'Fermier', RageUI.CreateMenu("", "Prise de service", nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Job', 'Fermier'):DisplayGlare(false);
RMenu:Get('Job', 'Fermier').Closable = false;

RMenu.Add('Job', 'Chest', RageUI.CreateMenu("", "Coffre", nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Job', 'Chest'):DisplayGlare(false);
RMenu:Get('Job', 'Chest').Closable = false;

RMenu.Add('Job', 'Chest_Item_Ply', RageUI.CreateSubMenu(RMenu:Get('Job', 'Chest'), "", "Inventaire"))
RMenu:Get('Job', 'Chest_Item_Ply'):DisplayGlare(false);

RMenu.Add('Job', 'Chest_Item_Sct', RageUI.CreateSubMenu(RMenu:Get('Job', 'Chest'), "", "Coffre"))
RMenu:Get('Job', 'Chest_Item_Sct'):DisplayGlare(false);

RMenu.Add('Job', 'Shop', RageUI.CreateMenu("", "Fournisseur", nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Job', 'Shop'):DisplayGlare(false);
RMenu:Get('Job', 'Shop').Closable = false;

RMenu.Add('Job', 'Garage', RageUI.CreateMenu("", "Garage", nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Job', 'Garage'):DisplayGlare(false);
RMenu:Get('Job', 'Garage').Closable = false;

RMenu.Add('Job', 'Cloackroom', RageUI.CreateMenu("", "Vestiaire", nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Job', 'Cloackroom'):DisplayGlare(false);
RMenu:Get('Job', 'Cloackroom').Closable = false;

RMenu.Add('Job', 'Stand', RageUI.CreateMenu("", "Stand", nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Job', 'Stand'):DisplayGlare(false);
RMenu:Get('Job', 'Stand').Closable = false;

RMenu.Add('Job', 'Stand_Custom', RageUI.CreateSubMenu(RMenu:Get('Job', 'Stand'), "", "Estéthique"))
RMenu:Get('Job', 'Stand_Custom'):DisplayGlare(false);

RMenu.Add('Job', 'Stand_Color', RageUI.CreateSubMenu(RMenu:Get('Job', 'Stand_Custom'), "", "Estéthique"))
RMenu:Get('Job', 'Stand_Color'):DisplayGlare(false);

RMenu.Add('Job', 'Stand_Wheels', RageUI.CreateSubMenu(RMenu:Get('Job', 'Stand_Custom'), "", "Roues"))
RMenu:Get('Job', 'Stand_Wheels'):DisplayGlare(false);

RMenu.Add('Job', 'Wheels_Color', RageUI.CreateSubMenu(RMenu:Get('Job', 'Stand_Wheels'), "", "Roues"))
RMenu:Get('Job', 'Wheels_Color'):DisplayGlare(false);

RMenu.Add('Job', 'Wheels_Found', RageUI.CreateSubMenu(RMenu:Get('Job', 'Stand_Wheels'), "", "Articles disponnible"))
RMenu:Get('Job', 'Wheels_Found'):DisplayGlare(false);

RMenu.Add('Job', 'Primary_Color', RageUI.CreateSubMenu(RMenu:Get('Job', 'Stand_Color'), "", "Couleur principale"))
RMenu:Get('Job', 'Primary_Color'):DisplayGlare(false);

RMenu.Add('Job', 'Secondary_Color', RageUI.CreateSubMenu(RMenu:Get('Job', 'Stand_Color'), "", "Couleur secondaire"))
RMenu:Get('Job', 'Secondary_Color'):DisplayGlare(false);

RMenu.Add('Job', 'Pearless_Color', RageUI.CreateSubMenu(RMenu:Get('Job', 'Stand_Color'), "", "Nacrage"))
RMenu:Get('Job', 'Pearless_Color'):DisplayGlare(false);

RMenu.Add('Job', 'Stand_Perfs', RageUI.CreateSubMenu(RMenu:Get('Job', 'Stand'), "", "Performance"))
RMenu:Get('Job', 'Stand_Perfs'):DisplayGlare(false);

RMenu.Add('Job', 'Crafting', RageUI.CreateMenu("", "Plan de travail", nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Job', 'Crafting'):DisplayGlare(false);
RMenu:Get('Job', 'Crafting').Closable = false;

function ShowMenu(Type)
		if Type == "Interim" then
			if PlayerData.job.name == "unemployed" then
				RageUI.Visible(RMenu:Get('Job', Type), not RageUI.Visible(RMenu:Get('Job', Type)))
				FreezeEntityPosition(PlayerPedId(), true)
				InMenu = true
			else
				ESX.ShowNotification("Vous avez déjà un emploi.")
			end
		elseif Type == "Eboueur" or Type == "Ouvrier" or Type == "Pêcheur" or Type == "Fermier"  then
			ESX.TriggerServerCallback('MissionState', function(InJob)
				if InJob then
					Job.MissionTxt = "Terminer votre mission."
				else
					Job.MissionTxt = "Commencer votre mission."
				end
			end, Type)
			RageUI.Visible(RMenu:Get('Job', Type), not RageUI.Visible(RMenu:Get('Job', Type)))
			FreezeEntityPosition(PlayerPedId(), true)
			InMenu = true
		elseif Type == "Chest" then
			if Job.Wl.DuttyState then
				ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(Money)
					Job.Wl.Society_Money = Money
				end, PlayerData.job.name)
				RageUI.Visible(RMenu:Get('Job', Type), not RageUI.Visible(RMenu:Get('Job', Type)))
				FreezeEntityPosition(PlayerPedId(), true)
				InMenu = true
			else
				ESX.ShowNotification("Vous devez être en service.")
			end
		elseif Type == "DeleteCar" then
			if Job.Wl.DuttyState then
				CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
				CrtPlate = GetVehicleNumberPlateText(CrtVhc)
				if CrtPlate == "JOBSLASV" then
					DeleteEntity(CrtVhc)
					ESX.ShowNotification("Vous avez rentrer le véhicule dans le garage.")
				else
					ESX.ShowNotification("Ce véhicule ne peut pas rentrer dans le garage.")
				end
			else
				ESX.ShowNotification("Vous devez être en service.")
			end
		elseif Type == "Stand" then
			CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
			if CrtVhc then
				Job.Stand.FinalPrice = 0
				SetVehicleModKit(CrtVhc, 0)	
				RageUI.Visible(RMenu:Get('Job', Type), not RageUI.Visible(RMenu:Get('Job', Type)))
				FreezeEntityPosition(CrtVhc, true)
				SetVehicleEngineOn(CrtVhc, false, true, true)
				InMenu = true
				Job.Stand.LastProps = ESX.Game.GetVehicleProperties(CrtVhc)
			else
			end
		elseif Type == "Crafting" then
			if Job.Wl.DuttyState then
				RageUI.Visible(RMenu:Get('Job', Type), not RageUI.Visible(RMenu:Get('Job', Type)))
				FreezeEntityPosition(PlayerPedId(), true)
				InMenu = true
			else
				ESX.ShowNotification("Vous devez être en service.")
			end
		else
			if Job.Wl.DuttyState then
				RageUI.Visible(RMenu:Get('Job', Type), not RageUI.Visible(RMenu:Get('Job', Type)))
				FreezeEntityPosition(PlayerPedId(), true)
				InMenu = true
			else
				ESX.ShowNotification("Vous devez être en service.")
			end
		end

	while InMenu do
		Citizen.Wait(0)

		RageUI.IsVisible(RMenu:Get('Job', 'Interim'), function()
			for _,v in pairs(Job.Interim) do
				RageUI.Item.Button(v.JobName, v.JobDesc, {}, true, {
					onSelected = function()
						SetNewWaypoint(v.Pos.x, v.Pos.y)
						ESX.ShowNotification("Vous devez vous rendre sur place pour accepter la mission.")
						ESX.ShowNotification("Votre mission vous est indiquer sur la carte.")
					end,
				})
			end
			RageUI.Item.Button("Retour", "", {}, true, {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), false)
					RageUI.CloseAll()
					InMenu = false
				end,
			})
		end)

		RageUI.IsVisible(RMenu:Get('Job', 'Ouvrier'), function()
			RageUI.Item.Button(Job.MissionTxt, "", {}, true, {
				onSelected = function()
					if not PlyInJob then
						TriggerServerEvent("StartJob", Type)
						PlyInJob = true
					else
						TriggerServerEvent("StopJob", Type)
					end
				end,
			})
			RageUI.Item.Button("Retour", "", {}, true, {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), false)
					Timing = 2000
					RageUI.CloseAll()
					InMenu = false
				end,
			})
		end)

		RageUI.IsVisible(RMenu:Get('Job', 'Pêcheur'), function()
			RageUI.Item.Button(Job.MissionTxt, "", {}, true, {
				onSelected = function()
					if not PlyInJob then
						TriggerServerEvent("StartJob", Type)
						PlyInJob = true
					else
						TriggerServerEvent("StopJob", Type)
					end
				end,
			})
			RageUI.Item.Button("Retour", "", {}, true, {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), false)
					Timing = 2000
					RageUI.CloseAll()
					InMenu = false
				end,
			})
		end)

		RageUI.IsVisible(RMenu:Get('Job', 'Fermier'), function()
			RageUI.Item.Button(Job.MissionTxt, "", {}, true, {
				onSelected = function()
					if not PlyInJob then
						TriggerServerEvent("StartJob", Type)
						PlyInJob = true
					else
						TriggerServerEvent("StopJob", Type)
					end
				end,
			})
			RageUI.Item.Button("Retour", "", {}, true, {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), false)
					Timing = 2000
					RageUI.CloseAll()
					InMenu = false
				end,
			})
		end)

		RageUI.IsVisible(RMenu:Get('Job', 'Chest'), function()
            RageUI.Item.Separator("Compte : ~g~"..Job.Wl.Society_Money.." $~s~")
			RageUI.Item.Button("Déposer de l'argent", "", {}, true, {
				onSelected = function()
					Input = KeyboardInput("Somme à déposer", "", 20)
					if tonumber(Input) ~= nil then
						Data = {Type = "Money", Amount = tonumber(Input)}
						AddChest(Data)
					else
						ESX.ShowNotification("Utilisation invalide.")
					end
				end,
			})
			RageUI.Item.Button("Déposer un objet", "", {}, true, {
				onSelected = function()
					Job.Wl.PlyInv = {}
					ESX.TriggerServerCallback('getPlayerInventory', function(inventory)
						for i=1, #inventory.items, 1 do
							local item = inventory.items[i]
							if item.count > 0 then
								table.insert(Job.Wl.PlyInv, {label = item.label .. ' x' .. tonumber(item.count), type = 'item_standard', value = item.name})
							end
						end
					end)
				end,
			},RMenu:Get('Job', 'Chest_Item_Ply'))
			if PlayerData.job.grade_name == "boss" then
				RageUI.Item.Button("Retirer de l'argent", "", {}, true, {
					onSelected = function()
						Input = KeyboardInput("Somme à retirer", "", 20)
						if tonumber(Input) ~= nil then
							Data = {Type = "Money", Amount = tonumber(Input)}
							RemoveChest(Data)
						else
							ESX.ShowNotification("Utilisation invalide.")
						end
					end,
				})
				RageUI.Item.Button("Retirer un objet", "", {}, true, {
					onSelected = function()
						Job.Wl.SctInv = {}
						ESX.TriggerServerCallback('getStockItems', function(Sitems)
							for i=1, #Sitems,1 do
								table.insert(Job.Wl.SctInv, {label = Sitems[i].label..' x ' .. tonumber(Sitems[i].count), value = Sitems[i].name, Count = tonumber(Sitems[i].count)})
							end
						end)
					end,
				},RMenu:Get('Job', 'Chest_Item_Sct'))
			end
			RageUI.Item.Button("Retour", "", {}, true, {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), false)
					Timing = 2000
					RageUI.CloseAll()
					InMenu = false
				end,
			})
		end)

		RageUI.IsVisible(RMenu:Get('Job', 'Chest_Item_Ply'), function()
			if Job.Wl.PlyInv then
				for _,v in pairs (Job.Wl.PlyInv) do
					RageUI.Item.Button(v.label, "", {}, true, {
						onSelected = function()
							Input = KeyboardInput("Quantité à déposer", "", 20)
							if tonumber(Input) ~= nil then
								Data = {Type = "Items", Item = v.value, Amount = tonumber(Input)}
								AddChest(Data)
							else
								ESX.ShowNotification("Utilisation invalide.")
							end
						end,
					})
				end
			end
			RageUI.Item.Button("Retour", "", {}, true, {
				onSelected = function()
					RageUI.GoBack()
				end,
			})
		end)

		RageUI.IsVisible(RMenu:Get('Job', 'Chest_Item_Sct'), function()
			if Job.Wl.SctInv then
				for _,v in pairs (Job.Wl.SctInv) do
					if v.Count >= 1 then
						RageUI.Item.Button(v.label, "", {}, true, {
							onSelected = function()
								Input = KeyboardInput("Quantité à retirer", "", 20)
								if tonumber(Input) ~= nil then
									Data = {Type = "Items", Item = v.value, Amount = tonumber(Input)}
									RemoveChest(Data)
								else
									ESX.ShowNotification("Utilisation invalide.")
								end
							end,
						})
					end
				end
			end
			RageUI.Item.Button("Retour", "", {}, true, {
				onSelected = function()
					RageUI.GoBack()
				end,
			})
		end)

		RageUI.IsVisible(RMenu:Get('Job', 'Shop'), function()
			if Job.Wl[PlayerData.job.name].Items then
				for _,v in pairs (Job.Wl[PlayerData.job.name].Items) do
					RageUI.Item.Button(v.Label, "", {RightLabel = "~g~"..v.Price.." $~s~"}, true, {
						onSelected = function(Index, Items)
							if v.Type == "Items" then
								Input = KeyboardInput("Quantité à acheter ("..v.Limite.." maximum)", "", 20)
								if tonumber(Input) ~= nil then
									TriggerServerEvent("Job:BuyItems", v, tonumber(Input))
								else
									ESX.ShowNotification("Utilisation invalide.")
								end
							else
								if not HasPedGotWeapon(PlayerPedId(), GetHashKey("weapon_"..v.Value), false) then
									TriggerServerEvent("Job:BuyItems", v, tonumber(Input))
								else
									ESX.ShowNotification("Vous avez déja cette arme sur vous.")
								end
							end
						end,
					})
				end
			end
			RageUI.Item.Button("Retour", "", {}, true, {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), false)
					Timing = 2000
					RageUI.CloseAll()
					InMenu = false
				end,
			})
		end)

		RageUI.IsVisible(RMenu:Get('Job', 'Garage'), function()
			if Job.Wl[PlayerData.job.name].Vehicle[PlayerData.job.grade_name].Value then
				for _,v in pairs (Job.Wl[PlayerData.job.name].Vehicle[PlayerData.job.grade_name].Value) do
					RageUI.Item.Button(v.Label, "", {}, true, {
						onSelected = function()
							SpawnJobCar(v.Value, Job.Wl[PlayerData.job.name].Vehicle.Spawn)
						end,
					})
				end
			end
			RageUI.Item.Button("Retour", "", {}, true, {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), false)
					Timing = 2000
					RageUI.CloseAll()
					InMenu = false
				end,
			})
		end)

		RageUI.IsVisible(RMenu:Get('Job', 'Cloackroom'), function()
			if Job.Wl[PlayerData.job.name].Clothe[PlayerData.job.grade_name].Value then
				for _,v in pairs (Job.Wl[PlayerData.job.name].Clothe[PlayerData.job.grade_name].Value) do
					RageUI.Item.Button(v.Label, "", {}, true, {
						onSelected = function()
							TriggerEvent("ApplySkin", PlayerPedId(), json.encode(v.Value))
						end,
					})
				end
			end
			RageUI.Item.Button("Retour", "", {}, true, {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), false)
					Timing = 2000
					RageUI.CloseAll()
					InMenu = false
				end,
			})
		end)

		RageUI.IsVisible(RMenu:Get('Job', 'Stand'), function()
			RageUI.Item.Separator("[Prix total] : ~g~"..Job.Stand.FinalPrice.." $~s~")
			Job.Stand.Btn()
			RageUI.Item.Button("Retour", "", {}, true, {
				onSelected = function()
					if not Job.Stand.Buyed then
						ESX.Game.SetVehicleProperties(CrtVhc, Job.Stand.LastProps)
						LeaveStand(CrtVhc)
					else
						Plate = GetVehicleNumberPlateText(CrtVhc)
						ESX.TriggerServerCallback('BuyMods', function(Result)
							if Result then
								CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
								LeaveStand(CrtVhc)
							end
						end, Job.Stand.FinalPrice, Plate)
					end
				end,
			})
		end)

		RageUI.IsVisible(RMenu:Get('Job', 'Stand_Perfs'), function()
			RageUI.Item.Separator("[Prix total] : ~g~"..Job.Stand.FinalPrice.." $~s~")
			Job.Stand.PerfsBtn()
		end)

		RageUI.IsVisible(RMenu:Get('Job', 'Stand_Custom'), function()
			RageUI.Item.Separator("[Prix total] : ~g~"..Job.Stand.FinalPrice.." $~s~")
			Job.Stand.CustomBtn()
		end)

		RageUI.IsVisible(RMenu:Get('Job', 'Stand_Color'), function()
			RageUI.Item.Separator("[Prix total] : ~g~"..Job.Stand.FinalPrice.." $~s~")
			Job.Stand.ColorBtn()
		end)

		RageUI.IsVisible(RMenu:Get('Job', 'Primary_Color'), function()
			RageUI.Item.Separator("[Prix total] : ~g~"..Job.Stand.FinalPrice.." $~s~")
			Job.Stand.PrimaryBtn()
		end)

		RageUI.IsVisible(RMenu:Get('Job', 'Secondary_Color'), function()
			RageUI.Item.Separator("[Prix total] : ~g~"..Job.Stand.FinalPrice.." $~s~")
			Job.Stand.SecondaryBtn()
		end)

		RageUI.IsVisible(RMenu:Get('Job', 'Pearless_Color'), function()
			RageUI.Item.Separator("[Prix total] : ~g~"..Job.Stand.FinalPrice.." $~s~")
			Job.Stand.PearlessBtn()
		end)

		RageUI.IsVisible(RMenu:Get('Job', 'Wheels_Color'), function()
			RageUI.Item.Separator("[Prix total] : ~g~"..Job.Stand.FinalPrice.." $~s~")
			Job.Stand.WheelColorBtn()
		end)

		RageUI.IsVisible(RMenu:Get('Job', 'Stand_Wheels'), function()
			RageUI.Item.Separator("[Prix total] : ~g~"..Job.Stand.FinalPrice.." $~s~")
			Job.Stand.WheelsBtn()
		end)

		RageUI.IsVisible(RMenu:Get('Job', 'Wheels_Found'), function()
			RageUI.Item.Separator("[Prix total] : ~g~"..Job.Stand.FinalPrice.." $~s~")
			Job.Stand.WheelsTypeBtn()
		end)

		RageUI.IsVisible(RMenu:Get('Job', 'Crafting'), function()
			Job.Crafting.Btn()
		end)
		
	end
end
