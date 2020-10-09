ESX = nil
InMenu, PlayerSpawn, MdpClien, HasDamaged, HasFaim, HasSoif, HudHiden = false, false, "Ntm", false, false, false, false
PlyStatut, Accessoires = {}, {}
IsDead = false


Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    ESX.PlayerData = ESX.GetPlayerData()
end)

AddEventHandler('playerSpawned', function()
	while ESX == nil do
		Citizen.Wait(1)
	end
	exports.spawnmanager:setAutoSpawn(false)
	ESX.TriggerServerCallback('CheckFirstSpawn', function(NotFirstSpawn)
		if NotFirstSpawn then
			SpawnPlayer()
		else
			CreatePlayer()
			SetEntityVisible(PlayerPedId(), false)
		end
	end)
	ESX.TriggerServerCallback('GetPlyStatut', function(Statut)
		Result = json.decode(Statut)
		Annee, Mois, Jour, Heure, Minute, Seconde = GetLocalTime()
		if Statut then
			PlyStatut = {Hunger = Result.Hunger, Thrist = Result.Thrist}
		else
			PlyStatut = {Hunger = 100, Thrist = 100}
		end
        SendNUIMessage({
        	Display = true,
        	ServId = "Votre ID : "..GetPlayerServerId(PlayerId()),
			DateTime = "Date : "..Jour.."/"..Mois.."/"..Annee.." Heure : "..Heure + 2 ..":"..Minute,
            Hunger = PlyStatut.Hunger,
            Thrist = PlyStatut.Thrist
        })
        PlayerSpawn = true
	end)
end)
-----------------------------------------------------------------------------
----------------Status-------------------------------------
RegisterNetEvent('AddHunger')
AddEventHandler('AddHunger', function(Ammount)
	HasFaim = false
	if PlyStatut.Hunger + Ammount <= 100 then
		NewHunger = PlyStatut.Hunger + Ammount
		NewThrist = PlyStatut.Thrist
		Annee, Mois, Jour, Heure, Minute, Seconde = GetLocalTime()
		PlyStatut = {Hunger = NewHunger, Thrist = NewThrist}
		TriggerServerEvent('SendStatut', MdpClien, NewHunger, NewThrist)
		if HudHiden then
	        SendNUIMessage({
      			Display = false,
      			ServId = "Votre ID : "..GetPlayerServerId(PlayerId()),
				DateTime = "Date : "..Jour.."/"..Mois.."/"..Annee.." Heure : "..Heure + 2 ..":"..Minute,
	            Hunger = NewHunger,
	            Thrist = NewThrist
	        })
		else
	        SendNUIMessage({
	   			Display = true,
     			ServId = "Votre ID : "..GetPlayerServerId(PlayerId()),
				DateTime = "Date : "..Jour.."/"..Mois.."/"..Annee.." Heure : "..Heure + 2 ..":"..Minute,
	            Hunger = NewHunger,
	            Thrist = NewThrist
	        })
		end
	else
		NewHunger = 100
		NewThrist = PlyStatut.Thrist
		PlyStatut = {Hunger = NewHunger, Thrist = NewThrist}
		TriggerServerEvent('SendStatut', MdpClien, NewHunger, NewThrist)
		if HudHiden then
	        SendNUIMessage({
      			Display = false,
      			ServId = "Votre ID : "..GetPlayerServerId(PlayerId()),
				DateTime = "Date : "..Jour.."/"..Mois.."/"..Annee.." Heure : "..Heure + 2 ..":"..Minute,
	            Hunger = NewHunger,
	            Thrist = NewThrist
	        })
		else
	        SendNUIMessage({
	   			Display = true,
     			ServId = "Votre ID : "..GetPlayerServerId(PlayerId()),
				DateTime = "Date : "..Jour.."/"..Mois.."/"..Annee.." Heure : "..Heure + 2 ..":"..Minute,
	            Hunger = NewHunger,
	            Thrist = NewThrist
	        })
		end
	end
end)

