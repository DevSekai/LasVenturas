ESX = nil
TokenGen = {}
InZone = {}

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
	end
    TriggerServerEvent("GetToken")
    CreatePosition()
    ESX.TriggerServerCallback('GetVehicleChoose', function(Cars)
		Storage.CarChoosen = Cars
	end)
end)

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(Position.Timing)

		if not Storage.InMenu then
			for _,v in pairs (Position.Coords) do
				if v.Class == "Shops" then
					local distanceShops = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.x, v.y, v.z, true)
					if distanceShops < Position.MarkerDist then
						Position.Timing = 0
						InZone[v.Name] = true
						DrawMarker(Position.MarkerType, v.x, v.y, v.z + 0.98, 0, 0, 0, 0, 0, 0, Position.MarkerScale, Position.MarkerScale, Position.MarkerScale, Position.MarkerR, Position.MarkerG, Position.MarkerB, Position.MarkerA, false, true, 2, true, nil, false)
						if distanceShops < Position.PedDist then
							ESX.ShowHelpNotification('Appuyer sur ~INPUT_CONTEXT~ pour acceder au véhicules disponible.')
							if IsControlJustReleased(1, 51) then
								Storage.ShopsIn = {x = v.cx, y = v.cy, z = v.cz, h = v.ch}
								Storage.ShopsOut = {x = v.x, y = v.y, z = v.z, h = v.h}
								Storage.BuyOut = {x = v.box, y = v.boy, z = v.boz, h = v.boh}
								ShowMenu(v.Menu)
							end
						end
					else
						if InZone[v.Name] then
							Position.Timing = 2000
							InZone[v.Name] = false
						end
					end
				elseif v.Class == "Storage" then
					if not IsPedSittingInAnyVehicle(PlayerPedId()) then
						distanceStorage = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.x, v.y, v.z, true)
					else
						distanceStorage = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.cx, v.cy, v.cz, true)
					end
					if distanceStorage < Position.MarkerDist2 then
						Position.Timing = 0
						InZone[v.Name] = true
						if not IsPedSittingInAnyVehicle(PlayerPedId()) then
							DrawMarker(Position.MarkerType, v.x, v.y, v.z + 0.98, 0, 0, 0, 0, 0, 0, Position.MarkerScale, Position.MarkerScale, Position.MarkerScale, Position.MarkerR, Position.MarkerG, Position.MarkerB, Position.MarkerA, false, true, 2, true, nil, false)
						else
							DrawMarker(Position.MarkerType2, v.cx, v.cy, v.cz - 1.98, 0, 0, 0, 0, 0, 0, Position.MarkerScale2, Position.MarkerScale2, Position.MarkerScale2, Position.MarkerR2, Position.MarkerG2, Position.MarkerB2, Position.MarkerA2, false, true, 2, true, nil, false)
						end
						if distanceStorage < Position.PedDist2 then
							if not IsPedSittingInAnyVehicle(PlayerPedId()) then
								ESX.ShowHelpNotification('Appuyer sur ~INPUT_CONTEXT~ pour acceder au véhicules disponible.')
							else
								ESX.ShowHelpNotification('Appuyer sur ~INPUT_CONTEXT~ pour ranger votre.')
							end
							if IsControlJustReleased(1, 51) then
								if not IsPedSittingInAnyVehicle(PlayerPedId()) then
									Storage.CarOut = {x = v.box, y = v.boy, z = v.boz, h = v.boh}
									Storage.CarIn = {x = v.x, y = v.y, z = v.z, h = v.h}
									ShowMenu(v.Menu)
								else
									CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
									VhcProps = ESX.Game.GetVehicleProperties(CrtVhc)
									VhcPlate = GetVehicleNumberPlateText(CrtVhc)
									VhcHealth = GetEntityHealth(CrtVhc)
									Choose = {Token = json.encode(TokenGen), Plate = VhcPlate, Props = VhcProps, Health = VhcHealth}
									TriggerServerEvent('InVehicle', json.encode(Choose))
								end
							end
						end
					else
						if InZone[v.Name] then
							Position.Timing = 2000
							InZone[v.Name] = false
						end
					end
				end
			end
		end
	end
