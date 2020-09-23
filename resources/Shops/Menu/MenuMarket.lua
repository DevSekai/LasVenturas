MdpMarket, FinalPrice = "Ntm", 0

RMenu.Add('Market', 'Principal', RageUI.CreateMenu("", "", nil, nil, "root_cause", "banner"), true)
RMenu:Get('Market', 'Principal'):SetSubtitle("~y~Supèrette")
RMenu:Get('Market', 'Principal'):DisplayGlare(false);
RMenu:Get('Market', 'Principal').Closable = false;

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)

		if not InMenu then
			local playerCoords = GetEntityCoords(PlayerPedId())
			for _,v in pairs (Config.Market) do
				local distanceMarket = GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, false)
				if distanceMarket < 2.5 then
					ESX.ShowHelpNotification('Appuyer sur ~INPUT_CONTEXT~ pour acceder au stand de masque.')
					if IsControlJustReleased(1, 51) then
						RageUI.Visible(RMenu:Get('Market', 'Principal'), not RageUI.Visible(RMenu:Get('Market', 'Principal')))
						FreezeEntityPosition(PlayerPedId(), true)
						InMenu = true
					end
				end
			end
		end

		RageUI.IsVisible(RMenu:Get('Market', 'Principal'), function()
		RageUI.Item.Separator("[~y~Prix~s~] : ~g~"..FinalPrice.." $")
            for _,v in pairs (Config.Market.Items) do
                 MxQte = {}
                for i = 0 , v.MaxNbr, 1 do
                    MxQte[i] = i
                end
                RageUI.Item.List(v.Label, MxQte, 1, nil, {}, true, {
                    onListChange = function(Index, Items)
                        FinalPrice = v.Price * Index
                    end,
                    onSelected = function (Index, Items)
                        TriggerServerEvent('BuyItem', MdpMarket, v.Value, Index, v.Label, v.Price)
                    end
                })
            end
            RageUI.Item.Button("Retour", "", {}, true, {
                onSelected = function()
					InMenu = false
					FreezeEntityPosition(PlayerPedId(), false)
					RageUI.CloseAll()
                end,
            })
	    end)
	end
end)