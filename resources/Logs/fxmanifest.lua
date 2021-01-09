fx_version 'adamant'
games { 'gta5' };

client_scripts {
    -- Ressource --
        'Client/*.lua',
}

server_scripts {
    -- MySql --
        '@mysql-async/lib/MySQL.lua',
    -- Ressource --
        'Config.lua',
        'Server/*.lua',
}