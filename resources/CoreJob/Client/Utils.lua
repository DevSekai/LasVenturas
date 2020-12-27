ESX = nil
TokenGen = {}
InMenu = false
PlyInJob = false
Pos = nil
Timing = 2000
JobBlips = {}
Count = 0
PlayerData = nil
Handcuffed = false
InCarOut = false
LimitCount = 50
CountClr = {255, 255, 255}
InZone = {}

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
	end
	TriggerServerEvent("GetJobToken")
	CreateJob()
	for _,v in pairs (Dutty.Shops) do
		TriggerServerEvent("Dutty:GetState", v.Type)
	end       
end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
	local LspdPhone = {
		name       = 'police',
		number     = 'police',
		base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NDFGQTJDRkI0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NDFGQTJDRkM0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0MUZBMkNGOTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0MUZBMkNGQTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PoW66EYAAAjGSURBVHjapJcLcFTV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'
	}

	TriggerEvent('esx_phone:addSpecialContact', LspdPhone.name, LspdPhone.number, LspdPhone.base64Icon)
end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
	local EmsPhone = {
		name       = 'ambulance',
		number     = 'ambulance',
		base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NDFGQTJDRkI0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NDFGQTJDRkM0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0MUZBMkNGOTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0MUZBMkNGQTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PoW66EYAAAjGSURBVHjapJcLcFTV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'
	}

	TriggerEvent('esx_phone:addSpecialContact', EmsPhone.name, EmsPhone.number, EmsPhone.base64Icon)
end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
	local MechanicPhone = {
		name       = 'mechanic',
		number     = 'mechanic',
		base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NDFGQTJDRkI0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NDFGQTJDRkM0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0MUZBMkNGOTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0MUZBMkNGQTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PoW66EYAAAjGSURBVHjapJcLcFTV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'
	}

	TriggerEvent('esx_phone:addSpecialContact', MechanicPhone.name, MechanicPhone.number, MechanicPhone.base64Icon)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
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

		if PlayerData ~= nil then
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
		else
			PlayerData = ESX.GetPlayerData()
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
				if item.count >= 1 then
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
				if Sitems[i].name >= 1 then
					table.insert(Job.Wl.SctInv, {label = Sitems[i].label..' x ' .. tonumber(Sitems[i].count), value = Sitems[i].name})
				end
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

RegisterNetEvent("Ply:RevivePly")
AddEventHandler("Ply:RevivePly", function()
	local playerPed = PlayerPedId()
	local lib, anim = 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest'
	ESX.ShowNotification("Réanimation en cours...")

	for i=1, 15 do
		Citizen.Wait(900)

		ESX.Streaming.RequestAnimDict(lib, function()
			TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
		end)
	end
	ClearPedBloodDamage(GetPlayerPed(Ped))	
end)

RegisterNetEvent("Trg:RevivePly")
AddEventHandler("Trg:RevivePly", function(Ped)
	Coords = GetEntityCoords(GetPlayerPed(Ped))
	NetworkResurrectLocalPlayer(Coords.x, Coords.y, Coords.z + 0.98, Heading, true, false)
	SetPlayerInvincible(GetPlayerPed(Ped), false)		
	ESX.ShowNotification("Vous avez était : ~o~Réanimer~s~.")

end)

RegisterNetEvent("Handcuffed")
AddEventHandler("Handcuffed", function()
	Handcuffed = not Handcuffed
	if Handcuffed then
		RequestAnimDict('mp_arresting')
		while not HasAnimDictLoaded('mp_arresting') do
			Citizen.Wait(100)
		end
		TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
		SetEnableHandcuffs(PlayerPedId(), true)
		DisablePlayerFiring(PlayerPedId(), true)
		SetCurrentPedWeapon(PlayerPedId(), GetHashKey('WEAPON_UNARMED'), true)
		SetPedCanPlayGestureAnims(PlayerPedId(), false)
		DisplayRadar(false)
	else
		ClearPedSecondaryTask(PlayerPedId())
		SetEnableHandcuffs(PlayerPedId(), false)
		DisablePlayerFiring(PlayerPedId(), false)
		SetPedCanPlayGestureAnims(PlayerPedId(), true)
		DisplayRadar(true)
	end
end)

RegisterNetEvent("InCarOut")
AddEventHandler("InCarOut", function()
	InCarOut = not InCarOut
	if InCarOut then
		if Handcuffed then
			local Coords = GetEntityCoords(PlayerPedId())
			if IsAnyVehicleNearPoint(Coords, 5.0) then
				local Vehicle = GetClosestVehicle(Coords, 5.0, 0, 71)
				if DoesEntityExist(Vehicle) then
					local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(Vehicle)
					for i=maxSeats - 1, 0, -1 do
						if IsVehicleSeatFree(Vehicle, i) then
							freeSeat = i
							break
						end
					end
					if freeSeat then
						TaskWarpPedIntoVehicle(PlayerPedId(), Vehicle, freeSeat)
					end
				end
			end
		end
	else
		if IsPedSittingInAnyVehicle(PlayerPedId()) then
			local Vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
			TaskLeaveVehicle(PlayerPedId(), Vehicle, 64)
		end
	end
end)