RegisterNetEvent('AddThrist')
AddEventHandler('AddThrist', function(Ammount)
	HasSoif = false
	if PlyStatut.Thrist + Ammount <= 100 then
		NewHunger = PlyStatut.Hunger
		NewThrist = PlyStatut.Thrist + Ammount
		Annee, Mois, Jour, Heure, Minute, Seconde = GetLocalTime()
		PlyStatut = {Hunger = NewHunger, Thrist = NewThrist}
		TriggerServerEvent('SendStatut', MdpClien, NewHunger, NewThrist)
		if HudHiden then
	        SendNUIMessage({
      			Display = false,
      			ServId = "Votre ID : "..GetPlayerServerId(PlayerId()),
				DateTime = "Date : "..Jour.."/"..Mois.."/"..Annee.." Heure : "..Heure + 2 ..":"..Minute,
	            Hunger = NewHunger,
	            Thrist = NewThrist
	        })
		else
	        SendNUIMessage({
	   			Display = true,
     			ServId = "Votre ID : "..GetPlayerServerId(PlayerId()),
				DateTime = "Date : "..Jour.."/"..Mois.."/"..Annee.." Heure : "..Heure + 2 ..":"..Minute,
	            Hunger = NewHunger,
	            Thrist = NewThrist
	        })
		end
	else
		NewHunger = PlyStatut.Hunger
		NewThrist = 100
		PlyStatut = {Hunger = NewHunger, Thrist = NewThrist}
		TriggerServerEvent('SendStatut', MdpClien, NewHunger, NewThrist)
		if HudHiden then
	        SendNUIMessage({
      			Display = false,
      			ServId = "Votre ID : "..GetPlayerServerId(PlayerId()),
				DateTime = "Date : "..Jour.."/"..Mois.."/"..Annee.." Heure : "..Heure + 2 ..":"..Minute,
	            Hunger = NewHunger,
	            Thrist = NewThrist
	        })
		else
	        SendNUIMessage({
	   			Display = true,
     			ServId = "Votre ID : "..GetPlayerServerId(PlayerId()),
				DateTime = "Date : "..Jour.."/"..Mois.."/"..Annee.." Heure : "..Heure + 2 ..":"..Minute,
	            Hunger = NewHunger,
	            Thrist = NewThrist
	        })
		end
	end
end)

RegisterNetEvent('RevivePlayer')
AddEventHandler('RevivePlayer', function()
	HasDamaged, HasSoif, HasFaim = false, false, false
	RevivePly()
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10 * 1000)
		Annee, Mois, Jour, Heure, Minute, Seconde = GetLocalTime()
		if HudHiden then
	        SendNUIMessage({
      			Display = false,
      			ServId = "Votre ID : "..GetPlayerServerId(PlayerId()),
				DateTime = "Date : "..Jour.."/"..Mois.."/"..Annee.." Heure : "..Heure + 2 ..":"..Minute,
	            Hunger = PlyStatut.Hunger,
	            Thrist = PlyStatut.Thrist
	        })
		else
	        SendNUIMessage({
	   			Display = true,
     			ServId = "Votre ID : "..GetPlayerServerId(PlayerId()),
				DateTime = "Date : "..Jour.."/"..Mois.."/"..Annee.." Heure : "..Heure + 2 ..":"..Minute,
	            Hunger = PlyStatut.Hunger,
	            Thrist = PlyStatut.Thrist
	        })
		end
	end
end)

