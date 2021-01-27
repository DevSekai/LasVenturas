ESX = nil
PlayerData = {}

Citizen.CreateThread( function()
	exports.spawnmanager:setAutoSpawn(false)
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
	end
	PlayerData = ESX.GetPlayerData()
	Wait(150)
	TriggerServerEvent("xPlayer:Init:Spawn")
end)

opened = false

RegisterNetEvent("xPlayer:Card:Id:Show")
AddEventHandler("xPlayer:Card:Id:Show", function(Data)
	opened = true
	SendNUIMessage({
		card = "id",
		display = "block",
		job = Data.job,
		name = Data.name,
		birthday = Data.birthday
	})
	mugshot = RegisterPedheadshot(PlayerPedId(Data.ped))
	Wait(300)
	txdString = GetPedheadshotTxdString(mugshot)
	while opened do
		Wait(0)
		DrawSprite(txdString, txdString, 0.565, 0.3195, 0.055, 0.1181, 0.0, 255, 255, 255, 1000)
		if IsControlJustPressed(0, 177) then
			opened = false
			SendNUIMessage({
				card = "id",
				display = "none"
			})
		end
	end
	UnregisterPedheadshot(mugshot)
end)

RegisterNetEvent("xPlayer:Card:Id:Look")
AddEventHandler("xPlayer:Card:Id:Look", function()
	ESX.TriggerServerCallback("xPlayer:Get:Card:Id", function(Data)
		opened = true
		SendNUIMessage({
			card = "id",
			display = "block",
			job = Data.job,
			name = Data.name,
			birthday = Data.birthday
		})
	end, GetPlayerServerId(PlayerId()))
	mugshot = RegisterPedheadshot(PlayerPedId())
	Wait(300)
	txdString = GetPedheadshotTxdString(mugshot)
	while opened do
		Wait(0)
		DrawSprite(txdString, txdString, 0.565, 0.3195, 0.055, 0.1181, 0.0, 255, 255, 255, 1000)
		if IsControlJustPressed(0, 177) then
			opened = false
			SendNUIMessage({
				card = "id",
				display = "none"
			})
		end
	end
	UnregisterPedheadshot(mugshot)
end)

RegisterNetEvent("xPlayer:Spawn:Player")
AddEventHandler("xPlayer:Spawn:Player", function(Data)
	local Player = GetPlayerPed(-1)
	local GoodPed = GetEntityModel(Player)

	RequestModel(GetHashKey(Data.skin.pedIndex))
	while not HasModelLoaded(GetHashKey(Data.skin.pedIndex)) do
		Citizen.Wait(0)
	end
	SetPlayerModel(PlayerId(Player), GetHashKey(Data.skin.pedIndex))
	SetPedHeadBlendData(PlayerPedId(Player), Data.skin.dadIndex, Data.skin.motherIndex, nil, Data.skin.dadIndex, Data.skin.motherIndex, nil, 0.5, 0.5, nil, true)
	SetPedComponentVariation(PlayerPedId(Player), 2, Data.skin.hairIndex, 1, 2)
	SetPedEyeColor(PlayerPedId(Player), Data.skin.eyesIndex, 0, 1)
	SetPedHeadOverlay(PlayerPedId(Player), 1, Data.skin.barberIndex, 1 + 0.0)
	SetPedHairColor(PlayerPedId(Player), Data.skin.hairColour, Data.skin.hairColour)
	SetPedHeadOverlayColor(PlayerPedId(Player), 1, 1, Data.skin.hairColour, Data.skin.hairColour)
	SetPedComponentVariation(PlayerPedId(Player), 8, Data.skin.tshirtIndex, Data.skin.tshirtColour, 2)
	SetPedComponentVariation(PlayerPedId(Player), 11, Data.skin.vesteIndex, Data.skin.vesteColour, 2)
	SetPedComponentVariation(PlayerPedId(Player), 3, Data.skin.armsIndex, 0, 2)
	SetPedComponentVariation(PlayerPedId(Player), 4, Data.skin.pantsIndex, Data.skin.pantsColour, 2)
	SetPedComponentVariation(PlayerPedId(Player), 6, Data.skin.shoesIndex, Data.skin.shoesColour, 2)
	ESX.TriggerServerCallback('xPlayer:Get:Tatoo', function(Tatoo)
		for _,v in pairs (Tatoo) do
			AddPedDecorationFromHashes(PlayerPedId(Player), v.Collection, GetHashKey(v.Tatoo))
		end
	end)
	SetEntityCoords(PlayerPedId(Player), Data.coords.x, Data.coords.y, Data.coords.z)
	SetEntityHeading(PlayerPedId(Player), Data.coords.heading)
	ESX.ShowNotification("Personnage chargé avec succés")
end)

function KeyboardInput(TextEntry, MaxStringLength)
    AddTextEntry("FMMC_KEY_TIP1", TextEntry .. "")
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", "", "", "", "", MaxStringLength)
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