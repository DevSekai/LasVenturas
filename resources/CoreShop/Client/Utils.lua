ESX = nil
InMenu = false
FinalPrice = 0
Timing = 2000

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(Timing)

		if not InMenu then
			for _,v in pairs (Shops.Coords) do
				local distanceShops = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.x, v.y, v.z, true)
				if distanceShops < Shops.MarkerDist then
					Timing = 0
					DrawMarker(Shops.MarkerType, v.x, v.y, v.z + 0.98, 0, 0, 0, 0, 0, 0, Shops.MarkerScale, Shops.MarkerScale, Shops.MarkerScale, Shops.MarkerR, Shops.MarkerG, Shops.MarkerB, Shops.MarkerA, false, true, 2, true, nil, false)
					if distanceShops < Shops.PedDist then
						ESX.ShowHelpNotification('Appuyer sur ~INPUT_CONTEXT~ pour acceder a la boutique.')
						if IsControlJustReleased(1, 51) then
							if v.Type == "Barber" then
								Shops.Barber.Out = {}
								Shops.Barber.Index = 0
								Shops.Barber.Index2 = 0
								Shops.Barber.Color = 0
								Shop = {Type = v.Type, X = v.ax, Y = v.ay, Z = v.az, Heading = v.ah}
								Shops.Barber.Out = {X = v.ox, Y = v.oy, Z = v.z, H = v.oh}
								EnterShop(json.encode(Shop))
							elseif v.Type == "Tatoo" then
								Shops.Tatoo.Out = {}
								Shop = {Type = v.Type, X = v.ax, Y = v.ay, Z = v.az - 0.98, Heading = v.ah}
								Shops.Tatoo.Out = {X = v.ox, Y = v.oy, Z = v.z, H = v.oh}
								EnterShop(json.encode(Shop))
							elseif v.Type == "Mask" then
								Shops.Mask.Index = 0
								Shops.Mask.Color = 0
								Shop = {Type = v.Type}
								EnterShop(json.encode(Shop))
							end
							ShowMenu(v.Type)
						end
					else
						if not InMenu then
							Timing = 2000
						end
					end
				end
			end
		end
	end
end)