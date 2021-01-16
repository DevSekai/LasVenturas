-- Création du menu --
RMenu.Add("Org", "Mobil", RageUI.CreateMenu("", "Intéraction", nil, nil, "root_cause", "Banner"), true)
RMenu:Get("Org", "Mobil").Closed = function()
    RageUI.CloseAll()
    InMenu = false
end
RMenu.Add("Org", "Mobil_Society", RageUI.CreateSubMenu(RMenu:Get("Org", "Mobil"),"", "Gestion de l'entreprise"))
RMenu.Add("Org", "Mobil_TrgInv", RageUI.CreateSubMenu(RMenu:Get("Org", "Mobil"),"", "Inventaire de la personne"))

RegisterCommand('OpenOrg', function()
    if not InMenu then
        if PlayerData.job2.name ~= "unemployed2" then
            OpenOrgMenu()
        end
    else
        InMenu = false
        RageUI.CloseAll()
    end
end, false)

RegisterKeyMapping('OpenOrg', 'Menu organisation', 'keyboard', 'F7')

function OpenOrgMenu()
    InMenu = true
    RageUI.Visible(RMenu:Get("Org", "Mobil"), true)
    while InMenu do
        Citizen.Wait(0)

        RageUI.IsVisible(RMenu:Get("Org", "Mobil"), function()
            Org.Wl.JobBtn()
        end)

        RageUI.IsVisible(RMenu:Get("Org", "Mobil_Society"), function()
            RageUI.Item.Separator("Compte : ~g~"..Org.Wl.Society_Money.." $~s~")
            RageUI.Item.Button("Recruter l'employer", nil, {}, true, {
                onSelected = function(Index, Items)
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 1.5 then
                        ESX.ShowNotification("Personne aux alentours")
                    else
                        TriggerServerEvent('Org:EmbaucherEmployer', GetPlayerServerId(closestPlayer), PlayerData.job.name, 0)
                    end
                end,
            })
            RageUI.Item.Button("Promouvoir l'employer", nil, {}, true, {
                onSelected = function(Index, Items)
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 1.5 then
                        ESX.ShowNotification("Personne aux alentours")
                    else
                        TriggerServerEvent('Org:PromouvoirEmployer', GetPlayerServerId(closestPlayer))
                    end
                end,
            })
            RageUI.Item.Button("Virer l'employer", nil, {}, true, {
                onSelected = function(Index, Items)
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 1.5 then
                        ESX.ShowNotification("Personne aux alentours")
                    else
                        TriggerServerEvent('Org:VirerEmployer', GetPlayerServerId(closestPlayer))
                    end
                end,
            })
            RageUI.Item.Button("Rétrograder l'employer", nil, {}, true, {
                onSelected = function(Index, Items)
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 1.5 then
                        ESX.ShowNotification("Personne aux alentours")
                    else
                        TriggerServerEvent('Org:RetrograderEmployer', GetPlayerServerId(closestPlayer))
                    end
                end,
            })
        end)

        RageUI.IsVisible(RMenu:Get("Org", "Mobil_TrgInv"), function()
            RageUI.Item.Separator("↓↓       Cash       ↓↓")
            for _,v in pairs (Org.Wl.Trg.Account) do
                RageUI.Item.Button("~g~"..v.label.." $", nil, {}, true, {
                })
            end
            RageUI.Item.Separator("↓↓       Objets       ↓↓")
            for _,v in pairs (Org.Wl.Trg.Inventory) do
                RageUI.Item.Button(""..v.label.." x "..v.amount, nil, {}, true, {
                })
            end
            RageUI.Item.Separator("↓↓       Armes       ↓↓")
            for _,v in pairs (Org.Wl.Trg.Loadout) do
                RageUI.Item.Button(""..v.label.." "..v.amount, nil, {}, true, {
                })
            end
        end)
    end
end