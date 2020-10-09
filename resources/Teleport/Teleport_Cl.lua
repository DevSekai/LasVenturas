ESX = nil
InMenu = false

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

function TeleportPlayer(Position)
    SetEntityCoords(PlayerPedId(), Position)
end