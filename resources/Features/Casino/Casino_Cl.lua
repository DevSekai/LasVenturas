ESX = nil
CarSpawn = false
InRoll = false
MdpCasino = "Ntm"

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
    TriggerServerEvent('CheckVehicleSpawn')
    PodiumHash = GetHashKey("vw_prop_vw_casino_podium_01a")
    RequestModel(PodiumHash)
    while not HasModelLoaded(PodiumHash) do
        RequestModel(PodiumHash)
        Citizen.Wait(0)
    end
    Podium = CreateObject(PodiumHash, Config.Casino.PodiumCoords, false, true, true)
    WheelHash = GetHashKey("vw_prop_vw_luckywheel_02a")
    RequestModel(WheelHash)
    while not HasModelLoaded(WheelHash) do
        RequestModel(WheelHash)
        Citizen.Wait(0)
    end
    Wheel = CreateObject(WheelHash, Config.Casino.WheelCoords, false, true, true)
    SetEntityHeading(Wheel, 0.0)

    while true do
        Citizen.Wait(0)
        local distanceRoue = (GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Config.Casino.WheelDist, true))
        if distanceRoue < 1.5 and not InRoll then
            ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour faire tourner la roue pour ~g~"..Config.Casino.RollPrice.." $")
            if IsControlJustReleased(0, 51) then
                TriggerServerEvent('RollWheel', MdpCasino, Config.Casino.RollPrice)
            end
        end 
        if DoesEntityExist(Car) then
            PodiumHeading = GetEntityHeading(Podium)
            SetEntityHeading(Podium, PodiumHeading + Config.Casino.PodiumSpeed)
            CarHeading = GetEntityHeading(Car)
            SetEntityHeading(Car, CarHeading + Config.Casino.PodiumSpeed)
        end
    end
end)

RegisterNetEvent('SpawnRandomCar')
AddEventHandler('SpawnRandomCar', function()
    Index = GetRandomIntInRange(1,  #Config.Casino.VehicleHash)
    CarHash = GetHashKey(Config.Casino.VehicleHash[Index])
    if not DoesEntityExist(Car) then
        Car = RequestModel(CarHash)
        while not HasModelLoaded(CarHash) do
            RequestModel(CarHash)
            Citizen.Wait(0)
        end
        Car = CreateVehicle(CarHash, Config.Casino.VehicleCoords, 0.0, false, true)
        SetVehicleDoorsLockedForNonScriptPlayers(Car, true)
        FreezeEntityPosition(Car, true)
    end
    TriggerServerEvent('SendVehicleHash', Config.Casino.VehicleHash[Index])
end)

RegisterNetEvent('SpawnCar')
AddEventHandler('SpawnCar', function(VhcHash)
    if not DoesEntityExist(Car) then
        Car = RequestModel(VhcHash)
        while not HasModelLoaded(VhcHash) do
            RequestModel(VhcHash)
            Citizen.Wait(0)
        end
        Car = CreateVehicle(VhcHash, Config.Casino.VehicleCoords, 0.0, true, true)
        SetVehicleDoorsLockedForNonScriptPlayers(Car, true)
        FreezeEntityPosition(Car, true)
        CarSpawn = true
    end
end)

RegisterNetEvent('WinCar')
AddEventHandler('WinCar', function(VehicleHash, VhcPlate)
    DeleteEntity(Car)
    VhcHash = GetHashKey(VehicleHash)
    RequestModel(VhcHash)
    while not HasModelLoaded(VhcHash) do
        RequestModel(VhcHash)
        Citizen.Wait(0)
    end
    OwnedCar = CreateVehicle(VhcHash, Config.Casino.VehicleCoords, 144.206, true, true)
    SetVehicleNumberPlateText(OwnedCar, VhcPlate)
    TaskWarpPedIntoVehicle(PlayerPedId(), OwnedCar, -1)
    DoScreenFadeOut(5000)
    Citizen.Wait(6000)
    SetPedCoordsKeepVehicle(PlayerPedId(), Config.Casino.WinCar)
    SetEntityHeading(OwnedCar, Config.Casino.WinCarHeading)
    DoScreenFadeIn(5000)
end)

RegisterNetEvent('StartRoll')
AddEventHandler('StartRoll', function()
    if not InRoll then
        InRoll = true
        local playerPed = PlayerPedId()
        local _lib = 'anim_casino_a@amb@casino@games@lucky7wheel@female'
        if IsPedMale(playerPed) then
            _lib = 'anim_casino_a@amb@casino@games@lucky7wheel@male'
        end
        local lib, anim = _lib, 'enter_right_to_baseidle'
        ESX.Streaming.RequestAnimDict(lib, function()
            local _movePos = vector3(1109.55, 228.88, -49.64)
            TaskGoStraightToCoord(playerPed,  _movePos.x,  _movePos.y,  _movePos.z,  1.0,  -1,  312.2,  0.0)
            local _isMoved = false
            while not _isMoved do
                local coords = GetEntityCoords(PlayerPedId())
                if coords.x >= (_movePos.x - 0.01) and coords.x <= (_movePos.x + 0.01) and coords.y >= (_movePos.y - 0.01) and coords.y <= (_movePos.y + 0.01) then
                    _isMoved = true
                end
                Citizen.Wait(0)
            end
            TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
            while IsEntityPlayingAnim(playerPed, lib, anim, 3) do
                    Citizen.Wait(0)
                    DisableAllControlActions(0)
                    
            end
            TaskPlayAnim(playerPed, lib, 'enter_to_armraisedidle', 8.0, -8.0, -1, 0, 0, false, false, false)
            while IsEntityPlayingAnim(playerPed, lib, 'enter_to_armraisedidle', 3) do
                Citizen.Wait(0)
                DisableAllControlActions(0)
            end
            TaskPlayAnim(playerPed, lib, 'armraisedidle_to_spinningidle_high', 8.0, -8.0, -1, 0, 0, false, false, false)
            StartRoll()
        end)
    end
end)

function StartRoll()
    local speedIntCnt = 2
    local RollSpeed = 1.0
    local Reward = math.random(1, 20)
    local WinAnlge = (Reward - 1) * 18
    local RollAnlge = WinAnlge + (360 * 8)
    local MidLenght = (RollAnlge / 2)
    local intCnt = 0
    SetEntityHeading(Wheel, -30.0)
    SetEntityRotation(Wheel, 0.0, 0.0, 0.0, 1, true)
    while speedIntCnt > 0 do
        local WheelRotation = GetEntityRotation(Wheel, 1)
        if RollAnlge > MidLenght then
            speedIntCnt = speedIntCnt + 1
        else
            speedIntCnt = speedIntCnt - 1
            if speedIntCnt < 0 then
                speedIntCnt = 0       
            end
        end
        intCnt = intCnt + 1
        RollSpeed = speedIntCnt / 10
        local NewY = WheelRotation.y - RollSpeed
        RollAnlge = RollAnlge - RollSpeed
        SetEntityRotation(Wheel, 0.0, NewY, 0.0, 1, true)
        Citizen.Wait(0)
    end
    ClearPedTasks(PlayerPedId())
    InRoll = false
    Index = GetRandomIntInRange(1,  #Config.Casino.WheelReward)
    GoodReward = Config.Casino.WheelReward[Index]
    VhcPlate = GetVehicleNumberPlateText(Car)
    TriggerServerEvent('GetReward', MdpCasino, GoodReward, VhcPlate)
end