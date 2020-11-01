ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('bread', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    xPlayer.removeInventoryItem('bread', 1)
	TriggerClientEvent('AddHunger', source, 20)

	xPlayer.showNotification(Shops.MessageEat.."du pain.")
end)

ESX.RegisterUsableItem('water', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    xPlayer.removeInventoryItem('water', 1)
	TriggerClientEvent('AddThrist', source, 20)

	xPlayer.showNotification(Shops.MessageDrink.."de l'eau.")
end)

ESX.RegisterUsableItem('sandwich', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    xPlayer.removeInventoryItem('sandwich', 1)
	TriggerClientEvent('AddHunger', source, 40)

	xPlayer.showNotification(Shops.MessageEat.."un sandwich.")
end)

ESX.RegisterUsableItem('coca', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    xPlayer.removeInventoryItem('coca', 1)
	TriggerClientEvent('AddThrist', source, 40)

	xPlayer.showNotification(Shops.MessageDrink.."un coca.")
end)

ESX.RegisterUsableItem('chargeur', function(source)
	TriggerClientEvent('UseChargeur', source)
end)

RegisterServerEvent('RemoveChargeur')
AddEventHandler('RemoveChargeur', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('chargeur', 1)
end)

ESX.RegisterUsableItem('silencieux', function(source)
    TriggerClientEvent('UseSilencieux', source)
end)

ESX.RegisterUsableItem('GPB', function(source)
   TriggerClientEvent('UseGPB', source)
end)

ESX.RegisterUsableItem('serflex', function(source)
	TriggerClientEvent('UseSerflex', source)
end)

ESX.RegisterUsableItem('corde', function(source)
	TriggerClientEvent('UseCorde', source)
end)