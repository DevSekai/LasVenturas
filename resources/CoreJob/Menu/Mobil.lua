-- Création du menu --
RMenu.Add("Job", "Mobil", RageUI.CreateMenu("", "Intéraction", nil, nil, "root_cause", "Banner"), true)
RMenu.Add("Job", "Mobil_Society", RageUI.CreateSubMenu(RMenu:Get("Job", "Mobil"),"", "Gestion de l'entreprise"))
RMenu.Add("Job", "Mobil_Report", RageUI.CreateSubMenu(RMenu:Get("Job", "Mobil"),"", "Dossiers"))

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(0)

        if IsControlJustReleased(1, 167) then
            if PlayerData.job.name ~= "unemployed" and PlayerData.job.name ~= "unemployed2" then
                RageUI.Visible(RMenu:Get("Job", "Mobil"), not RageUI.Visible(RMenu:Get("Job", "Mobil")))
            end
        end

        RageUI.IsVisible(RMenu:Get("Job", "Mobil"), function()
            if PlayerData.job.grade_name == "boss" then
                RageUI.Item.Button("Actions entreprise", nil, {}, true, {
                    onSelected = function(Index, Items)
                        ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(Money)
                            Job.Wl.Society_Money = Money
                        end, PlayerData.job.name)
                    end,
                },RMenu:Get("Job", "Mobil_Society"))
            end
            RageUI.Item.Checkbox("Prise/Fin de service", "", Job.Wl.DuttyState, {}, {
                onSelected = function(Index, Items)
                    Job.Wl.DuttyState = not Job.Wl.DuttyState
                    TriggerServerEvent("OnDutty", Job.Wl.DuttyState)
                end,
            })
            if Job.Wl.DuttyState then
                RageUI.Item.Button("Facturation", "", {}, true, {
                    onSelected = function(Index, Items)
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        if closestPlayer == -1 or closestDistance > 1.5 then
                            ESX.ShowNotification("Personne aux alentours")
                        else
                            Input = KeyboardInput("Montant de la facture", "", 20)
                            if tonumber(Input) ~= nil then
                                TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_'..PlayerData.job.name, 'Facture', tonumber(Input))
                            else
                                ESX.ShowNotification("Utilisation invalide.")
                            end
                        end
                    end,
                })
                for _,v in pairs (Job.Wl[PlayerData.job.name].Btn) do
                    if v.Type == "Button" then
                        RageUI.Item.Button(v.Label, nil, {}, true, {
                            onSelected = function(Index, Items)
                                v.Function()
                            end,
                        })
                    elseif v.Type == "List" then
                        RageUI.Item.List(v.Label, v.Table, v.Index, nil, {}, true, {
                            onSelected = function(Index, Items)
                                v.Index = Index
                                v.Function(Items.Value)
                            end,
                        })
                    else
                        RageUI.Item.Separator(v.Label)
                    end
                end
            end
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
    end
end)