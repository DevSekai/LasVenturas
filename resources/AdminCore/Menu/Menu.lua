RMenu.Add('Staff', 'Main', RageUI.CreateMenu("", "Menu administration", nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Staff', 'Main'):DisplayGlare(false);
RMenu:Get('Staff', 'Main').Closed = function()
    InMenu = false
end
    RMenu.Add("Staff", "Personal", RageUI.CreateSubMenu(RMenu:Get("Staff", "Main"), "", "Actions personnel"))
    RMenu.Add("Staff", "Environement", RageUI.CreateSubMenu(RMenu:Get("Staff", "Main"), "", "Actions environement"))
    RMenu.Add("Staff", "Vehicule", RageUI.CreateSubMenu(RMenu:Get("Staff", "Main"), "", "Actions véhicules"))
        RMenu.Add("Staff", "CarsList", RageUI.CreateSubMenu(RMenu:Get("Staff", "Vehicule"), "", "Véhicules disponnible"))

    RMenu.Add("Staff", "ItemsList2", RageUI.CreateSubMenu(RMenu:Get("Staff", "Main"), "", "Items disponnible"))
    RMenu.Add("Staff", "WeaponList2", RageUI.CreateSubMenu(RMenu:Get("Staff", "Main"), "", "Armes disponnible"))
    RMenu.Add("Staff", "JobsList2", RageUI.CreateSubMenu(RMenu:Get("Staff", "Main"), "", "Jobs disponnible"))
    RMenu.Add("Staff", "Jobs2List2", RageUI.CreateSubMenu(RMenu:Get("Staff", "Main"), "", "Jobs2 disponnible"))
RMenu.Add("Staff", "PlyList", RageUI.CreateSubMenu(RMenu:Get("Staff", "Main"), "", "Joueurs connecté"))
RMenu:Get("Staff", "PlyList").Closed = function()
    Staff.PlyListIndex = 1
end
    RMenu.Add("Staff", "PlyWarmList", RageUI.CreateSubMenu(RMenu:Get("Staff", "PlyList"), "", "Avertissements"))
    RMenu.Add("Staff", "PlyInfos", RageUI.CreateSubMenu(RMenu:Get("Staff", "PlyList"), "", "Avertissements"))
    RMenu.Add("Staff", "ItemsList", RageUI.CreateSubMenu(RMenu:Get("Staff", "PlyInfos"), "", "Items disponnible"))
    RMenu.Add("Staff", "WeaponList", RageUI.CreateSubMenu(RMenu:Get("Staff", "PlyInfos"), "", "Armes disponnible"))
    RMenu.Add("Staff", "JobsList", RageUI.CreateSubMenu(RMenu:Get("Staff", "PlyInfos"), "", "Jobs disponnible"))
    RMenu.Add("Staff", "Jobs2List", RageUI.CreateSubMenu(RMenu:Get("Staff", "PlyInfos"), "", "Jobs2 disponnible"))


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
                        TriggerServerEvent("Fd_Logs:SendLogs", "Staff", "Purple", "Prise de service", ""..GetPlayerName(PlayerId()).." à activer son staffmode.")
                        Citizen.Wait(10)
                        ESX.ShowNotification("Vous avez activer le StaffMode")
                    else
                        Staff.AdminState = false
                        TriggerServerEvent("Fd_Logs:SendLogs", "Staff", "Purple", "Fin de service", ""..GetPlayerName(PlayerId()).." à désactiver son staffmode.")
                        Citizen.Wait(10)
                        ESX.ShowNotification("Vous avez désactiver le StaffMode")
                    end
                end,
            })
            if Staff.AdminState then
                RageUI.Item.Button("Personnel", "", {RightLabel = "→→→"}, true, {
                },RMenu:Get("Staff", "Personal"))
                RageUI.Item.Button("Véhicule", "", {RightLabel = "→→→"}, true, {
                },RMenu:Get("Staff", "Vehicule"))
                RageUI.Item.Button("Liste des joueurs", "", {RightLabel = "→→→"}, true, {
                    onSelected = function()
                        Staff.PlyList = {}
                        for i = 0, 256 do
                            if NetworkIsPlayerActive(i) then
                                table.insert(Staff.PlyList, i)
                            end
                        end
                    end,
                },RMenu:Get("Staff", "PlyList"))
                RageUI.Item.Button("Environement", "", {RightLabel = "→→→"}, true, {
                },RMenu:Get("Staff", "Environement"))
            end
        end)
        
        RageUI.IsVisible(RMenu:Get("Staff", "Personal"), function()
            RageUI.Item.Separator("↓      Utilitaire      ↓")
            RageUI.Item.Checkbox("Noclip", "", false, {}, {
                onSelected = function()
                    if not Staff.Noclip then
                        ActionTiming = 0
                        SetEntityVisible(PlayerPedId(), false)
                        FreezeEntityPosition(PlayerPedId(), true)
                        Noclip()
                        Citizen.Wait(150)
                    else
                        Staff.Noclip = false
                        SetEntityVisible(PlayerPedId(), true)
                        FreezeEntityPosition(PlayerPedId(), false)
                        ESX.ShowNotification("Vous avez désactiver le Noclip")
                        Citizen.Wait(150)
                    end
                end,
            })
            RageUI.Item.Checkbox("Blips", "", false, {}, {
                onSelected = function()
                    if not Staff.PlyBlips then
                        Staff.PlyBlips = true
                        CreatePlyBlips()
                        ESX.ShowNotification("Vous avez activer les blips")
                        Citizen.Wait(150)
                    else
                        Staff.PlyBlips = false
                        DeletePlyBlips()
                        ESX.ShowNotification("Vous avez désactiver les blips")
                        Citizen.Wait(150)
                    end
                end,
            })
            RageUI.Item.Checkbox("Nom", "", false, {}, {
                onSelected = function()
                    if not Staff.PlyName then
                        PlyName()
                        ESX.ShowNotification("Vous avez activer les noms")
                        Citizen.Wait(150)
                    else
                        Staff.PlyName = false
                        ESX.ShowNotification("Vous avez désactiver les noms")
                        Citizen.Wait(150)
                    end
                end,
            })
            RageUI.Item.Separator("↓      Intéraction      ↓")
            for _,v in pairs (Staff.PlyActions) do
                if not v.Menu then
                    RageUI.Item.Button(v.Name, "", {RightLabel = "→→→"}, true, {
                        onSelected = function()
                            CrtTrigger = v.Value
                            CrtId = GetPlayerServerId(PlayerId())
                            if v.Value == "GiveMoney" then
                                Amount = KeyboardInput("Quantité", "", 10)
                                if tonumber(Amount) ~= nil then
                                    TriggerServerEvent("Fd_Staff:GiveMoney", "GiveMoney", CrtId, "money", tonumber(Amount))
                                else
                                    ESX.ShowNotification(Staff.KeyboardError)
                                end
                            elseif v.Value == "Revive" then
                                TriggerServerEvent("Fd_Staff:"..CrtTrigger, CrtTrigger, CrtId)
                            end
                        end,
                    })
                else
                    RageUI.Item.Button(v.Name, "", {RightLabel = "→→→"}, true, {
                        onSelected = function()
                            CrtTrigger = v.Value
                            CrtId = GetPlayerServerId(PlayerId())
                        end,
                    },RMenu:Get("Staff", v.Menu))
                end
            end
        end)
        
        RageUI.IsVisible(RMenu:Get("Staff", "Vehicule"), function()
            RageUI.Item.Button("Détruire le véhicule", nil, {RightLabel = "→→→"}, true, {
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
            RageUI.Item.Button("Booster le véhicule", nil, {RightLabel = "→→→"}, true, {
                onSelected = function(Index, Items)
                    CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
                    if DoesEntityExist(CrtVhc) then
                        BoostVhc(CrtVhc)
                    else
                        Vhc = ESX.Game.GetVehicleInDirection()
                        if DoesEntityExist(Vhc) then
                            BoostVhc(Vhc)
                        else
                            ESX.ShowNotification(Staff.KeyboardError)
                        end
                    end
                end,
            })
            RageUI.Item.Button("Réparer le véhicule", nil, {RightLabel = "→→→"}, true, {
                onSelected = function(Index, Items)
                    CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
                    if DoesEntityExist(CrtVhc) then
                        SetVehicleFixed(CrtVhc)
                        SetVehicleDeformationFixed(CrtVhc)
                    else
                        Vhc = ESX.Game.GetVehicleInDirection()
                        if DoesEntityExist(Vhc) then
                            SetVehicleFixed(Vhc)
							SetVehicleDeformationFixed(Vhc)
                        else
                            ESX.ShowNotification(Staff.KeyboardError)
                        end
                    end
                end,
            })
            RageUI.Item.Button("Nettoyer le véhicule", nil, {RightLabel = "→→→"}, true, {
                onSelected = function(Index, Items)
                    CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
                    if DoesEntityExist(CrtVhc) then
                        SetVehicleDirtLevel(CrtVhc, 0)
                    else
                        Vhc = ESX.Game.GetVehicleInDirection()
                        if DoesEntityExist(Vhc) then
                            SetVehicleDirtLevel(Vhc, 0)
                        else
                            ESX.ShowNotification(Staff.KeyboardError)
                        end
                    end
                end,
            })
            RageUI.Item.Button("Spawn un véhicule", "", {RightLabel = "→→→"}, true, {
            },RMenu:Get("Staff", "CarsList"))
        end)
        
        RageUI.IsVisible(RMenu:Get("Staff", "Environement"), function()
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
            RageUI.Item.List("Electricité", {
                {Name = "Avec", Value = false},
                {Name = "Sans", Value = true}
            }, 1, nil, {}, true, {
                onSelected = function(Index, Items)
                    TriggerServerEvent("Fd_Staff:SetBlackout", Items.Value)
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
                                    TriggerServerEvent("Fd_Staff:"..CrtTrigger, CrtTrigger, CrtId, tonumber(Amount))
                                else
                                    ESX.ShowNotification(Staff.KeyboardError)
                                end
                            elseif Items.Value == "Warns" or Items.Value == "Ban" then
                                year, month, day, hour, minute, second = GetLocalTime()
                                Date = day.."/"..month.."/"..year
                                Reason = KeyboardInput("Raison", "", 255)
                                if Reason ~= nil then
                                    TriggerServerEvent("Fd_Staff:"..CrtTrigger, CrtTrigger, CrtId, Date, Reason)
                                else
                                    ESX.ShowNotification(Staff.KeyboardError)
                                end
                            elseif Items.Value == "Spectate" then
                                if LstCoords ~= GetEntityCoords(PlayerPedId()) then
                                    LstCoords = GetEntityCoords(PlayerPedId())
                                end
                                if CrtPed ~= GetPlayerPed(v) then
                                    CrtPed = GetPlayerPed(v)
                                    Spectate()
                                    Citizen.Wait(10)
                                    FreezeEntityPosition(PlayerPedId(), true)
                                    SetEntityVisible(PlayerPedId(), false)
                                    SetEntityCollision(PlayerPedId(), false, false)
                                else
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
                                TriggerServerEvent("Fd_Staff:"..CrtTrigger, CrtTrigger, CrtId)
                            end
                        elseif Items.Menu == "PlyInfos" then
                            ESX.TriggerServerCallback('Ld_Staff:GetPlyInfos', function(Infos)
                                Staff.PlyInfos = Infos
                                RageUI.Visible(RMenu:Get("Staff", Items.Menu), true)
                            end, CrtId)
                        else
                            RageUI.Visible(RMenu:Get("Staff", Items.Menu), true)
                        end
                    end,
                })
            end
        end)

        RageUI.IsVisible(RMenu:Get("Staff", "PlyInfos"), function()
            RageUI.Item.Separator("↓      Informations      ↓")
            RageUI.Item.Separator("[Cash] : ~g~"..Staff.PlyInfos.Money.." $")
            RageUI.Item.Separator("[Bank] : ~y~"..Staff.PlyInfos.Bank.." $")
            RageUI.Item.Separator("[Sale] : ~r~"..Staff.PlyInfos.Dirty.." $")
            RageUI.Item.List("Donner de l'argent", {
                {Name = "Cash", Value = "money"},
                {Name = "Bank", Value = "bank"},
                {Name = "Sale", Value = "black_money"},
            }, 1, nil, {}, true, {
                onSelected = function(Index, Items)
                    Amount = KeyboardInput("Quantité", "", 10)
                    if tonumber(Amount) ~= nil then
                        TriggerServerEvent("Fd_Staff:GiveMoney", "GiveMoney", CrtId, Items.Value, tonumber(Amount))
                        RefreshInfos(CrtId)
                    else
                        ESX.ShowNotification(Staff.KeyboardError)
                    end
                end,
            })
            RageUI.Item.Separator("[Job] : "..Staff.PlyInfos.Job.." - [Grade] : "..Staff.PlyInfos.Grade)
            RageUI.Item.Button("Setjob", nil, {RightLabel = "→→→"}, true, {
                onSelected = function(Index, Items)
                    CrtTrigger = "SetJob"
                end,
            },RMenu:Get("Staff", "JobsList"))
            RageUI.Item.Separator("[Orga] : "..Staff.PlyInfos.Job2.." - [Grade] : "..Staff.PlyInfos.Grade2)
            RageUI.Item.Button("Setorg", nil, {RightLabel = "→→→"}, true, {
                onSelected = function(Index, Items)
                    CrtTrigger = "SetOrg"
                end,
            },RMenu:Get("Staff", "Jobs2List"))
            RageUI.Item.Separator("↓      Inventaire      ↓")
            for _,v in pairs (Staff.PlyInfos.Inventory) do
                if v.count >= 1 then
                    RageUI.Item.Separator("[Objet] : "..v.label.." x "..v.count)
                end
            end
            RageUI.Item.Button("Donner un objet", nil, {RightLabel = "→→→"}, true, {
                onSelected = function(Index, Items)
                    CrtTrigger = "GiveItem"
                end,
            },RMenu:Get("Staff", "ItemsList"))
            RageUI.Item.Button("Vider l'inventaire", nil, {RightLabel = "→→→"}, true, {
                onSelected = function()
                    TriggerServerEvent("Fd_Staff:ClearInventory", "ClearInventory", CrtId)
                    Staff.PlyInfos.Inventory = {}
                end,
            })
            RageUI.Item.Separator("↓      Armes      ↓")
            for _,v in pairs (Staff.PlyInfos.Weapons) do
                RageUI.Item.Separator("[Armes] : "..v.label.." - [Munitions] : "..v.ammo)
            end
            RageUI.Item.Button("Donner une arme", nil, {RightLabel = "→→→"}, true, {
                onSelected = function(Index, Items)
                    CrtTrigger = "GiveWeapon"
                end,
            },RMenu:Get("Staff", "WeaponList"))
            RageUI.Item.Button("Supprimer les armes", nil, {RightLabel = "→→→"}, true, {
                onSelected = function()
                    TriggerServerEvent("Fd_Staff:ClearLoadout", "ClearLoadout", CrtId)
                    Staff.PlyInfos.Weapons = {}
                end,
            })
        end)

        RageUI.IsVisible(RMenu:Get("Staff", "PlyWarmList"), function()
            for _, v in pairs(Staff.PlyWamrs) do
                RageUI.Item.Button(v.Date, v.Reason, {RightLabel = "Par : "..v.WarnedBy}, true, {
                })
            end
        end)

        RageUI.IsVisible(RMenu:Get("Staff", "ItemsList"), function()
            for _, v in pairs(Staff.ItemsList) do
                RageUI.Item.Button(v.label, nil, {RightLabel = "→→→"}, true, {
                    onSelected = function(Index, Items)
                        Count = KeyboardInput("Quantité", "", 3)
                        if tonumber(Count) ~= nil then
                            TriggerServerEvent("Fd_Staff:"..CrtTrigger, CrtTrigger, CrtId, v.name, v.label, tonumber(Count))
                            RefreshInfos(CrtId)
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
                        TriggerServerEvent("Fd_Staff:"..CrtTrigger, CrtTrigger, CrtId, Items.Job, Items.Value, Label)
                        RefreshInfos(CrtId)
                    end,
                })
            end
        end)

        RageUI.IsVisible(RMenu:Get("Staff", "Jobs2List"), function()
            for Label, v in pairs(Staff.Jobs2List) do
                RageUI.Item.List(Label, Staff.Jobs2List[Label].Grades, 1, nil, {}, true, {
                    onSelected = function(Index, Items)
                        TriggerServerEvent("Fd_Staff:"..CrtTrigger, CrtTrigger, CrtId, Items.Job, Items.Value, Label)
                        RefreshInfos(CrtId)
                    end,
                })
            end
        end)

        RageUI.IsVisible(RMenu:Get("Staff", "WeaponList"), function()
            for _, v in pairs(Staff.WeaponList) do
                if v.Value then
                    RageUI.Item.Button(v.Label, nil, {RightLabel = "→→→"}, true, {
                        onSelected = function(Index, Items)
                            TriggerServerEvent("Fd_Staff:"..CrtTrigger, CrtTrigger, CrtId, v.Value, v.Label)
                            RefreshInfos(CrtId)
                        end,
                    })
                else
                    RageUI.Item.Separator(v.Label)
                end
            end
        end)
        
        RageUI.IsVisible(RMenu:Get("Staff", "ItemsList2"), function()
            for _, v in pairs(Staff.ItemsList) do
                RageUI.Item.Button(v.label, nil, {RightLabel = "→→→"}, true, {
                    onSelected = function(Index, Items)
                        Count = KeyboardInput("Quantité", "", 3)
                        if tonumber(Count) ~= nil then
                            TriggerServerEvent("Fd_Staff:"..CrtTrigger, CrtTrigger, CrtId, v.name, v.label, tonumber(Count))
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
                        TriggerServerEvent("Fd_Staff:"..CrtTrigger, CrtTrigger, CrtId, Items.Job, Items.Value, Label)
                    end,
                })
            end
        end)

        RageUI.IsVisible(RMenu:Get("Staff", "Jobs2List2"), function()
            for Label, v in pairs(Staff.Jobs2List) do
                RageUI.Item.List(Label, Staff.Jobs2List[Label].Grades, 1, nil, {}, true, {
                    onSelected = function(Index, Items)
                        TriggerServerEvent("Fd_Staff:"..CrtTrigger, CrtTrigger, CrtId, Items.Job, Items.Value, Label)
                    end,
                })
            end
        end)

        RageUI.IsVisible(RMenu:Get("Staff", "WeaponList2"), function()
            for _, v in pairs(Staff.WeaponList) do
                if v.Value then
                    RageUI.Item.Button(v.Label, nil, {RightLabel = "→→→"}, true, {
                        onSelected = function(Index, Items)
                            TriggerServerEvent("Fd_Staff:"..CrtTrigger, CrtTrigger, CrtId, v.Value, v.Label)
                        end,
                    })
                else
                    RageUI.Item.Separator(v.Label)
                end
            end
        end)

        RageUI.IsVisible(RMenu:Get("Staff", "CarsList"), function()
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