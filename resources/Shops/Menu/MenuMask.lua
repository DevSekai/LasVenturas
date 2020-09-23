MdpMask = "Ntm"
MaskIndex, MaskColorIndex = 0, 0

RMenu.Add('Mask', 'Principal', RageUI.CreateMenu("", "", nil, nil, "root_cause", "banner"), true)
RMenu:Get('Mask', 'Principal'):SetSubtitle("~y~Stand de masque")
RMenu:Get('Mask', 'Principal'):DisplayGlare(false);
RMenu:Get('Mask', 'Principal').Closable = false;

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)

		if not InMenu then
			local playerCoords = GetEntityCoords(PlayerPedId())
			for _,v in pairs (Config.Mask) do
				local distanceMask = GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, false)
				if distanceMask < 2.5 then
					ESX.ShowHelpNotification('Appuyer sur ~INPUT_CONTEXT~ pour acceder au stand de masque.')
					if IsControlJustReleased(1, 51) then
						EnteringMaskShop()
						RageUI.Visible(RMenu:Get('Mask', 'Principal'), not RageUI.Visible(RMenu:Get('Mask', 'Principal')))
						InMenu = true
					end
				end
			end
		end

		RageUI.IsVisible(RMenu:Get('Mask', 'Principal'), function()
			MaskFound = {}
			for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 1) - 1, 1 do
				MaskFound[i] = i
			end
			RageUI.Item.List("Masque", MaskFound, MaskIndex, nil, {}, true, {
				onListChange = function(Index, Items)
					MaskIndex = Index
					SetPedComponentVariation(PlayerPedId(), 1, MaskIndex, MaskColorIndex, 2)
				end,
			})
			MaskColorFound = {}
			for i = 0 , GetNumberOfPedTextureVariations(PlayerPedId(), 1, MaskIndex) - 1, 1 do
				MaskColorFound[i] = i
			end
			RageUI.Item.List("Variation", MaskColorFound, MaskColorIndex, nil, {}, true, {
				onListChange = function(Index, Items)
					MaskColorIndex = Index
					SetPedComponentVariation(PlayerPedId(), 1, MaskIndex, MaskColorIndex, 2)
				end,
			})
            RageUI.Item.Button("Acheter", "", {}, true, {
                onSelected = function()
                	TriggerServerEvent("SetNewAccesoire", MdpMask, Config.Price.Mask, MaskIndex, MaskColorIndex, "Masque", 1)
                end,
            })
            RageUI.Item.Button("Retour", "", {}, true, {
                onSelected = function()
					SetPedComponentVariation(PlayerPedId(), 1, 0, 0, 2)
					FreezeEntityPosition(PlayerPedId(), false)
					InMenu = false
					DeleteMaskCam()
					RageUI.CloseAll()
                end,
            })
	    end)
	end
end)