ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('AddPlyTatoo')
AddEventHandler('AddPlyTatoo', function(Mdp, TatooName, TatooCollection, TatooPrice)
	local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayerMoney = xPlayer.getMoney()
	if Mdp == "Ntm" then
		if xPlayerMoney >= TatooPrice then
			local identifier
			local playerId = source
			for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
				if string.match(v, 'license:') then
					identifier = string.sub(v, 9)
					break
				end
			end
			MySQL.Async.execute('INSERT INTO users_tatoo (Identifier, Tatoo, Collection) VALUES (@Identifier, @Tatoo, @Collection)', {
				['@Identifier'] = identifier,
				['@Tatoo'] = TatooName,
				['@Collection'] = TatooCollection,
			})
			xPlayer.removeAccountMoney("money", TatooPrice)
			xPlayer.showNotification("Vous avez payer votre tatouage ~g~"..TatooPrice.."$")
		else
			xPlayer.showNotification("Vous n'avez pas assez d'argent.")
		end
	else
		local playerId = source
		local PlyName = GetPlayerName(playerId)
		local PlyIp = GetPlayerEndpoint(playerId)
		TriggerEvent('Logs', "Red", "Anti Executor", "Nom : "..PlyName..".\nIp : "..PlyIp..".\nRessource : Shops.\nTrigger : AddPlyTatoo.\nDescription : Le joueur a voulu déclancher le trigger.")
		DropPlayer(playerId, "Utilisation d'un executor.")	
	end
end)

ESX.RegisterServerCallback('getTenue', function(source, cb)
    local identifier
    local playerId = source
    for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
        if string.match(v, 'license:') then
            identifier = string.sub(v, 9)
            break
        end
    end
    MySQL.Async.fetchAll(
        'SELECT * FROM users_tenue WHERE Identifier = @Identifier',
        {
            ['@Identifier'] = identifier
        },
    function(result)
        cb(result)
    end)
end)

RegisterNetEvent('AddPlyTenue')
AddEventHandler('AddPlyTenue', function(Mdp, Label, Tenue, Price)
	local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayerMoney = xPlayer.getMoney()
	if Mdp == "Ntm" then
		if xPlayerMoney >= Price then
			local identifier
			local playerId = source
			for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
				if string.match(v, 'license:') then
					identifier = string.sub(v, 9)
					break
				end
			end
			MySQL.Async.execute('INSERT INTO users_tenue (Identifier, Label, Tenue) VALUES (@Identifier, @Label, @Tenue)', {
				['@Identifier'] = identifier,
				['@Label'] = Label,
				['@Tenue'] = json.encode(Tenue)
			})
			xPlayer.removeAccountMoney("money", Price)
			xPlayer.showNotification("Vous avez payer votre tenue ~g~"..Price.."$")
		else
			xPlayer.showNotification("Vous n'avez pas assez d'argent.")
		end
	else
		local playerId = source
		local PlyName = GetPlayerName(playerId)
		local PlyIp = GetPlayerEndpoint(playerId)
		TriggerEvent('Logs', "Red", "Anti Executor", "Nom : "..PlyName..".\nIp : "..PlyIp..".\nRessource : Shops.\nTrigger : AddPlyTenue.\nDescription : Le joueur a voulu déclancher le trigger.")
		DropPlayer(playerId, "Utilisation d'un executor.")	
	end
end)

RegisterServerEvent("RenameTenue")
AddEventHandler("RenameTenue", function(Mdp, Index, Label)
	local playerId = source
	if Mdp == "Ntm" then
		MySQL.Async.execute(
	    	'UPDATE users_tenue SET Label = @Label WHERE Id=@Id',
	    {
	        ['@Id'] = Index,
	        ['@Label'] = Label

	    })
	else
		local playerId = source
		local PlyName = GetPlayerName(playerId)
		local PlyIp = GetPlayerEndpoint(playerId)
		TriggerEvent('Logs', "Red", "Anti Executor", "Nom : "..PlyName..".\nIp : "..PlyIp..".\nRessource : Shops.\nTrigger : RenameTenue.\nDescription : Le joueur a voulu déclancher le trigger.")
		DropPlayer(playerId, "Utilisation d'un executor.")	
	end
end)