end)

RegisterNetEvent("Trunk:RefreshTrunk")
AddEventHandler("Trunk:RefreshTrunk", function(CWeight)
	Storage.CrtWeight = CWeight
end)

function SpawnCar(VhcName)
    CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
    HashCar = GetEntityModel(CrtVhc)
    if HashCar ~= GetHashKey(VhcName) then
        for _,v in pairs (Storage.LastVhc) do
            DeleteEntity(v)
        end
    end
    if not DoesEntityExist(Vehicle) then
		NewPlate = GeneratePlate()
        Car = RequestModel(GetHashKey(VhcName))
        while not HasModelLoaded(Car) do
            RequestModel(Car)
            Citizen.Wait(0)
        end
        Vehicle = CreateVehicle(GetHashKey(VhcName), Storage.ShopsIn.x, Storage.ShopsIn.y, Storage.ShopsIn.z, Storage.ShopsIn.h, false, true)
        TaskWarpPedIntoVehicle(PlayerPedId(), Vehicle, -1)
        FreezeEntityPosition(Vehicle, true)
        SetVehicleNumberPlateText(Vehicle, NewPlate)

        SetEntityVisible(PlayerPedId(), false)
        table.insert(Storage.LastVhc, Vehicle)
    end
end

RegisterNetEvent("SendToken")
AddEventHandler("SendToken", function(Token)
	TokenGen.Key = Token
end)

function CreatePosition()
    for k,v in pairs (Position.Coords) do
        local Blips = AddBlipForCoord(v.x, v.y, v.z)
            SetBlipDisplay(Blips, 4)
            SetBlipAsShortRange(Blips, true)
            BeginTextCommandSetBlipName("STRING")
        if v.Type == "Auto" then
            SetBlipSprite (Blips, Position.Car.BlipSprite)
            SetBlipScale  (Blips, Position.Car.BlipScale)
            SetBlipColour (Blips, Position.Car.BlipColor)
            AddTextComponentString(Position.Car.BlipLabel)
            EndTextCommandSetBlipName(Blips)
            RequestModel(Position.Car.Ped)
            while not HasModelLoaded(Position.Car.Ped) do
                RequestModel(Position.Car.Ped)
                Citizen.Wait(10)
            end
            Peds = CreatePed(1, Position.Car.Ped, v.x, v.y, v.z - 0.98, 0.0, false, true)
            SetEntityHeading(Peds, v.h)
            FreezeEntityPosition(Peds, true)
			SetEntityInvincible(Peds, true)
			SetBlockingOfNonTemporaryEvents(Peds, true)
        elseif v.Type == "Garage" then
            SetBlipSprite (Blips, Position.Garage.BlipSprite)
            SetBlipScale  (Blips, Position.Garage.BlipScale)
            SetBlipColour (Blips, Position.Garage.BlipColor)
            AddTextComponentString(Position.Garage.BlipLabel)
            EndTextCommandSetBlipName(Blips)
            RequestModel(Position.Garage.Ped)
            while not HasModelLoaded(Position.Garage.Ped) do
                RequestModel(Position.Garage.Ped)
                Citizen.Wait(10)
            end
            Peds = CreatePed(1, Position.Garage.Ped, v.x, v.y, v.z - 0.98, 0.0, false, true)
            SetEntityHeading(Peds, v.h)
            FreezeEntityPosition(Peds, true)
			SetEntityInvincible(Peds, true)
			SetBlockingOfNonTemporaryEvents(Peds, true)
        elseif v.Type == "Fourriere" then
            SetBlipSprite (Blips, Position.Fourriere.BlipSprite)
            SetBlipScale  (Blips, Position.Fourriere.BlipScale)
            SetBlipColour (Blips, Position.Fourriere.BlipColor)
            AddTextComponentString(Position.Fourriere.BlipLabel)
            EndTextCommandSetBlipName(Blips)
            RequestModel(Position.Fourriere.Ped)
            while not HasModelLoaded(Position.Fourriere.Ped) do
                RequestModel(Position.Fourriere.Ped)
                Citizen.Wait(10)
            end
            Peds = CreatePed(1, Position.Fourriere.Ped, v.x, v.y, v.z - 0.98, 0.0, false, true)
            SetEntityHeading(Peds, v.h)
            FreezeEntityPosition(Peds, true)
			SetEntityInvincible(Peds, true)
			SetBlockingOfNonTemporaryEvents(Peds, true)
        else
            SetBlipSprite (Blips, Position.Bike.BlipSprite)
            SetBlipScale  (Blips, Position.Bike.BlipScale)
            SetBlipColour (Blips, Position.Bike.BlipColor)
            AddTextComponentString(Position.Bike.BlipLabel)
            EndTextCommandSetBlipName(Blips)
            RequestModel(Position.Bike.Ped)
            while not HasModelLoaded(Position.Bike.Ped) do
                RequestModel(Position.Bike.Ped)
                Citizen.Wait(10)
            end
            Peds = CreatePed(1, Position.Bike.Ped, v.x, v.y, v.z - 0.98, 0.0, false, true)
            SetEntityHeading(Peds, v.h)
            FreezeEntityPosition(Peds, true)
			SetEntityInvincible(Peds, true)
			SetBlockingOfNonTemporaryEvents(Peds, true)
        end
		FreezeEntityPosition(Peds, true)
		SetEntityInvincible(Peds, true)
		SetBlockingOfNonTemporaryEvents(Peds, true)
		RequestAnimDict(Position.AnimDict)
		while not HasAnimDictLoaded(Position.AnimDict) do
		  	Citizen.Wait(0)
		end
		TaskPlayAnim(Peds, Position.AnimDict, Position.Anim, 8.0, 0.0, -1, 1, 0, 0, 0, 0)
    end
