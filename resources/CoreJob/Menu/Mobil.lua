-- Création du menu --
RMenu.Add("Job", "Mobil", RageUI.CreateMenu("", "Menu métier", nil, nil, "root_cause", "Banner"), true)
RMenu:Get("Job", "Mobil").Closed = function()
    RageUI.CloseAll()
    InMenu = false
end
RMenu.Add("Job", "Mobil_Society", RageUI.CreateSubMenu(RMenu:Get("Job", "Mobil"),"", "Gestion"))
RMenu.Add("Job", "Mobil_Report", RageUI.CreateSubMenu(RMenu:Get("Job", "Mobil"),"", "Dossiers"))
RMenu.Add("Job", "Mobil_TrgInv", RageUI.CreateSubMenu(RMenu:Get("Job", "Mobil"),"", "Inventaire"))
RMenu.Add("Job", "Mobil_TrgIdt", RageUI.CreateSubMenu(RMenu:Get("Job", "Mobil"),"", "Identité"))
RMenu.Add("Job", "Mobil_CarOwner", RageUI.CreateSubMenu(RMenu:Get("Job", "Mobil"),"", "Informations"))


RegisterCommand('OpenJob', function()
    if not InMenu then
        if PlayerData.job.name ~= "unemployed" then
            OpenJobMenu()
        end
    else
        InMenu = false
        RageUI.CloseAll()
    end
end, false)

RegisterKeyMapping('OpenJob', 'Menu job', 'keyboard', 'F6')

function OpenJobMenu()
    InMenu = true
    RageUI.Visible(RMenu:Get("Job", "Mobil"), true)
    while InMenu do
        Citizen.Wait(0)

        RageUI.IsVisible(RMenu:Get("Job", "Mobil"), function()
            Job.Wl.JobBtn()
        end)

        RageUI.IsVisible(RMenu:Get("Job", "Mobil_Society"), function()
            RageUI.Item.Separator("Compte : ~g~"..Job.Wl.Society_Money.." $")
            RageUI.Item.Button("~r~>~s~  Recruter l'employer", nil, {}, true, {
                onSelected = function(Index, Items)
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 1.5 then
                        ESX.ShowNotification("Personne aux alentours")
                    else
                        TriggerServerEvent('EmbaucherEmployer', GetPlayerServerId(closestPlayer), PlayerData.job.name, 0)
                    end
                end,
            })
            RageUI.Item.Button("~r~>~s~  Promouvoir l'employer", nil, {}, true, {
                onSelected = function(Index, Items)
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 1.5 then
                        ESX.ShowNotification("Personne aux alentours")
                    else
                        TriggerServerEvent('PromouvoirEmployer', GetPlayerServerId(closestPlayer))
                    end
                end,
            })
            RageUI.Item.Button("~r~>~s~  Virer l'employer", nil, {}, true, {
                onSelected = function(Index, Items)
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 1.5 then
                        ESX.ShowNotification("Personne aux alentours")
                    else
                        TriggerServerEvent('VirerEmployer', GetPlayerServerId(closestPlayer))
                    end
                end,
            })
            RageUI.Item.Button("~r~>~s~  Rétrograder l'employer", nil, {}, true, {
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
            RageUI.Item.Separator("Cash")
            for _,v in pairs (Job.Wl.Trg.Account) do
                RageUI.Item.Button("~r~>~s~  ~g~"..v.label.." $", nil, {}, true, {
                })
            end
            RageUI.Item.Separator("Objets")
            for _,v in pairs (Job.Wl.Trg.Inventory) do
                RageUI.Item.Button("~r~>~s~  "..v.label.." x "..v.amount, nil, {}, true, {
                })
            end
            RageUI.Item.Separator("Armes")
            for _,v in pairs (Job.Wl.Trg.Loadout) do
                RageUI.Item.Button("~r~>~s~  "..v.label.." "..v.amount, nil, {}, true, {
                })
            end
        end)

        RageUI.IsVisible(RMenu:Get("Job", "Mobil_TrgIdt"), function()
            RageUI.Item.Separator("Identité")
            RageUI.Item.Separator("[Nom] : "..Job.Wl.TrgIdentity.LastName)
            RageUI.Item.Separator("[Prénom] : "..Job.Wl.TrgIdentity.FirstName)
            RageUI.Item.Separator("Informations")
            RageUI.Item.Separator("[Age] : "..Job.Wl.TrgIdentity.Birthday)
            RageUI.Item.Separator("[Métier] : "..Job.Wl.TrgIdentity.Job)
        end)

        RageUI.IsVisible(RMenu:Get("Job", "Mobil_CarOwner"), function()
            RageUI.Item.Separator("Identité")
            RageUI.Item.Separator("[Nom] : "..Job.Wl.CarOwner.LastName)
            RageUI.Item.Separator("[Prénom] : "..Job.Wl.CarOwner.FirstName)
            RageUI.Item.Separator("Informations")
            RageUI.Item.Separator("[Age] : "..Job.Wl.CarOwner.Plate)
            if Job.Wl.CarOwner.Ensured then
                RageUI.Item.Separator("[Assurer]")
            end
            if Job.Wl.CarOwner.Search then
                RageUI.Item.Separator("[Rechercher]")
            end
        end)
    end
end