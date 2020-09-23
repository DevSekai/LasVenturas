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
    'Menu/MenuMarket.lua',
    'Menu/MenuWeapon.lua',
    'Menu/MenuClothe.lua',
    'Menu/MenuTatoo.lua',
    'Menu/MenuMask.lua',
    'Config.lua',
	'Shops_Cl.lua',
}
server_scripts {
    '@mysql-async/lib/MySQL.lua',
	'Shops_Sv.lua',
}
