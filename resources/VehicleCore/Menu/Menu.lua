RMenu.Add('Super', 'Principal', RageUI.CreateMenu("", "Luxury Autoshop", nil, nil, "ShopDict", "VhcBanner"), true)
RMenu:Get('Super', 'Principal'):DisplayGlare(false);
RMenu:Get('Super', 'Principal').Closable = false;

RMenu.Add('Sportive', 'Principal', RageUI.CreateMenu("", "Premium autoshop", nil, nil, "ShopDict", "VhcBanner"), true)
RMenu:Get('Sportive', 'Principal'):DisplayGlare(false);
RMenu:Get('Sportive', 'Principal').Closable = false;

RMenu.Add('Muscle', 'Principal', RageUI.CreateMenu("", "Los santos autoshop", nil, nil, "ShopDict", "VhcBanner"), true)
RMenu:Get('Muscle', 'Principal'):DisplayGlare(false);
RMenu:Get('Muscle', 'Principal').Closable = false;

RMenu.Add('OffRoad', 'Principal', RageUI.CreateMenu("", "Sandy shore autoshop", nil, nil, "ShopDict", "VhcBanner"), true)
RMenu:Get('OffRoad', 'Principal'):DisplayGlare(false);
RMenu:Get('OffRoad', 'Principal').Closable = false;

RMenu.Add('Suv', 'Principal', RageUI.CreateMenu("", "Suv autoshop", nil, nil, "ShopDict", "VhcBanner"), true)
RMenu:Get('Suv', 'Principal'):DisplayGlare(false);
RMenu:Get('Suv', 'Principal').Closable = false;

RMenu.Add('Compact', 'Principal', RageUI.CreateMenu("", "Compact autoshop", nil, nil, "ShopDict", "VhcBanner"), true)
RMenu:Get('Compact', 'Principal'):DisplayGlare(false);
RMenu:Get('Compact', 'Principal').Closable = false;

RMenu.Add('Moto', 'Principal', RageUI.CreateMenu("", "Moto autoshop", nil, nil, "ShopDict", "VhcBanner"), true)
RMenu:Get('Moto', 'Principal'):DisplayGlare(false);
RMenu:Get('Moto', 'Principal').Closable = false;

RMenu.Add('Velo', 'Principal', RageUI.CreateMenu("", "Velo autoshop", nil, nil, "ShopDict", "VhcBanner"), true)
RMenu:Get('Velo', 'Principal'):DisplayGlare(false);
RMenu:Get('Velo', 'Principal').Closable = false;

