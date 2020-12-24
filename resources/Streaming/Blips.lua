Blips = {
    {
        Label = "Commissariat",
        Sprite = 60,
        Color = 3,
        Coords = vector3(431.88131713867, -981.63952636719, 30.695190429688),
    },
    {
        Label = "Hôpital",
        Sprite = 61,
        Color = 2,
        Coords = vector3(365.10330200195, -591.66595458984, 28.690063476563),
    },
    {
        Label = "Benny's",
        Sprite = 446,
        Color = 5,
        Coords = vector3(-205.95164489746, -1305.876953125, 30.695190429688),
    },
    {
        Label = "Weazel News",
        Sprite = 184,
        Color = 4,
        Coords = vector3(-603.65277099609, -932.65057373047, 23.854248046875),
    },
    {
        Label = "Unicorn",
        Sprite = 121,
        Color = 8,
        Coords = vector3(134.28132629395, -1307.7098388672, 28.993408203125),
    },
    {
        Label = "Tequi-La-La",
        Sprite = 93,
        Color = 28,
        Coords = vector3(-564.96264648438, 270.39559936523, 83.013916015625),
    },
    {
        Label = "Gouvernement",
        Sprite = 419,
        Color = 4,
        Coords = vector3(-542.46594238281, -208.91868591309, 37.637329101563),
    },
    {
        Label = "Legion'Dog",
        Sprite = 279,
        Color = 5,
        Coords = vector3(49.331871032715, -999.11206054688, 29.347290039063),
    },
}

Citizen.CreateThread( function()
    for _,v in pairs (Blips) do
        local Blip = AddBlipForCoord(v.Coords)
        SetBlipSprite (Blip, v.Sprite)
        SetBlipDisplay(Blip, 4)
        SetBlipScale  (Blip, 0.8)
        SetBlipColour (Blip, v.Color)
        SetBlipAsShortRange(Blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.Label)
        EndTextCommandSetBlipName(Blip)
    end
end)