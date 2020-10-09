ESX = nil
PlayerGroup = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand("Heal", function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.group ~= 'user' then
    	PlayerId = tonumber(args[1])
		TriggerClientEvent('RevivePlayer', PlayerId)
	end
end, false)