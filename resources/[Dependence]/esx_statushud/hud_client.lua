ESX = nil
local food, water = 0, 0

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
            FoodId = _
        elseif v.name == "thirst" then
            WaterId = _
        elseif v.name == "drunk" then
            DrunkId = _
        end
    end
    food, water, drunk = (status[FoodId].percent / 100), (status[WaterId].percent / 100), (status[DrunkId].percent / 100)
    if (status[FoodId].percent / 100) < 0.3 then
        ESX.ShowNotification("Vous avez faim.")
    elseif (status[WaterId].percent / 100) < 0.3 then
        ESX.ShowNotification("Vous avez soif.")
    end
end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(2000)
        SendNUIMessage({
            pauseMenu = IsPauseMenuActive(),
            food = food,
            water = water,
            drunk = drunk
        })
    end
end)