RegisterNetEvent('JobRenfort')
AddEventHandler('JobRenfort', function(Coords, Level)
	JobBlips = {}
	PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
	PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
	if Level == "Low" then
		ESX.ShowAdvancedNotification('LSPD INFORMATIONS', '~b~Demande de renfort', 'Demande de renfort demandé.\n\n\n~w~Importance: ~g~Basse.', 'CHAR_CALL911', 8)
		Blips = AddBlipForCoord(Coords)
		SetBlipSprite(Blips, 161)
		SetBlipScale(Blips, 0.6)
		SetBlipColour(Blips, 2)
		SetBlipAsShortRange(Blips, true)
	elseif Level == "Mid" then
		ESX.ShowAdvancedNotification('LSPD INFORMATIONS', '~b~Demande de renfort', 'Demande de renfort demandé.\n\n\n~w~Importance: ~y~Moyenne.', 'CHAR_CALL911', 8)
		Blips = AddBlipForCoord(Coords)
		SetBlipSprite(Blips, 161)
		SetBlipScale(Blips, 0.8)
		SetBlipColour(Blips, 5)
		SetBlipAsShortRange(Blips, true)
	elseif Level == "High" then
		ESX.ShowAdvancedNotification('LSPD INFORMATIONS', '~b~Demande de renfort', 'Demande de renfort demandé.\n\n\n~w~Importance: ~o~Haute.', 'CHAR_CALL911', 8)
		Blips = AddBlipForCoord(Coords)
		SetBlipSprite(Blips, 161)
		SetBlipScale(Blips, 1.0)
		SetBlipColour(Blips, 17)
		SetBlipAsShortRange(Blips, true)
	else
		ESX.ShowAdvancedNotification('LSPD INFORMATIONS', '~b~Demande de renfort', 'Demande de renfort demandé.\n\n\n~w~Importance: ~o~Extreme.', 'CHAR_CALL911', 8)
		Blips = AddBlipForCoord(Coords)
		SetBlipSprite(Blips, 161)
		SetBlipScale(Blips, 1.2)
		SetBlipColour(Blips, 1)
		SetBlipAsShortRange(Blips, false)
	end
	Wait(1000)
	PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Demande renfort')
	EndTextCommandSetBlipName(Blips)
	table.insert(JobBlips, {Value = Blips, Level = Level})
	for _, v in pairs(JobBlips) do
		if v.Level == "Low" then
			Citizen.Wait(20 * 60 * 1000)
			RemoveBlip(v.Value)
		end
		if v.Level == "Mid" then
			Citizen.Wait(15 * 60 * 1000)
			RemoveBlip(v.Value)
		end
		if v.Level == "High" then
			Citizen.Wait(10 * 60 * 1000)
			RemoveBlip(v.Value)
		end
		if v.Level == "Xtrem" then
			Citizen.Wait(5 * 60 * 1000)
			RemoveBlip(v.Value)
		end
	end
end)

RegisterNetEvent("RefreshPrice")
AddEventHandler("RefreshPrice", function(Price)
	Job.Stand.Buyed = true
	Job.Stand.FinalPrice = Job.Stand.FinalPrice + Price
end)

function LeaveStand(Vehicle)
	FreezeEntityPosition(Vehicle, false)
	SetVehicleEngineOn(Vehicle, true, false, false)
	Timing = 2000
	RageUI.CloseAll()
	InMenu = false
end

RegisterNetEvent("Weazel:Annonce")
AddEventHandler("Weazel:Annonce", function(Desc)
	ESX.ShowAdvancedNotification("Weazel News", "Annonce aux citoyens", Desc, "CHAR_ABIGAIL", 2)
end)

RegisterNetEvent("Job:Craft")
AddEventHandler("Job:Craft", function(Items)
	Job.Crafting.Function(Items)
end)

RegisterNetEvent("Gouv:Annonce")
AddEventHandler("Gouv:Annonce", function(Desc)
	PlaySoundFrontend(-1, "DELETE","HUD_DEATHMATCH_SOUNDSET", 1)
	announcestring = Desc
	i = 0
	while announcestring do
		Citizen.Wait(0)
        if announcestring then
            scaleform = Initialize("mp_big_message_freemode")
            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
		end
		i = i + 1
		if i >= 2500 then
			announcestring = nil
			break
		end
    end
end)

