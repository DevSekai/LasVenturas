local speedBuffer  = {}
local velBuffer    = {}
local beltOn       = false
local wasInCar     = false

IsCar = function(veh)
    local vc = GetVehicleClass(veh)
    return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 17 and vc <= 20)
end	

Fwv = function (entity)
    local hr = GetEntityHeading(entity) + 90.0
    if hr < 0.0 then hr = 360.0 + hr end
    hr = hr * 0.0174533
    return { x = math.cos(hr) * 2.0, y = math.sin(hr) * 2.0 }
end

Driftmode = false

function GetPed() return GetPlayerPed(-1) end

function GetCar() return GetVehiclePedIsIn(GetPlayerPed(-1),false) end

SetPlayerCanDoDriveBy(GetPlayerPed(-1), true)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Hud.Timing)

        local player = PlayerPedId()
        local position = GetEntityCoords(player)
        local vehicle = GetVehiclePedIsIn(player, false)
        local vehicleClass = GetVehicleClass(vehicle)
        local CrtSpeed = GetEntitySpeed(vehicle)
        local LastSpeed = CrtSpeed

        if IsPedInAnyVehicle(player, false) and GetIsVehicleEngineRunning(vehicle) and vehicleClass ~= 13 then
            Hud.Timing = 0
            local model = GetEntityModel(vehicle)
            -- If it's not a boat, plane or helicopter, and the vehilce is off the ground with ALL wheels, then block steering/leaning left/right/up/down.
            if not IsThisModelABoat(model) and not IsThisModelAHeli(model) and not IsThisModelAPlane(model) and not VvehicleClass == 8 and IsEntityInAir(veh) then
                DisableAllControlActions(0)
                DisableAllControlActions(1)
                DisableAllControlActions(2)
            end
            if GetPedInVehicleSeat(vehicle, -1) == GetPlayerPed(-1) and (CrtSpeed * 3.6) >= 30.0 then
                SetPlayerCanDoDriveBy(PlayerId(), false)
                canshoot = false
            else
                if not canshoot then
                    SetPlayerCanDoDriveBy(PlayerId(), true)
                    canshoot = true
                end
            end
            if IsControlJustPressed(1, 118) then
                Driftmode = not Driftmode
            end
            if Driftmode then
                drawTxt("Drift mode : Activer", 2, {255, 255, 255, 255}, 0.4, Hud.X + 0.005, Hud.Y + 0.008)
                if IsPedInAnyVehicle(GetPed(), false) then
                    CarSpeed = GetEntitySpeed(GetCar()) * 3.6
                    if GetPedInVehicleSeat(GetCar(), -1) == GetPed() then
                        if CarSpeed <= 150.0 then  
                            if IsControlPressed(1, 21) then
                                SetVehicleReduceGrip(GetCar(), true)
                            else
                                SetVehicleReduceGrip(GetCar(), false)
                            end
                        end
                    end
                end
            end
            local Speed = CrtSpeed*3.6
            local SpeedClr = (Speed >= Hud.SpeedLimit) and Hud.SpeedOver or Hud.SpeedUnder
            drawTxt(("%.3d"):format(math.ceil(Speed)), 2, SpeedClr, 0.8, Hud.X + 0.000, Hud.Y + 0.028)
            drawTxt("KmH", 2, SpeedClr, 0.4, Hud.X + 0.030, Hud.Y + 0.038)
            
            CrtFuel = 100 * GetVehicleFuelLevel(vehicle) / GetVehicleHandlingFloat(vehicle,"CHandlingData","fPetrolTankVolume")
            local FuelColor = (CrtFuel >= Hud.FuelLimit) and Hud.FuelOver or Hud.FuelUnder
            drawTxt(("%.3d"):format(math.ceil(CrtFuel)), 2, FuelColor, 0.8, Hud.X + 0.06, Hud.Y + 0.028)
            drawTxt("Fuel", 2, FuelColor, 0.4, Hud.X + 0.09, Hud.Y + 0.038)

            year ,month ,day ,hour ,minute ,second  = GetLocalTime()
            timeText = ("%.2d"):format((hour +1 == 0) and 24 or hour +1) .. ":" .. ("%.2d"):format( minute)
            drawTxt(timeText, 4, Hud.ClrTxt, 0.4, Hud.X + 0.005, Hud.Y + 0.078)

            
            if IsControlJustReleased(0, Hud.SeatbeltKey) and vehicleClass ~= 8 then
                SeatbeltState = not SeatbeltState
                PlaySoundFrontend(-1, "Faster_Click", "RESPAWN_ONLINE_SOUNDSET", 1)
            end
            
            local ped = GetPlayerPed(-1)
            local car = GetVehiclePedIsIn(ped)
            
            if vehicle ~= 0 and (wasInCar or IsCar(vehicle)) then
            
                wasInCar = true
                
                if SeatbeltState then 
                    SetPedConfigFlag(PlayerPedId(), 32, true)
                    DisableControlAction(0, 75) 
                end
                
                speedBuffer[2] = speedBuffer[1]
                speedBuffer[1] = GetEntitySpeed(vehicle)
                
                if speedBuffer[2] ~= nil 
                and not SeatbeltState
                and GetEntitySpeedVector(vehicle, true).y > 1.0  
                and speedBuffer[1] > Hud.SeatbeltEject 
                and (speedBuffer[2] - speedBuffer[1]) > (speedBuffer[1] * Hud.SeatbeltEjectAcc) then
                
                    local co = GetEntityCoords(ped)
                    local fw = Fwv(ped)
                    SetEntityCoords(ped, co.x + fw.x, co.y + fw.y, co.z - 0.47, true, true, true)
                    SetEntityVelocity(ped, velBuffer[2].x, velBuffer[2].y, velBuffer[2].z)
                    Citizen.Wait(1)
                    SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
                end
                    
                velBuffer[2] = velBuffer[1]
                velBuffer[1] = GetEntityVelocity(car)
                
            elseif wasInCar then
                wasInCar = false
                SeatbeltState = false
                speedBuffer[1], speedBuffer[2] = 0.0, 0.0
            end
            if vehicleClass ~= 8 then
                local SeatbeltColor = SeatbeltState and Hud.SeatbeltOn or Hud.SeatbeltOff
                drawTxt("Ceinture", 2, SeatbeltColor, 0.4, Hud.X + 0.076, Hud.Y + 0.078)
            end

            if (GetPedInVehicleSeat(vehicle, -1) == player) then
                if IsControlJustReleased(0, Hud.LimiteurKey) then
                    LimiteurState = not LimiteurState
                    LimiteurSpeed = CrtSpeed
                    if LimiteurState then
                        SetEntityMaxSpeed(vehicle, CrtSpeed)
                        ESX.ShowNotification("Limiteur de vitesse activé.")
                    else
                        local MaxSpeed = LimiteurState and LimiteurSpeed or GetVehicleHandlingFloat(vehicle,"CHandlingData","fInitialDriveMaxFlatVel")
                        SetEntityMaxSpeed(vehicle, MaxSpeed)
                        ESX.ShowNotification("Limiteur de vitesse désactivé.")
                    end
                end
            end
            local LimiteurClr = LimiteurState and Hud.LimiteurOn or Hud.LimiteurOff
            drawTxt("Limiteur", 2, LimiteurClr, 0.4, Hud.X + 0.030, Hud.Y + 0.078)
        else
            Hud.Timing = 2000
            LimiteurState = false
            SeatbeltState = false
        end
    end
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