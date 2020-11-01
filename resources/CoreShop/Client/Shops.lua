Citizen.CreateThread(function ()
    CreateShop()
end)

function EnterShop(Shops)
	local Result = json.decode(Shops)
	if Result.Type == "Mask" then
		SetEntityCoords(PlayerPedId(), Shops.Mask.PlyCam)
		SetEntityHeading(PlayerPedId(), Shops.Mask.PlyCamH)
		FreezeEntityPosition(PlayerPedId(), true)
		Cams = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
		SetCamCoord(Cams, Shops.Mask.Cam)
		PointCamAtCoord(Cams, Shops.Mask.CamH)
		SetCamActive(Cams, true)
		RenderScriptCams(true, true, 2000, true, false)
	elseif Result.Type == "Barber" then
		DoScreenFadeOut(1500)
		Citizen.Wait(750)
		SetEntityCoords(PlayerPedId(), Result.X, Result.Y, Result.Z)
		SetEntityHeading(PlayerPedId(), Result.Heading)
		ClearPedTasks(GetPlayerPed(-1))
		PlyCoords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0 - 0.5, -0.5);
		TaskStartScenarioAtPosition(GetPlayerPed(-1), "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", PlyCoords['x'], PlyCoords['y'], PlyCoords['z'], GetEntityHeading(PlayerPedId()), 0, 1, false)
		Citizen.Wait(750)
		DoScreenFadeIn(1500)
	elseif Result.Type == "Tatoo" then
		DoScreenFadeOut(1500)
		Citizen.Wait(750)
		SetEntityCoords(PlayerPedId(), Result.X, Result.Y, Result.Z)
		SetEntityHeading(PlayerPedId(), Result.Heading)
		ESX.TriggerServerCallback('GetPlySkin', function(Skin)
			Result = json.decode(Skin)
			Result.TshirtIndex2 = 0
			Result.ArmsIndex = 15
			Result.VesteIndex = 91
			Result.TshirtIndex = 15
			Result.VesteIndex2 = 0
			Result.PantalonIndex = 14
			Result.PantalonIndex2 = 0
			Result.ChaussureIndex = 34
			Result.ChaussureIndex2 = 0
			TriggerEvent('ApplySkin', GetPlayerPed(-1), json.encode(Result))
		end)
		Citizen.Wait(750)
		DoScreenFadeIn(1500)
	end
end

RegisterNetEvent("CloseMenu")
AddEventHandler("CloseMenu", function()
	SetCamActive(Cams, false)
	RenderScriptCams(false, true, 2000, true, true)
    DestroyAllCams(true)
	Timing = 2000
	FreezeEntityPosition(PlayerPedId(), false)
	RageUI.CloseAll()
	Citizen.Wait(Timing)
	InMenu = false
end)

RegisterNetEvent("LeaveShop")
AddEventHandler("LeaveShop", function(Type)
	DoScreenFadeOut(1500)
	Citizen.Wait(750)
	if Type == "Barber" then
		ESX.TriggerServerCallback('GetPlySkin', function(Skin)
			Result = json.decode(Skin)
			Result.CheuveuxIndex = Shops.Barber.Index
			Result.BarbeIndex = Shops.Barber.Index2
			Result.CouleurIndex = Shops.Barber.Color
			TriggerServerEvent('CreateSkin', "Ntm", json.encode(Result))
		end)
		SetEntityCoords(PlayerPedId(), Shops.Barber.Out.X, Shops.Barber.Out.Y, Shops.Barber.Out.Z - 0.98)
		SetEntityHeading(PlayerPedId(), Shops.Barber.Out.H)
	elseif Type == "Tatoo" then
		ESX.TriggerServerCallback('GetPlySkin', function(Skin)
			TriggerEvent('ApplySkin', GetPlayerPed(-1), Skin)
		end)
		ESX.TriggerServerCallback('GetPlyTatoo', function(Tatoo)
			for _,v in pairs (Tatoo) do
				AddPedDecorationFromHashes(GetPlayerPed(-1), v.Collection, GetHashKey(v.Tatoo))
			end
		end)
		SetEntityCoords(PlayerPedId(), Shops.Tatoo.Out.X, Shops.Tatoo.Out.Y, Shops.Tatoo.Out.Z - 0.98)
		SetEntityHeading(PlayerPedId(), Shops.Tatoo.Out.H)
	end
	FreezeEntityPosition(PlayerPedId(), false)
	RageUI.CloseAll()
	Citizen.Wait(750)
	Timing = 2000
	DoScreenFadeIn(1500)
	Citizen.Wait(Timing)
	InMenu = false
end)

function DeleteCams()
	SetCamActive(Cams, false)
	RenderScriptCams(false, true, 2000, true, true)
    DestroyAllCams(true)
end