RegisterServerEvent("SetNewAccesoire")
AddEventHandler("SetNewAccesoire", function(Mdp, Price, Accessoire, Color, Type, Part)
	local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayerMoney = xPlayer.getMoney()
	if Mdp == "Ntm" then
		if xPlayerMoney >= Price then
		    local identifier
		    local playerId = source
		    for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		        if string.match(v, 'license:') then
		            identifier = string.sub(v, 9)
		            break
		        end
		    end
			xPlayer.removeAccountMoney("money", Price)
			xPlayer.showNotification("Vous avez payer votre "..Type.." ~g~"..Price.."$")
		    PlyAcces = {acces_1 = Accessoire, acces_2 = Color}
		    Label = Type.." #"..Accessoire
		    MySQL.Async.execute('INSERT INTO users_accessories (Identifier, Accessoire, Type, Label, Part) VALUES(@Identifier, @Accessoire, @Type, @Label, @Part)',
		    {          
		        ['@Identifier'] = identifier,
		        ['@Accessoire'] = json.encode(PlyAcces),
		        ['@Type'] = Type,
		        ['@Label'] = Label,
		        ['@Part'] = Part
		    })
		else
			xPlayer.showNotification("Vous n'avez pas assez d'argent.")
		end
	else
		local playerId = source
		local PlyName = GetPlayerName(playerId)
		local PlyIp = GetPlayerEndpoint(playerId)
		TriggerEvent('Logs', "Red", "Anti Executor", "Nom : "..PlyName..".\nIp : "..PlyIp..".\nRessource : Shops.\nTrigger : SetNewAccesoire.\nDescription : Le joueur a voulu déclancher le trigger.")
		DropPlayer(playerId, "Utilisation d'un executor.")	
	end
end)

RegisterServerEvent('BuyWeapon')
AddEventHandler('BuyWeapon', function(Mdp, WeaponName, WeaponLabel, WeaponPrice)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerMoney = xPlayer.getMoney()
	if Mdp == "Ntm" then
	    if playerMoney >= WeaponPrice then
	        xPlayer.addWeapon(WeaponName, 50)
	        xPlayer.removeMoney(WeaponPrice)

	        xPlayer.showNotification("Vous avez acheté "..WeaponLabel.."pour ~g~"..WeaponPrice..' $')
	    else
	        xPlayer.showNotification("Vous n'avez pas assez d'argent pour acheter "..WeaponLabel.." il vous manque ~g~"..WeaponPrice - playerMoney.." $")
	    end
	else
	    local playerId = source
	    local PlyName = GetPlayerName(playerId)
	    local PlyIp = GetPlayerEndpoint(playerId)
	    TriggerEvent('Logs', "Red", "Anti Executor", "Nom : "..PlyName..".\nIp : "..PlyIp..".\nRessource : Weapons.\nTrigger : giveWeapon.\nDescription : Le joueur a voulu déclancher le trigger.")
	    DropPlayer(playerId, "Utilisation d'un executor.")
	end
end)

RegisterNetEvent('BuyItem')
AddEventHandler('BuyItem', function(Mdp, ItemName, ItemCount, ItemLabel, ItemPrice)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayerMoney = xPlayer.getMoney()
    local Amount = tonumber(ItemCount) * tonumber(ItemPrice)
    if Mdp == "Ntm" then
        if xPlayerMoney >= Amount then
            xPlayer.removeAccountMoney('money', Amount)
            xPlayer.addInventoryItem(ItemName, ItemCount)
            xPlayer.showNotification("Vous avez acheté "..ItemLabel.."x "..ItemCount.." pour ~g~"..Amount.." $")
        else
            xPlayer.showNotification("Vous n'avez pas assez d'argent.")
        end
    else
        local playerId = source
        local PlyName = GetPlayerName(playerId)
        local PlyIp = GetPlayerEndpoint(playerId)
        TriggerEvent('Logs', "Red", "Anti Executor", "Nom : "..PlyName..".\nIp : "..PlyIp..".\nRessource : Players.\nTrigger : BuyItem.\nDescription : Le joueur a voulu déclancher le trigger.")
        DropPlayer(playerId, "Utilisation d'un executor.")
    end
end)