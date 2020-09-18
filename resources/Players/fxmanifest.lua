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
    'Menu/MenuIdentity.lua',
    'Menu/MenuSkin.lua',
    'Menu/MenuPersonal.lua',
	'Client.lua',
}
server_scripts {
    '@mysql-async/lib/MySQL.lua',
	'Server.lua',
}
