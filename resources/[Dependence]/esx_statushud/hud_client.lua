ESX = nil
local food, water, cash = 0

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent("esx_statushud:onTick")
AddEventHandler("esx_statushud:onTick", function(status)
    print(json.encode(status))
    --food, water = status[1].percent, status[2].percent
end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(0)
        SendNUIMessage({
            pauseMenu = IsPauseMenuActive(),
            food = food,
            water = water
        })
    end
end)