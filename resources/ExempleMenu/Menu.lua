-- Création du menu --
RMenu.Add(Exemple.MenuType, Exemple.MenuPage, RageUI.CreateMenu(Exemple.MenuTitle, Exemple.MenuSubTitle, Exemple.MenuPosX, Exemple.MenuPosY, Exemple.MenuBannerDict, Exemple.MenuBanner), true)

-- Création du submenu --
RMenu.Add(Exemple.MenuType, Exemple.SubmenuPage, RageUI.CreateSubMenu(RMenu:Get(Exemple.MenuType, Exemple.SubmenuParentsPage), Exemple.SubmenuTitle, Exemple.SubmenuSubtitle))

-- Création du submenu --
RMenu.Add(Exemple.MenuType, Exemple.SubmenuPage2, RageUI.CreateSubMenu(RMenu:Get(Exemple.MenuType, Exemple.SubmenuParentsPage2), Exemple.SubmenuTitle2, Exemple.SubmenuSubtitle2))


Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(0)

        if IsControlJustReleased(1, 51) then
            RageUI.Visible(RMenu:Get(Exemple.MenuType, Exemple.MenuPage), not RageUI.Visible(RMenu:Get(Exemple.MenuType, Exemple.MenuPage)))
        end

        RageUI.IsVisible(RMenu:Get(Exemple.MenuType, Exemple.MenuPage), function()
            RageUI.Item.Button("Button onSelected", "", {}, true, {
                onSelected = function()
                    sendNotif("Vous avez appuyer sur le boutton.")
                end
            })
            RageUI.Item.Button("Button onActive", "", {}, true, {
                onActive = function()
                    sendNotif("Le boutton est activer.")
                end
            })
            RageUI.Item.Button("Button Submenu", "Les checkbox", {}, true, {
            },RMenu:Get(Exemple.MenuType, Exemple.SubmenuPage))
        end)

        RageUI.IsVisible(RMenu:Get(Exemple.MenuType, Exemple.SubmenuPage), function()
            RageUI.Item.Checkbox("Checkbox onChecked", "", false, {}, {
                onChecked = function()
                    sendNotif("La checkbox est passer sur true.")
                end,
            })
            RageUI.Item.Checkbox("Checkbox onUnChecked", "", true, {}, {
                onUnChecked = function()
                    sendNotif("La checkbox est passer sur false.")
                end,
            })
            RageUI.Item.Button("Button Submenu2", "Les list", {}, true, {
            },RMenu:Get(Exemple.MenuType, Exemple.SubmenuPage2))
        end)

        RageUI.IsVisible(RMenu:Get(Exemple.MenuType, Exemple.SubmenuPage2), function()
            RageUI.Item.List("List onListchange", Exemple.ListExemple.Table, Exemple.ListExemple.Index, nil, {}, true, {
                onListChange = function(Index, Items)
                    Exemple.ListExemple.Index = Index
					sendNotif(Items.Name)
				end
			})
            RageUI.Item.List("List onSelected", Exemple.ListExemple.Table, Exemple.ListExemple.Index, nil, {}, true, {
				onSelected = function (Index, Items)
                    Exemple.ListExemple.Index = Index
					sendNotif(Items.Name)
				end
			})
            RageUI.Item.Button("Fermer le menu", "Les list", {}, true, {
                onSelected = function()
                    RageUI.CloseAll()
                end
            })
        end)
    end
end)

function sendNotif(Txt)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(Txt)
	DrawNotification(0,1)
end