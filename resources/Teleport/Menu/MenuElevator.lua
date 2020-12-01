RMenu.Add('Batiments', 'Principal', RageUI.CreateMenu("", "", nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Batiments', 'Principal'):DisplayGlare(false);
RMenu:Get('Batiments', 'Principal').Closable = false;

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)

		if not InMenu then
			local playerCoords = GetEntityCoords(PlayerPedId())
			for _,v in pairs (Config.Batiments) do
				local distanceEnterBatiments = GetDistanceBetweenCoords(playerCoords, v.Enter, true)
				local distanceExitBatiments = GetDistanceBetweenCoords(playerCoords, v.Exit, true)
				if distanceEnterBatiments < 1.5 then
					ESX.ShowHelpNotification("Appuyer sur ~INPUT_CONTEXT~ pour entrer dans le batiment.")
					if IsControlJustReleased(1, 51) then
						FreezeEntityPosition(PlayerPedId(), true)
						RageUI.Visible(RMenu:Get('Batiments', 'Principal'), not RageUI.Visible(RMenu:Get('Batiments', 'Principal')))
						RMenu:Get('Batiments', 'Principal'):SetSubtitle("~y~"..v.Label)
						Exit = v.Exit
					end
				elseif distanceExitBatiments < 1.5 then
					ESX.ShowHelpNotification("Appuyer sur ~INPUT_CONTEXT~ pour sortir dans le batiment.")
					if IsControlJustReleased(1, 51) then
						FreezeEntityPosition(PlayerPedId(), true)
						RageUI.Visible(RMenu:Get('Batiments', 'Principal'), not RageUI.Visible(RMenu:Get('Batiments', 'Principal')))
						RMenu:Get('Batiments', 'Principal'):SetSubtitle("~y~"..v.Label)
						Enter = v.Enter
					end
				end
			end
		end

        RageUI.IsVisible(RMenu:Get('Batiments', 'Principal'), function()
        	if Enter then
	            RageUI.Item.Button("Sortir du batiment", "", {}, true, {
	                onSelected = function()
	                	TeleportPlayer(Enter)
	                	FreezeEntityPosition(PlayerPedId(), false)
	                    RageUI.CloseAll()
                		Enter, Exit = nil, nil
	                    InMenu = false
	                end,
	            })
	        else
	            RageUI.Item.Button("Entrer dans le batiment", "", {}, true, {
	                onSelected = function()
	                	TeleportPlayer(Exit)
	                	FreezeEntityPosition(PlayerPedId(), false)
	                    RageUI.CloseAll()
                		Enter, Exit = nil, nil
	                    InMenu = false
	                end,
	            })
	        end
            RageUI.Item.Button("Retour", "", {}, true, {
                onSelected = function()
                	Enter, Exit = nil, nil
                	FreezeEntityPosition(PlayerPedId(), false)
                    RageUI.CloseAll()
                    InMenu = false
                end,
            })
        end)
	end
end)