Citizen.CreateThread(function()
	while not HasDamaged do
		Citizen.Wait(1000)
		if PlyStatut.Hunger >= 1 and PlyStatut.Thrist >= 2 then
			if IsPedRunning(PlayerPedId()) then
				NewHunger = PlyStatut.Hunger - 2
				NewThrist = PlyStatut.Thrist - 4
			else
				NewHunger = PlyStatut.Hunger - 1
				NewThrist = PlyStatut.Thrist - 2
			end
			Annee, Mois, Jour, Heure, Minute, Seconde = GetLocalTime()
			PlyStatut = {Hunger = NewHunger, Thrist = NewThrist}
			if PlyStatut.Hunger <= NewHunger or PlyStatut.Thrist <= NewThrist then
				if PlyStatut.Hunger <= 0 then HasFaim = true end
				if PlyStatut.Thrist <= 0 then HasSoif = true end
				if PlyStatut.Hunger <= 50 then ESX.ShowNotification("Vous avez faim.") end
				if PlyStatut.Thrist <= 50 then ESX.ShowNotification("Vous avez soif.") end
				TriggerServerEvent('SendStatut', MdpClien, PlyStatut.Hunger, PlyStatut.Thrist)
				if HudHiden then
			        SendNUIMessage({
	        			Display = false,
	        			ServId = "Votre ID : "..GetPlayerServerId(PlayerId()),
						DateTime = "Date : "..Jour.."/"..Mois.."/"..Annee.." Heure : "..Heure + 2 ..":"..Minute,
			            Hunger = NewHunger,
			            Thrist = NewThrist
			        })

				else
			        SendNUIMessage({
	        			Display = true,
	        			ServId = "Votre ID : "..GetPlayerServerId(PlayerId()),
						DateTime = "Date : "..Jour.."/"..Mois.."/"..Annee.." Heure : "..Heure + 2 ..":"..Minute,
			            Hunger = NewHunger,
			            Thrist = NewThrist
			        })
			    end
				HungerThristDamage()
			end
			TriggerServerEvent('SendStatut', MdpClien, NewHunger, NewThrist)
			if HudHiden then
		        SendNUIMessage({
	       			Display = false,
	       			ServId = "Votre ID : "..GetPlayerServerId(PlayerId()),
					DateTime = "Date : "..Jour.."/"..Mois.."/"..Annee.." Heure : "..Heure + 2 ..":"..Minute,
		            Hunger = NewHunger,
		            Thrist = NewThrist
		        })
			else
		        SendNUIMessage({
	       			Display = true,
	       			ServId = "Votre ID : "..GetPlayerServerId(PlayerId()),
					DateTime = "Date : "..Jour.."/"..Mois.."/"..Annee.." Heure : "..Heure + 2 ..":"..Minute,
		            Hunger = NewHunger,
		            Thrist = NewThrist
		        })
			end
		end
	end
end)

function RevivePly()
	HasDamaged = false
	PlyCoords = GetEntityCoords(PlayerPedId())
	PlyHead = GetEntityHeading(PlayerPedId())
	SetEntityHealth(PlayerPedId(), 200)
	SetEntityCoordsNoOffset(PlayerPedId(), PlyCoords, false, false, false, true)
	NetworkResurrectLocalPlayer(PlyCoords, PlyHead, true, false)
	SetPlayerInvincible(PlayerPedId(), false)
	ClearPedBloodDamage(PlayerPedId())
	NewHunger = 100
	NewThrist = 100
	Annee, Mois, Jour, Heure, Minute, Seconde = GetLocalTime()
	PlyStatut = {Hunger = NewHunger, Thrist = NewThrist}
	TriggerServerEvent('SendStatut', MdpClien, NewHunger, NewThrist)
	if HudHiden then
        SendNUIMessage({
   			Display = false,
   			ServId = "Votre ID : "..GetPlayerServerId(PlayerId()),
			DateTime = "Date : "..Jour.."/"..Mois.."/"..Annee.." Heure : "..Heure + 2 ..":"..Minute,
            Hunger = NewHunger,
            Thrist = NewThrist
        })
	else
        SendNUIMessage({
   			Display = true,
   			ServId = "Votre ID : "..GetPlayerServerId(PlayerId()),
			DateTime = "Date : "..Jour.."/"..Mois.."/"..Annee.." Heure : "..Heure + 2 ..":"..Minute,
            Hunger = NewHunger,
            Thrist = NewThrist
        })
	end
end

function HungerThristDamage()
HasDamaged = true
	while HasDamaged do
		Citizen.Wait(1000)
		if HasFaim or HasSoif then
			PlyHealth = GetEntityHealth(PlayerPedId())
			GetHealth = 5
			if PlyHealth ~= 0 then
				if PlyHealth <= 100 then
					GetHealth = 10
				end
				NewHealth = PlyHealth - GetHealth
				SetEntityHealth(PlayerPedId(), NewHealth)
			else
				HasDamaged = false
			end
		else
			HasDamaged = false
		end
	end
