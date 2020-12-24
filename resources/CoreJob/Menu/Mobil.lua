-- Création du menu --
RMenu.Add("Job", "Mobil", RageUI.CreateMenu("", "Intéraction", nil, nil, "root_cause", "Banner"), true)
RMenu.Add("Job", "Mobil_Society", RageUI.CreateSubMenu(RMenu:Get("Job", "Mobil"),"", "Gestion de l'entreprise"))
RMenu.Add("Job", "Mobil_Report", RageUI.CreateSubMenu(RMenu:Get("Job", "Mobil"),"", "Dossiers"))
RMenu.Add("Job", "Mobil_TrgInv", RageUI.CreateSubMenu(RMenu:Get("Job", "Mobil"),"", "Inventaire de la personne"))
RMenu.Add("Job", "Mobil_TrgIdt", RageUI.CreateSubMenu(RMenu:Get("Job", "Mobil"),"", "Identité de la personne"))
RMenu.Add("Job", "Mobil_CarOwner", RageUI.CreateSubMenu(RMenu:Get("Job", "Mobil"),"", "Identité du propriétaire"))

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(0)

        if IsControlJustReleased(1, 167) then
            if PlayerData.job.name ~= "unemployed" then
                RageUI.Visible(RMenu:Get("Job", "Mobil"), not RageUI.Visible(RMenu:Get("Job", "Mobil")))
            end
        end

        RageUI.IsVisible(RMenu:Get("Job", "Mobil"), function()
            Job.Wl.JobBtn()
        end)

        RageUI.IsVisible(RMenu:Get("Job", "Mobil_Society"), function()
            RageUI.Item.Separator("Compte : ~g~"..Job.Wl.Society_Money.." $~s~")
            RageUI.Item.Button("Recruter l'employer", "", {}, true, {
                onSelected = function(Index, Items)
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 1.5 then
                        ESX.ShowNotification("Personne aux alentours")
                    else
                        TriggerServerEvent('EmbaucherEmployer', GetPlayerServerId(closestPlayer), PlayerData.job.name, 0)
                    end
                end,
            })
            RageUI.Item.Button("Promouvoir l'employer", "", {}, true, {
                onSelected = function(Index, Items)
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 1.5 then
                        ESX.ShowNotification("Personne aux alentours")
                    else
                        TriggerServerEvent('PromouvoirEmployer', GetPlayerServerId(closestPlayer))
                    end
                end,
            })
            RageUI.Item.Button("Virer l'employer", "", {}, true, {
                onSelected = function(Index, Items)
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 1.5 then
                        ESX.ShowNotification("Personne aux alentours")
                    else
                        TriggerServerEvent('VirerEmployer', GetPlayerServerId(closestPlayer))
                    end
                end,
            })
            RageUI.Item.Button("Rétrograder l'employer", "", {}, true, {
                onSelected = function(Index, Items)
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 1.5 then
                        ESX.ShowNotification("Personne aux alentours")
                    else
                        TriggerServerEvent('RetrograderEmployer', GetPlayerServerId(closestPlayer))
                    end
                end,
            })
        end)

        RageUI.IsVisible(RMenu:Get("Job", "Mobil_Report"), function()
            for _,v in pairs (Job.Wl.PlyReport) do
                RageUI.Item.Button(v.Date, v.Report, {}, true, {
                })
            end
        end)

        RageUI.IsVisible(RMenu:Get("Job", "Mobil_TrgInv"), function()
            RageUI.Item.Separator("↓↓       ~g~Cash~s~       ↓↓")
            for _,v in pairs (Job.Wl.Trg.Account) do
                RageUI.Item.Button("~g~"..v.label.." $", "", {}, true, {
                })
            end
            RageUI.Item.Separator("↓↓       ~y~Objets~s~       ↓↓")
            for _,v in pairs (Job.Wl.Trg.Inventory) do
                RageUI.Item.Button(""..v.label.." "..v.amount, "", {}, true, {
                })
            end
            RageUI.Item.Separator("↓↓       ~o~Armes~s~       ↓↓")
            for _,v in pairs (Job.Wl.Trg.Loadout) do
                RageUI.Item.Button(""..v.label.." "..v.amount, "", {}, true, {
                })
            end
        end)

        RageUI.IsVisible(RMenu:Get("Job", "Mobil_TrgIdt"), function()
            RageUI.Item.Separator("↓↓       ~y~Identité~s~       ↓↓")
            RageUI.Item.Separator("[Nom] : "..Job.Wl.TrgIdentity.LastName)
            RageUI.Item.Separator("[Prénom] : "..Job.Wl.TrgIdentity.FirstName)
            RageUI.Item.Separator("↓↓       ~y~Informations~s~       ↓↓")
            RageUI.Item.Separator("[Age] : "..Job.Wl.TrgIdentity.Birthday)
            RageUI.Item.Separator("[Métier] : "..Job.Wl.TrgIdentity.Job)
        end)

        RageUI.IsVisible(RMenu:Get("Job", "Mobil_CarOwner"), function()
            RageUI.Item.Separator("↓↓       ~y~Identité~s~       ↓↓")
            RageUI.Item.Separator("[Nom] : "..Job.Wl.CarOwner.LastName)
            RageUI.Item.Separator("[Prénom] : "..Job.Wl.CarOwner.FirstName)
            RageUI.Item.Separator("↓↓       ~y~Informations~s~       ↓↓")
            RageUI.Item.Separator("[Age] : "..Job.Wl.CarOwner.Plate)
            if Job.Wl.CarOwner.Ensured then
                RageUI.Item.Separator("[Assurer]")
            end
            if Job.Wl.CarOwner.Search then
                RageUI.Item.Separator("[Rechercher]")
            end
        end)
    end
end)