end

local NumberCharset = {}
local Charset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end

for i = 65,  90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

function GeneratePlate()
	local generatedPlate

		math.randomseed(GetGameTimer())
        generatedPlate = string.upper(GetRandomLetter(2) .. ' ' .. GetRandomNumber(3) .. GetRandomLetter(2))

		ESX.TriggerServerCallback('IsPlateTaken', function(isPlateTaken)
			if isPlateTaken then
				GeneratePlate()
			end
		end, generatedPlate)

	return generatedPlate
end

-- mixing async with sync tasks
function IsPlateTaken(plate)
	local callback = 'waiting'

	ESX.TriggerServerCallback('IsPlateTaken', function(isPlateTaken)
		callback = isPlateTaken
	end, plate)

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

RegisterNetEvent('RentCar')
AddEventHandler('RentCar', function(RentedVehicle)
	for _,v in pairs (Storage.LastVhc) do
		DeleteEntity(v)
	end
	Storage.LastVhc = {}
	NewVhc = CreateVehicle(GetHashKey(RentedVehicle), Storage.BuyOut.x, Storage.BuyOut.y, Storage.BuyOut.z, Storage.BuyOut.h, true, true)
	SetVehicleNumberPlateText(NewVhc, "~RENTAL~")
	TaskWarpPedIntoVehicle(PlayerPedId(), NewVhc, -1)
	SetEntityAsMissionEntity(NewVhc, true, true)
	SetEntityVisible(PlayerPedId(), true)
	FreezeEntityPosition(PlayerPedId(), false)
	FreezeEntityPosition(NewVhc, false)
	Position.Timing = 2000
	Storage.InMenu = false
	RageUI.CloseAll()
end)

RegisterNetEvent('BuyVehicle')
AddEventHandler('BuyVehicle', function(BuyedVehicle)
	Result = json.decode(BuyedVehicle)
	for _,v in pairs (Storage.LastVhc) do
		DeleteEntity(v)
	end
	Storage.LastVhc = {}
	NewVhc = CreateVehicle(GetHashKey(Result.Hash), Storage.BuyOut.x, Storage.BuyOut.y, Storage.BuyOut.z, Storage.BuyOut.h, true, true)
	SetVehicleNumberPlateText(NewVhc, Result.Plate)
	ESX.Game.SetVehicleProperties(NewVhc, Result.Props)
	TaskWarpPedIntoVehicle(PlayerPedId(), NewVhc, -1)
	SetEntityAsMissionEntity(NewVhc, true, true)
	SetEntityVisible(PlayerPedId(), true)
	FreezeEntityPosition(PlayerPedId(), false)
	FreezeEntityPosition(NewVhc, false)
	Position.Timing = 2000
	Storage.InMenu = false
	RageUI.CloseAll()
end)