function ShowMenu(Type)
	RageUI.Visible(RMenu:Get(Type, 'Principal'), not RageUI.Visible(RMenu:Get(Type, 'Principal')))
	FreezeEntityPosition(PlayerPedId(), true)
	InMenu = true

	while InMenu do
		Citizen.Wait(0)

		RageUI.IsVisible(RMenu:Get('Super', 'Principal'), function()
            RageUI.Item.Separator("[~y~Prix~s~] : ~g~"..Shops.FinalPrice.." $")
            RageUI.Item.Separator("--- SuperCar ---")
            for _,v in pairs (Shops.CarChoosen.Super) do
                RageUI.Item.Button(v.Name, "", {}, true, {
                    onActive = function()
                        if Shops.FinalPrice ~= v.Price then
                            Shops.FinalPrice = v.Price
                        end
                        SpawnCar(v.Value)
                    end,
                    onSelected = function()
                        CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
                        VhcProps = ESX.Game.GetVehicleProperties(CrtVhc)
                        VhcPlate = GetVehicleNumberPlateText(CrtVhc)
                        VhcHealth = GetEntityHealth(CrtVhc)
                        Choose = {Token = json.encode(TokenGen), Label = v.Name, Hash = v.Value, Price = v.Price, Plate = VhcPlate, Props = VhcProps, Health = VhcHealth}
						TriggerServerEvent('BuyVehicle', json.encode(Choose))
                    end,
                })
            end
            RageUI.Item.Separator("--- CarClassique ---")
            for _,v in pairs (Shops.CarChoosen.Classique) do
                RageUI.Item.Button(v.Name, "", {}, true, {
                    onActive = function()
                        if Shops.FinalPrice ~= v.Price then
                            Shops.FinalPrice = v.Price
                        end
                        SpawnCar(v.Value)
                    end,
                    onSelected = function()
                        CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
                        VhcProps = ESX.Game.GetVehicleProperties(CrtVhc)
                        VhcPlate = GetVehicleNumberPlateText(CrtVhc)
                        VhcHealth = GetEntityHealth(CrtVhc)
                        Choose = {Token = json.encode(TokenGen), Label = v.Name, Hash = v.Value, Price = v.Price, Plate = VhcPlate, Props = VhcProps, Health = VhcHealth}
						TriggerServerEvent('BuyVehicle', json.encode(Choose))
                    end,
                })
            end
			RageUI.Item.Button("Retour", "", {}, true, {
				onSelected = function()
                    for _,v in pairs (Shops.LastVhc) do
                        DeleteEntity(v)
                    end
                    Shops.Timing = 2000
                    SetEntityCoords(PlayerPedId(), Shops.ShopsOut.x, Shops.ShopsOut.y, Shops.ShopsOut.z)
                    SetEntityHeading(PlayerPedId(), Shops.ShopsOut.h)
                    SetEntityVisible(PlayerPedId(), true)
					FreezeEntityPosition(PlayerPedId(), false)
					RageUI.CloseAll()
					Citizen.Wait(Shops.Timing)
					InMenu = false
				end,
			})
        end)

        RageUI.IsVisible(RMenu:Get('Sportive', 'Principal'), function()
            RageUI.Item.Separator("[~y~Prix~s~] : ~g~"..Shops.FinalPrice.." $")
            RageUI.Item.Separator("--- Sportives ---")
            for _,v in pairs (Shops.CarChoosen.Sport) do
                RageUI.Item.Button(v.Name, "", {}, true, {
                    onActive = function()
                        if Shops.FinalPrice ~= v.Price then
                            Shops.FinalPrice = v.Price
                        end
                        SpawnCar(v.Value)
                    end,
                    onSelected = function()
                        CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
                        VhcProps = ESX.Game.GetVehicleProperties(CrtVhc)
                        VhcPlate = GetVehicleNumberPlateText(CrtVhc)
                        VhcHealth = GetEntityHealth(CrtVhc)
                        Choose = {Token = json.encode(TokenGen), Label = v.Name, Hash = v.Value, Price = v.Price, Plate = VhcPlate, Props = VhcProps, Health = VhcHealth}
						TriggerServerEvent('BuyVehicle', json.encode(Choose))
                    end,
                })
            end
            RageUI.Item.Separator("--- Sedans ---")
            for _,v in pairs (Shops.CarChoosen.Sedans) do
                RageUI.Item.Button(v.Name, "", {}, true, {
                    onActive = function()
                        if Shops.FinalPrice ~= v.Price then
                            Shops.FinalPrice = v.Price
                        end
                        SpawnCar(v.Value)
                    end,
                    onSelected = function()
                        CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
                        VhcProps = ESX.Game.GetVehicleProperties(CrtVhc)
                        VhcPlate = GetVehicleNumberPlateText(CrtVhc)
                        VhcHealth = GetEntityHealth(CrtVhc)
                        Choose = {Token = json.encode(TokenGen), Label = v.Name, Hash = v.Value, Price = v.Price, Plate = VhcPlate, Props = VhcProps, Health = VhcHealth}
						TriggerServerEvent('BuyVehicle', json.encode(Choose))
                    end,
                })
            end
			RageUI.Item.Button("Retour", "", {}, true, {
				onSelected = function()
                    for _,v in pairs (Shops.LastVhc) do
                        DeleteEntity(v)
                    end
                    Shops.Timing = 2000
                    SetEntityCoords(PlayerPedId(), Shops.ShopsOut.x, Shops.ShopsOut.y, Shops.ShopsOut.z)
                    SetEntityHeading(PlayerPedId(), Shops.ShopsOut.h)
                    SetEntityVisible(PlayerPedId(), true)
					FreezeEntityPosition(PlayerPedId(), false)
					RageUI.CloseAll()
					Citizen.Wait(Shops.Timing)
					InMenu = false
				end,
			})
        end)

        RageUI.IsVisible(RMenu:Get('Muscle', 'Principal'), function()
            RageUI.Item.Separator("[~y~Prix~s~] : ~g~"..Shops.FinalPrice.." $")
            RageUI.Item.Separator("--- Muscle ---")
            for _,v in pairs (Shops.CarChoosen.Muscle) do
                RageUI.Item.Button(v.Name, "", {}, true, {
                    onActive = function()
                        if Shops.FinalPrice ~= v.Price then
                            Shops.FinalPrice = v.Price
                        end
                        SpawnCar(v.Value)
                    end,
                    onSelected = function()
                        CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
                        VhcProps = ESX.Game.GetVehicleProperties(CrtVhc)
                        VhcPlate = GetVehicleNumberPlateText(CrtVhc)
                        VhcHealth = GetEntityHealth(CrtVhc)
                        Choose = {Token = json.encode(TokenGen), Label = v.Name, Hash = v.Value, Price = v.Price, Plate = VhcPlate, Props = VhcProps, Health = VhcHealth}
						TriggerServerEvent('BuyVehicle', json.encode(Choose))
                    end,
                })
            end
            RageUI.Item.Separator("--- Vans ---")
            for _,v in pairs (Shops.CarChoosen.Vans) do
                RageUI.Item.Button(v.Name, "", {}, true, {
                    onActive = function()
                        if Shops.FinalPrice ~= v.Price then
                            Shops.FinalPrice = v.Price
                        end
                        SpawnCar(v.Value)
                    end,
                    onSelected = function()
                        CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
                        VhcProps = ESX.Game.GetVehicleProperties(CrtVhc)
                        VhcPlate = GetVehicleNumberPlateText(CrtVhc)
                        VhcHealth = GetEntityHealth(CrtVhc)
                        Choose = {Token = json.encode(TokenGen), Label = v.Name, Hash = v.Value, Price = v.Price, Plate = VhcPlate, Props = VhcProps, Health = VhcHealth}
						TriggerServerEvent('BuyVehicle', json.encode(Choose))
                    end,
                })
            end
			RageUI.Item.Button("Retour", "", {}, true, {
				onSelected = function()
                    for _,v in pairs (Shops.LastVhc) do
                        DeleteEntity(v)
                    end
                    Shops.Timing = 2000
                    SetEntityCoords(PlayerPedId(), Shops.ShopsOut.x, Shops.ShopsOut.y, Shops.ShopsOut.z)
                    SetEntityHeading(PlayerPedId(), Shops.ShopsOut.h)
                    SetEntityVisible(PlayerPedId(), true)
					FreezeEntityPosition(PlayerPedId(), false)
					RageUI.CloseAll()
					Citizen.Wait(Shops.Timing)
					InMenu = false
				end,
			})
        end)

        RageUI.IsVisible(RMenu:Get('OffRoad', 'Principal'), function()
            RageUI.Item.Separator("[~y~Prix~s~] : ~g~"..Shops.FinalPrice.." $")
            RageUI.Item.Separator("--- OffRoad ---")
            for _,v in pairs (Shops.CarChoosen.OffRoad) do
                RageUI.Item.Button(v.Name, "", {}, true, {
                    onActive = function()
                        if Shops.FinalPrice ~= v.Price then
                            Shops.FinalPrice = v.Price
                        end
                        SpawnCar(v.Value)
                    end,
                    onSelected = function()
                        CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
                        VhcProps = ESX.Game.GetVehicleProperties(CrtVhc)
                        VhcPlate = GetVehicleNumberPlateText(CrtVhc)
                        VhcHealth = GetEntityHealth(CrtVhc)
                        Choose = {Token = json.encode(TokenGen), Label = v.Name, Hash = v.Value, Price = v.Price, Plate = VhcPlate, Props = VhcProps, Health = VhcHealth}
						TriggerServerEvent('BuyVehicle', json.encode(Choose))
                    end,
                })
            end
			RageUI.Item.Button("Retour", "", {}, true, {
				onSelected = function()
                    for _,v in pairs (Shops.LastVhc) do
                        DeleteEntity(v)
                    end
                    Shops.Timing = 2000
                    SetEntityCoords(PlayerPedId(), Shops.ShopsOut.x, Shops.ShopsOut.y, Shops.ShopsOut.z)
                    SetEntityHeading(PlayerPedId(), Shops.ShopsOut.h)
                    SetEntityVisible(PlayerPedId(), true)
					FreezeEntityPosition(PlayerPedId(), false)
					RageUI.CloseAll()
					Citizen.Wait(Shops.Timing)
					InMenu = false
				end,
			})
        end)

        RageUI.IsVisible(RMenu:Get('Suv', 'Principal'), function()
            RageUI.Item.Separator("[~y~Prix~s~] : ~g~"..Shops.FinalPrice.." $")
            RageUI.Item.Separator("--- Suv ---")
            for _,v in pairs (Shops.CarChoosen.Suv) do
                RageUI.Item.Button(v.Name, "", {}, true, {
                    onActive = function()
                        if Shops.FinalPrice ~= v.Price then
                            Shops.FinalPrice = v.Price
                        end
                        SpawnCar(v.Value)
                    end,
                    onSelected = function()
                        CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
                        VhcProps = ESX.Game.GetVehicleProperties(CrtVhc)
                        VhcPlate = GetVehicleNumberPlateText(CrtVhc)
                        VhcHealth = GetEntityHealth(CrtVhc)
                        Choose = {Token = json.encode(TokenGen), Label = v.Name, Hash = v.Value, Price = v.Price, Plate = VhcPlate, Props = VhcProps, Health = VhcHealth}
						TriggerServerEvent('BuyVehicle', json.encode(Choose))
                    end,
                })
            end
			RageUI.Item.Button("Retour", "", {}, true, {
				onSelected = function()
                    for _,v in pairs (Shops.LastVhc) do
                        DeleteEntity(v)
                    end
                    Shops.Timing = 2000
                    SetEntityCoords(PlayerPedId(), Shops.ShopsOut.x, Shops.ShopsOut.y, Shops.ShopsOut.z)
                    SetEntityHeading(PlayerPedId(), Shops.ShopsOut.h)
                    SetEntityVisible(PlayerPedId(), true)
					FreezeEntityPosition(PlayerPedId(), false)
					RageUI.CloseAll()
					Citizen.Wait(Shops.Timing)
					InMenu = false
				end,
			})
        end)

        RageUI.IsVisible(RMenu:Get('Compact', 'Principal'), function()
            RageUI.Item.Separator("[~y~Prix~s~] : ~g~"..Shops.FinalPrice.." $")
            RageUI.Item.Separator("--- Compacts ---")
            for _,v in pairs (Shops.CarChoosen.Compacts) do
                RageUI.Item.Button(v.Name, "", {}, true, {
                    onActive = function()
                        if Shops.FinalPrice ~= v.Price then
                            Shops.FinalPrice = v.Price
                        end
                        SpawnCar(v.Value)
                    end,
                    onSelected = function()
                        CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
                        VhcProps = ESX.Game.GetVehicleProperties(CrtVhc)
                        VhcPlate = GetVehicleNumberPlateText(CrtVhc)
                        VhcHealth = GetEntityHealth(CrtVhc)
                        Choose = {Token = json.encode(TokenGen), Label = v.Name, Hash = v.Value, Price = v.Price, Plate = VhcPlate, Props = VhcProps, Health = VhcHealth}
						TriggerServerEvent('BuyVehicle', json.encode(Choose))
                    end,
                })
            end
			RageUI.Item.Button("Retour", "", {}, true, {
				onSelected = function()
                    for _,v in pairs (Shops.LastVhc) do
                        DeleteEntity(v)
                    end
                    Shops.Timing = 2000
                    SetEntityCoords(PlayerPedId(), Shops.ShopsOut.x, Shops.ShopsOut.y, Shops.ShopsOut.z)
                    SetEntityHeading(PlayerPedId(), Shops.ShopsOut.h)
                    SetEntityVisible(PlayerPedId(), true)
					FreezeEntityPosition(PlayerPedId(), false)
					RageUI.CloseAll()
					Citizen.Wait(Shops.Timing)
					InMenu = false
				end,
			})
        end)

        RageUI.IsVisible(RMenu:Get('Moto', 'Principal'), function()
            RageUI.Item.Separator("[~y~Prix~s~] : ~g~"..Shops.FinalPrice.." $")
            RageUI.Item.Separator("--- Moto ---")
            for _,v in pairs (Shops.CarChoosen.Moto) do
                RageUI.Item.Button(v.Name, "", {}, true, {
                    onActive = function()
                        if Shops.FinalPrice ~= v.Price then
                            Shops.FinalPrice = v.Price
                        end
                        SpawnCar(v.Value)
                    end,
                    onSelected = function()
                        CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
                        VhcProps = ESX.Game.GetVehicleProperties(CrtVhc)
                        VhcPlate = GetVehicleNumberPlateText(CrtVhc)
                        VhcHealth = GetEntityHealth(CrtVhc)
                        Choose = {Token = json.encode(TokenGen), Label = v.Name, Hash = v.Value, Price = v.Price, Plate = VhcPlate, Props = VhcProps, Health = VhcHealth}
						TriggerServerEvent('BuyVehicle', json.encode(Choose))
                    end,
                })
            end
			RageUI.Item.Button("Retour", "", {}, true, {
				onSelected = function()
                    for _,v in pairs (Shops.LastVhc) do
                        DeleteEntity(v)
                    end
                    Shops.Timing = 2000
                    SetEntityCoords(PlayerPedId(), Shops.ShopsOut.x, Shops.ShopsOut.y, Shops.ShopsOut.z)
                    SetEntityHeading(PlayerPedId(), Shops.ShopsOut.h)
                    SetEntityVisible(PlayerPedId(), true)
					FreezeEntityPosition(PlayerPedId(), false)
					RageUI.CloseAll()
					Citizen.Wait(Shops.Timing)
					InMenu = false
				end,
			})
        end)

        RageUI.IsVisible(RMenu:Get('Velo', 'Principal'), function()
            RageUI.Item.Separator("[~y~Prix~s~] : ~g~"..Shops.FinalPrice.." $")
            RageUI.Item.Separator("--- Vélo ---")
            for _,v in pairs (VehicleList.Velo) do
                RageUI.Item.Button(v.Name, "", {}, true, {
                    onActive = function()
                        if Shops.FinalPrice ~= v.Price then
                            Shops.FinalPrice = v.Price
                        end
                        SpawnCar(v.Value)
                    end,
                    onSelected = function()
                        CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
                        VhcProps = ESX.Game.GetVehicleProperties(CrtVhc)
                        VhcPlate = GetVehicleNumberPlateText(CrtVhc)
                        VhcHealth = GetEntityHealth(CrtVhc)
                        Choose = {Token = json.encode(TokenGen), Label = v.Name, Hash = v.Value, Price = v.Price, Plate = VhcPlate, Props = VhcProps, Health = VhcHealth}
						TriggerServerEvent('BuyVehicle', json.encode(Choose))
                    end,
                })
            end
			RageUI.Item.Button("Retour", "", {}, true, {
				onSelected = function()
                    for _,v in pairs (Shops.LastVhc) do
                        DeleteEntity(v)
                    end
                    Shops.Timing = 2000
                    SetEntityCoords(PlayerPedId(), Shops.ShopsOut.x, Shops.ShopsOut.y, Shops.ShopsOut.z)
                    SetEntityHeading(PlayerPedId(), Shops.ShopsOut.h)
                    SetEntityVisible(PlayerPedId(), true)
					FreezeEntityPosition(PlayerPedId(), false)
					RageUI.CloseAll()
					Citizen.Wait(Shops.Timing)
					InMenu = false
				end,
			})
        end)
        
    end
end