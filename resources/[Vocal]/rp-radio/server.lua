ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('policeradio', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    
	TriggerClientEvent('AddPoliceRadio', source)
end)