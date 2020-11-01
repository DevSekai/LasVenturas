fx_version 'adamant'
games { 'gta5' };

client_scripts {
    "RageUI/RMenu.lua",
    "RageUI/menu/RageUI.lua",
    "RageUI/menu/Menu.lua",
    "RageUI/menu/MenuController.lua",

    "RageUI/components/*.lua",

    "RageUI/menu/elements/*.lua",

    "RageUI/menu/items/*.lua",

    "RageUI/menu/panels/*.lua",

    "RageUI/menu/panels/*.lua",
    "RageUI/menu/windows/*.lua",

}

client_scripts {
    'Menu/MenuTest.lua',
    'Menu/MenuIdentity.lua',
    'Menu/MenuSkin.lua',
    'Menu/MenuPersonal.lua',
    'Menu/MenuBanque.lua',
    'Config.lua',
	'Players_Cl.lua',
}
server_scripts {
    '@mysql-async/lib/MySQL.lua',
	'Players_Sv.lua',
}
