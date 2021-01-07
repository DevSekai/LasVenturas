RMenu.Add('Staff', 'Main', RageUI.CreateMenu("", "Menu administration", nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Staff', 'Main'):DisplayGlare(false);
RMenu:Get('Staff', 'Main').Closed = function()
    Timing = 0
    InMenu = false
end
RMenu.Add("Staff", "CarsList", RageUI.CreateSubMenu(RMenu:Get("Staff", "Main"), "", "Véhicules disponnible"))
RMenu.Add("Staff", "ItemsList2", RageUI.CreateSubMenu(RMenu:Get("Staff", "Main"), "", "Items disponnible"))
RMenu.Add("Staff", "WeaponList2", RageUI.CreateSubMenu(RMenu:Get("Staff", "Main"), "", "Armes disponnible"))
RMenu.Add("Staff", "JobsList2", RageUI.CreateSubMenu(RMenu:Get("Staff", "Main"), "", "Jobs disponnible"))
RMenu.Add("Staff", "Jobs2List2", RageUI.CreateSubMenu(RMenu:Get("Staff", "Main"), "", "Jobs2 disponnible"))

RMenu.Add("Staff", "PlyList", RageUI.CreateSubMenu(RMenu:Get("Staff", "Main"), "", "Joueurs connecté"))
RMenu:Get("Staff", "PlyList").Closed = function()
    Staff.PlyListIndex = 1
end
RMenu.Add("Staff", "PlyWarmList", RageUI.CreateSubMenu(RMenu:Get("Staff", "PlyList"), "", "Avertissements"))
RMenu.Add("Staff", "ItemsList", RageUI.CreateSubMenu(RMenu:Get("Staff", "PlyList"), "", "Items disponnible"))
RMenu.Add("Staff", "WeaponList", RageUI.CreateSubMenu(RMenu:Get("Staff", "PlyList"), "", "Armes disponnible"))
RMenu.Add("Staff", "JobsList", RageUI.CreateSubMenu(RMenu:Get("Staff", "PlyList"), "", "Jobs disponnible"))
RMenu.Add("Staff", "Jobs2List", RageUI.CreateSubMenu(RMenu:Get("Staff", "PlyList"), "", "Jobs2 disponnible"))


Timing = 0
ActionTiming = 2000
InMenu = false
CrtId = nil
CrtTrigger = nil
LastMenu = nil
CrtPed = nil
LstCoords = nil

Citizen.CreateThread( function()
    while true do
        Citizen.Wait(Timing)
        if IsControlJustReleased(1, 51) then
            if not Staff.JobsListsReady then
                GetJobsLists()
            end
            OpenMenu()
        end
    end
end)

Citizen.CreateThread( function()
    while true do
        Citizen.Wait(ActionTiming)
        if Staff.Noclip then
            local plyPed = GetPlayerPed(-1)
            local plyCoords = GetEntityCoords(plyPed, false)
			local camCoords = getCamDirection()
			SetEntityVelocity(plyPed, 0.01, 0.01, 0.01)

			if IsControlPressed(0, 32) then
				plyCoords = plyCoords + (1.1 * camCoords)
			end

			if IsControlPressed(0, 269) then
				plyCoords = plyCoords - (1.1 * camCoords)
			end

			SetEntityCoordsNoOffset(plyPed, plyCoords, true, true, true)
        end
        if Staff.PlyName then
            for i = 0, 256 do
                if NetworkIsPlayerActive(i) then
                    local GamerTagId = 0
                    local PlayerPed = GetPlayerPed(i)
                    
                    -- If the player (loop id) is NOT the same as the current player, create a new GamerTagId.
                    --if Player ~= PlayerId() then
                        GamerTagId = CreateMpGamerTag(PlayerPed, GetPlayerName(i), false, false, "", 0)
                    --end
                    
                    -- Using that GamerTagId, we remove the gamertag if the player is more than _distance_ away from another other player.
                    if Vdist2(GetEntityCoords(PlayerPed, true), GetEntityCoords(PlayerPedId(), true)) > 5 * 10  then
                        RemoveMpGamerTag(GamerTagId)
                    end
                end
            end
        end
        if Staff.Spectate then
            Coords = GetEntityCoords(CrtPed)
            SetEntityCoordsNoOffset(PlayerPedId(), Coords, true, true, true)
        end
    end
end)

function OpenMenu()
    Timing = 2000
    RageUI.Visible(RMenu:Get("Staff", "Main"), not RageUI.Visible(RMenu:Get("Staff", "Main")))
    InMenu = true
    while InMenu do
        Citizen.Wait(0)
        
        RageUI.IsVisible(RMenu:Get("Staff", "Main"), function()
            RageUI.Item.Checkbox("StaffMode", "", Staff.AdminState, {}, {
                onSelected = function()
                    if not Staff.AdminState then
                        Staff.AdminState = true
                        if Staff.UseFd_Logs then
                            TriggerServerEvent("Fd_Logs:SendLogs", "Staff", "Purple", "Prise de service", ""..GetPlayerName(PlayerId()).." à activer son staffmode.")
                        end
                        Citizen.Wait(10)
                        ESX.ShowNotification("Vous avez activer le StaffMode")
                    else
                        Staff.AdminState = false
                        if Staff.UseFd_Logs then
                            TriggerServerEvent("Fd_Logs:SendLogs", "Staff", "Purple", "Fin de service", ""..GetPlayerName(PlayerId()).." à désactiver son staffmode.")
                        end
                        Citizen.Wait(10)
                        ESX.ShowNotification("Vous avez désactiver le StaffMode")
                    end
                end,
            })
            if Staff.AdminState then
                RageUI.Item.Separator("Utilitaire")
                RageUI.Item.Checkbox("Noclip", "", Staff.Noclip, {}, {
                    onSelected = function()
                        if not Staff.Noclip then
                            Staff.Noclip = true
                            Citizen.Wait(10)
                            ActionTiming = 0
                            SetEntityVisible(PlayerPedId(), false)
                            FreezeEntityPosition(PlayerPedId(), true)
                            ESX.ShowNotification("Vous avez activer le Noclip")
                        else
                            Staff.Noclip = false
                            Citizen.Wait(10)
                            ActionTiming = 2000
                            SetEntityVisible(PlayerPedId(), true)
                            FreezeEntityPosition(PlayerPedId(), false)
                            ESX.ShowNotification("Vous avez désactiver le Noclip")
                        end
                    end,
                })
                RageUI.Item.Checkbox("Blips", "", Staff.PlyBlips, {}, {
                    onSelected = function()
                        if not Staff.PlyBlips then
                            Staff.PlyBlips = true
                            Citizen.Wait(10)
                            CreatePlyBlips()
                            ESX.ShowNotification("Vous avez activer les Nom")
                        else
                            Staff.PlyBlips = false
                            Citizen.Wait(10)
                            DeletePlyBlips()
                            ESX.ShowNotification("Vous avez désactiver les Nom")
                        end
                    end,
                })
                RageUI.Item.Checkbox("Nom", "", Staff.PlyName, {}, {
                    onSelected = function()
                        if not Staff.PlyName then
                            Staff.PlyName = true
                            Citizen.Wait(10)
                            ActionTiming = 0
                            ESX.ShowNotification("Vous avez activer les Nom")
                        else
                            Staff.PlyName = false
                            Citizen.Wait(10)
                            ActionTiming = 2000
                            ESX.ShowNotification("Vous avez désactiver les Nom")
                        end
                    end,
                })
                RageUI.Item.Separator("Environement")
                RageUI.Item.List("Météo", {"CLEAR","EXTRASUNNY","CLOUDS","OVERCAST","RAIN","CLEARING","THUNDER","SMOG","FOGGY","XMAS","SNOWLIGHT","BLIZZARD"}, 1, nil, {}, true, {
                    onSelected = function(Index, Items)
                        TriggerServerEvent("Fd_Staff:SetWeather", Items)
                    end,
                })
                RageUI.Item.List("Heure", {
                    {Name = "00:00", Hour = 0},
                    {Name = "4:00", Hour = 4},
                    {Name = "8:00", Hour = 8},
                    {Name = "12:00", Hour = 12},
                    {Name = "16:00", Hour = 16},
                    {Name = "20:00", Hour = 20}
                }, 1, nil, {}, true, {
                    onSelected = function(Index, Items)
                        TriggerServerEvent("Fd_Staff:SetTime", Items.Hour)
                    end,
                })
                RageUI.Item.List("Clear la zone", {5.0, 15.0, 30.0, 60.0, 120.0}, 1, nil, {}, true, {
                    onSelected = function(Index, Items)
                        Coords = GetEntityCoords(PlayerPedId())
                        ClearArea(Coords.x, Coords.y, Coords.z, Items, true, false, true, false)
                        CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
                        if DoesEntityExist(CrtVhc) then
                            DeleteEntity(CrtVhc)
                        end
                    end,
                })
                RageUI.Item.Button("Spawn un véhicule", "", {}, true, {
                },RMenu:Get("Staff", "CarsList"))
                RageUI.Item.Separator("Actions")
                RageUI.Item.Button("Liste des joueurs", "", {}, true, {
                    onSelected = function()
                        Staff.PlyList = {}
                        for i = 0, 256 do
                            if NetworkIsPlayerActive(i) then
                                table.insert(Staff.PlyList, i)
                            end
                        end
                    end,
                },RMenu:Get("Staff", "PlyList"))
                for _,v in pairs (Staff.PlyActions) do
                    if not v.Menu then
                        RageUI.Item.Button(v.Name, "", {}, true, {
                            onSelected = function()
                                CrtTrigger = v.Value
                                CrtId = GetPlayerServerId(PlayerId())
                                if v.Value == "GiveCash" then
                                    Amount = KeyboardInput("Quantité", "", 10)
                                    if tonumber(Amount) ~= nil then
                                        TriggerServerEvent(CrtTrigger, CrtTrigger, CrtId, tonumber(Amount))
                                    else
                                        ESX.ShowNotification(Staff.KeyboardError)
                                    end
                                elseif v.Value == "Revive" then
                                    TriggerServerEvent(CrtTrigger, CrtTrigger, CrtId)
                                end
                            end,
                        })
                    else
                        RageUI.Item.Button(v.Name, "", {}, true, {
                            onSelected = function()
                                CrtTrigger = v.Value
                                CrtId = GetPlayerServerId(PlayerId())
                            end,
                        },RMenu:Get("Staff", v.Menu))
                    end
                end
            end
        end)
        
        RageUI.IsVisible(RMenu:Get("Staff", "PlyList"), function()
            for _, v in pairs(Staff.PlyList) do
                local Vie = GetEntityHealth(GetPlayerPed(v)) / 2
                RageUI.Item.List("Nom : "..GetPlayerName(v).." - HP : "..Vie, Staff.PlyListActions, Staff.PlyListIndex or 1, nil, {}, true, {
                    onSelected = function(Index, Items)
                        Staff.PlyListIndex = Index
                        CrtTrigger = Items.Value
                        CrtId = GetPlayerServerId(v)
                        if not Items.Menu then
                            if Items.Value == "WarnsList" then
                                ESX.TriggerServerCallback('Ld_Staff:GetPlyWarns', function(Warns)
                                    Staff.PlyWamrs = Warns
                                    RageUI.Visible(RMenu:Get("Staff", "PlyWarmList"), true)
                                end, CrtId)
                            elseif Items.Value == "GiveCash" then
                                Amount = KeyboardInput("Quantité", "", 10)
                                if tonumber(Amount) ~= nil then
                                    TriggerServerEvent(CrtTrigger, CrtTrigger, CrtId, tonumber(Amount))
                                else
                                    ESX.ShowNotification(Staff.KeyboardError)
                                end
                            elseif Items.Value == "Warns" or Items.Value == "Ban" then
                                year, month, day, hour, minute, second = GetLocalTime()
                                Date = day.."/"..month.."/"..year
                                Reason = KeyboardInput("Raison", "", 255)
                                if Reason ~= nil then
                                    TriggerServerEvent(CrtTrigger, CrtTrigger, CrtId, Date, Reason)
                                else
                                    ESX.ShowNotification(Staff.KeyboardError)
                                end
                            elseif Items.Value == "Spectate" then
                                if LstCoords ~= GetEntityCoords(PlayerPedId()) then
                                    LstCoords = GetEntityCoords(PlayerPedId())
                                end
                                if CrtPed ~= GetPlayerPed(v) then
                                    CrtPed = GetPlayerPed(v)
                                    Staff.Spectate = true
                                    Citizen.Wait(10)
                                    ActionTiming = 0
                                    FreezeEntityPosition(PlayerPedId(), true)
                                    SetEntityVisible(PlayerPedId(), false)
                                    SetEntityCollision(PlayerPedId(), false, false)
                                else
                                    ActionTiming = 2000
                                    CrtPed = nil
                                    Staff.Spectate = false
                                    Citizen.Wait(10)
                                    FreezeEntityPosition(PlayerPedId(), false)
                                    SetEntityVisible(PlayerPedId(), true)
                                    SetEntityCollision(PlayerPedId(), true, true)
                                    SetEntityCoords(PlayerPedId(), LstCoords)
                                    LstCoords = nil
                                end
                            else
                                TriggerServerEvent(CrtTrigger, CrtTrigger, CrtId)
                            end
                        else
                            RageUI.Visible(RMenu:Get("Staff", Items.Menu), true)
                        end
                    end,
                })
            end
        end)

        RageUI.IsVisible(RMenu:Get("Staff", "PlyWarmList"), function()
            for _, v in pairs(Staff.PlyWamrs) do
                RageUI.Item.Button(v.Date, v.Reason, {RightLabel = "Par : "..v.WarnedBy}, true, {
                })
            end
        end)

        RageUI.IsVisible(RMenu:Get("Staff", "ItemsList"), function()
            for _, v in pairs(Staff.ItemsList) do
                RageUI.Item.Button(v.label, nil, {}, true, {
                    onSelected = function(Index, Items)
                        Count = KeyboardInput("Quantité", "", 3)
                        if tonumber(Count) ~= nil then
                            TriggerServerEvent(CrtTrigger, CrtTrigger, CrtId, v.name, v.label, tonumber(Count))
                        else
                            ESX.ShowNotification(Staff.KeyboardError)
                        end
                    end,
                })
            end
        end)

        RageUI.IsVisible(RMenu:Get("Staff", "JobsList"), function()
            for Label, v in pairs(Staff.JobsList) do
                RageUI.Item.List(Label, Staff.JobsList[Label].Grades, 1, nil, {}, true, {
                    onSelected = function(Index, Items)
                        TriggerServerEvent(CrtTrigger, CrtTrigger, CrtId, Items.Job, Items.Value, Label)
                    end,
                })
            end
        end)

        RageUI.IsVisible(RMenu:Get("Staff", "Jobs2List"), function()
            for Label, v in pairs(Staff.Jobs2List) do
                RageUI.Item.List(Label, Staff.Jobs2List[Label].Grades, 1, nil, {}, true, {
                    onSelected = function(Index, Items)
                        TriggerServerEvent(CrtTrigger, CrtTrigger, CrtId, Items.Job, Items.Value, Label)
                    end,
                })
            end
        end)

        RageUI.IsVisible(RMenu:Get("Staff", "WeaponList"), function()
            for _, v in pairs(Staff.WeaponList) do
                if v.Value then
                    RageUI.Item.Button(v.Label, nil, {}, true, {
                        onSelected = function(Index, Items)
                            TriggerServerEvent(CrtTrigger, CrtTrigger, CrtId, v.Value, v.Label)
                        end,
                    })
                else
                    RageUI.Item.Separator(v.Label)
                end
            end
        end)
        
        RageUI.IsVisible(RMenu:Get("Staff", "ItemsList2"), function()
            for _, v in pairs(Staff.ItemsList) do
                RageUI.Item.Button(v.label, nil, {}, true, {
                    onSelected = function(Index, Items)
                        Count = KeyboardInput("Quantité", "", 3)
                        if tonumber(Count) ~= nil then
                            TriggerServerEvent(CrtTrigger, CrtTrigger, CrtId, v.name, v.label, tonumber(Count))
                        else
                            ESX.ShowNotification(Staff.KeyboardError)
                        end
                    end,
                })
            end
        end)

        RageUI.IsVisible(RMenu:Get("Staff", "JobsList2"), function()
            for Label, v in pairs(Staff.JobsList) do
                RageUI.Item.List(Label, Staff.JobsList[Label].Grades, 1, nil, {}, true, {
                    onSelected = function(Index, Items)
                        TriggerServerEvent(CrtTrigger, CrtTrigger, CrtId, Items.Job, Items.Value, Label)
                    end,
                })
            end
        end)

        RageUI.IsVisible(RMenu:Get("Staff", "Jobs2List2"), function()
            for Label, v in pairs(Staff.Jobs2List) do
                RageUI.Item.List(Label, Staff.Jobs2List[Label].Grades, 1, nil, {}, true, {
                    onSelected = function(Index, Items)
                        TriggerServerEvent(CrtTrigger, CrtTrigger, CrtId, Items.Job, Items.Value, Label)
                    end,
                })
            end
        end)

        RageUI.IsVisible(RMenu:Get("Staff", "WeaponList2"), function()
            for _, v in pairs(Staff.WeaponList) do
                if v.Value then
                    RageUI.Item.Button(v.Label, nil, {}, true, {
                        onSelected = function(Index, Items)
                            TriggerServerEvent(CrtTrigger, CrtTrigger, CrtId, v.Value, v.Label)
                        end,
                    })
                else
                    RageUI.Item.Separator(v.Label)
                end
            end
        end)

        RageUI.IsVisible(RMenu:Get("Staff", "CarsList"), function()
            RageUI.Item.Button("Détruire le véhicule", nil, {}, true, {
                onSelected = function(Index, Items)
                    CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
                    if DoesEntityExist(CrtVhc) then
                        DeleteEntity(CrtVhc)
                    else
                        Vhc = ESX.Game.GetVehicleInDirection()
                        if DoesEntityExist(Vhc) then
                            DeleteEntity(Vhc)
                        else
                            ESX.ShowNotification(Staff.KeyboardError)
                        end
                    end
                end,
            })
            for _, v in pairs(Staff.CarsList) do
                RageUI.Item.List(v.Label, v.Cars, v.Index or 1, nil, {}, true, {
                    onSelected = function(Index, Items)
                        SpawnCar(Items.Value)
                    end,
                })
            end
        end)
    end
end


