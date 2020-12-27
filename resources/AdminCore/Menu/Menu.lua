-- Création du menu --
RMenu.Add("Admin", "Principal", RageUI.CreateMenu("", "Administration", nil, nil, "root_cause", "Banner"), true)

-- PlyList --
RMenu.Add("Admin", "PlyList", RageUI.CreateSubMenu(RMenu:Get("Admin", "Principal"), "", "Joueurs connecté"))
-- PlyWarns --
RMenu.Add("Admin", "PlyWarns", RageUI.CreateSubMenu(RMenu:Get("Admin", "Principal"), "", "Warns"))

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(0)

        if IsControlJustReleased(1, 57) then
            if Storage.PlyGroup ~= "user" then
                RageUI.Visible(RMenu:Get("Admin", "Principal"), not RageUI.Visible(RMenu:Get("Admin", "Principal")))
            else
                ESX.ShowNotification(Storage.AccesDenied)
            end
        end

        RageUI.IsVisible(RMenu:Get("Admin", "Principal"), function()
            RageUI.Item.Checkbox("StaffMode", "", Storage.AdminState, {}, {
                onChecked = function()
                    Storage.AdminState = true
                    ESX.ShowNotification("Vous avez activez le StaffMode")
                end,
                onUnChecked = function()
                    Storage.AdminState = false
                    ESX.ShowNotification("Vous avez désactivez le StaffMode")
                end,
            })
            if Storage.AdminState then
                RageUI.Item.Button("Liste des joueurs", "", {}, true, {
                    onSelected = function()
                        Storage.PlyList = {}
                        for i = 0, 255 do
                            if NetworkIsPlayerActive(i) then
                                table.insert(Storage.PlyList, i)
                            end
                        end
                    end,
                },RMenu:Get("Admin", "PlyList"))
            end
        end)

        RageUI.IsVisible(RMenu:Get("Admin", "PlyList"), function()
            for _, v in pairs(Storage.PlyList) do
                local Vie = GetEntityHealth(GetPlayerPed(v)) / 2
                RageUI.Item.List("Nom : "..GetPlayerName(v).." - HP : "..Vie, Storage.PlyListActions, Storage.PlyListIndex, nil, {}, true, {
                    onSelected = function (Index, Items)
                        Storage.PlyListIndex = Index
                        if Items.Value == "Ban" or Items.Value == "Warns" or Items.Value == "Jail" then
                            Reason = KeyboardInput("Raison", "", 255)
                            if Reason ~= nil then
                                Table = {Token = json.encode(TokenGen), Target = GetPlayerServerId(v), Type = Items.Value, Reason = Reason}
                                TriggerServerEvent(Items.Trigger, json.encode(Table))
                            else
                                ESX.ShowNotification("Veuillez entrer une raison.")
                            end
                        elseif Items.Value == "ClearInventory" or Items.Value == "ClearLoadout" then
                            Table = {Token = json.encode(TokenGen), Target = GetPlayerServerId(v), Type = Items.Value}
                            TriggerServerEvent(Items.Trigger, json.encode(Table))
                        elseif Items.Value == "WarnsList" then
                            ESX.TriggerServerCallback('GetPlyWarns', function(Warns)
                                Storage.PlyWamrs = Warns
                                RageUI.Visible(RMenu:Get("Admin", "PlyWarns"), true)
                            end, GetPlayerServerId(v))
                        elseif Items.Value == "Setjob" or Items.Value == "Setorg" or Items.Value == "Goto" or Items.Value == "Bring" then
                            if Items.Value == "Goto" then
                                Coords = GetEntityCoords(PlayerPedId(v))
                                Table = {Token = json.encode(TokenGen), Target = GetPlayerServerId(PlayerId()), Type = Items.Value, Coords = Coords}
                                TriggerServerEvent(Items.Trigger, json.encode(Table))
                            if Items.Value == "Bring" then
                                Coords = GetEntityCoords(PlayerPedId())
                                Table = {Token = json.encode(TokenGen), Target = GetPlayerServerId(v), Type = Items.Value, Coords = Coords}
                                TriggerServerEvent(Items.Trigger, json.encode(Table))
                            else
                                Job = KeyboardInput("Nom", "", 255)
                                JobGrade = KeyboardInput("Grade (0 à 5)", "", 255)
                                if Job ~= nil then
                                    if JobGrade ~= nil then
                                        Table = {Token = json.encode(TokenGen), Target = GetPlayerServerId(v), Type = Items.Value, Job = Job, JobGrade = JobGrade}
                                        TriggerServerEvent(Items.Trigger, json.encode(Table))
                                    else
                                        ESX.ShowNotification("Veuillez entrer un grade.")
                                    end
                                else
                                    ESX.ShowNotification("Veuillez entrer un nom.")
                                end
                            end
                        elseif Items.Value == "GiveItem" then
                            ItmName = KeyboardInput("Nom de l'item", "", 255)
                            ItmQte = KeyboardInput("Quantié", "", 255)
                            if ItmName ~= nil then
                                if tonumber(ItmQte) ~= nil then
                                    Table = {Token = json.encode(TokenGen), Target = GetPlayerServerId(v), Type = Items.Value, ItmName = ItmName, ItmQte = ItmQte}
                                    TriggerServerEvent(Items.Trigger, json.encode(Table))
                                else
                                    ESX.ShowNotification("Veuillez entrer un nombre d'item valide.")
                                end
                            else
                                ESX.ShowNotification("Veuillez entrer un nom d'item valide.")
                            end
                        elseif Items.Value == "GiveWeapon" then
                            WpnName = KeyboardInput("Nom de l'arme", "", 255)
                            if WpnName ~= nil then
                                Table = {Token = json.encode(TokenGen), Target = GetPlayerServerId(v), Type = Items.Value, WpnName = WpnName}
                                TriggerServerEvent(Items.Trigger, json.encode(Table))
                            else
                                ESX.ShowNotification("Veuillez entrer un nom d'arme valide.")
                            end
                        elseif Items.Value == "GiveCash" then
                            Amount = KeyboardInput("Quantité", "", 255)
                            if tonumber(Amount) ~= nil then
                                Table = {Token = json.encode(TokenGen), Target = GetPlayerServerId(v), Type = Items.Value, Amount = tonumber(Amount)}
                                TriggerServerEvent(Items.Trigger, json.encode(Table))
                            else
                                ESX.ShowNotification("Veuillez entrer une quantité valide.")
                            end
                        end
                    end
                })
            end
        end)

        RageUI.IsVisible(RMenu:Get("Admin", "PlyWarns"), function()
            for _, v in pairs(Storage.PlyWamrs) do
                RageUI.Item.Button(v.Date, v.Reason, {}, true, {
                })
            end
        end)
    end
end)