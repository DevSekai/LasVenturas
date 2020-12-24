RMenu.Add("Lift", "Lift_Main", RageUI.CreateMenu("", "A quel étage voulez vous aller ??", nil, nil, "root_cause", "Banner"), true)
RMenu:Get("Lift", "Lift_Main").Closable = false;
ESX = nil

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
    PlayerData = ESX.GetPlayerData()     
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

Citizen.CreateThread( function()
    while true do
        Citizen.Wait(0)

        for _,v in pairs (Lift.Floor) do -- Je recherche TOUT les POS présent dans ma table Lift.Floor --
            local Distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.Pos.x, v.Pos.y, v.Pos.z, true)
            if Distance < 5 then -- Si la distance est inférieur à 5 alors un Marker apparait --
                DrawMarker(22, v.Pos.x, v.Pos.y, v.Pos.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 1.0, false, true, 2, true, nil, false)
                if Distance < 1.5 then -- Si la distance est inférieur à 1.5 alors je save la Zone pour l'utiliser plus tard --
                    if v.Job == PlayerData.job.name then
                        Lift.CrtZone = v.Zone
                        Lift.Help("Appuyer sur ~INPUT_CONTEXT~ pour acceder au menu.")
                        if IsControlJustReleased(1, 51) then
                            for _,v in pairs (Lift.Floor) do -- Je recherche TOUT les POS présent dans ma table Lift.Floor --
                                if v.Zone == Lift.CrtZone then -- Si la Zone est la même que la Zone dans la quelle je suis j'insert les données dans une table --
                                    table.insert(Lift.CrtLift, v.Floor, {Pos = v.Pos, Label = v.Label})
                                end
                            end
                            RageUI.Visible(RMenu:Get("Lift", "Lift_Main"), not RageUI.Visible(RMenu:Get("Lift", "Lift_Main")))
                            FreezeEntityPosition(PlayerPedId(), true)
                        end
                    end
                end
            end
        end

        RageUI.IsVisible(RMenu:Get("Lift", "Lift_Main"), function()
            for _,v in pairs (Lift.CrtLift) do -- Je recherche TOUT les POS présent dans ma table Lift.CrtLift qui est lié à la zone actuel --
                RageUI.Item.Button(v.Label, nil, {}, true, {
                    onSelected = function()
                        Lift.TakeLift(v.Pos)
                    end,
                })
            end
            RageUI.Item.Button("Retour", nil, {}, true, {
                onSelected = function()
                    Lift.LeaveLift()
                end,
            })
        end)
    end
end)