RegisterNetEvent('VehicleBuyed')
AddEventHandler('VehicleBuyed', function(BuyedVehicle)
	Result = json.decode(BuyedVehicle)
	if Result.Table == "Super" then
		table.remove(Storage.CarChoosen.Super, tonumber(Result.TableNbr))
	elseif Result.Table == "Classique" then
		table.remove(Storage.CarChoosen.Classique, tonumber(Result.TableNbr))
	elseif Result.Table == "Sport" then
		table.remove(Storage.CarChoosen.Sport, tonumber(Result.TableNbr))
	elseif Result.Table == "Sedans" then
		table.remove(Storage.CarChoosen.Sedans, tonumber(Result.TableNbr))
	elseif Result.Table == "Muscle" then
		table.remove(Storage.CarChoosen.Muscle, tonumber(Result.TableNbr))
	elseif Result.Table == "Vans" then
		table.remove(Storage.CarChoosen.Vans, tonumber(Result.TableNbr))
	elseif Result.Table == "OffRoad" then
		table.remove(Storage.CarChoosen.OffRoad, tonumber(Result.TableNbr))
	elseif Result.Table == "Suv" then
		table.remove(Storage.CarChoosen.Suv, tonumber(Result.TableNbr))
	elseif Result.Table == "Compacts" then
		table.remove(Storage.CarChoosen.Compacts, tonumber(Result.TableNbr))
	elseif Result.Table == "Moto" then
		table.remove(Storage.CarChoosen.Moto, tonumber(Result.TableNbr))
	end
end)

RegisterNetEvent('InVehicle')
AddEventHandler('InVehicle', function()
	CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
	SetEntityAsMissionEntity(CrtVhc, true, true)
	DeleteEntity(CrtVhc)
end)

RegisterNetEvent('OutEnsuredVehicle')
AddEventHandler('OutEnsuredVehicle', function()
	CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
	Citizen.Wait(1000)
	EnsuredBlips = AddBlipForEntity(CrtVhc)
	SetBlipDisplay(EnsuredBlips, 4)
	SetBlipAsShortRange(EnsuredBlips, true)
	BeginTextCommandSetBlipName("STRING")
	SetBlipSprite (EnsuredBlips, 225)
	SetBlipScale  (EnsuredBlips, 0.6)
	SetBlipColour (EnsuredBlips, 1)
	AddTextComponentString("Véhicule : "..GetVehicleNumberPlateText(CrtVhc))
	EndTextCommandSetBlipName(EnsuredBlips)
end)

RegisterNetEvent('OutFourriere')
AddEventHandler('OutFourriere', function(Vehicles)
	SpawnCoords = vector3(Storage.CarOut.x, Storage.CarOut.y, Storage.CarOut.z)
	ESX.Game.SpawnVehicle(Vehicles.Hash, SpawnCoords, Storage.CarOut.h, function(Vehicle)
		ESX.Game.SetVehicleProperties(Vehicle, json.encode(Vehicles.Props))
		SetVehRadioStation(Vehicle, "OFF")
		SetVehicleFixed(Vehicle)
		SetVehicleDeformationFixed(Vehicle)
		SetVehicleUndriveable(Vehicle, false)
		SetVehicleEngineOn(Vehicle, true, true)
		SetEntityHealth(Vehicle, tonumber(Vehicles.Health))
		SetVehicleNumberPlateText(Vehicle, Vehicles.Plate)
		local carplate = GetVehicleNumberPlateText(Vehicle)
		SetEntityAsMissionEntity(Vehicle, true, true)
		TaskWarpPedIntoVehicle(PlayerPedId(), Vehicle, -1)
	end)
	Position.Timing = 2000
	FreezeEntityPosition(PlayerPedId(), false)
	RageUI.CloseAll()
	Citizen.Wait(Position.Timing)
	Storage.InMenu = false
end)