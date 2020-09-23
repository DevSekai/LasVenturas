ESX = nil
PlyTenue = {}
InMenu = false

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

function EnteringMaskShop()
	SetEntityCoords(PlayerPedId(), -1337.261, -1277.351, 4.880 - 0.98)
	SetEntityHeading(PlayerPedId(), 82.342)
	FreezeEntityPosition(PlayerPedId(), true)
	MaskCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
	SetCamCoord(MaskCam, -1338.976, -1277.313, 4.888 + 0.58)
	PointCamAtCoord(MaskCam, -1337.261, -1277.351, 4.880 + 0.78)
	SetCamActive(MaskCam, true)
	RenderScriptCams(true, true, 2000, true, false)
end

function DeleteMaskCam()
	SetCamActive(MaskCam, false)
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