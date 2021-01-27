ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('xPlayer:getUserAccounts', function(source, cb)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
    cb(xPlayer.accounts)
end)

ESX.RegisterServerCallback('xPlayer:getUserLoadout', function(source, cb)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	cb(xPlayer.loadout)
end)

ESX.RegisterServerCallback('xPlayer:getUserInventory', function(source, cb)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	cb(xPlayer.inventory)
end)

RegisterNetEvent('xPlayer:GiveItem')
AddEventHandler('xPlayer:GiveItem', function(Target, ItemName, ItemCount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Target)
	local ItemGiven = xPlayer.getInventoryItem(ItemName)
	local ItemQte = xPlayer.getInventoryItem(ItemName).count
	if ItemQte > 0 then
		if xTarget.canCarryItem(ItemName, ItemCount) then
			xPlayer.removeInventoryItem(ItemName, ItemCount)
			xPlayer.showNotification("Vous avez donner x"..ItemCount.." "..ItemGiven.label.." à "..xTarget.name)
			xTarget.addInventoryItem(ItemName, ItemCount)
			xTarget.showNotification("Vous avez recu x"..ItemCount.." "..ItemGiven.label.." de "..xPlayer.name)
		else
			xPlayer.showNotification(xTarget.name.." n'a pas assez de place dans l'inventaire.")
			xTarget.showNotification("Vous n'avez pas assez de place dans l'inventaire pour recevoir l'objet de "..xPlayer.name)
		end
	end
end)

RegisterNetEvent('xPlayer:UseItem')
AddEventHandler('xPlayer:UseItem', function(ItemName)
	local xPlayer = ESX.GetPlayerFromId(source)
	local ItemQte = xPlayer.getInventoryItem(ItemName).count
	if ItemQte > 0 then
		ESX.UseItem(source, ItemName)
	end
end)

RegisterNetEvent('xPlayer:RemoveItem')
AddEventHandler('xPlayer:RemoveItem', function(ItemName, ItemCount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local ItemQte = xPlayer.getInventoryItem(ItemName).count
	if ItemQte > 0 then
		xPlayer.removeInventoryItem(ItemName, ItemCount)
	end
end)

RegisterNetEvent('xPlayer:GiveWeapon')
AddEventHandler('xPlayer:GiveWeapon', function(Target, WeaponLabel, WeaponName, Ammo)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Target)
	xPlayer.removeWeapon(WeaponName, Ammo)
    xTarget.addWeapon(WeaponName, Ammo)
	xPlayer.showNotification("Vous avez donner "..WeaponLabel.." à "..xTarget.name)
	xTarget.showNotification("Vous avez recu "..WeaponLabel.." de "..xPlayer.name)
end)

RegisterNetEvent('xPlayer:RemoveWeapon')
AddEventHandler('xPlayer:RemoveWeapon', function(WeaponName, Ammo)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Target)
	xPlayer.removeWeapon(WeaponName, Ammo)
end)

RegisterNetEvent('xPlayer:GiveMoney')
AddEventHandler('xPlayer:GiveMoney', function(Target, MoneyType, Amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Target)
    local xPlayerMoney = xPlayer.getMoney()
	if xPlayerMoney >= Amount then
		xPlayer.removeAccountMoney(MoneyType, Amount)
        xTarget.addAccountMoney(MoneyType, Amount)
		xPlayer.showNotification("Vous avez donner "..Amount.." $ à "..xTarget.name)
		xTarget.showNotification("Vous avez recu "..Amount.." $ de "..xPlayer.name)
	else
		xPlayer.showNotification("Vous n'avez pas assez d'argent.")
	end
end)

RegisterNetEvent('xPlayer:RemoveMoney')
AddEventHandler('xPlayer:RemoveMoney', function(MoneyType, Amount)
	local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayerMoney = xPlayer.getMoney()
	if xPlayerMoney >= Amount then
		xPlayer.removeAccountMoney(MoneyType, Amount)
		xPlayer.showNotification("Vous avez jeter "..Amount.." $")
	else
		xPlayer.showNotification("Vous n'avez pas assez d'argent.")
	end
end)

ESX.RegisterServerCallback('xPlayer:getAccessoire', function(source, cb)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)
    if string.match(identifier, 'license:') then
        identifier = string.sub(identifier, 9)
    end
    MySQL.Async.fetchAll(
        'SELECT * FROM users_accessories WHERE Identifier = @Identifier',
        {
            ['@Identifier'] = identifier
        },
    function(result)
        cb(result)
    end)
end)

RegisterNetEvent('xPlayer:RenameAcc')
AddEventHandler('xPlayer:RenameAcc', function(Id, Label)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)
    if string.match(identifier, 'license:') then
        identifier = string.sub(identifier, 9)
    end
	MySQL.Async.execute(
		'UPDATE users_accessories SET Label = @Label WHERE Id = @Id',
	{
	    ['@Label'] = Label,
	    ['@Id'] = Id
	})
end)

RegisterNetEvent('xPlayer:GiveAcc')
AddEventHandler('xPlayer:GiveAcc', function(Target, Id)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Target)
	MySQL.Async.execute(
		'UPDATE users_accessories SET Identifier = @Identifier WHERE Id = @Id',
	{
	    ['@Identifier'] = xTarget.identifier,
	    ['@Id'] = Id
	})
	xPlayer.showNotification("Vous avez donner un accessoire à "..xTarget.name)
	xTarget.showNotification("Vous avez recu un accesoire de "..xPlayer.name)
end)

RegisterNetEvent('xPlayer:DelAcc')
AddEventHandler('xPlayer:DelAcc', function(Id)
	local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.execute(
		'DELETE FROM users_accessories where Id = @Id',
	{
	    ['@Id'] = Id
	})
	xPlayer.showNotification("Vous avez jeter un accessoire.")
end)

ESX.RegisterServerCallback("xPlayer:getSkin", function(source, cb)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)
    if string.match(identifier, 'license:') then
        identifier = string.sub(identifier, 9)
    end
	MySQL.Async.fetchScalar('SELECT Skin FROM users WHERE Identifier = @Identifier', {
		['@Identifier'] = identifier
	}, function(result)
		cb(json.decode(result))
	end)
end)