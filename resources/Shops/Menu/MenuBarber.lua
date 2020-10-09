MdpBarber = "Ntm"
CheuveuxIndex, BarbeIndex, CouleurIndex = 1, 1, 0
BarberHash = GetHashKey("s_f_m_fembarber")

RMenu.Add('Barber', 'Principal', RageUI.CreateMenu("", "", nil, nil, "root_cause", "banner"), true)
RMenu:Get('Barber', 'Principal'):SetSubtitle("~y~Salon De Coiffure")
RMenu:Get('Barber', 'Principal'):DisplayGlare(false);
RMenu:Get('Barber', 'Principal').Closable = false;

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)

		if not InMenu then
			local playerCoords = GetEntityCoords(PlayerPedId())
			for _,v in pairs (Config.Barber) do
				local distanceBarber = GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, false)
				if distanceBarber < 1.5 then
					ESX.ShowHelpNotification("Appuyer sur ~INPUT_CONTEXT~ pour s'assoir a une chaise.")
					if IsControlJustReleased(1, 51) then
						Out = vector3(v.AnimX, v.AnimY, v.AnimZ)
					    OpenBarberShop(v)
					end
				end
			end
		end

        RageUI.IsVisible(RMenu:Get('Barber', 'Principal'), function()
	        Coiffure2Found = {}
	        for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 2)-1, 1 do
	            Coiffure2Found[i] = i
	        end
		    RageUI.Item.List("Cheveux", Coiffure2Found, 1, nil, {}, true, {
		        onListChange = function(Index, Items)
			        CheuveuxIndex = Index
			        SetPedComponentVariation(PlayerPedId(), 2, CheuveuxIndex, 1, 2)
		        end,
		    })
	        Barbes2Found = {}
	        for i = 0 , GetNumHeadOverlayValues(1)-1, 1 do
	            Barbes2Found[i] = i
	        end
		    RageUI.Item.List("Barbes", Barbes2Found, 1, nil, {}, true, {
		        onListChange = function(Index, Items)
			        BarbeIndex = Index
			        SetPedHeadOverlay(PlayerPedId(), 1, BarbeIndex, 1 + 0.0)
			        SetPedHeadOverlayColor(PlayerPedId(), 1, 1, 1, 1)
		        end,
		    })
            Couleur2Found = {}
            for i = 0 , GetNumHairColors()-1 do
                Couleur2Found[i] = i
            end
		    RageUI.Item.List("Couleur cheveux/barbes", Couleur2Found, 1, nil, {}, true, {
		        onListChange = function(Index, Items)
		            CouleurIndex = Index
		            SetPedHairColor(PlayerPedId(), CouleurIndex, CouleurIndex)
		            SetPedHeadOverlayColor(PlayerPedId(), 1, 1, CouleurIndex, CouleurIndex)
		        end,
		    })
            RageUI.Item.Button("Partir", "", {}, true, {
                onSelected = function()
                    RageUI.CloseAll()
                    FreezeEntityPosition(PlayerPedId(), false)
                    x, y, z = table.unpack(Out)
                    SetEntityCoords(PlayerPedId(), x, y, z - 0.98)
                    ClearPedTasks(PlayerPedId())
                    Citizen.Wait(500)
                    DeletePed(BarberPed)
                    ESX.TriggerServerCallback('GetPlySkin', function(Skin)
						TriggerEvent('ApplySkin', GetPlayerPed(-1), Skin)
                    end)
                    InMenu = false
                end,
            })
            RageUI.Item.Button("Acheter", "", {}, true, {
                onSelected = function()
                    RequestAnimDict("misshair_shop@barbers")
                    while not HasAnimDictLoaded("misshair_shop@barbers") do
                        Citizen.Wait(0)
                    end
                    TaskPlayAnim(BarberPed, "misshair_shop@barbers", "keeper_idle_b", 8.0, 8.0, 15000, 0, 0, -1, -1, -1)
                    TriggerServerEvent('BuyBarber', MdpBarber, Config.Price.Barber)
                end,
            })
        end)
	end
end)