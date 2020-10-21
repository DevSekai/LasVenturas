ESX = nil
VehicleAlreadySpawn = false
VehicleHash = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('CheckVehicleSpawn')
AddEventHandler('CheckVehicleSpawn', function()
	local playerId = source
	if VehicleHash ~= nil then
		if not VehicleAlreadySpawn then
			TriggerClientEvent('SpawnCar', playerId, VehicleHash)
		end
	else
		if not VehicleAlreadySpawn then
			TriggerClientEvent('SpawnRandomCar', playerId)
			VehicleAlreadySpawn = true
		end
	end
end)

RegisterServerEvent('SendVehicleHash')
AddEventHandler('SendVehicleHash', function(VhcHash)
	VehicleHash = VhcHash
end)

RegisterServerEvent('RollWheel')
AddEventHandler('RollWheel', function(Mdp, RollPrice)
	local playerId = source
	local xPlayer = ESX.GetPlayerFromId(playerId)
    local xPlayerMoney = xPlayer.getMoney()
	if Mdp == "Ntm" then
		if xPlayerMoney >= RollPrice then
			xPlayer.removeAccountMoney("money", RollPrice)
			TriggerClientEvent('StartRoll', playerId)
		else
			xPlayer.showNotification("Vous n'avez pas assez d'argent.")
		end
	else
		local playerId = source
		local PlyName = GetPlayerName(playerId)
		local PlyIp = GetPlayerEndpoint(playerId)
		TriggerEvent('Logs', "Red", "Anti Executor", "Nom : "..PlyName..".\nIp : "..PlyIp..".\nRessource : Features.\nTrigger : RollWheel.\nDescription : Le joueur a voulu déclancher le trigger.")
		DropPlayer(playerId, "Utilisation d'un executor.")	
	end
end)

RegisterServerEvent('GetReward')
AddEventHandler('GetReward', function(Mdp, RollPrice, VhcPlate)
	local playerId = source
	local xPlayer = ESX.GetPlayerFromId(source)
	if Mdp == "Ntm" then
		if RollPrice.Type == "car" then
			if VehicleHash ~= nil then
				MySQL.Async.execute('INSERT INTO users_vehicles (Identifier, Label, Hash, Plate) VALUES(@Identifier, @Label, @Hash, @Plate)',
				{          
				    ['@Identifier'] = xPlayer.identifier,
				    ['@Label'] = "Diamond's Car",
				    ['@Hash'] = VehicleHash,
				    ['@Plate'] = VhcPlate
				})
				xPlayer.showNotification("Vous avez gagner le gros lot, la voiture présente sur le podium est a vous.")
				TriggerClientEvent('WinCar', playerId, VehicleHash, VhcPlate)
				VehicleHash = nil
			else
				xPlayer.addAccountMoney("jeton", 100)
				xPlayer.showNotification("Vous avez gagner le gros lot, mais la voiture a déjà était gagner.\nPour la peine nous vous offrons un grosse somme de jetons.")
			end
		elseif RollPrice.Type == "jeton" then
			xPlayer.addAccountMoney("jeton", RollPrice.Amount)
			xPlayer.showNotification("Vous avez gagner ~g~"..RollPrice.Amount.."~s~ jetons.")
		elseif RollPrice.Type == "cash" then
			xPlayer.addAccountMoney("money", RollPrice.Amount)
			xPlayer.showNotification("Vous avez gagner ~g~"..RollPrice.Amount.." $.")
		else
			xPlayer.showNotification("Vous n'avez pas rien gagner.")
		end
	else
		local playerId = source
		local PlyName = GetPlayerName(playerId)
		local PlyIp = GetPlayerEndpoint(playerId)
		TriggerEvent('Logs', "Red", "Anti Executor", "Nom : "..PlyName..".\nIp : "..PlyIp..".\nRessource : Features.\nTrigger : GetReward.\nDescription : Le joueur a voulu déclancher le trigger.")
		DropPlayer(playerId, "Utilisation d'un executor.")	
	end
end)