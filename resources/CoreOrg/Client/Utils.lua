ESX = nil
TokenGen = {}
InMenu = false
Timing = 2000
PlayerData = nil
Handcuffed = false
InCarOut = false
InZone = {}

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
	end
	TriggerServerEvent("GetOrgToken")      
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
    PlayerData.job2 = job2
end)

RegisterNetEvent("SendOrgToken")
AddEventHandler("SendOrgToken", function(Token)
	TokenGen.Key = Token
end)

function drawTxt(content, font, colour, scale, x, y)
    SetTextFont(font)
    SetTextScale(scale, scale)
    SetTextColour(colour[1],colour[2],colour[3], 255)
    SetTextEntry("STRING")
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
    AddTextComponentString(content)
    DrawText(x, y)
end

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(Timing)

		if PlayerData ~= nil then
			if not InMenu then
				for _,v in pairs (Org.Wl[PlayerData.job2.name].Coords) do
					local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.x, v.y, v.z, true)
					if distance < Org.MarkerDist then
						Timing = 0
						InZone[v.Type] = true
						DrawMarker(v.MarkerType, v.x, v.y, v.z, 0, 0, 0, 0, 0, 0, v.MarkerScale, v.MarkerScale, v.MarkerScale, v.MarkerR, v.MarkerG, v.MarkerB, v.MarkerA, false, true, 2, true, nil, false)
						if distance < Org.PedDist then
							if v.Type ~= "DeleteCar" then
								ESX.ShowHelpNotification('Appuyer sur ~INPUT_CONTEXT~ pour acceder au menu.')
							else
								ESX.ShowHelpNotification('Appuyer sur ~INPUT_CONTEXT~ pour rentrer le véhicule.')
							end
							if IsControlJustReleased(1, 51) then
								ShowMenu(v.Type)
							end
						end
					else
						if InZone[v.Type] then
							Timing = 2000
							InZone[v.Type] = false
						end
					end
				end
				for _,v in pairs (Org.Wl.Objects) do
					local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(v), true)
					if distance < Org.MarkerDist then
						Timing = 0
						InZone[v] = true
						if distance < Org.PedDist then
							ESX.ShowHelpNotification("Appuyer sur ~INPUT_PICKUP~ pour enlever l'objets.")
							if IsControlJustReleased(1, 38) then
								DeleteEntity(v)
							end
						end
					else
						if InZone[v] then
							Timing = 2000
							InZone[v] = false
						end
					end
				end
			end
		else
			PlayerData = ESX.GetPlayerData()
			ESX.ShowNotification("Personnage chargé")
		end
	end
end)

function KeyboardInput(TextEntry, ExampleText, MaxStringLength)
    AddTextEntry("FMMC_KEY_TIP1", TextEntry .. "")
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLength)
    blockinput = true

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        blockinput = false
        return result
    else
        Citizen.Wait(500)
        blockinput = false
        return nil
    end
end

function AddChest2(Data)
	ESX.ShowNotification(Data.Amount)
	if Data.Type == "Money" then
		TriggerServerEvent('esx_society:depositMoney', PlayerData.job2.name, tonumber(Data.Amount))
		ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(Money)
			Org.Wl.Society_Money = Money
		end, PlayerData.job2.name)
	else
		TriggerServerEvent('putStockItems2', Data.Item, tonumber(Data.Amount))
		ESX.TriggerServerCallback('getPlayerInventory', function(inventory)
			Org.Wl.PlyInv = {}
			for i=1, #inventory.items, 1 do
				local item = inventory.items[i]
				if item.count >= 1 then
					table.insert(Org.Wl.PlyInv, {label = item.label .. ' x' .. tonumber(item.count), type = 'item_standard', value = item.name})
				end
			end
		end)
	end
end

function RemoveChest2(Data)
	if Data.Type == "Money" then
		TriggerServerEvent('esx_society:withdrawMoney', PlayerData.job2.name, tonumber(Data.Amount))
		ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(Money)
			Org.Wl.Society_Money = Money
		end, PlayerData.job2.name)
	else
		TriggerServerEvent('getStockItem2', Data.Item, tonumber(Data.Amount))
		Org.Wl.SctInv = {}
		ESX.TriggerServerCallback('getStockItems2', function(Sitems)
			for i=1, #Sitems,1 do
				if Sitems[i].count >= 1 then
					table.insert(Org.Wl.SctInv, {label = Sitems[i].label..' x ' .. tonumber(Sitems[i].count), value = Sitems[i].name, Count = tonumber(Sitems[i].count)})
				end
			end
		end)
	end
end

function SpawnOrgCar(Car, Pos)
    if not DoesEntityExist(Vehicle) then
        VhcName = RequestModel(Car)
        while not HasModelLoaded(Car) do
            RequestModel(Car)
            Citizen.Wait(0)
        end
        Vehicle = CreateVehicle(GetHashKey(Car), Pos.x, Pos.y, Pos.z, Pos.h, true, true)
        TaskWarpPedIntoVehicle(PlayerPedId(), Vehicle, -1)
		SetVehicleNumberPlateText(Vehicle, "LASV")
		SetVehicleRadioEnabled(Vehicle, false)
		FreezeEntityPosition(PlayerPedId(), false)
		Timing = 2000
		RageUI.CloseAll()
		InMenu = false
    end
end