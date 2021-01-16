ESX = nil
local food, water, drunk = nil, nil, nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent("esx_statushud:onTick")
AddEventHandler("esx_statushud:onTick", function(status)
    local FoodId, WaterId, DrunkId = nil, nil, nil
    for _,v in pairs (status) do
        if v.name == "hunger" then
            food = (status[_].percent / 100)
        elseif v.name == "thirst" then
            water = (status[_].percent / 100)
        elseif v.name == "drunk" then
            drunk = (status[_].percent / 100)
        end
    end
    if food < 0.3 then
        ESX.ShowNotification("Vous avez faim.")
    elseif water < 0.3 then
        ESX.ShowNotification("Vous avez soif.")
    end
end)

Citizen.CreateThread(function()
    while true do 
        if food then
            SendNUIMessage({
                pauseMenu = IsPauseMenuActive(),
                food = food
            })
        end
        if water then
            SendNUIMessage({
                pauseMenu = IsPauseMenuActive(),
                water = water
            })
        end
        if drunk then
            SendNUIMessage({
                pauseMenu = IsPauseMenuActive(),
                drunk = drunk
            })
        end
        Citizen.Wait(2000)
    end
end)