end
-----------------------------------------------------------------------------
----------------Utils-------------------------------------
function SpawnPlayer()
	ESX.TriggerServerCallback('GetPlyCoords', function(Coords)
		Result = json.decode(Coords)
		SetEntityCoordsNoOffset(PlayerPedId(), Result.x, Result.y, Result.z, true, true, true)
		SetEntityHeading(PlayerPedId(), Result.heading)
	end)
	ESX.TriggerServerCallback('GetPlySkin', function(Skin)
		ApplySkin(GetPlayerPed(-1), Skin)
    end)
end

function CreatePlayer()
	SetEntityCoordsNoOffset(PlayerPedId(), -1042.571, -2746.193, 21.359, true, true, true)
	SetEntityHeading(PlayerPedId(), 327.772)
	if not InMenu then
		SetEntityVisible(PlayerPedId(), false)
		FreezeEntityPosition(PlayerPedId(), true)
		HighCam()
		RageUI.Visible(RMenu:Get('CrationPerso', 'Identity'), not RageUI.Visible(RMenu:Get('CrationPerso', 'Identity')))
		InMenu = true
	end
end

function CreateSkinPed()
	if SexeChoosen == 'Femme' then
		characterModel = "mp_f_freemode_01"
	else
		characterModel = "mp_m_freemode_01"
	end
	while not HasModelLoaded(characterModel) do
		RequestModel(characterModel)
		Citizen.Wait(0)
	end
	if IsModelInCdimage(characterModel) and IsModelValid(characterModel) then
		SetPlayerModel(PlayerId(), characterModel)
		SetPedDefaultComponentVariation(PlayerPedId())
	end
	SetModelAsNoLongerNeeded(characterModel)
	SetEntityVisible(PlayerPedId(), true)

	RageUI.CloseAll()
	RageUI.Visible(RMenu:Get('CrationPerso', 'Skin'), not RageUI.Visible(RMenu:Get('CrationPerso', 'Skin')))
end

function FaceCam()
	local SelectionCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
	SetCamCoord(SelectionCam, -1042.317, -2745.617, 21.359 + 0.68)
	PointCamAtCoord(SelectionCam, -1042.571, -2746.193, 21.359 + 0.68)
	SetCamActive(SelectionCam, true)
	RenderScriptCams(true, true, 200, true, false)
end

function HighCam()
	local SelectionCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
	SetCamCoord(SelectionCam, -1041.546, -2744.474, 21.359 + 0.48)
	PointCamAtCoord(SelectionCam, -1042.571, -2746.193, 21.359 + 0.48)
	SetCamActive(SelectionCam, true)
	RenderScriptCams(true, true, 200, true, false)
end

function LowCam()
	local SelectionCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
	SetCamCoord(SelectionCam, -1041.546, -2744.474, 21.359)
	PointCamAtCoord(SelectionCam, -1042.571, -2746.193, 21.359)
	SetCamActive(SelectionCam, true)
	RenderScriptCams(true, true, 200, true, false)
end

function DeleteCam()
	SetCamActive(SelectionCam, false)
	RenderScriptCams(false, true, 2000, true, true)
	RageUI.CloseAll()
    DestroyAllCams(true)
    Citizen.Wait(2000)
	FreezeEntityPosition(PlayerPedId(), false)
	DisplayRadar(true)
end

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

function DateIsCorrect(date)
    if (string.match(date, "^%d+%p%d+%p%d%d%d%d$")) then
        local d, m, y = string.match(date, "(%d+)%p(%d+)%p(%d+)")
        d, m, y = tonumber(d), tonumber(m), tonumber(y)
        local dm2 = d*m*m
        if  d>31 or m>12 or dm2==0 or dm2==116 or dm2==120 or dm2==124 or dm2==496 or dm2==1116 or dm2==2511 or dm2==3751 then
            if dm2==116 and (y%400 == 0 or (y%100 ~= 0 and y%4 == 0)) then
                return true
            else
                return false
            end
        else
            return true
        end
    else
        return false
    end
end

RegisterNetEvent('ApplySkin')
AddEventHandler('ApplySkin', function(Ped, Skin)
	ApplySkin(Ped, Skin)
end)

