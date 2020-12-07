RMenu.Add('Super', 'Principal', RageUI.CreateMenu("", Storage.MenuDesc, nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Super', 'Principal'):DisplayGlare(false);
RMenu:Get('Super', 'Principal').Closable = false;

RMenu.Add('Sportive', 'Principal', RageUI.CreateMenu("", Storage.MenuDesc, nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Sportive', 'Principal'):DisplayGlare(false);
RMenu:Get('Sportive', 'Principal').Closable = false;

RMenu.Add('Muscle', 'Principal', RageUI.CreateMenu("", Storage.MenuDesc, nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Muscle', 'Principal'):DisplayGlare(false);
RMenu:Get('Muscle', 'Principal').Closable = false;

RMenu.Add('OffRoad', 'Principal', RageUI.CreateMenu("", Storage.MenuDesc, nil, nil, "root_cause", "Banner"), true)
RMenu:Get('OffRoad', 'Principal'):DisplayGlare(false);
RMenu:Get('OffRoad', 'Principal').Closable = false;

RMenu.Add('Suv', 'Principal', RageUI.CreateMenu("", Storage.MenuDesc, nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Suv', 'Principal'):DisplayGlare(false);
RMenu:Get('Suv', 'Principal').Closable = false;

RMenu.Add('Compact', 'Principal', RageUI.CreateMenu("", Storage.MenuDesc, nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Compact', 'Principal'):DisplayGlare(false);
RMenu:Get('Compact', 'Principal').Closable = false;

RMenu.Add('Moto', 'Principal', RageUI.CreateMenu("", Storage.MenuDesc, nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Moto', 'Principal'):DisplayGlare(false);
RMenu:Get('Moto', 'Principal').Closable = false;

RMenu.Add('Velo', 'Principal', RageUI.CreateMenu("", Storage.MenuDesc, nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Velo', 'Principal'):DisplayGlare(false);
RMenu:Get('Velo', 'Principal').Closable = false;

RMenu.Add('Garage', 'Principal', RageUI.CreateMenu("", Storage.MenuDesc, nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Garage', 'Principal'):DisplayGlare(false);
RMenu:Get('Garage', 'Principal').Closable = false;

RMenu.Add('Fourriere', 'Principal', RageUI.CreateMenu("", Storage.MenuDesc, nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Fourriere', 'Principal'):DisplayGlare(false);
RMenu:Get('Fourriere', 'Principal').Closable = false;

RMenu.Add('Rental', 'Principal', RageUI.CreateMenu("", Storage.MenuDesc, nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Rental', 'Principal'):DisplayGlare(false);
RMenu:Get('Rental', 'Principal').Closable = false;

function ShowMenu(Type)
    if Type ~= "Garage" and Type ~= "Fourriere" then
	    RageUI.Visible(RMenu:Get(Type, 'Principal'), not RageUI.Visible(RMenu:Get(Type, 'Principal')))
    else
        ESX.TriggerServerCallback('GetPlyVehicles', function(PlyCars)
            Storage.PlayerCars = PlyCars
            RageUI.Visible(RMenu:Get(Type, 'Principal'), not RageUI.Visible(RMenu:Get(Type, 'Principal')))
        end)
    end
    FreezeEntityPosition(PlayerPedId(), true)
	Storage.InMenu = true

	while Storage.InMenu do
		Citizen.Wait(0)

        RageUI.IsVisible(RMenu:Get('Rental', 'Principal'), function()
            for _,v in pairs (Storage.RentalCars) do
                RageUI.Item.Button(v.Label, "", {RightLabel = "~g~"..v.Price.." $"}, true, {
                    onActive = function()
                        SpawnCar(v.Value)
                    end,
                    onSelected = function()
                        Choose = {Token = json.encode(TokenGen), Vhc = v}
                        TriggerServerEvent('RentCar', json.encode(Choose))
                    end,
                })
            end
			RageUI.Item.Button("Retour", "", {}, true, {
				onSelected = function()
                    for _,v in pairs (Storage.LastVhc) do
                        DeleteEntity(v)
                    end
                    Position.Timing = 2000
                    SetEntityCoords(PlayerPedId(), Storage.ShopsOut.x, Storage.ShopsOut.y, Storage.ShopsOut.z)
                    SetEntityHeading(PlayerPedId(), Storage.ShopsOut.h)
                    SetEntityVisible(PlayerPedId(), true)
					FreezeEntityPosition(PlayerPedId(), false)
					RageUI.CloseAll()
					Citizen.Wait(Position.Timing)
					Storage.InMenu = false
				end,
			})
        end)

        RageUI.IsVisible(RMenu:Get('Fourriere', 'Principal'), function()
            for _,v in pairs (Storage.PlayerCars) do
                if not v.Stored then
                    RageUI.Item.Button(v.Label.." "..v.Plate, "", {}, true, {
                        onSelected = function()
                            Choose = {Token = json.encode(TokenGen), Vhc = v}
                            TriggerServerEvent('OutFourriere', json.encode(Choose))
                        end,
                    })
                end
            end
			RageUI.Item.Button("Retour", "", {}, true, {
				onSelected = function()
                    Position.Timing = 2000
					FreezeEntityPosition(PlayerPedId(), false)
					RageUI.CloseAll()
					Citizen.Wait(Position.Timing)
					Storage.InMenu = false
				end,
			})
        end)

        RageUI.IsVisible(RMenu:Get('Garage', 'Principal'), function()
            for _,v in pairs (Storage.PlayerCars) do
                if v.Stored then
                    RageUI.Item.Button(v.Label.." "..v.Plate, "", {}, true, {
                        onSelected = function()
                            SpawnCoords = vector3(Storage.CarOut.x, Storage.CarOut.y, Storage.CarOut.z)
                            ESX.Game.SpawnVehicle(v.Hash, SpawnCoords, Storage.CarOut.h, function(Vehicle)
                                ESX.Game.SetVehicleProperties(Vehicle, json.encode(v.Props))
                                SetVehRadioStation(Vehicle, "OFF")
                                SetVehicleFixed(Vehicle)
                                SetVehicleDeformationFixed(Vehicle)
                                SetVehicleUndriveable(Vehicle, false)
                                SetVehicleEngineOn(Vehicle, true, true)
                                SetEntityHealth(Vehicle, tonumber(v.Health))
                                SetVehicleNumberPlateText(Vehicle, v.Plate)
                                local carplate = GetVehicleNumberPlateText(Vehicle)
                                TaskWarpPedIntoVehicle(PlayerPedId(), Vehicle, -1)
                                SetEntityAsMissionEntity(Vehicle, true, true)
                                Choose = {Token = json.encode(TokenGen), Id = v.Id}
                                TriggerServerEvent('OutVehicle', json.encode(Choose))
                            end)
                            Position.Timing = 2000
                            FreezeEntityPosition(PlayerPedId(), false)
                            RageUI.CloseAll()
                            Citizen.Wait(Position.Timing)
                            Storage.InMenu = false
                        end,
                    })
                end
            end
			RageUI.Item.Button("Retour", "", {}, true, {
				onSelected = function()
                    Position.Timing = 2000
					FreezeEntityPosition(PlayerPedId(), false)
					RageUI.CloseAll()
					Citizen.Wait(Position.Timing)
					Storage.InMenu = false
				end,
			})
        end)

		RageUI.IsVisible(RMenu:Get('Super', 'Principal'), function()
            RageUI.Item.Separator("--- SuperCar ---")
            for _,v in pairs (Storage.CarChoosen.Super) do
                RageUI.Item.Button(v.Name, "", {RightLabel = "~g~"..v.Price.." $"}, true, {
                    onActive = function()
                        SpawnCar(v.Value)
                    end,
                    onSelected = function()
                        CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
                        VhcProps = ESX.Game.GetVehicleProperties(CrtVhc)
                        VhcPlate = GetVehicleNumberPlateText(CrtVhc)
                        VhcHealth = GetEntityHealth(CrtVhc)
                        Choose = {Token = json.encode(TokenGen), Label = v.Name, Hash = v.Value, Price = v.Price, Plate = VhcPlate, Props = VhcProps, Health = VhcHealth, Table = "Super", TableNbr = tonumber(_)}
						TriggerServerEvent('BuyVehicle', json.encode(Choose))
                    end,
                })
            end
            RageUI.Item.Separator("--- CarClassique ---")
            for _,v in pairs (Storage.CarChoosen.Classique) do
                RageUI.Item.Button(v.Name, "", {RightLabel = "~g~"..v.Price.." $"}, true, {
                    onActive = function()
                        SpawnCar(v.Value)
                    end,
                    onSelected = function()
                        CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
                        VhcProps = ESX.Game.GetVehicleProperties(CrtVhc)
                        VhcPlate = GetVehicleNumberPlateText(CrtVhc)
                        VhcHealth = GetEntityHealth(CrtVhc)
                        Choose = {Token = json.encode(TokenGen), Label = v.Name, Hash = v.Value, Price = v.Price, Plate = VhcPlate, Props = VhcProps, Health = VhcHealth, Table = "Classique", TableNbr = tonumber(_)}
						TriggerServerEvent('BuyVehicle', json.encode(Choose))
                    end,
                })
            end
			RageUI.Item.Button("Retour", "", {}, true, {
				onSelected = function()
                    for _,v in pairs (Storage.LastVhc) do
                        DeleteEntity(v)
                    end
                    Position.Timing = 2000
                    SetEntityCoords(PlayerPedId(), Storage.ShopsOut.x, Storage.ShopsOut.y, Storage.ShopsOut.z)
                    SetEntityHeading(PlayerPedId(), Storage.ShopsOut.h)
                    SetEntityVisible(PlayerPedId(), true)
					FreezeEntityPosition(PlayerPedId(), false)
					RageUI.CloseAll()
					Citizen.Wait(Position.Timing)
					Storage.InMenu = false
				end,
			})
        end)

        RageUI.IsVisible(RMenu:Get('Sportive', 'Principal'), function()
            RageUI.Item.Separator("--- Sportives ---")
            for _,v in pairs (Storage.CarChoosen.Sport) do
                RageUI.Item.Button(v.Name, "", {RightLabel = "~g~"..v.Price.." $"}, true, {
                    onActive = function()
                        SpawnCar(v.Value)
                    end,
                    onSelected = function()
                        CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
                        VhcProps = ESX.Game.GetVehicleProperties(CrtVhc)
                        VhcPlate = GetVehicleNumberPlateText(CrtVhc)
                        VhcHealth = GetEntityHealth(CrtVhc)
                        Choose = {Token = json.encode(TokenGen), Label = v.Name, Hash = v.Value, Price = v.Price, Plate = VhcPlate, Props = VhcProps, Health = VhcHealth, Table = "Sport", TableNbr = tonumber(_)}
						TriggerServerEvent('BuyVehicle', json.encode(Choose))
                    end,
                })
            end
            RageUI.Item.Separator("--- Sedans ---")
            for _,v in pairs (Storage.CarChoosen.Sedans) do
                RageUI.Item.Button(v.Name, "", {RightLabel = "~g~"..v.Price.." $"}, true, {
                    onActive = function()
                        SpawnCar(v.Value)
                    end,
                    onSelected = function()
                        CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
                        VhcProps = ESX.Game.GetVehicleProperties(CrtVhc)
                        VhcPlate = GetVehicleNumberPlateText(CrtVhc)
                        VhcHealth = GetEntityHealth(CrtVhc)
                        Choose = {Token = json.encode(TokenGen), Label = v.Name, Hash = v.Value, Price = v.Price, Plate = VhcPlate, Props = VhcProps, Health = VhcHealth, Table = "Sedans", TableNbr = tonumber(_)}
						TriggerServerEvent('BuyVehicle', json.encode(Choose))
                    end,
                })
            end
			RageUI.Item.Button("Retour", "", {}, true, {
				onSelected = function()
                    for _,v in pairs (Storage.LastVhc) do
                        DeleteEntity(v)
                    end
                    Position.Timing = 2000
                    SetEntityCoords(PlayerPedId(), Storage.ShopsOut.x, Storage.ShopsOut.y, Storage.ShopsOut.z)
                    SetEntityHeading(PlayerPedId(), Storage.ShopsOut.h)
                    SetEntityVisible(PlayerPedId(), true)
					FreezeEntityPosition(PlayerPedId(), false)
					RageUI.CloseAll()
					Citizen.Wait(Position.Timing)
					Storage.InMenu = false
				end,
			})
        end)

        RageUI.IsVisible(RMenu:Get('Muscle', 'Principal'), function()
            RageUI.Item.Separator("--- Muscle ---")
            for _,v in pairs (Storage.CarChoosen.Muscle) do
                RageUI.Item.Button(v.Name, "", {RightLabel = "~g~"..v.Price.." $"}, true, {
                    onActive = function()
                        SpawnCar(v.Value)
                    end,
                    onSelected = function()
                        CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
                        VhcProps = ESX.Game.GetVehicleProperties(CrtVhc)
                        VhcPlate = GetVehicleNumberPlateText(CrtVhc)
                        VhcHealth = GetEntityHealth(CrtVhc)
                        Choose = {Token = json.encode(TokenGen), Label = v.Name, Hash = v.Value, Price = v.Price, Plate = VhcPlate, Props = VhcProps, Health = VhcHealth, Table = "Muscle", TableNbr = tonumber(_)}
						TriggerServerEvent('BuyVehicle', json.encode(Choose))
                    end,
                })
            end
            RageUI.Item.Separator("--- Vans ---")
            for _,v in pairs (Storage.CarChoosen.Vans) do
                RageUI.Item.Button(v.Name, "", {RightLabel = "~g~"..v.Price.." $"}, true, {
                    onActive = function()
                        SpawnCar(v.Value)
                    end,
                    onSelected = function()
                        CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
                        VhcProps = ESX.Game.GetVehicleProperties(CrtVhc)
                        VhcPlate = GetVehicleNumberPlateText(CrtVhc)
                        VhcHealth = GetEntityHealth(CrtVhc)
                        Choose = {Token = json.encode(TokenGen), Label = v.Name, Hash = v.Value, Price = v.Price, Plate = VhcPlate, Props = VhcProps, Health = VhcHealth, Table = "Vans", TableNbr = tonumber(_)}
						TriggerServerEvent('BuyVehicle', json.encode(Choose))
                    end,
                })
            end
			RageUI.Item.Button("Retour", "", {}, true, {
				onSelected = function()
                    for _,v in pairs (Storage.LastVhc) do
                        DeleteEntity(v)
                    end
                    Position.Timing = 2000
                    SetEntityCoords(PlayerPedId(), Storage.ShopsOut.x, Storage.ShopsOut.y, Storage.ShopsOut.z)
                    SetEntityHeading(PlayerPedId(), Storage.ShopsOut.h)
                    SetEntityVisible(PlayerPedId(), true)
					FreezeEntityPosition(PlayerPedId(), false)
					RageUI.CloseAll()
					Citizen.Wait(Position.Timing)
					Storage.InMenu = false
				end,
			})
        end)

        RageUI.IsVisible(RMenu:Get('OffRoad', 'Principal'), function()
            RageUI.Item.Separator("--- OffRoad ---")
            for _,v in pairs (Storage.CarChoosen.OffRoad) do
                RageUI.Item.Button(v.Name, "", {RightLabel = "~g~"..v.Price.." $"}, true, {
                    onActive = function()
                        SpawnCar(v.Value)
                    end,
                    onSelected = function()
                        CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
                        VhcProps = ESX.Game.GetVehicleProperties(CrtVhc)
                        VhcPlate = GetVehicleNumberPlateText(CrtVhc)
                        VhcHealth = GetEntityHealth(CrtVhc)
                        Choose = {Token = json.encode(TokenGen), Label = v.Name, Hash = v.Value, Price = v.Price, Plate = VhcPlate, Props = VhcProps, Health = VhcHealth, Table = "OffRoad", TableNbr = tonumber(_)}
						TriggerServerEvent('BuyVehicle', json.encode(Choose))
                    end,
                })
            end
			RageUI.Item.Button("Retour", "", {}, true, {
				onSelected = function()
                    for _,v in pairs (Storage.LastVhc) do
                        DeleteEntity(v)
                    end
                    Position.Timing = 2000
                    SetEntityCoords(PlayerPedId(), Storage.ShopsOut.x, Storage.ShopsOut.y, Storage.ShopsOut.z)
                    SetEntityHeading(PlayerPedId(), Storage.ShopsOut.h)
                    SetEntityVisible(PlayerPedId(), true)
					FreezeEntityPosition(PlayerPedId(), false)
					RageUI.CloseAll()
					Citizen.Wait(Position.Timing)
					Storage.InMenu = false
				end,
			})
        end)

        RageUI.IsVisible(RMenu:Get('Suv', 'Principal'), function()
            RageUI.Item.Separator("--- Suv ---")
            for _,v in pairs (Storage.CarChoosen.Suv) do
                RageUI.Item.Button(v.Name, "", {RightLabel = "~g~"..v.Price.." $"}, true, {
                    onActive = function()
                        SpawnCar(v.Value)
                    end,
                    onSelected = function()
                        CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
                        VhcProps = ESX.Game.GetVehicleProperties(CrtVhc)
                        VhcPlate = GetVehicleNumberPlateText(CrtVhc)
                        VhcHealth = GetEntityHealth(CrtVhc)
                        Choose = {Token = json.encode(TokenGen), Label = v.Name, Hash = v.Value, Price = v.Price, Plate = VhcPlate, Props = VhcProps, Health = VhcHealth, Table = "Suv", TableNbr = tonumber(_)}
						TriggerServerEvent('BuyVehicle', json.encode(Choose))
                    end,
                })
            end
			RageUI.Item.Button("Retour", "", {}, true, {
				onSelected = function()
                    for _,v in pairs (Storage.LastVhc) do
                        DeleteEntity(v)
                    end
                    Position.Timing = 2000
                    SetEntityCoords(PlayerPedId(), Storage.ShopsOut.x, Storage.ShopsOut.y, Storage.ShopsOut.z)
                    SetEntityHeading(PlayerPedId(), Storage.ShopsOut.h)
                    SetEntityVisible(PlayerPedId(), true)
					FreezeEntityPosition(PlayerPedId(), false)
					RageUI.CloseAll()
					Citizen.Wait(Position.Timing)
					Storage.InMenu = false
				end,
			})
        end)

        RageUI.IsVisible(RMenu:Get('Compact', 'Principal'), function()
            RageUI.Item.Separator("--- Compacts ---")
            for _,v in pairs (Storage.CarChoosen.Compacts) do
                RageUI.Item.Button(v.Name, "", {RightLabel = "~g~"..v.Price.." $"}, true, {
                    onActive = function()
                        SpawnCar(v.Value)
                    end,
                    onSelected = function()
                        CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
                        VhcProps = ESX.Game.GetVehicleProperties(CrtVhc)
                        VhcPlate = GetVehicleNumberPlateText(CrtVhc)
                        VhcHealth = GetEntityHealth(CrtVhc)
                        Choose = {Token = json.encode(TokenGen), Label = v.Name, Hash = v.Value, Price = v.Price, Plate = VhcPlate, Props = VhcProps, Health = VhcHealth, Table = "Compacts", TableNbr = tonumber(_)}
						TriggerServerEvent('BuyVehicle', json.encode(Choose))
                    end,
                })
            end
			RageUI.Item.Button("Retour", "", {}, true, {
				onSelected = function()
                    for _,v in pairs (Storage.LastVhc) do
                        DeleteEntity(v)
                    end
                    Position.Timing = 2000
                    SetEntityCoords(PlayerPedId(), Storage.ShopsOut.x, Storage.ShopsOut.y, Storage.ShopsOut.z)
                    SetEntityHeading(PlayerPedId(), Storage.ShopsOut.h)
                    SetEntityVisible(PlayerPedId(), true)
					FreezeEntityPosition(PlayerPedId(), false)
					RageUI.CloseAll()
					Citizen.Wait(Position.Timing)
					Storage.InMenu = false
				end,
			})
        end)

        RageUI.IsVisible(RMenu:Get('Moto', 'Principal'), function()
            RageUI.Item.Separator("--- Moto ---")
            for _,v in pairs (Storage.CarChoosen.Moto) do
                RageUI.Item.Button(v.Name, "", {RightLabel = "~g~"..v.Price.." $"}, true, {
                    onActive = function()
                        SpawnCar(v.Value)
                    end,
                    onSelected = function()
                        CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
                        VhcProps = ESX.Game.GetVehicleProperties(CrtVhc)
                        VhcPlate = GetVehicleNumberPlateText(CrtVhc)
                        VhcHealth = GetEntityHealth(CrtVhc)
                        Choose = {Token = json.encode(TokenGen), Label = v.Name, Hash = v.Value, Price = v.Price, Plate = VhcPlate, Props = VhcProps, Health = VhcHealth, Table = "Moto", TableNbr = tonumber(_)}
						TriggerServerEvent('BuyVehicle', json.encode(Choose))
                    end,
                })
            end
			RageUI.Item.Button("Retour", "", {}, true, {
				onSelected = function()
                    for _,v in pairs (Storage.LastVhc) do
                        DeleteEntity(v)
                    end
                    Position.Timing = 2000
                    SetEntityCoords(PlayerPedId(), Storage.ShopsOut.x, Storage.ShopsOut.y, Storage.ShopsOut.z)
                    SetEntityHeading(PlayerPedId(), Storage.ShopsOut.h)
                    SetEntityVisible(PlayerPedId(), true)
					FreezeEntityPosition(PlayerPedId(), false)
					RageUI.CloseAll()
					Citizen.Wait(Position.Timing)
					Storage.InMenu = false
				end,
			})
        end)

        RageUI.IsVisible(RMenu:Get('Velo', 'Principal'), function()
            RageUI.Item.Separator("--- Vélo ---")
            for _,v in pairs (VehicleList.Velo) do
                RageUI.Item.Button(v.Name, "", {RightLabel = "~g~"..v.Price.." $"}, true, {
                    onActive = function()
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
                    for _,v in pairs (Storage.LastVhc) do
                        DeleteEntity(v)
                    end
                    Position.Timing = 2000
                    SetEntityCoords(PlayerPedId(), Storage.ShopsOut.x, Storage.ShopsOut.y, Storage.ShopsOut.z)
                    SetEntityHeading(PlayerPedId(), Storage.ShopsOut.h)
                    SetEntityVisible(PlayerPedId(), true)
					FreezeEntityPosition(PlayerPedId(), false)
					RageUI.CloseAll()
					Citizen.Wait(Position.Timing)
					Storage.InMenu = false
				end,
			})
        end)
        
    end
end