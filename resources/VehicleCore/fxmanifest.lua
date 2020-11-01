fx_version 'adamant'
games { 'gta5' };

client_scripts {
    -- Config --
        'Shops.lua',
    -- Client --
        'Client/*.lua',
    -- RageUI --
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
    -- Menu --
        'Menu/*.lua',
}

server_scripts {
    -- MySql --
        '@mysql-async/lib/MySQL.lua',
    -- Config --
        'Shops.lua',
    -- Server --
        'Server/*.lua',
}
