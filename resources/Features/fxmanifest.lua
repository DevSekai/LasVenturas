fx_version 'adamant'
games { 'gta5' };

ui_page('Html/index.html')

files {
    'Html/index.html',
    'Html/Giffle.ogg',
}

client_scripts {
    -- Casino --
        'Casino.lua',
    -- Client --
        'Client/*.lua',
    -- RageUI --
        "@RageUI/RMenu.lua",
        "@RageUI/menu/RageUI.lua",
        "@RageUI/menu/Menu.lua",
        "@RageUI/menu/MenuController.lua",

        "@RageUI/menu/items/UIButton.lua",
        "@RageUI/menu/items/UICheckBox.lua",
        "@RageUI/menu/items/UIList.lua",
        "@RageUI/menu/items/UIProgress.lua",
        "@RageUI/menu/items/UISeparator.lua",
        "@RageUI/menu/items/UISlider.lua",
        "@RageUI/menu/items/UISliderHeritage.lua",
        "@RageUI/menu/items/UISliderProgress.lua",

        "@RageUI/components/Audio.lua",
        "@RageUI/components/Enum.lua",
        "@RageUI/components/Keys.lua",
        "@RageUI/components/Rectangle.lua",
        "@RageUI/components/Sprite.lua",
        "@RageUI/components/Text.lua",
        "@RageUI/components/Visual.lua",

        "@RageUI/menu/elements/ItemsBadge.lua",
        "@RageUI/menu/elements/ItemsColour.lua",
        "@RageUI/menu/elements/PanelColour.lua",

        "@RageUI/menu/panels/UIButtonPanel.lua",
        "@RageUI/menu/panels/UIColourPanel.lua",
        "@RageUI/menu/panels/UIGridPanel.lua",
        "@RageUI/menu/panels/UIGridPanelHorizontal.lua",
        "@RageUI/menu/panels/UIGridPanelVertical.lua",
        "@RageUI/menu/panels/UIPercentagePanel.lua",
        "@RageUI/menu/panels/UIStatisticsPanel.lua",

        "@RageUI/menu/windows/UIHeritage.lua",
    -- Menu --
        'Menu/*.lua',
}

server_scripts {
    -- MySql --
        '@mysql-async/lib/MySQL.lua',
    -- Server --
        'Server/*.lua',
}
