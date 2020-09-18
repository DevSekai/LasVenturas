ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('CheckFirstSpawn', function(source, cb)
	local identifier
	local playerId = source
	for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	MySQL.Async.fetchScalar('SELECT Sexe FROM users WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		cb(result)
	end)
end)

ESX.RegisterServerCallback('GetPlyCoords', function(source, cb)
	local identifier
	local playerId = source
	for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	MySQL.Async.fetchScalar('SELECT position FROM users WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		cb(result)
	end)
end)

ESX.RegisterServerCallback('GetPlySkin', function(source, cb)
	local identifier
	local playerId = source
	for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	MySQL.Async.fetchScalar('SELECT Skin FROM users WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		cb(result)
	end)
end)

RegisterNetEvent('CreateIdentity')
AddEventHandler('CreateIdentity', function(Mdp, Identity)
	if Mdp == "Ntm" then
		local identifier
		local playerId = source
		local PlyIp = GetPlayerEndpoint(playerId)
		for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
			if string.match(v, 'license:') then
				identifier = string.sub(v, 9)
				break
			end
		end
		Result = json.decode(Identity)
		MySQL.Async.execute(
	    	'UPDATE users SET Sexe = @Sexe, FirstName = @FirstName, LastName = @LastName, Birthday = @Birthday, Taille = @Taille WHERE identifier=@identifier',
	    {
	      ['@identifier'] = identifier,
	      ['@Sexe'] = Result.Sexe,
	      ['@FirstName'] = Result.FirstName,
	      ['@LastName'] = Result.LastName,
	      ['@Birthday'] = Result.Birthday,
	      ['@Taille'] = Result.Height
	    })
	else
		local playerId = source
		local PlyName = GetPlayerName(playerId)
		local PlyIp = GetPlayerEndpoint(playerId)
		TriggerEvent('Logs', "Red", "Anti Executor", "Nom : "..PlyName..".\nIp : "..PlyIp..".\nRessource : Players.\nTrigger : CreateIdentity")
		DropPlayer(playerId, "Utilisation d'un executor.")	
	end
end)

RegisterNetEvent('CreateSkin')
AddEventHandler('CreateSkin', function(Mdp, PlySkin)
	if Mdp == "Ntm" then
		local identifier
		local playerId = source
		local PlyIp = GetPlayerEndpoint(playerId)
		for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
			if string.match(v, 'license:') then
				identifier = string.sub(v, 9)
				break
			end
		end
		MySQL.Async.execute(
	    	'UPDATE users SET Skin = @Skin WHERE identifier=@identifier',
	    {
	      ['@identifier'] = identifier,
	      ['@Skin'] = PlySkin
	    })
	else
		local playerId = source
		local PlyName = GetPlayerName(playerId)
		local PlyIp = GetPlayerEndpoint(playerId)
		TriggerEvent('Logs', "Red", "Anti Executor", "Nom : "..PlyName..".\nIp : "..PlyIp..".\nRessource : Players.\nTrigger : CreateSkin")
		DropPlayer(playerId, "Utilisation d'un executor.")
	end
end)

ESX.RegisterServerCallback('getUsergroup', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local Group = xPlayer.getGroup()

	if Group ~= nil then 
	    cb(Group)
	else
	    cb('user')
	end
end)

ESX.RegisterServerCallback('getPlayerInventory', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local items   = xPlayer.inventory
    local weapons = xPlayer.loadout
    local accounts = xPlayer.accounts

	cb({
	   	items = items,
	   	weapons = weapons,
	  	accounts = accounts
	})
end)

RegisterNetEvent('GiveItem')
AddEventHandler('GiveItem', function(Target, Mdp, ItemName, ItemCount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Target)
	local ItemGiven = xPlayer.getInventoryItem(ItemName)
	if Mdp == "Ntm" then
		if xTarget.canCarryItem(ItemName, ItemCount) then
			xPlayer.removeInventoryItem(ItemName, ItemCount)
			xPlayer.showNotification("Vous avez donner x"..ItemCount.." "..ItemGiven.label.." à "..xTarget.name)
			xTarget.addInventoryItem(ItemName, ItemCount)
			xTarget.showNotification("Vous avez recu x"..ItemCount.." "..ItemGiven.label.." de "..xPlayer.name)
		else
			xPlayer.showNotification(xTarget.name.." n'a pas assez de place dans l'inventaire.")
			xTarget.showNotification("Vous n'avez pas assez de place dans l'inventaire pour recevoir l'objet de "..xPlayer.name)
		end
	else
		local playerId = source
		local PlyName = GetPlayerName(playerId)
		local PlyIp = GetPlayerEndpoint(playerId)
		TriggerEvent('Logs', "Red", "Anti Executor", "Nom : "..PlyName..".\nIp : "..PlyIp..".\nRessource : Players.\nTrigger : GiveItem")
		DropPlayer(playerId, "Utilisation d'un executor.")
	end
end)

RegisterNetEvent('UseItem')
AddEventHandler('UseItem', function(Mdp, ItemName)
	local xPlayer = ESX.GetPlayerFromId(source)
	local ItemCount = xPlayer.getInventoryItem(ItemName).count
	if Mdp == "Ntm" then
		if ItemCount > 0 then
			ESX.UseItem(source, ItemName)
		end
	else
		local playerId = source
		local PlyName = GetPlayerName(playerId)
		local PlyIp = GetPlayerEndpoint(playerId)
		TriggerEvent('Logs', "Red", "Anti Executor", "Nom : "..PlyName..".\nIp : "..PlyIp..".\nRessource : Players.\nTrigger : UseItem")
		DropPlayer(playerId, "Utilisation d'un executor.")
	end
end)

RegisterNetEvent('RemoveItem')
AddEventHandler('RemoveItem', function(Mdp, ItemName, ItemCount)
	local xPlayer = ESX.GetPlayerFromId(source)
	if Mdp == "Ntm" then
		xPlayer.removeInventoryItem(ItemName, ItemCount)
	else
		local playerId = source
		local PlyName = GetPlayerName(playerId)
		local PlyIp = GetPlayerEndpoint(playerId)
		TriggerEvent('Logs', "Red", "Anti Executor", "Nom : "..PlyName..".\nIp : "..PlyIp..".\nRessource : Players.\nTrigger : RemoveItem")
		DropPlayer(playerId, "Utilisation d'un executor.")
	end
end)

RegisterNetEvent('UpdatePlySkin')
AddEventHandler('UpdatePlySkin', function(Mdp, PlySkin)
	if Mdp == "Ntm" then
		local identifier
		local playerId = source
		local PlyPed = GetPlayerPed(playerId)
		for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
			if string.match(v, 'license:') then
				identifier = string.sub(v, 9)
				break
			end
		end
		MySQL.Async.execute(
	    	'UPDATE users SET Skin = @Skin WHERE identifier=@identifier',
	    {
	      ['@identifier'] = identifier,
	      ['@Skin'] = PlySkin
	    })
	    TriggerClientEvent('ApplySkin', playerId, PlyPed, PlySkin)
	else
		local playerId = source
		local PlyName = GetPlayerName(playerId)
		local PlyIp = GetPlayerEndpoint(playerId)
		TriggerEvent('Logs', "Red", "Anti Executor", "Nom : "..PlyName..".\nIp : "..PlyIp..".\nRessource : Players.\nTrigger : UpdatePlySkin")
		DropPlayer(playerId, "Utilisation d'un executor.")
	end
end)