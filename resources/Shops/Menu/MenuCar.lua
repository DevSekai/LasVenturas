MdpCar, CarPrice = "Ntm", 0
LastPlyPos, LastVehicle = nil, {}

RMenu.Add('Car', 'Principal', RageUI.CreateMenu("", "", nil, nil, "root_cause", "banner"), true)
RMenu:Get('Car', 'Principal'):SetSubtitle("~y~Stand de masque")
RMenu:Get('Car', 'Principal'):DisplayGlare(false);
RMenu:Get('Car', 'Principal').Closable = false;

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)

		if not InMenu then
			local playerCoords = GetEntityCoords(PlayerPedId())
			for _,v in pairs (Config.Car.Pos) do
				local distanceCar = GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, false)
				if distanceCar < 2.5 then
					ESX.ShowHelpNotification('Appuyer sur ~INPUT_CONTEXT~ pour acheter une véhicule.')
					if IsControlJustReleased(1, 51) then
						LastPlyPos = GetEntityCoords(PlayerPedId())
						RageUI.Visible(RMenu:Get('Car', 'Principal'), not RageUI.Visible(RMenu:Get('Car', 'Principal')))
						FreezeEntityPosition(PlayerPedId(), true)
						SetEntityVisible(PlayerPedId(), false)
						InMenu = true
					end
				end
			end
		end

		RageUI.IsVisible(RMenu:Get('Car', 'Principal'), function()
		RageUI.Item.Separator("[~y~Prix~s~] : ~g~"..CarPrice.." $")
			for _,v in pairs (Config.Car.Categorie) do
				RageUI.Item.List(v.Label, v.Vehicle, 1, nil, {}, true, {
					onListChange = function(Index, Items)
						VhcPlate = GeneratePlate()
						for _,v in pairs (LastVehicle) do
							DeleteVehicle(v)
						end
						ESX.Game.SpawnLocalVehicle(Items.Value, Config.Car.InCar, Config.Car.InCarHeading, function(Vhc)
							TaskWarpPedIntoVehicle(PlayerPedId(), Vhc, -1)
							SetVehicleNumberPlateText(Vhc, VhcPlate)
							table.insert(LastVehicle, Vhc)
						end)
						CarPrice = Items.Price
					end,
	                onSelected = function(Index, Items)
	                	TriggerServerEvent('BuyCar', MdpCar, VhcPlate, Items.Name, Items.Value, Items.Price)
	                end,
				})
			end
            RageUI.Item.Button("Retour", "", {}, true, {
                onSelected = function()
					for _,v in pairs (LastVehicle) do
						DeleteVehicle(v)
					end
					SetEntityVisible(PlayerPedId(), true)
					FreezeEntityPosition(PlayerPedId(), false)
					SetEntityCoords(PlayerPedId(), LastPlyPos)
					LastVehicle = {}
					InMenu = false
					RageUI.CloseAll()
                end,
            })
	    end)
	end
end)