function Initialize(scaleform)
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
	PushScaleformMovieFunctionParameterString("Annonce gourvernemental")
    PushScaleformMovieFunctionParameterString(announcestring)
    PopScaleformMovieFunctionVoid()
    return scaleform
end

RegisterNetEvent("OnDutty")
AddEventHandler("OnDutty", function(Ped, State, Label, Name)
	local mugshot, mugshotStr = ESX.Game.GetPedMugshot(GetPlayerPed(Ped))
	if State then
		ESX.ShowAdvancedNotification(Label, "~g~Prise de service", Name.." Ã  pris son service", mugshotStr, 2)
	else
		ESX.ShowAdvancedNotification(Label, "~r~Fin de service", Name.." Ã  fini son service", mugshotStr, 2)
	end
end)

Dutty = {
	State = {
		["ambulance"] = false,
		["mecano"] = false,
	},
	CrtPed = {
		["ambulance"] = {},
		["mecano"] = {},
	},
	["ambulance"] =  {
		Ped = "s_m_m_paramedic_01",
		Coords = vector3(359.32748413086, -591.38903808594, 28.605834960938),
		Heading = 255.11810302734,
		Function = function()
			SetEntityHealth(PlayerPedId(), 200.0)
			ClearPedBloodDamage(PlayerPedId())
			ESX.ShowNotification("Vous avez était soigner.")
		end,
	},
	["mecano"] =  {
		Ped = "ig_benny",
		Coords = vector3(-199.84616088867, -1296.8308105469, 31.285034179688),
		Heading = 172.91337585449,
		Function = function()
			CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
			if IsPedInAnyVehicle(PlayerPedId(), false) then
				SetVehicleFixed(CrtVhc)
				SetVehicleDeformationFixed(CrtVhc)
				SetVehicleUndriveable(CrtVhc, false)
				SetVehicleEngineOn(CrtVhc, true, true)
				ESX.ShowNotification("Votre véhicule est réparer.")
			else
				ESX.ShowNotification("Vous devez être dans un véhicule.")
			end
		end,
	},
	Shops = {
		{Coords = vector3(359.32748413086, -591.38903808594, 28.605834960938), Type = "ambulance"},
		{Coords = vector3(-201.37582397461, -1299.4549560547, 30.594116210938), Type = "mecano"},
	},
}

RegisterNetEvent("Dutty:CreateShop")
AddEventHandler("Dutty:CreateShop", function(JobName)
	if Dutty[JobName] then
		RequestModel(Dutty[JobName].Ped)
		while not HasModelLoaded(Dutty[JobName].Ped) do
			RequestModel(Dutty[JobName].Ped)
			Citizen.Wait(10)
		end
		Peds = CreatePed(1, Dutty[JobName].Ped, Dutty[JobName].Coords[1], Dutty[JobName].Coords[2], Dutty[JobName].Coords[3] - 0.98, 0.0, false, true)
		SetEntityHeading(Peds, Dutty[JobName].Heading)
		table.insert(Dutty.CrtPed[JobName], Peds)
		Dutty.State[JobName] = true
		while Dutty.State[JobName] do
			Citizen.Wait(Timing)
			for _,v in pairs (Dutty.Shops) do
				if Dutty.State["mecano"] and v.Type == "mecano" then
					local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.Coords[1], v.Coords[2], v.Coords[3], true)
					if distance < 8.0 then
						Timing = 0
						InZone[v.Type] = true
						if distance < 2.0 then
							ESX.ShowHelpNotification('Appuyer sur ~INPUT_CONTEXT~ pour reparer votre véhicule.')
							if IsControlJustReleased(1, 51) then
								Dutty[v.Type].Function()
							end
						end
					else
						if InZone[v.Type] then
							Timing = 2000
							InZone[v.Type] = false
						end
					end
				elseif Dutty.State["ambulance"] and v.Type == "ambulance" then
					local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.Coords[1], v.Coords[2], v.Coords[3], true)
					if distance < 8.0 then
						Timing = 0
						InZone[v.Type] = true
						if distance < 2.0 then
							ESX.ShowHelpNotification('Appuyer sur ~INPUT_CONTEXT~ pour vous faire soigner.')
							if IsControlJustReleased(1, 51) then
								Dutty[v.Type].Function()
							end
						end
					else
						if InZone[v.Type] then
							Timing = 2000
							InZone[v.Type] = false
						end
					end
				end
			end
		end
	end
end)

RegisterNetEvent("Dutty:DeleteShop")
AddEventHandler("Dutty:DeleteShop", function(JobName)
	if Dutty[JobName] then
		for _,v in pairs (Dutty.CrtPed[JobName]) do
			DeleteEntity(v)
		end
		Timing = 2000
		Dutty.State[JobName] = false
	end
end)