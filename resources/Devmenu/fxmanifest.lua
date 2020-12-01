fx_version 'adamant'
games { 'gta5' };

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/jquery.js',
	'html/init.js',
}

client_scripts {
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
    -- Client --
        'Client/*.lua',
}