function ApplySkin(Ped, Skin)
	SetEntityVisible(PlayerPedId(Ped), true)
	SetEntityCollision(PlayerPedId(Ped), true)
	Result = json.decode(Skin)
	GoodPed = GetEntityModel(PlayerId(Ped))

	if GoodPed ~= Result.PedIndex then
		RequestModel(Result.PedIndex)
		while not HasModelLoaded(Result.PedIndex) do
			RequestModel(Result.PedIndex)
			Citizen.Wait(0)
		end 
		SetPlayerModel(PlayerId(Ped), Result.PedIndex) 
	end
	if Result.DadIndex and Result.MotherIndex then SetPedHeadBlendData(PlayerPedId(Ped), Result.DadIndex, Result.MotherIndex, nil, Result.DadIndex, Result.MotherIndex, nil, 0.5, 0.5, nil, true) end
	if Result.CheuveuxIndex then SetPedComponentVariation(PlayerPedId(Ped), 2, Result.CheuveuxIndex, 1, 2) end
	if Result.OeilIndex then SetPedEyeColor(PlayerPedId(Ped), Result.OeilIndex, 0, 1) end
	if Result.BarbeIndex then SetPedHeadOverlay(PlayerPedId(Ped), 1, Result.BarbeIndex, 1 + 0.0) end
	if Result.CouleurIndex then SetPedHairColor(PlayerPedId(Ped), Result.CouleurIndex, Result.CouleurIndex) end
	if Result.CouleurIndex then SetPedHeadOverlayColor(PlayerPedId(Ped), 1, 1, Result.CouleurIndex, Result.CouleurIndex) end
	if Result.TshirtIndex and Result.TshirtIndex2 then SetPedComponentVariation(PlayerPedId(Ped), 8, Result.TshirtIndex, Result.TshirtIndex2, 2) end
	if Result.VesteIndex and Result.VesteIndex2 then SetPedComponentVariation(PlayerPedId(Ped), 11, Result.VesteIndex, Result.VesteIndex2, 2) end
	if Result.ArmsIndex then SetPedComponentVariation(PlayerPedId(Ped), 3, Result.ArmsIndex, 0, 2) end
	if Result.PantalonIndex and Result.PantalonIndex2 then SetPedComponentVariation(PlayerPedId(Ped), 4, Result.PantalonIndex, Result.PantalonIndex2, 2) end
	if Result.ChaussureIndex and Result.ChaussureIndex2 then SetPedComponentVariation(PlayerPedId(Ped), 6, Result.ChaussureIndex, Result.ChaussureIndex2, 2) end
	ESX.TriggerServerCallback('GetPlyTatoo', function(Tatoo)
		for _,v in pairs (Tatoo) do
			AddPedDecorationFromHashes(GetPlayerPed(-1), v.Collection, GetHashKey(v.Tatoo))
		end
	end)
end

function StartDemarche(MoveSet)
	ESX.Streaming.RequestAnimSet(MoveSet, function()
		SetPedMotionBlur(GetPlayerPed(-1), false)
		SetPedMovementClipset(GetPlayerPed(-1), MoveSet, true)
		RemoveAnimSet(MoveSet)
	end)
end

