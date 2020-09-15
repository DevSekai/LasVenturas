ESX = nil
InMenu = false

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

--AddEventHandler('playerSpawned', function()
AddEventHandler('onClientResourceStart', function()
	while ESX == nil do
		Citizen.Wait(1)
	end
	ESX.TriggerServerCallback('CheckFirstSpawn', function(NotFirstSpawn)
		if NotFirstSpawn then
			SpawnPlayer()
		else
			CreatePlayer()
		end
	end)
end)

function SpawnPlayer()
	ESX.TriggerServerCallback('GetPlyCoords', function(Coords)
		Result = json.decode(Coords)
		SetEntityCoords(PlayerPedId(), Result.x, Result.y, Result.z - 0.98)
		SetEntityHeading(PlayerPedId(), Result.heading)
	end)
end

function CreatePlayer()
	SetEntityCoords(PlayerPedId(), -1042.571, -2746.193, 21.359 - 0.98)
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
	RenderScriptCams(false, false, 0, 1, 0)
    DestroyAllCams(true)
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