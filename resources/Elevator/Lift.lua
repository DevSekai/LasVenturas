Lift = {
    CrtZone = nil,
    CrtLift = {},
    Floor = {
        {Pos = vector3(132.540, -1287.496, 29.272), Label = "Passer derière le bar", Zone = "Unicorn", Floor = 1, Job = "unicorn"},
        {Pos = vector3(133.062, -1293.807, 29.269), Label = "Passer en salle", Zone = "Unicorn", Floor = 2, Job = "unicorn"},
    },
}

--[[ Explication de la table : 
        CrtZone : Se définie lors d'entré dans une zone
        CrtLift : Les niveaux de l'ascenseur lié a la zone
        Pos : Toujours en vector3 fivem a "du mal avec x,y,z"
        Label : Nom dans le menu
        Zone : Permet de différencier les differents ascenseurs
        Floor : L'orde des buttons dans le menu
--]]

Lift.TakeLift = function(Pos)
    RageUI.CloseAll()
    SetEntityCoords(PlayerPedId(), Pos)
    Lift.CrtLift = {}
    FreezeEntityPosition(PlayerPedId(), false)
end

Lift.LeaveLift = function()
    RageUI.CloseAll()
    Lift.CrtLift = {}
    FreezeEntityPosition(PlayerPedId(), false)
end

Lift.Help = function (Txt)
	AddTextEntry('HelpNotify', Txt)
	BeginTextCommandDisplayHelp('HelpNotify')
	EndTextCommandDisplayHelp(0, false, true, -1)
end