function AccessoiresOn(Type, Index, Index2)
	if Type == "Masque" then
		local dict = 'missfbi4'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'takeoff_mask'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		SetPedComponentVariation(playerPed, 1, Index, Index2, 2)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Lunettes" then
		local dict = 'clothingspecs'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'try_glasses_positive_a'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		SetPedPropIndex(playerPed, 1, Index, Index2, 2)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Chapeaux" then
		local dict = 'missheistdockssetup1hardhat@'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'put_on_hat'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		SetPedPropIndex(playerPed, 0, Index, Index2, 2)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Boucles d'oreille" then
		local dict = 'mp_masks@standard_car@rps@'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'put_on_mask'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		SetPedPropIndex(playerPed, 2, Index, Index2, 2)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Veste" then
		local dict = 'mp_masks@standard_car@rps@'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'put_on_mask'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		ESX.TriggerServerCallback('GetPlySkin', function(Skin)
			Result = json.decode(Skin)
			Result.VesteIndex = Index
			Result.VesteIndex2 = Index2
			TriggerEvent('ApplySkin', GetPlayerPed(-1), json.encode(Result))
		end)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Pantalon" then
		local dict = 'mp_masks@standard_car@rps@'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'put_on_mask'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		ESX.TriggerServerCallback('GetPlySkin', function(Skin)
			Result = json.decode(Skin)
			Result.PantalonIndex = Index
			Result.PantalonIndex2 = Index2
			TriggerEvent('ApplySkin', GetPlayerPed(-1), json.encode(Result))
		end)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Chaussure" then
		local dict = 'mp_masks@standard_car@rps@'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'put_on_mask'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		ESX.TriggerServerCallback('GetPlySkin', function(Skin)
			Result = json.decode(Skin)
			Result.ChaussureIndex = Index
			Result.ChaussureIndex2 = Index2
			TriggerEvent('ApplySkin', GetPlayerPed(-1), json.encode(Result))
		end)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Tshirt" then
		local dict = 'mp_masks@standard_car@rps@'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'put_on_mask'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		ESX.TriggerServerCallback('GetPlySkin', function(Skin)
			Result = json.decode(Skin)
			Result.TshirtIndex = Index
			Result.TshirtIndex2 = Index2
			TriggerEvent('ApplySkin', GetPlayerPed(-1), json.encode(Result))
		end)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Chaines" then
		local dict = 'mp_masks@standard_car@rps@'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'put_on_mask'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		SetPedComponentVariation(playerPed, 7, Index, Index2, 2)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	end
end

function AccessoiresOff(Type)
	if Type == "Masque" then
		local dict = 'missfbi4'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'takeoff_mask'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		SetPedComponentVariation(playerPed, 1, 0, 0, 2)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Lunettes" then
		local dict = 'clothingspecs'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'try_glasses_positive_a'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		SetPedPropIndex(playerPed, 1, 0, 0, 2)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Chapeaux" then
		local dict = 'missheistdockssetup1hardhat@'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'put_on_hat'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		SetPedPropIndex(playerPed, 0, 0, 0, 2)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Boucles d'oreille" then
		local dict = 'mp_masks@standard_car@rps@'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'put_on_mask'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		SetPedPropIndex(playerPed, 2, 0, 0, 2)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Veste" then
		local dict = 'mp_masks@standard_car@rps@'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'put_on_mask'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		ESX.TriggerServerCallback('GetPlySkin', function(Skin)
			Result = json.decode(Skin)
			Result.VesteIndex = 0
			Result.VesteIndex2 = 0
			TriggerEvent('ApplySkin', GetPlayerPed(-1), json.encode(Result))
		end)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Pantalon" then
		local dict = 'mp_masks@standard_car@rps@'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'put_on_mask'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		ESX.TriggerServerCallback('GetPlySkin', function(Skin)
			Result = json.decode(Skin)
			Result.PantalonIndex = 0
			Result.PantalonIndex2 = 0
			TriggerEvent('ApplySkin', GetPlayerPed(-1), json.encode(Result))
		end)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Chaussure" then
		local dict = 'mp_masks@standard_car@rps@'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'put_on_mask'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		ESX.TriggerServerCallback('GetPlySkin', function(Skin)
			Result = json.decode(Skin)
			Result.ChaussureIndex = 0
			Result.ChaussureIndex2 = 0
			TriggerEvent('ApplySkin', GetPlayerPed(-1), json.encode(Result))
		end)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Tshirt" then
		local dict = 'mp_masks@standard_car@rps@'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'put_on_mask'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		ESX.TriggerServerCallback('GetPlySkin', function(Skin)
			Result = json.decode(Skin)
			Result.TshirtIndex = 0
			Result.TshirtIndex2 = 0
			TriggerEvent('ApplySkin', GetPlayerPed(-1), json.encode(Result))
		end)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Chaines" then
		local dict = 'mp_masks@standard_car@rps@'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'put_on_mask'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		SetPedComponentVariation(playerPed, 7, 0, 0, 2)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	end
end