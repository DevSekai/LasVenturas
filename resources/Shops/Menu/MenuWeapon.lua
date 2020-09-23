MdrWeapShop = "Ntm"

RMenu.Add('Weapon', 'Principal', RageUI.CreateMenu("", "", nil, nil, "root_cause", "banner"), true)
RMenu:Get('Weapon', 'Principal'):SetSubtitle("~y~Armurerie")
RMenu:Get('Weapon', 'Principal'):DisplayGlare(false);
RMenu:Get('Weapon', 'Principal').Closable = false;

RMenu.Add('Weapon', 'Melee', RageUI.CreateSubMenu(RMenu:Get('Weapon', 'Principal'), "", ""))
RMenu:Get('Weapon', 'Melee'):SetSubtitle("~y~Armes Blanches")
RMenu:Get('Weapon', 'Melee'):DisplayGlare(false);

RMenu.Add('Weapon', 'Guns', RageUI.CreateSubMenu(RMenu:Get('Weapon', 'Principal'), "", ""))
RMenu:Get('Weapon', 'Guns'):SetSubtitle("~y~Armes à Feu")
RMenu:Get('Weapon', 'Guns'):DisplayGlare(false);

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerCoords = GetEntityCoords(PlayerPedId())

		if not InMenu then
			for _, v in pairs(Config.Weapon) do
	            local distanceWeapon = GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, true)
	             
	            if distanceWeapon <= 1.5 then
	                ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder à l'armurerie.")

	                if IsControlJustReleased(1, 51) then
	                    RageUI.Visible(RMenu:Get('Weapon', 'Principal'), not RageUI.Visible(RMenu:Get('Weapon', 'Principal')))
	                    FreezeEntityPosition(PlayerPedId(), true)
						InMenu = true
	                end
	            end
	        end
	    end
        
        RageUI.IsVisible(RMenu:Get('Weapon', 'Principal'), function()
            RageUI.Item.Button("Armes Blanches", "", {}, true, {
            },RMenu:Get('Weapon', 'Melee'))
            RageUI.Item.Button("Armes à Feu", "", {}, true, {
            },RMenu:Get('Weapon', 'Guns'))
            RageUI.Item.Button("Acheter un chargeur ~g~"..Config.Price.Chargeur.." $", "", {}, true, {
            	onSelected = function ()
            		TriggerServerEvent('BuyItem', MdrWeapShop, "chargeur", 1, "Chargeur", Config.Price.Chargeur)
            	end,
            })
            RageUI.Item.Button("Retour", "", {}, true, {
                onSelected = function ()
                    FreezeEntityPosition(PlayerPedId(), false)
					InMenu = false
                    RageUI.CloseAll()
                end,
            })
        end)

        RageUI.IsVisible(RMenu:Get('Weapon', 'Melee'), function()
            for _,v in pairs (Config.Weapon.Items.Blanches) do
                RageUI.Item.Button(v.Label, "", {RightLabel = "~g~" .. v.Price.. " $"}, true, {
                    onSelected = function ()
                        TriggerServerEvent('BuyWeapon', MdrWeapShop, v.Value, v.Label, v.Price)
                    end,
                })
            end
        end)

        RageUI.IsVisible(RMenu:Get('Weapon', 'Guns'), function()
            for _,v in pairs (Config.Weapon.Items.Feu) do
                RageUI.Item.Button(v.Label, "", {RightLabel = "~g~" .. v.Price.. " $"}, true, {
                    onSelected = function ()
                        TriggerServerEvent('BuyWeapon', MdrWeapShop, v.Value, v.Label, v.Price)
                    end,
                })
            end
        end)

	end
end)