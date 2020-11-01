ESX = nil
TokenGen = {}

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
	end
    TriggerServerEvent("GetToken")
    CreateShops()
end)

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