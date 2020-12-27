ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand("getcoords", function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	local PlyPed = GetPlayerPed(source)
	local PlyCoords = GetEntityCoords(PlyPed)
    if xPlayer.group ~= "users" then
        print(PlyCoords)
    end
end, false)