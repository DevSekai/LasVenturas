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

RMenu.Add('Job', 'Chest_Item_Ply', RageUI.CreateSubMenu(RMenu:Get('Job', 'Chest'), "", ""))
RMenu:Get('Job', 'Chest_Item_Ply'):SetSubtitle("Inventaire")
RMenu:Get('Job', 'Chest_Item_Ply'):DisplayGlare(false);

RMenu.Add('Job', 'Chest_Item_Sct', RageUI.CreateSubMenu(RMenu:Get('Job', 'Chest'), "", ""))
RMenu:Get('Job', 'Chest_Item_Sct'):SetSubtitle("Coffre")
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
						onSelected = function()
							Input = KeyboardInput("Quantité à acheter ("..v.Limite.." maximum)", "", 20)
							if tonumber(Input) ~= nil then
								TriggerServerEvent("Job:BuyItems", v, tonumber(Input))
							else
								ESX.ShowNotification("Utilisation invalide.")
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

	end
end
