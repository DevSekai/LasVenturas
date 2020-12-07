ESX = nil
TokenGen = {}
InMenu = false
PlyInJob = false
Pos = nil
Timing = 2000
JobBlips = {}
Count = 0
LimitCount = 50
CountClr = {255, 255, 255}
InZone = {}

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
		PlayerData = ESX.GetPlayerData()
	end
	TriggerServerEvent("GetJobToken")
	CreateJob()        
end)

RegisterNetEvent("SendJobToken")
AddEventHandler("SendJobToken", function(Token)
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

		if not InMenu then
			for _,v in pairs (Job.Coords) do
				local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.x, v.y, v.z, true)
				if distance < Job.MarkerDist then
					Timing = 0
					InZone[v.Type] = true
					DrawMarker(Job.MarkerType, v.x, v.y, v.z + 0.98, 0, 0, 0, 0, 0, 0, Job.MarkerScale, Job.MarkerScale, Job.MarkerScale, Job.MarkerR, Job.MarkerG, Job.MarkerB, Job.MarkerA, false, true, 2, true, nil, false)
					if distance < Job.PedDist then
						ESX.ShowHelpNotification('Appuyer sur ~INPUT_CONTEXT~ pour acceder au menu.')
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
			if PlayerData.job.name ~= "unemployed" then
				for _,v in pairs (Job.Wl[PlayerData.job.name].Coords) do
					local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.x, v.y, v.z, true)
					if distance < Job.MarkerDist then
						Timing = 0
						InZone[v.Type] = true
						DrawMarker(v.MarkerType, v.x, v.y, v.z, 0, 0, 0, 0, 0, 0, v.MarkerScale, v.MarkerScale, v.MarkerScale, v.MarkerR, v.MarkerG, v.MarkerB, v.MarkerA, false, true, 2, true, nil, false)
						if distance < Job.PedDist then
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
				for _,v in pairs (Job.Wl.Objects) do
					local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(v), true)
					if distance < Job.MarkerDist then
						Timing = 0
						InZone[v] = true
						if distance < Job.PedDist then
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
		end
	end
end)

