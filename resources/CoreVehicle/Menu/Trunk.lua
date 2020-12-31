RMenu.Add("Trunk", "Main", RageUI.CreateMenu("Coffre", "Intéractions", nil, nil), true)
RMenu:Get("Trunk", "Main").Closable = false;
RMenu.Add("Trunk", "Vhc_Inv", RageUI.CreateSubMenu(RMenu:Get("Trunk", "Main"), "Coffre du véhicule", "Retirer"))
RMenu.Add("Trunk", "Ply_Inv", RageUI.CreateSubMenu(RMenu:Get("Trunk", "Main"), "Coffre du véhicule", "Déposer"))

Timing = 2000
OnTrunk = false

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(Timing)
        local Vehicle   = ESX.Game.GetVehicleInDirection()
        if DoesEntityExist(Vehicle) then
            Timing = 0
            OnTrunk = true
            ESX.ShowHelpNotification("Appuyer sur ~INPUT_CELLPHONE_CAMERA_FOCUS_LOCK~ pour ouvrir le coffre")
            VhcClass = GetVehicleClass(Vehicle)
            if IsControlJustReleased(1, 182) then
                local Coords    = GetEntityCoords(PlayerPedId())
                if IsPedSittingInAnyVehicle(PlayerPedId()) then
                    TriggerEvent('esx:showAdvancedNotification', "Dymia ~g~V", "~y~Véhicule", "Vous ne pouvez pas le faire depuis le véhicule.", "CHAR_STRETCH", 1)
                elseif DoesEntityExist(Vehicle) then
                local Plate = GetVehicleNumberPlateText(Vehicle)
                    ESX.TriggerServerCallback('Trunk:IsOpen', function(Opened)
                        if Opened then
                            TriggerEvent('esx:showAdvancedNotification', "Dymia ~g~V", "~y~Véhicule", "Le coffre est déjà utiliser.", "CHAR_STRETCH", 1)
                        else
                            Storage.Vhc_Inv = {}
                            ESX.TriggerServerCallback('Trunk:GetVhcInv', function(TrunkInv)
                                if TrunkInv then
                                    Storage.Vhc_Inv = TrunkInv
                                    RageUI.Visible(RMenu:Get("Trunk", "Main"), true)
                                else
                                    RageUI.Visible(RMenu:Get("Trunk", "Main"), true)
                                end
                            end, Plate)
                        end
                    end, Plate)
                else
                    TriggerEvent('esx:showAdvancedNotification', "Dymia ~g~V", "~y~Véhicule", "Il n'y a pas de véhicule autour.", "CHAR_STRETCH", 1)
                end
            end
        else
            if OnTrunk then
                Timing = 2000
                OnTrunk = false
            end
        end

        RageUI.IsVisible(RMenu:Get("Trunk", "Main"), function()
            RageUI.Item.Separator("[Capacité] : ~b~"..ESX.Math.Round((Storage.Trunk.MaxWeight[VhcClass] - Storage.CrtWeight) / 1000).."~s~ KG")
            RageUI.Item.Button("Déposer dans le coffre", nil, { RightLabel = "→→"}, true, {
                onSelected = function(Index, Items)
                    Storage.Pressed = false
					Storage.Ply_Inv = {}
					ESX.TriggerServerCallback('Trunk:GetPlyInv', function(inventory)
						for i=1, #inventory.items, 1 do
							local item = inventory.items[i]
							if item.count >= 1 then
								table.insert(Storage.Ply_Inv, {Label = item.label, Count = item.count, Type = 'item_standard', Value = item.name})
							end
						end
					end)
                end,
            },RMenu:Get("Trunk", "Ply_Inv"))
            RageUI.Item.Button("Retirer du coffre", nil, { RightLabel = "→→"}, true, {
                onSelected = function(Index, Items)
                    local Plate = GetVehicleNumberPlateText(Vehicle)
                    VhcClass = GetVehicleClass(Vehicle)
                    Storage.Pressed = false
                    Storage.Vhc_Inv = {}
                    ESX.TriggerServerCallback('Trunk:GetVhcInv', function(TrunkInv)
                        if TrunkInv then
                            Storage.Vhc_Inv = TrunkInv
                        else
                            TriggerEvent('esx:showAdvancedNotification', "Dymia ~g~V", "~y~Véhicule", "Le coffre est vide.", "CHAR_STRETCH", 1)
                        end
                    end, Plate)
                end,
            },RMenu:Get("Trunk", "Vhc_Inv"))
            RageUI.Item.Button("~r~Fermer le coffre", nil, {}, true, {
                onSelected = function(Index, Items)
                    local Plate = GetVehicleNumberPlateText(Vehicle)
                    TriggerServerEvent("Trunk:Leave", Plate)
                    FreezeEntityPosition(PlayerPedId(), false)
                    RageUI.CloseAll()
                end,
            })
        end)

        RageUI.IsVisible(RMenu:Get("Trunk", "Ply_Inv"), function()
            RageUI.Item.Separator("[Capacité] : ~b~"..ESX.Math.Round((Storage.Trunk.MaxWeight[VhcClass] - Storage.CrtWeight) / 1000).."~s~ KG")
            for _,v in pairs (Storage.Ply_Inv) do
                IndexFound = {}
                for i = 1 , v.Count, 1 do
                    IndexFound[i] = i
                end
                RageUI.Item.List(v.Label.." ~b~Max : "..v.Count.. " Poids : "..(Storage.Trunk.Weight[v.Value] / 1000).." KG", IndexFound, v.Index or 1, nil, {}, true, {
                    onSelected = function(Index, Items)
                        local Plate = GetVehicleNumberPlateText(Vehicle)
                        VhcClass = GetVehicleClass(Vehicle)
                        if not Storage.Pressed then
                            Storage.Pressed = true
                            if Storage.CrtWeight <= Storage.Trunk.MaxWeight[VhcClass] then
                                Table = {ItemName = v.Value, ItemLabel = v.Label, ItemCount = Index, Plate = Plate, VhcClass = VhcClass}
                                TriggerServerEvent("Trunk:Deposite", Table)
                                RageUI.GoBack()
                            else
                                RageUI.GoBack()
                            end
                        end
                    end,
                })
            end
        end)

        RageUI.IsVisible(RMenu:Get("Trunk", "Vhc_Inv"), function()
            RageUI.Item.Separator("[Capacité] : ~b~"..ESX.Math.Round((Storage.Trunk.MaxWeight[VhcClass] - Storage.CrtWeight) / 1000).."~s~ KG")
            for _,v in pairs (Storage.Vhc_Inv) do
                if v.ItemCount >= 1 then
                    IndexFound = {}
                    for i = 1 , v.ItemCount, 1 do
                        IndexFound[i] = i
                    end
                    RageUI.Item.List(v.ItemLabel.." ~b~Max : "..v.ItemCount.. " Poids : "..(Storage.Trunk.Weight[v.ItemName] / 1000).." KG", IndexFound, v.Index or 1, nil, {}, true, {
                        onSelected = function(Index, Items)
                            local Plate = GetVehicleNumberPlateText(Vehicle)
                            if not Storage.Pressed then
                                Storage.Pressed = true
                                Table = {ItemName = v.ItemName, ItemLabel = v.ItemLabel, ItemCount = Index, Plate = Plate, VhcClass = VhcClass}
                                TriggerServerEvent("Trunk:Withdraw", Table)
                                RageUI.GoBack()
                            end
                        end,
                    })
                end
            end
        end)
    end
end)