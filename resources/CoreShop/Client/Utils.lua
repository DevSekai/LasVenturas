ESX = nil
TokenGen = {}
InMenu = false
FinalPrice = 0
Timing = 2000
InZone = {}
LtdPed = {}
CrtStore = nil

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
	end
	TriggerServerEvent("GetShopToken")
end)

RegisterNetEvent("SendShopToken")
AddEventHandler("SendShopToken", function(Token)
	TokenGen.Key = Token
end)

Citizen.CreateThread(function ()
	me = PlayerPedId()
	while true do
		Citizen.Wait(Timing)

		if not InMenu then
			for _,v in pairs (Shops.Coords) do
				local distanceShops = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.x, v.y, v.z, true)
				if distanceShops < Shops.MarkerDist then
					Timing = 0
					InZone[v.Name] = true
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
					end
				else
					if InZone[v.Name] then
						Timing = 2000
						InZone[v.Name] = false
					end
				end
			end
		end
	end
end)

loadDict = function(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(10)
    end
end

function DrawText3D(coords, text)
    local onScreen, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z)
    local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
  
    SetTextScale(0.4, 0.4)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(1)
    SetTextColour(255, 255, 255, 255)
    SetTextOutline()
  
    AddTextComponentString(text)
    DrawText(_x, _y)
end