-- Création du menu --
RMenu.Add("Org", "Mobil", RageUI.CreateMenu("", "Intéraction", nil, nil, "root_cause", "Banner"), true)
RMenu.Add("Org", "Mobil_Society", RageUI.CreateSubMenu(RMenu:Get("Org", "Mobil"),"", "Gestion de l'entreprise"))
RMenu.Add("Org", "Mobil_TrgInv", RageUI.CreateSubMenu(RMenu:Get("Org", "Mobil"),"", "Inventaire de la personne"))

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(0)

        if IsControlJustReleased(1, 168) then
            if PlayerData.job2.name ~= "unemployed2" then
                RageUI.Visible(RMenu:Get("Org", "Mobil"), not RageUI.Visible(RMenu:Get("Org", "Mobil")))
            end
        end

        RageUI.IsVisible(RMenu:Get("Org", "Mobil"), function()
            Org.Wl.JobBtn()
        end)

        RageUI.IsVisible(RMenu:Get("Org", "Mobil_Society"), function()
            RageUI.Item.Separator("Compte : ~g~"..Org.Wl.Society_Money.." $~s~")
            RageUI.Item.Button("Recruter l'employer", "", {}, true, {
                onSelected = function(Index, Items)
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 1.5 then
                        ESX.ShowNotification("Personne aux alentours")
                    else
                        TriggerServerEvent('Org:EmbaucherEmployer', GetPlayerServerId(closestPlayer), PlayerData.job.name, 0)
                    end
                end,
            })
            RageUI.Item.Button("Promouvoir l'employer", "", {}, true, {
                onSelected = function(Index, Items)
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 1.5 then
                        ESX.ShowNotification("Personne aux alentours")
                    else
                        TriggerServerEvent('Org:PromouvoirEmployer', GetPlayerServerId(closestPlayer))
                    end
                end,
            })
            RageUI.Item.Button("Virer l'employer", "", {}, true, {
                onSelected = function(Index, Items)
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 1.5 then
                        ESX.ShowNotification("Personne aux alentours")
                    else
                        TriggerServerEvent('Org:VirerEmployer', GetPlayerServerId(closestPlayer))
                    end
                end,
            })
            RageUI.Item.Button("Rétrograder l'employer", "", {}, true, {
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
            RageUI.Item.Separator("↓↓       ~g~Cash~s~       ↓↓")
            for _,v in pairs (Org.Wl.Trg.Account) do
                RageUI.Item.Button("~g~"..v.label.." $", "", {}, true, {
                })
            end
            RageUI.Item.Separator("↓↓       ~y~Objets~s~       ↓↓")
            for _,v in pairs (Org.Wl.Trg.Inventory) do
                RageUI.Item.Button(""..v.label.." "..v.amount, "", {}, true, {
                })
            end
            RageUI.Item.Separator("↓↓       ~o~Armes~s~       ↓↓")
            for _,v in pairs (Org.Wl.Trg.Loadout) do
                RageUI.Item.Button(""..v.label.." "..v.amount, "", {}, true, {
                })
            end
        end)
    end
end)