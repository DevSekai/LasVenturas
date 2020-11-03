ESX = nil
TokenGen = {}

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
	end
    TriggerServerEvent("GetToken")
    CreateShops()
    ESX.TriggerServerCallback('GetVehicleChoose', function(Cars)
        Shops.CarChoosen = Cars
	end)
end)

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(Shops.Timing)

		if not InMenu then
			for _,v in pairs (Shops.Coords) do
				local distanceShops = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.x, v.y, v.z, true)
				if distanceShops < Shops.MarkerDist then
					Shops.Timing = 0
					DrawMarker(Shops.MarkerType, v.x, v.y, v.z + 0.98, 0, 0, 0, 0, 0, 0, Shops.MarkerScale, Shops.MarkerScale, Shops.MarkerScale, Shops.MarkerR, Shops.MarkerG, Shops.MarkerB, Shops.MarkerA, false, true, 2, true, nil, false)
					if distanceShops < Shops.PedDist then
						ESX.ShowHelpNotification('Appuyer sur ~INPUT_CONTEXT~ pour acceder au véhicules disponible.')
                        if IsControlJustReleased(1, 51) then
                            Shops.ShopsIn = {x = v.cx, y = v.cy, z = v.cz, h = v.ch}
                            Shops.ShopsOut = {x = v.x, y = v.y, z = v.z, h = v.h}
                            Shops.BuyOut = {x = v.box, y = v.boy, z = v.boz, h = v.boh}
							ShowMenu(v.Menu)
						end
					else
						if not InMenu then
							Shops.Timing = 2000
						end
					end
				end
			end
		end
	end
end)

function SpawnCar(VhcName)
    CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
    HashCar = GetEntityModel(CrtVhc)
    if HashCar ~= GetHashKey(VhcName) then
        for _,v in pairs (Shops.LastVhc) do
            DeleteEntity(v)
        end
    end
    if not DoesEntityExist(Vehicle) then
		NewPlate = GeneratePlate()
        Car = RequestModel(GetHashKey(VhcName))
        while not HasModelLoaded(Car) do
            RequestModel(Car)
            Citizen.Wait(1)
        end
        Vehicle = CreateVehicle(GetHashKey(VhcName), Shops.ShopsIn.x, Shops.ShopsIn.y, Shops.ShopsIn.z, Shops.ShopsIn.h, false, true)
        TaskWarpPedIntoVehicle(PlayerPedId(), Vehicle, -1)
        FreezeEntityPosition(Vehicle, true)
        SetVehicleNumberPlateText(Vehicle, NewPlate)

        SetEntityVisible(PlayerPedId(), false)
        table.insert(Shops.LastVhc, Vehicle)
    end
end

RegisterNetEvent("SendToken")
AddEventHandler("SendToken", function(Token)
	TokenGen.Key = Token
end)

function CreateShops()
    for k,v in pairs (Shops.Coords) do
        local Blips = AddBlipForCoord(v.x, v.y, v.z)
            SetBlipDisplay(Blips, 4)
            SetBlipAsShortRange(Blips, true)
            BeginTextCommandSetBlipName("STRING")
        if v.Type == "Auto" then
            SetBlipSprite (Blips, Shops.Car.BlipSprite)
            SetBlipScale  (Blips, Shops.Car.BlipScale)
            SetBlipColour (Blips, Shops.Car.BlipColor)
            AddTextComponentString(Shops.Car.BlipLabel)
            EndTextCommandSetBlipName(Blips)
            RequestModel(Shops.Car.Ped)
            while not HasModelLoaded(Shops.Car.Ped) do
                RequestModel(Shops.Car.Ped)
                Citizen.Wait(10)
            end
            Peds = CreatePed(1, Shops.Car.Ped, v.x, v.y, v.z - 0.98, 0.0, false, true)
            SetEntityHeading(Peds, v.h)
            FreezeEntityPosition(Peds, true)
			SetEntityInvincible(Peds, true)
			SetBlockingOfNonTemporaryEvents(Peds, true)
        else
            SetBlipSprite (Blips, Shops.Bike.BlipSprite)
            SetBlipScale  (Blips, Shops.Bike.BlipScale)
            SetBlipColour (Blips, Shops.Bike.BlipColor)
            AddTextComponentString(Shops.Bike.BlipLabel)
            EndTextCommandSetBlipName(Blips)
            RequestModel(Shops.Bike.Ped)
            while not HasModelLoaded(Shops.Bike.Ped) do
                RequestModel(Shops.Bike.Ped)
                Citizen.Wait(10)
            end
            Peds = CreatePed(1, Shops.Bike.Ped, v.x, v.y, v.z - 0.98, 0.0, false, true)
            SetEntityHeading(Peds, v.h)
            FreezeEntityPosition(Peds, true)
			SetEntityInvincible(Peds, true)
			SetBlockingOfNonTemporaryEvents(Peds, true)
        end
		FreezeEntityPosition(Peds, true)
		SetEntityInvincible(Peds, true)
		SetBlockingOfNonTemporaryEvents(Peds, true)
		RequestAnimDict(Shops.AnimDict)
		while not HasAnimDictLoaded(Shops.AnimDict) do
		  	Citizen.Wait(0)
		end
		TaskPlayAnim(Peds, Shops.AnimDict, Shops.Anim, 8.0, 0.0, -1, 1, 0, 0, 0, 0)
    end
end

local NumberCharset = {}
local Charset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end

for i = 65,  90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

function GeneratePlate()
	local generatedPlate
	local doBreak = false

	while true do
		Citizen.Wait(0)
		math.randomseed(GetGameTimer())
        generatedPlate = string.upper(GetRandomLetter(2) .. ' ' .. GetRandomNumber(3) .. GetRandomLetter(2))

		ESX.TriggerServerCallback('IsPlateTaken', function(isPlateTaken)
			if not isPlateTaken then
				doBreak = true
			end
		end, generatedPlate)

		if doBreak then
			break
		end
	end

	return generatedPlate
end

-- mixing async with sync tasks
function IsPlateTaken(plate)
	local callback = 'waiting'

	ESX.TriggerServerCallback('IsPlateTaken', function(isPlateTaken)
		callback = isPlateTaken
	end, plate)

	while type(callback) == 'string' do
		Citizen.Wait(0)
	end

	return callback
end

function GetRandomNumber(length)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

function GetRandomLetter(length)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end

RegisterNetEvent('BuyVehicle')
AddEventHandler('BuyVehicle', function(BuyedVehicle)
	Result = json.decode(BuyedVehicle)
	for _,v in pairs (Shops.LastVhc) do
		DeleteEntity(v)
	end
	Shops.LastVhc = {}
	NewVhc = CreateVehicle(GetHashKey(Result.Hash), Shops.BuyOut.x, Shops.BuyOut.y, Shops.BuyOut.z, Shops.BuyOut.h, true, true)
	SetVehicleNumberPlateText(NewVhc, Result.Plate)
	ESX.Game.SetVehicleProperties(NewVhc, Result.Props)
	TaskWarpPedIntoVehicle(PlayerPedId(), NewVhc, -1)
	SetEntityAsMissionEntity(NewVhc, true, true)
	SetEntityVisible(PlayerPedId(), true)
	FreezeEntityPosition(PlayerPedId(), false)
	FreezeEntityPosition(NewVhc, false)
	Shops.Timing = 2000
	InMenu = false
	RageUI.CloseAll()
end)