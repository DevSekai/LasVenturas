RMenu.Add('Exemple', 'Main', RageUI.CreateMenu("Exemple", "", nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Exemple', 'Main'):DisplayGlare(false);

Timing = 0
InMenu = false

Citizen.CreateThread( function()
    while true do
        Citizen.Wait(Timing)
        if IsControlJustReleased(1, 51) then
            OpenMenu()
        end
        if not RageUI.Visible(RMenu:Get('Exemple', 'Main')) then
            InMenu = false
            Timing = 0
        end
    end
end)

function OpenMenu()
    Timing = 2000 -- Permet de ralentire la boucle (gain de perfs)
    RageUI.Visible(RMenu:Get("Exemple', 'Main"), not RageUI.Visible(RMenu:Get("Exemple', 'Main")))
    InMenu = true
    while InMenu do
        Citizen.Wait(0)
        -- TON MENU --
    end
end
