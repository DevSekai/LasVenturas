Staff = {
    MaxWarns = 5, -- A changer selon votre choix
    Jail_Timing = 15 * 60 * 1000, -- 15M de base, a changer selon votre envie
    Jail_Coords = vector3(-324.0263671875, -1968.3297119141, 66.9560546875), -- A changer selon votre envie
    JailOut_Coords = vector3(-280.15383911133, -1916.2548828125, 29.93701171875), -- A changer selon votre envie
    AdminState = false,
    Noclip = false,
    PlyBlips = false,
    PlyBlip = {},
    PlyName = false,
    KeyboardError = "Usage invalide.",
    PlyList = {},
    PlyListIndex = 1,
    PlyActions = {
        {Name = "Donner un objet", Value = "GiveItem", Menu = "ItemsList2"},
        {Name = "Donner une arme", Value = "GiveWeapon", Menu = "WeaponList2"},
        {Name = "Donner de l'argent", Value = "GiveMoney"},
        {Name = "Setjob", Value = "SetJob", Menu = "JobsList2"},
        {Name = "Setorg", Value = "SetOrg", Menu = "Jobs2List2"},
        {Name = "Revive", Value = "Revive"},
        {Name = "Supprimer les armes", Value = "ClearLoadout"},
        {Name = "Vider l'inventaire", Value = "ClearInventory"},
    },
    PlyListActions = {
        {Name = "Voir les informations", Value = "GetInfo", Menu = "PlyInfos"},
        {Name = "Spectate", Value = "Spectate"},
        {Name = "Revive", Value = "Revive"},
        {Name = "Se tp a lui", Value = "Goto"},
        {Name = "Le tp a sois", Value = "Bring"},
        {Name = "Lire les Warns", Value = "WarnsList"},
        {Name = "Jail", Value = "Jail"},
        {Name = "Warn", Value = "Warns"},
        {Name = "Ban", Value = "Ban"},
    },
    PlyInfos = {},
    PlyInfosInv = {},
    PlyInfosWea = {},
    PlyWamrs = {},
    JobsList = {},
    Jobs2List = {},
    JobsListsReady = false,
    ItemsList = {},
    WeaponList = {
        {Label = "↓↓       ~o~Mélée~s~       ↓↓"},
        {Label = "Couteau", Value = "weapon_knife"},
        {Label = "Matraque", Value = "weapon_nightstick"},
        {Label = "Marteau", Value = "weapon_hammer"},
        {Label = "Batte", Value = "weapon_bat"},
        {Label = "Club de golf", Value = "weapon_golfclub"},
        {Label = "Pied de biche", Value = "weapon_crowbar"},
        {Label = "Queue de billard", Value = "weapon_poolcue"},
        {Label = "Hache de combat", Value = "weapon_battleaxe"},
        {Label = "Couteau a cran d'arret", Value = "weapon_switchblade"},
        {Label = "Hachette", Value = "weapon_hatchet"},
        {Label = "Poing américain", Value = "weapon_knuckle"},
        {Label = "Dague", Value = "weapon_dagger"},
        {Label = "Bouteille", Value = "weapon_bottle"},
        {Label = "Clé", Value = "weapon_wrench"},
        {Label = "Lampe torche", Value = "weapon_flashlight"},
        {Label = "↓↓       ~o~Armes de poing~s~       ↓↓"},
        {Label = "Tazer", Value = "weapon_stungun"},
        {Label = "Pistolet", Value = "weapon_pistol"},
        {Label = "Pistolet de combat", Value = "weapon_combatpistol"},
        {Label = "Pistolet automatique", Value = "weapon_appistol"},
        {Label = "Pistolet calibre 50", Value = "weapon_pistol50"},
        {Label = "Pistolet sns", Value = "weapon_snspistol"},
        {Label = "Pistolet lourd", Value = "weapon_heavypistol"},
        {Label = "Pistolet vintage", Value = "weapon_vintagepistol"},
        {Label = "Pistolet marksman", Value = "weapon_marksmanpistol"},
        {Label = "Revolver", Value = "weapon_revolver"},
        {Label = "Revolver double action", Value = "weapon_doubleaction"},
        {Label = "↓↓       ~o~Mitrailletes~s~       ↓↓"},
        {Label = "Micro smg", Value = "weapon_microsmg"},
        {Label = "Mini smg", Value = "weapon_minismg"},
        {Label = "Pistolet mitrailleur", Value = "weapon_machinepistol"},
        {Label = "Smg", Value = "weapon_smg"},
        {Label = "Combat PDW", Value = "weapon_combatpdw"},
        {Label = "Smg d'assaut", Value = "weapon_assaultsmg"},
        {Label = "↓↓       ~o~Fusil dà pompe~s~       ↓↓"},
        {Label = "Pump Shotgun", Value = "weapon_pumpshotgun"},
        {Label = "Sawed-Off Shotgun", Value = "weapon_sawnoffshotgun"},
        {Label = "Assault Shotgun", Value = "weapon_assaultshotgun"},
        {Label = "Bullpup Shotgun", Value = "weapon_bullpupshotgun"},
        {Label = "Musket", Value = "weapon_musket"},
        {Label = "Heavy Shotgun", Value = "weapon_heavyshotgun"},
        {Label = "Double Barrel Shotgun", Value = "weapon_dbshotgun"},
        {Label = "Sweeper Shotgun", Value = "weapon_autoshotgun"},
        {Label = "Combat Shotgun", Value = "weapon_combatshotgun"},
        {Label = "↓↓       ~o~Fusil d'assaut~s~       ↓↓"},
        {Label = "Fusil d'assault", Value = "weapon_assaultrifle"},
        {Label = "Carabine d'assault", Value = "weapon_carbinerifle"},
        {Label = "Fusil avancé", Value = "weapon_advancedrifle"},
        {Label = "Carabine spéciale", Value = "weapon_specialcarbine"},
        {Label = "Fusil bullpup", Value = "weapon_bullpuprifle"},
        {Label = "Fusil compact", Value = "weapon_compactrifle"},
        {Label = "↓↓       ~o~Mitrailleuse~s~       ↓↓"},
        {Label = "MG", Value = "weapon_mg"},
        {Label = "Combat MG", Value = "weapon_combatmg"},
        {Label = "Gusenberg Sweeper", Value = "weapon_gusenberg"},
        {Label = "↓↓       ~o~Sniper~s~       ↓↓"},
        {Label = "Sniper Rifle", Value = "weapon_sniperrifle"},
        {Label = "Heavy Sniper", Value = "weapon_heavysniper"},
        {Label = "Marksman Rifle", Value = "weapon_marksmanrifle"},
        {Label = "↓↓       ~o~Heavy~s~       ↓↓"},
        {Label = "Rpg", Value = "weapon_rpg"},
        {Label = "Grenade Launcher", Value = "weapon_grenadelauncher"},
        {Label = "Minigun", Value = "weapon_minigun"},
        {Label = "Firework Launcher", Value = "weapon_firework"},
        {Label = "Homing Launcher", Value = "weapon_hominglauncher"},
        {Label = "Compact Grenade Launcher", Value = "weapon_compactlauncher"},
        {Label = "↓↓       ~o~Lançable~s~       ↓↓"},
        {Label = "Grenade", Value = "weapon_grenade"},
        {Label = "BZ Gas", Value = "weapon_bzgas"},
        {Label = "Molotov Cocktail", Value = "weapon_molotov"},
        {Label = "Sticky Bomb", Value = "weapon_stickybomb"},
        {Label = "Proximity Mines", Value = "weapon_proxmine"},
        {Label = "Snowballs", Value = "weapon_snowball"},
        {Label = "Pipe Bombs", Value = "weapon_pipebomb"},
        {Label = "Baseball", Value = "weapon_ball"},
        {Label = "Tear Gas", Value = "weapon_smokegrenade"},
        {Label = "Flare", Value = "weapon_flare"},
    },
    CarsList = {
        {
            Label = "Compacts",
            Index = 1,
            Cars = {
                {Name = "Blista", Value = "blista"},
                {Name = "Brioso", Value = "brioso"},
                {Name = "Dilettante", Value = "dilettante"},
                {Name = "Issi", Value = "issi2"},
                {Name = "Panto", Value = "panto"},
                {Name = "Prairie", Value = "prairie"},
                {Name = "Rhapsody", Value = "rhapsody"},
            },
        },
        {
            Label = "Coupe",
            Index = 1,
            Cars = {
                {Name = "Cogcabrio", Value = "cogcabrio"},
                {Name = "Exemplar", Value = "exemplar"},
                {Name = "F620", Value = "f620"},
                {Name = "Felon", Value = "felon"},
                {Name = "Felon Cabriolé", Value = "felon2"},
                {Name = "Jackal", Value = "jackal"},
                {Name = "Oracle", Value = "oracle"},
                {Name = "Sentinel", Value = "sentinel"},
                {Name = "Sentinel Cabriolé", Value = "sentinel2"},
                {Name = "Zion", Value = "zion"},
                {Name = "Zion Cabriolé", Value = "zion2"},
            },
        },
        {
            Label = "Sedans",
            Index = 1,
            Cars = {
                {Name = "Asea", Value = "asea"},
                {Name = "Asterope", Value = "asterope"},
                {Name = "Cog55", Value = "cog55"},
                {Name = "Cognoscenti", Value = "cognoscenti"},
                {Name = "Emperor", Value = "emperor"},
                {Name = "Fugitive", Value = "fugitive"},
                {Name = "Glendale", Value = "glendale"},
                {Name = "Ingot", Value = "ingot"},
                {Name = "Intruder", Value = "intruder"},
                {Name = "Limo", Value = "limo2"},
                {Name = "Premier", Value = "premier"},
                {Name = "Primo", Value = "primo"},
                {Name = "Regina", Value = "regina"},
                {Name = "Romero", Value = "romero"},
                {Name = "Stafford", Value = "stafford"},
                {Name = "Stanier", Value = "stanier"},
                {Name = "Stratum", Value = "stratum"},
                {Name = "SuperD", Value = "superd"},
                {Name = "Surge", Value = "surge"},
                {Name = "Tailgater", Value = "tailgater"},
                {Name = "Warrener", Value = "warrener"},
                {Name = "Washington", Value = "washington"},
            },
        },
        {
            Label = "Sport",
            Index = 1,
            Cars = {
                {Name = "Alpha", Value = "alpha"},
                {Name = "Banshee", Value = "banshee"},
                {Name = "BestiaGTS", Value = "bestiagts"},
                {Name = "Blista", Value = "blista2"},
                {Name = "Buffalo", Value = "buffalo"},
                {Name = "Carbonizzare", Value = "carbonizzare"},
                {Name = "Comet", Value = "comet2"},
                {Name = "Coquette", Value = "coquette"},
                {Name = "Drafter", Value = "drafter"},
                {Name = "Deveste", Value = "deveste"},
                {Name = "Elegy", Value = "elegy"},
                {Name = "ElegyRS", Value = "elegy2"},
                {Name = "Feltzer", Value = "feltzer2"},
                {Name = "FlashGT", Value = "flashgt"},
                {Name = "FuroreGT", Value = "furoregt"},
                {Name = "Fusilade", Value = "fusilade"},
                {Name = "Futo", Value = "futo"},
                {Name = "GB200", Value = "gb200"},
                {Name = "Hotring", Value = "hotring"},
                {Name = "Komoda", Value = "komoda"},
                {Name = "Imorgon", Value = "imorgon"},
                {Name = "Issi", Value = "issi7"},
                {Name = "ItaliGTO", Value = "italigto"},
                {Name = "Jugular", Value = "jugular"},
                {Name = "Jester", Value = "jester"},
                {Name = "Khamelion", Value = "khamelion"},
                {Name = "Kuruma", Value = "kuruma"},
                {Name = "Locust", Value = "locust"},
                {Name = "Lynx", Value = "lynx"},
                {Name = "Massacro", Value = "massacro"},
                {Name = "Neo", Value = "neo"},
                {Name = "Neon", Value = "neon"},
                {Name = "NineF", Value = "ninef"},
                {Name = "Omnis", Value = "omnis"},
                {Name = "Paragon", Value = "paragon"},
                {Name = "Pariah", Value = "pariah"},
                {Name = "Penumbra", Value = "penumbra"},
                {Name = "Raiden", Value = "raiden"},
                {Name = "RapidGT", Value = "rapidgt"},
                {Name = "Raptor", Value = "raptor"},
                {Name = "Revolter", Value = "revolter"},
                {Name = "Ruston", Value = "ruston"},
                {Name = "Schafter", Value = "schafter3"},
                {Name = "Schlagen", Value = "schlagen"},
                {Name = "Schwarzer", Value = "schwarzer"},
                {Name = "Sentinel", Value = "sentinel3"},
                {Name = "Seven70", Value = "seven70"},
                {Name = "Specter", Value = "specter"},
                {Name = "Streiter", Value = "streiter"},
                {Name = "Sugoi", Value = "sugoi"},
                {Name = "Sultan", Value = "sultan"},
                {Name = "Surano", Value = "surano"},
                {Name = "Tampa", Value = "tampa2"},
                {Name = "Tropos", Value = "tropos"},
                {Name = "Verlierer", Value = "verlierer2"},
                {Name = "VSTR", Value = "vstr"},
            },
        },
        {
            Label = "Muscle",
            Index = 1,
            Cars = {
                {Name = "Blade", Value = "blade"},
                {Name = "Buccaneer", Value = "buccaneer"},
                {Name = "Buccaneer Cabriolé", Value = "buccaneer2"},
                {Name = "Chino", Value = "chino"},
                {Name = "Chino Cabriolé", Value = "chino2"},
                {Name = "Clique", Value = "clique"},
                {Name = "Coquette", Value = "coquette3"},
                {Name = "Deviant", Value = "deviant"},
                {Name = "Dominator", Value = "dominator"},
                {Name = "DominatorRS", Value = "dominator3"},
                {Name = "Dukes", Value = "dukes"},
                {Name = "Faction", Value = "faction"},
                {Name = "Ellie", Value = "ellie"},
                {Name = "Gauntlet", Value = "gauntlet"},
                {Name = "Hermes", Value = "hermes"},
                {Name = "Hotknife", Value = "hotknife"},
                {Name = "Hustler", Value = "hustler"},
                {Name = "Impaler", Value = "impaler"},
                {Name = "Imperator", Value = "imperator"},
                {Name = "Lurcher", Value = "lurcher"},
                {Name = "Moonbeam", Value = "moonbeam"},
                {Name = "Nighshade", Value = "nightshade"},
                {Name = "Phoenix", Value = "phoenix"},
                {Name = "Picador", Value = "picador"},
                {Name = "RatLoader", Value = "ratloader2"},
                {Name = "Ruiner", Value = "ruiner"},
                {Name = "SabreGT", Value = "sabregt"},
                {Name = "Slamvan", Value = "slamvan"},
                {Name = "Stalion", Value = "stalion"},
                {Name = "Tampa", Value = "tampa"},
                {Name = "Tulip", Value = "tulip"},
                {Name = "Vamos", Value = "vamos"},
                {Name = "Vigero", Value = "vigero"},
                {Name = "Virgo", Value = "virgo"},
                {Name = "Voodoo", Value = "voodoo"},
                {Name = "Yosemite", Value = "yosemite"},
            },
        },
        {
            Label = "Vans",
            Index = 1,
            Cars = {
                {Name = "Bison", Value = "bison"},
                {Name = "BobcatXL", Value = "bobcatxl"},
                {Name = "Burrito", Value = "burrito"},
                {Name = "Camper", Value = "camper"},
                {Name = "Journey", Value = "journey"},
                {Name = "Minivan", Value = "minivan"},
                {Name = "Paradise", Value = "paradise"},
                {Name = "Pony", Value = "pony"},
                {Name = "Rumpo", Value = "rumpo"},
                {Name = "Speedo", Value = "speedo"},
                {Name = "Surfer", Value = "surfer"},
                {Name = "Youge", Value = "youga"},
            },
        },
        {
            Label = "Suv",
            Index = 1,
            Cars = {
                {Name = "Baller", Value = "baller"},
                {Name = "BallerRS", Value = "baller2"},
                {Name = "BJXL", Value = "bjxl"},
                {Name = "Cavalcade", Value = "cavalcade"},
                {Name = "Contender", Value = "contender"},
                {Name = "Dubsta", Value = "dubsta"},
                {Name = "FQ2", Value = "fq2"},
                {Name = "Granger", Value = "granger"},
                {Name = "Gresley", Value = "gresley"},
                {Name = "Habanero", Value = "habanero"},
                {Name = "Huntley", Value = "huntley"},
                {Name = "Landstalker", Value = "landstalker"},
                {Name = "Mesa", Value = "mesa"},
                {Name = "Novak", Value = "novak"},
                {Name = "Patriot", Value = "patriot"},
                {Name = "Radi", Value = "radi"},
                {Name = "Rebla", Value = "rebla"},
                {Name = "Rocotp", Value = "rocoto"},
                {Name = "Semimole", Value = "seminole"},
                {Name = "Serrano", Value = "serrano"},
                {Name = "Toros", Value = "toros"},
                {Name = "XLS", Value = "xls"},
            },
        },
        {
            Label = "OffRoad",
            Index = 1,
            Cars = {
                {Name = "BFinjection", Value = "bfinjection"},
                {Name = "Bifta", Value = "bifta"},
                {Name = "Blazer", Value = "blazer"},
                {Name = "Blazer street", Value = "blazer4"},
                {Name = "Bodhi", Value = "bodhi2"},
                {Name = "Brawler", Value = "brawler"},
                {Name = "Brutus", Value = "brutus"},
                {Name = "Caracara", Value = "caracara"},
                {Name = "Caracara custom", Value = "caracara2"},
                {Name = "DLoader", Value = "dloader"},
                {Name = "Dubsta", Value = "dubsta3"},
                {Name = "Dune", Value = "dune"},
                {Name = "Everon", Value = "everon"},
                {Name = "Freecrawler", Value = "freecrawler"},
                {Name = "Hellion", Value = "hellion"},
                {Name = "Kalahari", Value = "kalahari"},
                {Name = "Kamacho", Value = "kamacho"},
                {Name = "Mesa", Value = "mesa3"},
                {Name = "Outlaw", Value = "outlaw"},
                {Name = "RancherXL", Value = "rancherxl"},
                {Name = "Rebel", Value = "rebel"},
                {Name = "Riata", Value = "riata"},
                {Name = "Sandking", Value = "sandking"},
                {Name = "SandkingXL", Value = "sandking2"},
                {Name = "Vagrant", Value = "vagrant"},
            },
        },
        {
            Label = "Moto",
            Index = 1,
            Cars = {
                {Name = "Akuma", Value = "akuma"},
                {Name = "Avarus", Value = "avarus"},
                {Name = "Bagger", Value = "bagger"},
                {Name = "Bati801", Value = "bati"},
                {Name = "Bf400", Value = "bf400"},
                {Name = "CarbonRS", Value = "carbonrs"},
                {Name = "Chimera", Value = "chimera"},
                {Name = "Cliffhanger", Value = "cliffhanger"},
                {Name = "Daemon", Value = "daemon"},
                {Name = "Defiler", Value = "defiler"},
                {Name = "Diabolus", Value = "diablous"},
                {Name = "Diabolus Custom", Value = "diablous2"},
                {Name = "Double T", Value = "double"},
                {Name = "Enduro", Value = "enduro"},
                {Name = "Esskey", Value = "esskey"},
                {Name = "Faggio", Value = "faggio"},
                {Name = "Faggio MOD", Value = "faggio3"},
                {Name = "FCR", Value = "fcr"},
                {Name = "Gargoyle", Value = "gargoyle"},
                {Name = "Hakuchou", Value = "hakuchou"},
                {Name = "Hexer", Value = "hexer"},
                {Name = "Innovation", Value = "innovation"},
                {Name = "Lectro", Value = "lectro"},
                {Name = "Manchez", Value = "manchez"},
                {Name = "Nemesis", Value = "nemesis"},
                {Name = "Nightblade", Value = "nightblade"},
                {Name = "PCJ", Value = "pcj"},
                {Name = "Ruffian", Value = "ruffian"},
                {Name = "Rocket", Value = "rrocket"},
                {Name = "Sanchez", Value = "sanchez2"},
                {Name = "Sanctus", Value = "sanctus"},
                {Name = "Stryder", Value = "stryder"},
                {Name = "Thrust", Value = "thrust"},
                {Name = "Vader", Value = "vader"},
                {Name = "Vindicator", Value = "vindicator"},
                {Name = "Vortex", Value = "vortex"},
                {Name = "Wolfsbane", Value = "wolfsbane"},
                {Name = "Zombie", Value = "zombiea"},
            },
        },
        {
            Label = "Vélo",
            Index = 1,
            Cars = {
                {Name = "BMX", Value = "bmx"},
                {Name = "Cruiser", Value = "cruiser"},
                {Name = "Fixter", Value = "fixter"},
                {Name = "Scorcher", Value = "scorcher"},
                {Name = "TriBike", Value = "tribike3"},
            },
        },
        {
            Label = "Classique",
            Index = 1,
            Cars = {
                {Name = "Ardent", Value = "ardent"},
                {Name = "BType", Value = "btype"},
                {Name = "Casco", Value = "casco"},
                {Name = "Cheetah", Value = "cheetah2"},
                {Name = "Coquette", Value = "coquette2"},
                {Name = "Dynasty", Value = "dynasty"},
                {Name = "Fagoloa", Value = "fagaloa"},
                {Name = "GT500", Value = "gt500"},
                {Name = "Infernus", Value = "infernus2"},
                {Name = "Jb700", Value = "jb700"},
                {Name = "Mamba", Value = "mamba"},
                {Name = "Manana", Value = "manana"},
                {Name = "Michelli", Value = "michelli"},
                {Name = "Monroe", Value = "monroe"},
                {Name = "Nebula", Value = "nebula"},
                {Name = "Peyote", Value = "peyote"},
                {Name = "Pigalle", Value = "pigalle"},
                {Name = "RapidGT", Value = "rapidgt3"},
                {Name = "Retinue", Value = "retinue"},
                {Name = "Savestra", Value = "savestra"},
                {Name = "Stringer", Value = "stinger"},
                {Name = "StringerGT", Value = "stingergt"},
                {Name = "Stromberg", Value = "stromberg"},
                {Name = "Swiner", Value = "swinger"},
                {Name = "Torero", Value = "torero"},
                {Name = "Tornado", Value = "tornado2"},
                {Name = "Turismo", Value = "turismo2"},
                {Name = "Viseris", Value = "viseris"},
                {Name = "Z190", Value = "z190"},
                {Name = "Ztype", Value = "ztype"},
                {Name = "Zion", Value = "zion3"},
                {Name = "Cheburek", Value = "cheburek"},
            },
        },
        {
            Label = "Super",
            Index = 1,
            Cars = {
                {Name = "Adder", Value = "adder"},
                {Name = "Autrach", Value = "autarch"},
                {Name = "Banshee", Value = "banshee2"},
                {Name = "Bullet", Value = "bullet"},
                {Name = "Cheetah", Value = "cheetah"},
                {Name = "Cyclone", Value = "cyclone"},
                {Name = "Entity", Value = "entity2"},
                {Name = "EntityXF", Value = "entityxf"},
                {Name = "Emerus", Value = "emerus"},
                {Name = "Fmj", Value = "fmj"},
                {Name = "Furia", Value = "furia"},
                {Name = "Gp1", Value = "gp1"},
                {Name = "Infernus", Value = "infernus"},
                {Name = "ItaliGTB", Value = "italigtb"},
                {Name = "Krieger", Value = "krieger"},
                {Name = "Le7b", Value = "le7b"},
                {Name = "Nero", Value = "nero"},
                {Name = "Osiris", Value = "osiris"},
                {Name = "Penetrator", Value = "penetrator"},
                {Name = "Pfister811", Value = "pfister811"},
                {Name = "Reaper", Value = "reaper"},
                {Name = "Sc1", Value = "sc1"},
                {Name = "Sheava", Value = "sheava"},
                {Name = "SultanRS", Value = "sultanrs"},
                {Name = "T20", Value = "t20"},
                {Name = "Taipan", Value = "taipan"},
                {Name = "Tempesta", Value = "tempesta"},
                {Name = "Tezeract", Value = "tezeract"},
                {Name = "Thrax", Value = "thrax"},
                {Name = "Tigon", Value = "tigon"},
                {Name = "TurismoR", Value = "turismor"},
                {Name = "Tyrant", Value = "tyrant"},
                {Name = "Tyrus", Value = "tyrus"},
                {Name = "Vacca", Value = "vacca"},
                {Name = "Vagner", Value = "vagner"},
                {Name = "Visione", Value = "visione"},
                {Name = "Voltic", Value = "voltic"},
                {Name = "Xa21", Value = "xa21"},
                {Name = "Zentorno", Value = "zentorno"},
                {Name = "Zorusso", Value = "zorrusso"},
            },
        },
    },
}