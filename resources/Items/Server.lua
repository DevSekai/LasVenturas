ESX = nil
MessageEat = "Vous avez manger "
MessageDrink = "Vous avez bu "

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('bread', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('bread', 1)
	TriggerClientEvent('AddHunger', source, 10)

	xPlayer.showNotification(MessageEat.."du pain.")
end)

ESX.RegisterUsableItem('water', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('water', 1)
	TriggerClientEvent('AddThrist', source, 10)

	xPlayer.showNotification(MessageDrink.."de l'eau.")
end)