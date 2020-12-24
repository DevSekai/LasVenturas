RMenu.Add('Org', 'Chest', RageUI.CreateMenu("", "Coffre", nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Org', 'Chest'):DisplayGlare(false);
RMenu:Get('Org', 'Chest').Closable = false;

RMenu.Add('Org', 'Chest_Item_Ply', RageUI.CreateSubMenu(RMenu:Get('Org', 'Chest'), "", "Inventaire"))
RMenu:Get('Org', 'Chest_Item_Ply'):DisplayGlare(false);

RMenu.Add('Org', 'Chest_Item_Sct', RageUI.CreateSubMenu(RMenu:Get('Org', 'Chest'), "", "Coffre"))
RMenu:Get('Org', 'Chest_Item_Sct'):DisplayGlare(false);

RMenu.Add('Org', 'Garage', RageUI.CreateMenu("", "Garage", nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Org', 'Garage'):DisplayGlare(false);
RMenu:Get('Org', 'Garage').Closable = false;

RMenu.Add('Org', 'Cloackroom', RageUI.CreateMenu("", "Vestiaire", nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Org', 'Cloackroom'):DisplayGlare(false);
RMenu:Get('Org', 'Cloackroom').Closable = false;

function ShowMenu(Type)
		if Type == "Chest" then
			ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(Money)
				Org.Wl.Society_Money = Money
			end, PlayerData.job2.name)
			RageUI.Visible(RMenu:Get('Org', Type), not RageUI.Visible(RMenu:Get('Org', Type)))
			FreezeEntityPosition(PlayerPedId(), true)
			InMenu = true
		elseif Type == "DeleteCar" then
			CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
			CrtPlate = GetVehicleNumberPlateText(CrtVhc)
			if CrtPlate == "LASV" then
				DeleteEntity(CrtVhc)
				ESX.ShowNotification("Vous avez rentrer le véhicule dans le garage.")
			else
				ESX.ShowNotification("Ce véhicule ne peut pas rentrer dans le garage.")
			end
		else
			RageUI.Visible(RMenu:Get('Org', Type), not RageUI.Visible(RMenu:Get('Org', Type)))
			FreezeEntityPosition(PlayerPedId(), true)
			InMenu = true
		end

	while InMenu do
		Citizen.Wait(0)

		RageUI.IsVisible(RMenu:Get('Org', 'Chest'), function()
            RageUI.Item.Separator("Compte : ~g~"..Org.Wl.Society_Money.." $~s~")
			RageUI.Item.Button("Déposer de l'argent", "", {}, true, {
				onSelected = function()
					Input = KeyboardInput("Somme à déposer", "", 20)
					if tonumber(Input) ~= nil then
						Data = {Type = "Money", Amount = tonumber(Input)}
						AddChest2(Data)
					else
						ESX.ShowNotification("Utilisation invalide.")
					end
				end,
			})
			RageUI.Item.Button("Déposer un objet", "", {}, true, {
				onSelected = function()
					Org.Wl.PlyInv = {}
					ESX.TriggerServerCallback('getPlayerInventory', function(inventory)
						for i=1, #inventory.items, 1 do
							local item = inventory.items[i]
							if item.count >= 1 then
								table.insert(Org.Wl.PlyInv, {label = item.label .. ' x' .. tonumber(item.count), type = 'item_standard', value = item.name})
							end
						end
					end)
				end,
			},RMenu:Get('Org', 'Chest_Item_Ply'))
			if PlayerData.job2.grade_name == "boss" then
				RageUI.Item.Button("Retirer de l'argent", "", {}, true, {
					onSelected = function()
						Input = KeyboardInput("Somme à retirer", "", 20)
						if tonumber(Input) ~= nil then
							Data = {Type = "Money", Amount = tonumber(Input)}
							RemoveChest2(Data)
						else
							ESX.ShowNotification("Utilisation invalide.")
						end
					end,
				})
				RageUI.Item.Button("Retirer un objet", "", {}, true, {
					onSelected = function()
						Org.Wl.SctInv = {}
						ESX.TriggerServerCallback('getStockItems2', function(Sitems)
							for i=1, #Sitems,1 do
								if Sitems[i].count >= 1 then
									table.insert(Org.Wl.SctInv, {label = Sitems[i].label..' x ' .. tonumber(Sitems[i].count), value = Sitems[i].name, Count = tonumber(Sitems[i].count)})
								end
							end
						end)
					end,
				},RMenu:Get('Org', 'Chest_Item_Sct'))
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

		RageUI.IsVisible(RMenu:Get('Org', 'Chest_Item_Ply'), function()
			if Org.Wl.PlyInv then
				for _,v in pairs (Org.Wl.PlyInv) do
					RageUI.Item.Button(v.label, "", {}, true, {
						onSelected = function()
							Input = KeyboardInput("Quantité à déposer", "", 20)
							if tonumber(Input) ~= nil then
								Data = {Type = "Items", Item = v.value, Amount = tonumber(Input)}
								AddChest2(Data)
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

		RageUI.IsVisible(RMenu:Get('Org', 'Chest_Item_Sct'), function()
			if Org.Wl.SctInv then
				for _,v in pairs (Org.Wl.SctInv) do
						RageUI.Item.Button(v.label, "", {}, true, {
							onSelected = function()
								Input = KeyboardInput("Quantité à retirer", "", 20)
								if tonumber(Input) ~= nil then
									Data = {Type = "Items", Item = v.value, Amount = tonumber(Input)}
									RemoveChest2(Data)
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

		RageUI.IsVisible(RMenu:Get('Org', 'Garage'), function()
			if Org.Wl[PlayerData.job2.name].Vehicle[PlayerData.job2.grade_name].Value then
				for _,v in pairs (Org.Wl[PlayerData.job2.name].Vehicle[PlayerData.job2.grade_name].Value) do
					RageUI.Item.Button(v.Label, "", {}, true, {
						onSelected = function()
							SpawnOrgCar(v.Value, Org.Wl[PlayerData.job2.name].Vehicle.Spawn)
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

		RageUI.IsVisible(RMenu:Get('Org', 'Cloackroom'), function()
			if Org.Wl[PlayerData.job2.name].Clothe[PlayerData.job2.grade_name].Value then
				for _,v in pairs (Org.Wl[PlayerData.job2.name].Clothe[PlayerData.job2.grade_name].Value) do
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