function CreateJob()
	for _,v in pairs (Job.Coords) do
		if v.Label then
			local Blips = AddBlipForCoord(v.x, v.y, v.z)
			SetBlipSprite (Blips, v.Sprite)
			SetBlipDisplay(Blips, 4)
			SetBlipScale  (Blips, v.Scale)
			SetBlipColour (Blips, v.Color)
			SetBlipAsShortRange(Blips, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(v.Label)
			EndTextCommandSetBlipName(Blips)
		end
		if v.Ped then
			RequestModel(v.Ped)
			while not HasModelLoaded(v.Ped) do
				RequestModel(v.Ped)
				Citizen.Wait(10)
			end
			Peds = CreatePed(1, v.Ped, v.x, v.y, v.z - 0.98, 0.0, false, true)
			SetEntityHeading(Peds, v.h)
			FreezeEntityPosition(Peds, true)
			SetEntityInvincible(Peds, true)
			SetBlockingOfNonTemporaryEvents(Peds, true)
			RequestAnimDict(Job.AnimDict)
			while not HasAnimDictLoaded(Job.AnimDict) do
				Citizen.Wait(0)
			end
			TaskPlayAnim(Peds, Job.AnimDict, Job.Anim, 8.0, 0.0, -1, 1, 0, 0, 0, 0)
		end
	end
end

RegisterNetEvent("StartJob")
AddEventHandler("StartJob", function(Type)
	RageUI.CloseAll()
	InMenu = false
	Timing = 2000
	PlyInJob = true
	FreezeEntityPosition(PlayerPedId(), false)
	GetRandomPoint(Type)
end)

RegisterNetEvent("StopJob")
AddEventHandler("StopJob", function(Type)
	for _,v in pairs (JobBlips) do
		RemoveBlip(v)
	end
	RageUI.CloseAll()
	FreezeEntityPosition(PlayerPedId(), false)
	InMenu = false
	Timing = 2000
	Count = 0
	PlyInJob = false
	Pos = nil
end)

function GetRandomPoint(Type)
	if Type == "Ouvrier" then
		Index = GetRandomIntInRange(1,  #Job.Ouvrier.Pos)
		Pos = Job.Ouvrier.Pos[Index]
		Txt = "Appuyer sur ~INPUT_CONTEXT~ pour accomplir votre tache."
	elseif Type == "Pêcheur" then
		Index = GetRandomIntInRange(1,  #Job.Pecheur.Pos)
		Pos = Job.Pecheur.Pos[Index]
		Txt = "Appuyer sur ~INPUT_CONTEXT~ pour recupérer la feraille."
	elseif Type == "Fermier" then
		Index = GetRandomIntInRange(1,  #Job.Fermier.Pos)
		Pos = Job.Fermier.Pos[Index]
		Txt = "Appuyer sur ~INPUT_CONTEXT~ pour vous occuper de la bête."
	end
	JobBlip = AddBlipForCoord(Pos.x, Pos.y, Pos.z)
	SetBlipSprite (JobBlip, 1)
	SetBlipDisplay(JobBlip, 8)
	SetBlipScale  (JobBlip, 0.6)
	SetBlipColour (JobBlip, 5)
	SetBlipAsShortRange(JobBlip, true)
	table.insert(JobBlips, JobBlip)
	while Pos ~= nil do
		Citizen.Wait(0)
		if Pos ~= nil then
			drawTxt(Count.." / "..LimitCount, 1, CountClr, 0.6, 0.5, 0.9)
			local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Pos.x, Pos.y, Pos.z, true)
			if distance < Job.MarkerDist then
				DrawMarker(Job.JobMarkerType, Pos.x, Pos.y, Pos.z, 0, 0, 0, 0, 0, 0, Job.JobMarkerScale, Job.JobMarkerScale, Job.JobMarkerScale, Job.MarkerR, Job.MarkerG, Job.MarkerB, Job.MarkerA, false, true, 2, true, nil, false)
				if distance < Job.PedDist then
					ESX.ShowHelpNotification(Txt)
					if IsControlJustReleased(1, 51) then
						AnimPos = vector3(Pos.x, Pos.y, Pos.z)
						AnimHead = Pos.h
						DeletePoint(Type, AnimPos, AnimHead)
						Pos = nil
						break
					end
				end
			end
		end
	end
end

function DeletePoint(Type, AnimPos, AnimHead)
	for _,v in pairs (JobBlips) do
		RemoveBlip(v)
	end
	CrtType = {}
	if Type == "Ouvrier" then
		CrtType = Job.Ouvrier
	elseif Type == "Pêcheur" then
		CrtType = Job.Pecheur
	elseif Type == "Fermier" then
		CrtType = Job.Fermier
	end
	SetEntityInvincible(PlayerPedId(), true)
	SetEntityHeading(PlayerPedId(), AnimHead)
	SetEntityCoords(PlayerPedId(), AnimPos.x, AnimPos.y, AnimPos.z - 0.98, 0, 0, 0, false)
	TaskStartScenarioInPlace(GetPlayerPed(-1), CrtType.Anim, 0, 1) 
	Citizen.Wait(10000)
	ClearPedTasksImmediately(PlayerPedId())
	TriggerServerEvent("CountJob")
	Count = Count + 1
	if Count <= 10 then
		CountClr = {51,255,230}
	elseif Count <= 20 then
		CountClr = {51,255,88}
	elseif Count <= 30 then
		CountClr = {206,255,51}
	elseif Count <= 40 then
		CountClr = {255,160,3}
	elseif Count >= 50 then
		CountClr = {255,3,3}
	end
	GetRandomPoint(Type)
end

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

function AddChest(Data)
	ESX.ShowNotification(Data.Amount)
	if Data.Type == "Money" then
		TriggerServerEvent('esx_society:depositMoney', PlayerData.job.name, tonumber(Data.Amount))
		ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(Money)
			Job.Wl.Society_Money = Money
		end, PlayerData.job.name)
	else
		TriggerServerEvent('putStockItems', Data.Item, tonumber(Data.Amount))
		Job.Wl.PlyInv = {}
		ESX.TriggerServerCallback('getPlayerInventory', function(inventory)
			for i=1, #inventory.items, 1 do
				local item = inventory.items[i]
				if item.count > 1 then
					table.insert(Job.Wl.PlyInv, {label = item.label .. ' x' .. tonumber(item.count), type = 'item_standard', value = item.name})
				end
			end
		end)
	end
end

function RemoveChest(Data)
	if Data.Type == "Money" then
		TriggerServerEvent('esx_society:withdrawMoney', PlayerData.job.name, tonumber(Data.Amount))
		ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(Money)
			Job.Wl.Society_Money = Money
		end, PlayerData.job.name)
	else
		TriggerServerEvent('getStockItem', Data.Item, tonumber(Data.Amount))
		Job.Wl.SctInv = {}
		ESX.TriggerServerCallback('getStockItems', function(Sitems)
			for i=1, #Sitems,1 do
				table.insert(Job.Wl.SctInv, {label = Sitems[i].label..' x ' .. tonumber(Sitems[i].count), value = Sitems[i].name})
			end
		end)
	end
end

function SpawnJobCar(Car, Pos)
    if not DoesEntityExist(Vehicle) then
        VhcName = RequestModel(Car)
        while not HasModelLoaded(Car) do
            RequestModel(Car)
            Citizen.Wait(0)
        end
        Vehicle = CreateVehicle(GetHashKey(Car), Pos.x, Pos.y, Pos.z, Pos.h, true, true)
        TaskWarpPedIntoVehicle(PlayerPedId(), Vehicle, -1)
		SetVehicleNumberPlateText(Vehicle, "JOBSLASV")
		SetVehicleRadioEnabled(Vehicle, false)
		FreezeEntityPosition(PlayerPedId(), false)
		Timing = 2000
		RageUI.CloseAll()
		InMenu = false
    end
end

RegisterNetEvent("HealPly")
AddEventHandler("HealPly", function(Ped)
	SetEntityHealth(GetPlayerPed(Ped), 200)
end)

RegisterNetEvent("RevivePly")
AddEventHandler("RevivePly", function(Ped)
	Coords = GetEntityCoords(GetPlayerPed(Ped))
	Heading = GetEntityHeading(GetPlayerPed(Ped))
	SetEntityCoordsNoOffset(GetPlayerPed(Ped), Coords.x, Coords.y, Coords.z, false, false, false, true)
	NetworkResurrectLocalPlayer(Coords.x, Coords.y, Coords.z, Heading, true, false)
	SetPlayerInvincible(GetPlayerPed(Ped), false)
	ClearPedBloodDamage(GetPlayerPed(Ped))
end)