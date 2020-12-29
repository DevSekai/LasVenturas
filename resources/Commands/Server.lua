ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand("getcoords", function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	local PlyPed = GetPlayerPed(source)
    local PlyCoords = GetEntityCoords(PlyPed)
    local PlyHeading = GetEntityHeading(PlyPed)
    if xPlayer.group ~= "users" then
        print("{x = "..PlyCoords.x..", y = "..PlyCoords.y..", z = "..PlyCoords.z..", h = "..PlyHeading.."},")
    end
end, false)