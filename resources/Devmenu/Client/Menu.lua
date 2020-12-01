RMenu.Add('PosMenu', 'Principal', RageUI.CreateMenu("", "Menu position", nil, nil, "root_cause", "Banner"), true)
RMenu:Get('PosMenu', 'Principal'):DisplayGlare(false);

RMenu.Add('PosMenu', 'Vehicle', RageUI.CreateSubMenu(RMenu:Get('PosMenu', 'Principal'), "", "Garage & Fourrière"))
RMenu:Get('PosMenu', 'Vehicle'):DisplayGlare(false);

Pos = {
    Ped = nil,
    PedState = false,
    Enter = nil,
    EnterState = false,
    Out = nil,
    OutState = false
}

Citizen.CreateThread( function()
    while true do
        Citizen.Wait(0)
        if IsControlJustReleased(1, 344) then
            RageUI.Visible(RMenu:Get('PosMenu', 'Principal'), not RageUI.Visible(RMenu:Get('PosMenu', 'Principal')))
        end

        RageUI.IsVisible(RMenu:Get('PosMenu', 'Principal'), function()
            RageUI.Item.Button("Garage & Fourrière", "Permet d'avoir les positions en un rien de temps.", {}, true, {
            },RMenu:Get('PosMenu', 'Vehicle'))
        end)
        
        RageUI.IsVisible(RMenu:Get('PosMenu', 'Vehicle'), function()
            RageUI.Item.Checkbox("Ped", Pos.Ped, Pos.PedState, {}, {
                onChecked = function()
                    local Coords = GetEntityCoords(PlayerPedId())
                    local x, y, z = table.unpack(Coords)
                    local Heading = GetEntityHeading(PlayerPedId())
                    Pos.Ped = "{x = "..x..", y = "..y..", z = "..z..", h = "..Heading..", Menu = , Type = , Class = ,"
                    Pos.PedState = true
                end,
            })
            if Pos.Ped ~= nil then
                RageUI.Item.Checkbox("Enter", Pos.Enter, Pos.EnterState, {}, {
                    onChecked = function()
                        local Coords = GetEntityCoords(PlayerPedId())
                        local x, y, z = table.unpack(Coords)
                        local Heading = GetEntityHeading(PlayerPedId())
                        Pos.Enter = ",\ncx = "..x..", cy = "..y..", cz = "..z..", ch = "..Heading
                        Pos.EnterState = true
                    end,
                })
            end
            if Pos.Ped ~= nil and Pos.Enter ~= nil then
                RageUI.Item.Checkbox("Out", Pos.Out, Pos.OutState, {}, {
                    onChecked = function()
                        local Coords = GetEntityCoords(PlayerPedId())
                        local x, y, z = table.unpack(Coords)
                        local Heading = GetEntityHeading(PlayerPedId())
                        Pos.Out = ",\nbox = "..x..", boy = "..y..", boz = "..z..", boh = "..Heading.."},"
                        Pos.OutState = true
                    end,
                })
            end
            if Pos.Ped ~= nil and Pos.Enter ~= nil and Pos.Out ~= nil then
                RageUI.Item.Button("Copier les coords du garage/fourriere", Pos.Ped..Pos.Enter..Pos.Out, {}, true, {
                    onSelected = function()
                        SendNUIMessage({
                            Copy = Pos.Ped..Pos.Enter..Pos.Out
                        })
                        Ped = nil
                        Enter = nil
                        Out = nil
                    end,
                })
            end
        end)
    end
end)

function sendNotif(Txt)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(Txt)
	DrawNotification(0,1)
end

