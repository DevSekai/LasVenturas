Storage = {
    PlyGroup = "",
    AdminState = false,
    PlyList = {},
    CrtPly = {},
    PlyListIndex = 1,
    PlyListActions = {
        {Name = "~g~Donner un objet~s~", Value = "GiveItem", Trigger = "GivePlayer"},
        {Name = "~g~Donner une arme~s~", Value = "GiveWeapon", Trigger = "GivePlayer"},
        {Name = "~g~Donner de l'argent~s~", Value = "GiveCash", Trigger = "GivePlayer"},
        {Name = "~y~Setjob~s~", Value = "Setjob", Trigger = "ActionPlayer"},
        {Name = "~y~Setorg~s~", Value = "Setorg", Trigger = "ActionPlayer"},
        {Name = "~o~Se tp a lui~s~", Value = "Goto", Trigger = "ActionPlayer"},
        {Name = "~o~Le tp a sois~s~", Value = "Bring", Trigger = "ActionPlayer"},
        {Name = "~o~Lire les Warns~s~", Value = "WarnsList"},
        {Name = "~r~Supprimer les armes~s~", Value = "ClearLoadout", Trigger = "PunishPlayer"},
        {Name = "~r~Vider l'inventaire~s~", Value = "ClearInventory", Trigger = "PunishPlayer"},
        {Name = "~r~Jail~s~", Value = "Jail", Trigger = "PunishPlayer"},
        {Name = "~r~Warn~s~", Value = "Warns", Trigger = "PunishPlayer"},
        {Name = "~r~Ban~s~", Value = "Ban", Trigger = "PunishPlayer"},
    },
    InJail = false,
    JailTime = 15 * 60,
    TimeInJail = 0,
    JailInCoords = vector3(0, 0, 0),
    JailOutCoords = vector3(202.2501373291, 1246.0, 225.46675109863),
    PlyWarns = {},
    AccesDenied = "Vous n'avez pas les autorisation nécéssaire.",
}