function CreateShop()
	for _,v in ipairs(Shops.Coords) do
		if v.Type == "Ltd" then
			local Blips = AddBlipForCoord(v.x, v.y, v.z)
			SetBlipSprite (Blips, Shops.Ltd.BlipSprite)
			SetBlipDisplay(Blips, 4)
			SetBlipScale  (Blips, Shops.Ltd.BlipScale)
			SetBlipColour (Blips, Shops.Ltd.BlipColor)
			SetBlipAsShortRange(Blips, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(Shops.Ltd.BlipLabel)
			EndTextCommandSetBlipName(Blips)
			RequestModel(Shops.Ltd.Ped)
			while not HasModelLoaded(Shops.Ltd.Ped) do
				RequestModel(Shops.Ltd.Ped)
				Citizen.Wait(10)
			end
			Peds = CreatePed(1, Shops.Ltd.Ped, v.x, v.y, v.z - 0.98, 0.0, false, true)
			SetEntityHeading(Peds, v.h)
		elseif v.Type == "Weapon" then
			local Blips = AddBlipForCoord(v.x, v.y, v.z)
			SetBlipSprite (Blips, Shops.Weapon.BlipSprite)
			SetBlipDisplay(Blips, 4)
			SetBlipScale  (Blips, Shops.Weapon.BlipScale)
			SetBlipColour (Blips, Shops.Weapon.BlipColor)
			SetBlipAsShortRange(Blips, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(Shops.Weapon.BlipLabel)
			EndTextCommandSetBlipName(Blips)
			RequestModel(Shops.Weapon.Ped)
			while not HasModelLoaded(Shops.Weapon.Ped) do
				RequestModel(Shops.Weapon.Ped)
				Citizen.Wait(10)
			end
			Peds = CreatePed(1, Shops.Weapon.Ped, v.x, v.y, v.z - 0.98, 0.0, false, true)
			SetEntityHeading(Peds, v.h)
		elseif v.Type == "Clothe" then
			local Blips = AddBlipForCoord(v.x, v.y, v.z)
			SetBlipSprite (Blips, Shops.Clothe.BlipSprite)
			SetBlipDisplay(Blips, 4)
			SetBlipScale  (Blips, Shops.Clothe.BlipScale)
			SetBlipColour (Blips, Shops.Clothe.BlipColor)
			SetBlipAsShortRange(Blips, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(Shops.Clothe.BlipLabel)
			EndTextCommandSetBlipName(Blips)
			RequestModel(Shops.Clothe.Ped)
			while not HasModelLoaded(Shops.Clothe.Ped) do
				RequestModel(Shops.Clothe.Ped)
				Citizen.Wait(10)
			end
			Peds = CreatePed(1, Shops.Clothe.Ped, v.x, v.y, v.z - 0.98, 0.0, false, true)
			SetEntityHeading(Peds, v.h)
		elseif v.Type == "Tatoo" then
			local Blips = AddBlipForCoord(v.x, v.y, v.z)
			SetBlipSprite (Blips, Shops.Tatoo.BlipSprite)
			SetBlipDisplay(Blips, 4)
			SetBlipScale  (Blips, Shops.Tatoo.BlipScale)
			SetBlipColour (Blips, Shops.Tatoo.BlipColor)
			SetBlipAsShortRange(Blips, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(Shops.Tatoo.BlipLabel)
			EndTextCommandSetBlipName(Blips)
			RequestModel(Shops.Tatoo.Ped)
			while not HasModelLoaded(Shops.Tatoo.Ped) do
				RequestModel(Shops.Tatoo.Ped)
				Citizen.Wait(10)
			end
			Peds = CreatePed(1, Shops.Tatoo.Ped, v.x, v.y, v.z - 0.98, 0.0, false, true)
			SetEntityHeading(Peds, v.h)
		elseif v.Type == "Barber" then
			local Blips = AddBlipForCoord(v.x, v.y, v.z)
			SetBlipSprite (Blips, Shops.Barber.BlipSprite)
			SetBlipDisplay(Blips, 4)
			SetBlipScale  (Blips, Shops.Barber.BlipScale)
			SetBlipColour (Blips, Shops.Barber.BlipColor)
			SetBlipAsShortRange(Blips, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(Shops.Barber.BlipLabel)
			EndTextCommandSetBlipName(Blips)
			RequestModel(Shops.Barber.Ped)
			while not HasModelLoaded(Shops.Barber.Ped) do
				RequestModel(Shops.Barber.Ped)
				Citizen.Wait(10)
			end
			Peds = CreatePed(1, Shops.Barber.Ped, v.x, v.y, v.z - 0.98, 0.0, false, true)
			SetEntityHeading(Peds, v.h)
		elseif v.Type == "Mask" then
			local Blips = AddBlipForCoord(v.x, v.y, v.z)
			SetBlipSprite (Blips, Shops.Mask.BlipSprite)
			SetBlipDisplay(Blips, 4)
			SetBlipScale  (Blips, Shops.Mask.BlipScale)
			SetBlipColour (Blips, Shops.Mask.BlipColor)
			SetBlipAsShortRange(Blips, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(Shops.Mask.BlipLabel)
			EndTextCommandSetBlipName(Blips)
			RequestModel(Shops.Mask.Ped)
			while not HasModelLoaded(Shops.Mask.Ped) do
				RequestModel(Shops.Mask.Ped)
				Citizen.Wait(10)
			end
			Peds = CreatePed(1, Shops.Mask.Ped, v.x, v.y, v.z - 0.98, 0.0, false, true)
			SetEntityHeading(Peds, v.h)
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