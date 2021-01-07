TrunkTiming = 2000
CivTiming = 2000


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(TrunkTiming)

        local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 10.0, 0, 70)
		--Lockstatus
		local lockStatus = GetVehicleDoorLockStatus(vehicle)
		--Lockstatus End
        if DoesEntityExist(vehicle) then
            TrunkTiming = 0
            local trunk = GetEntityBoneIndexByName(vehicle, 'boot')
            local lockStatus = GetVehicleDoorLockStatus(vehicle)
            if trunk ~= -1 then
                local coords = GetWorldPositionOfEntityBone(vehicle, trunk)
                if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), coords, true) <= 1.5 then
                    if not inTrunk then
                        if GetVehicleDoorAngleRatio(vehicle, 5) < 0.9 then
                            DrawText3D(coords, '[N] Se cacher\n[L] Ouvrir')
								if IsControlJustReleased(1, 74)then
									if lockStatus == 1 then --unlocked
										SetCarBootOpen(vehicle)
									elseif lockStatus == 2 then -- locked
										ESX.ShowNotification('Véhicule Fermée')
									end
								end
                        else
                            DrawText3D(coords, '[N] Se cacher\n[L] Ouvrir')
                            if IsControlJustReleased(1, 74) then
                                SetVehicleDoorShut(vehicle, 5)
                            end
                        end
                    end
                    if IsControlJustReleased(1, 306) and not inTrunk then
                        local player = ESX.Game.GetClosestPlayer()
                        local playerPed = GetPlayerPed(player)
						local playerPed2 = GetPlayerPed(-1)
						if lockStatus == 1 then --unlocked
							if DoesEntityExist(playerPed) then
								if not IsEntityAttached(playerPed) or GetDistanceBetweenCoords(GetEntityCoords(playerPed), GetEntityCoords(PlayerPedId()), true) >= 5.0 then
									SetCarBootOpen(vehicle)
									Wait(350)
									AttachEntityToEntity(PlayerPedId(), vehicle, -1, 0.0, -2.2, 0.5, 0.0, 0.0, 0.0, false, false, false, false, 20, true)	
									loadAnimDict('timetable@floyd@cryingonbed@base')
									TaskPlayAnim(PlayerPedId(), 'timetable@floyd@cryingonbed@base', 'base', 8.0, -8.0, -1, 1, 0, false, false, false)
									Wait(50)
									inTrunk = true

									Wait(1500)
									SetVehicleDoorShut(vehicle, 5)
								else
									ESX.ShowNotification('Il y a déjà quelqu\'un dans le coffre!')
								end
							end
						elseif lockStatus == 2 then -- locked
							ESX.ShowNotification('Véhicule Fermée')
						end
                    end
                end
            end
            if inTrunk then
                local coords = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, 'boot'))
                SetEntityCollision(PlayerPedId(), false, false)
                DrawText3D(coords, '[N] Sortir du coffre')

                if GetVehicleDoorAngleRatio(vehicle, 5) < 0.9 then
                    SetEntityVisible(PlayerPedId(), false, false)
                else
                    if not IsEntityPlayingAnim(PlayerPedId(), 'timetable@floyd@cryingonbed@base', 3) then
                        loadAnimDict('timetable@floyd@cryingonbed@base')
                        TaskPlayAnim(PlayerPedId(), 'timetable@floyd@cryingonbed@base', 'base', 8.0, -8.0, -1, 1, 0, false, false, false)

                        SetEntityVisible(PlayerPedId(), true, false)
                    end
                end
                if IsControlJustReleased(1, 306) and inTrunk then
                    SetCarBootOpen(vehicle)
                    SetEntityCollision(PlayerPedId(), true, true)
                    Wait(750)
                    inTrunk = false
                    DetachEntity(PlayerPedId(), true, true)
                    SetEntityVisible(PlayerPedId(), true, false)
                    ClearPedTasks(PlayerPedId())
                    SetEntityCoords(PlayerPedId(), GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, -0.5, -0.75))
                    Wait(250)
                    SetVehicleDoorShut(vehicle, 5)
                end
            end
        else
            TrunkTiming = 2000
        end
    end
end)

Citizen.CreateThread( function()
    while true do
        Citizen.Wait(CivTiming)

        local CitoyenCible, distance = getNearPlayer()
        if (distance ~= -1 and distance < 2) then
            CivTiming = 0
            if IsPedArmed(GetPlayerPed(-1), 7) then
                SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey('WEAPON_UNARMED'), true)
            end
            if (DoesEntityExist(GetPlayerPed(-1)) and not IsEntityDead(GetPlayerPed(-1))) and IsControlPressed(1, 19) and IsControlJustPressed(1, 51) then
                loadAnimDict("melee@unarmed@streamed_variations")
                TaskPlayAnim(GetPlayerPed(-1), "melee@unarmed@streamed_variations", "plyr_takedown_front_slap", 8.0, 1.0, 1500, 1, 0, 0, 0, 0)
                TriggerServerEvent("Feat:SyncAnim", GetPlayerServerId(CitoyenCible))
            end
        else
            CivTiming = 2000
        end
    end
end)

RegisterNetEvent('Feat:SyncAnim')
AddEventHandler('Feat:SyncAnim', function(playerNetId)
    Wait(250)
    TriggerServerEvent("Feat:SyncSv")
    SetPedToRagdoll(GetPlayerPed(-1), 2000, 2000, 0, 0, 0, 0)
end)

RegisterNetEvent('Feat:SyncCl')
AddEventHandler('Feat:SyncCl', function(playerNetId)
    local lCoords = GetEntityCoords(GetPlayerPed(-1))
    local eCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerNetId)))
    local distIs  = Vdist(lCoords.x, lCoords.y, lCoords.z, eCoords.x, eCoords.y, eCoords.z)
    if (distIs <= 2.0001) then
        SendNUIMessage({
            DemarrerLaMusique     = 'Sound:Slap',
            VolumeDeLaMusique   = VolumeDeLaMusique
        })
    end
end)
