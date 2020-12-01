ESX = nil
InMenu, PlayerSpawn, MdpClien, HasDamaged, HasFaim, HasSoif, HudHiden = false, false, "Ntm", false, false, false, false
Accessoires = {}


Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(10)
    end
	if ESX then
		while ESX.GetPlayerData().job == nil do
			Citizen.Wait(10)
		end
    end
	ESX.PlayerData = ESX.GetPlayerData()
	InitPlayers()
end)

function InitPlayers()
	Citizen.Wait(1000)
	exports.spawnmanager:setAutoSpawn(false)
	ESX.TriggerServerCallback('CheckFirstSpawn', function(NotFirstSpawn)
		if NotFirstSpawn then
			SpawnPlayer()
		else
			CreatePlayer()
			SetEntityVisible(PlayerPedId(), false)
		end
	end)
	Citizen.Wait(1000)
	ESX.TriggerServerCallback('getUserLoadout', function(PlyWeapons)
		Result = json.decode(PlyWeapons)
		for k,v in pairs (Result) do
			WeaponHash = GetHashKey(k)
			GiveWeaponToPed(PlayerPedId(), WeaponHash, v.ammo, false, false)
		end
	end)
end
-----------------------------------------------------------------------------
----------------Utils-------------------------------------
function SpawnPlayer()
	Citizen.Wait(1000)
	ESX.TriggerServerCallback('GetPlyCoords', function(Coords)
		Result = json.decode(Coords)
		SetEntityCoordsNoOffset(PlayerPedId(), Result.x, Result.y, Result.z, true, true, true)
		SetEntityHeading(PlayerPedId(), Result.heading)
	end)
	Citizen.Wait(1000)
	ESX.TriggerServerCallback('GetPlySkin', function(Skin)
		ApplySkin(GetPlayerPed(-1), Skin)
    end)
	Citizen.Wait(1000)
	ESX.TriggerServerCallback('GetPlyCoords', function(Coords)
		Result = json.decode(Coords)
		SetEntityCoordsNoOffset(PlayerPedId(), Result.x, Result.y, Result.z, true, true, true)
		SetEntityHeading(PlayerPedId(), Result.heading)
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

RegisterNetEvent('GetPlyWeapon')
AddEventHandler('GetPlyWeapon', function(Ped, Weapon)
	print("Test")
end)

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
	ESX.ShowNotification("Personnage chargé avec succés")
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
	elseif Type == "Boucles" then
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
	elseif Type == "Vestes" then
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
		SetPedComponentVariation(myPed, 11, Index, Index2, 2)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Pantalons" then
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
		SetPedComponentVariation(myPed, 4, Index, Index2, 2)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Chaussures" then
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
		SetPedComponentVariation(myPed, 6, Index, Index2, 2)
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
		SetPedComponentVariation(myPed, 8, Index, Index2, 2)
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
	elseif Type == "Boucles" then
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
	elseif Type == "Vestes" then
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
		SetPedComponentVariation(myPed, 11, 0, 0, 2)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Pantalons" then
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
		SetPedComponentVariation(myPed, 4, 0, 0, 2)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Chaussures" then
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
		SetPedComponentVariation(myPed, 6, 0, 0, 2)
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
		SetPedComponentVariation(myPed, 8, 0, 0, 2)
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