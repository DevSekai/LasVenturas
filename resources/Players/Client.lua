ESX = nil
InMenu = false

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

AddEventHandler('playerSpawned', function()
	while ESX == nil do
		Citizen.Wait(1)
	end
	ESX.TriggerServerCallback('CheckFirstSpawn', function(NotFirstSpawn)
		if NotFirstSpawn then
			SpawnPlayer()
		else
			CreatePlayer()
			SetEntityVisible(PlayerPedId(), false)
		end
	end)
end)

function SpawnPlayer()
	ESX.TriggerServerCallback('GetPlyCoords', function(Coords)
		Result = json.decode(Coords)
		SetEntityCoordsNoOffset(PlayerPedId(), Result.x, Result.y, Result.z - 0.98, true, true, true)
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
	Result = json.decode(Skin)
	RequestModel(Result.PedIndex)
	while not HasModelLoaded(Result.PedIndex) do
		RequestModel(Result.PedIndex)
		Citizen.Wait(0)
	end
	if Result.PedIndex then SetPlayerModel(PlayerId(Ped), Result.PedIndex) end
	FreezeEntityPosition(PlayerPedId(Ped), false)
	SetEntityVisible(PlayerPedId(Ped), true)
	SetEntityCollision(PlayerPedId(Ped), true)
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
end