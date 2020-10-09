ESX = nil
InMenu = false
PlyTenue = {}
NumberCharset = {}
Charset = {}

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

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end

for i = 65,  90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

function GeneratePlate()
    local NewPlate
    local doBreak = false

    while true do
        Citizen.Wait(2)
        math.randomseed(GetGameTimer())
        NewPlate = string.upper(GetRandomLetter(2)..GetRandomNumber(3)..GetRandomLetter(2))

        ESX.TriggerServerCallback('isPlateTaken', function(isPlateTaken)
            if not isPlateTaken then
                doBreak = true
            end
        end, NewPlate)

        if doBreak then
            break
        end
    end

    return NewPlate
end

function IsPlateTaken(plate)
    local callback = 'waiting'

    ESX.TriggerServerCallback('isPlateTaken', function(isPlateTaken)
        callback = isPlateTaken
    end, plate)

    while type(callback) == 'string' do
        Citizen.Wait(0)
    end

    return callback
end

function GetRandomNumber(length)
    Citizen.Wait(0)
    math.randomseed(GetGameTimer())
    if length > 0 then
        return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
    else
        return ''
    end
end

function GetRandomLetter(length)
    Citizen.Wait(0)
    math.randomseed(GetGameTimer())
    if length > 0 then
        return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
    else
        return ''
    end
end

RegisterNetEvent('BuyCar')
AddEventHandler('BuyCar', function(Ped, VehiclePlate, VehicleHash)
    ESX.Game.SpawnVehicle(VehicleHash, Config.Car.OutCar, Config.Car.OutCarHeading, function(Vhc)
        TaskWarpPedIntoVehicle(PlayerPedId(Ped), Vhc, -1)
        SetVehicleNumberPlateText(Vhc, VehiclePlate)
        SetEntityVisible(PlayerPedId(Ped), true)
        FreezeEntityPosition(PlayerPedId(Ped), false)
        LastVehicle = {}
        InMenu = false
        RageUI.CloseAll()
    end)
end)

function OpenBarberShop(Zone)
    RequestModel(BarberHash)
    while not HasModelLoaded(BarberHash) do
        RequestModel(BarberHash)
        Citizen.Wait(10)
    end
    BarberPed = CreatePed(1, BarberHash, Zone.PedX, Zone.PedY, Zone.PedZ - 0.95, 0.0, true, true)
    SetEntityHeading(BarberPed, Zone.PedHeading)
    SetEntityInvincible(BarberPed, true)
    SetBlockingOfNonTemporaryEvents(BarberPed, true)
    TaskPedSlideToCoord(BarberPed, Zone.PedInX, Zone.PedInY, Zone.PedInZ, Zone.PedInHeading, 1.0)
    TaskPedSlideToCoord(PlayerPedId(), Zone.InX, Zone.InY, Zone.InZ, Zone.InHeading, 1.0)
    DoScreenFadeOut(1000)
    SetEntityCoords(PlayerPedId(), Zone.AnimX, Zone.AnimY, Zone.AnimZ)
    SetEntityHeading(PlayerPedId(), Zone.AnimHeading)
    ClearPedTasks(GetPlayerPed(-1))
    BehindPlayer = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0 - 0.5, -0.5);
    TaskStartScenarioAtPosition(GetPlayerPed(-1), "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", BehindPlayer['x'], BehindPlayer['y'], BehindPlayer['z'], GetEntityHeading(PlayerPedId()), 0, 1, false)
    Citizen.Wait(1300)
    DoScreenFadeIn(5000)    
    Citizen.Wait(5000)
    FreezeEntityPosition(PlayerPedId(), true)
    InMenu = true
    RageUI.Visible(RMenu:Get('Barber', 'Principal'), not RageUI.Visible(RMenu:Get('Barber', 'Principal')))
end

RegisterNetEvent('BuyBarber')
AddEventHandler('BuyBarber', function()
    ESX.TriggerServerCallback('GetPlySkin', function(Skin)
        Result = json.decode(Skin)
        Result.CouleurIndex = CouleurIndex
        Result.CheuveuxIndex = CheuveuxIndex
        Result.BarbeIndex = BarbeIndex
        TriggerServerEvent('CreateSkin', MdpBarber, json.encode(Result))
    end)
end)