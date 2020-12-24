Exemple = {
    ------------------------------------------
    -- Les commentaires finissant par :
    -- * = Paramétre communn au submenu et au menu parents.
    -- ** = Paramètres non lié entre les différents menu. 
    ------------------------------------------


    -- Menu --
    MenuType = "Exemple", -- * -- Type de votre menu "Sa catégorie".
    MenuPosX = nil, -- * -- Remplacer par des nombres pour déplacer le menu .
    MenuPosY = nil, -- * -- Remplacer par des nombres pour déplacer le menu .
    MenuBannerDict = "root_cause", -- * --Le nom du fichier finissant par ".ytd" contenant votre bannière.
    MenuBanner = "Banner", -- * -- Le nom de la bannière dans le fichier ci dessus.

    MenuPage = "Button", -- ** -- Le nom de votre menu .
    MenuTitle = "Titre menu", -- ** -- Le titre de la page .
    MenuSubTitle = "Sous titre menu", -- ** -- Le sous titre de la page .

    -- Submenu --
    SubmenuParentsPage = "Button", -- ** -- Page atteinte lors d'un retour, ou d'un RageUI.GoBack()
    SubmenuPage = "Checkbox", -- ** -- Le nom de votre page.
    SubmenuTitle = "Titre submenu", -- ** -- Le titre de la page .
    SubmenuSubTitle = "Sous titre submenu", -- ** -- Le sous titre de la page .

    -- Submenu2 --
    SubmenuParentsPage2 = "Checkbox", -- ** -- Page atteinte lors d'un retour, ou d'un RageUI.GoBack()
    SubmenuPage2 = "List", -- ** -- Le nom de votre page.
    SubmenuTitle2 = "Titre submenu2", -- ** -- Le titre de la page .
    SubmenuSubTitle2 = "Sous titre submenu2", -- ** -- Le sous titre de la page .

    ListExemple = {
        Index = 1, -- Pour l'exemple j'ai un index global, mais pour d'autre utiliter vaux mieux avoir 1 Index par list.
        Table = {
            -- Name seras toujours le nom afficher dans le menu.
            -- On peux ajouter autant de local que l'on souhaite temps que l'on garde la local Name.
            {Name = "Carotte", Value = "Test 1"},
            {Name = "Banane", Value = "Test 2"},
            {Name = "Haricots", Value = "Test 3"},
            {Name = "Beurre", Value = "Test 4"},
            {Name = "Courgette", Value = "Test 5"},
            {Name = "Lettue", Value = "Test 6"},
            {Name = "Tomate", Value = "Test 7"},
            {Name = "Patate", Value = "Test 8"},
        },
    },
}