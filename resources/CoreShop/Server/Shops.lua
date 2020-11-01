RegisterNetEvent('BuyItems')
AddEventHandler('BuyItems', function(ItemType, Items)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayerMoney = xPlayer.getMoney()
    local Result = json.decode(Items)
    local TokenGen = json.decode(Result.Token)
    if TokenGen.Key == Token then
        if ItemType == "Standar" then
            local Amount = tonumber(Result.Count) * tonumber(Result.Price)
            if xPlayerMoney >= Amount then
                xPlayer.removeAccountMoney('money', Amount)
                xPlayer.addInventoryItem(Result.Name, Result.Count)
                xPlayer.showNotification("Vous avez acheté ~o~"..Result.Label.." ~y~x"..Result.Count.."~s~ pour ~g~"..Amount.." $")
            else
                xPlayer.showNotification("Vous n'avez pas assez d'argent.")
            end
        elseif ItemType == "Weapon" then
            if xPlayerMoney >= Result.Price then
                xPlayer.removeAccountMoney('money', Result.Price)
                xPlayer.addWeapon(Result.Name, Shops.Weapon.BaseAmmo)
                xPlayer.showNotification("Vous avez acheté ~o~"..Result.Label.."~s~ pour ~g~"..Result.Price..' $')
            else
                xPlayer.showNotification("Vous n'avez pas assez d'argent.")
            end
        end
    else
        local playerId = source
        local PlyName = GetPlayerName(playerId)
        local PlyIp = GetPlayerEndpoint(playerId)
        Logs(LogsRed, "Anti Executor", "Nom : "..PlyName..".\nIp : "..PlyIp..".\nRessource : CoreShop.\nTrigger : BuyItems.\nDescription : Le joueur a voulu déclancher le trigger.\nObjets : "..Result.Name..".")
        DropPlayer(playerId, "Utilisation d'un executor.")
    end
end)

RegisterServerEvent("BuyStuff")
AddEventHandler("BuyStuff", function(Stuff)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayerMoney = xPlayer.getMoney()
    local Result = json.decode(Stuff)
    local TokenGen = json.decode(Result.Token)
    if TokenGen.Key == Token then
        if xPlayerMoney >= Result.Price then
			xPlayer.removeAccountMoney("money", Result.Price)
            xPlayer.showNotification("Vous avez payer votre "..Result.Name.." ~g~"..Result.Price.."$")
            TriggerClientEvent("CloseMenu", source)
		    NewStuff = {Index = Result.Index, Color = Result.Color}
		    Label = Result.Name.." #"..Result.Index
		    MySQL.Async.execute('INSERT INTO users_accessories (Identifier, Type, Stuff, Label) VALUES(@Identifier, @Type, @Stuff, @Label)',
		    {          
                ['@Identifier'] = xPlayer.identifier,
                ['@Type'] = Result.Name,
		        ['@Stuff'] = json.encode(NewStuff),
		        ['@Label'] = Label
		    })
		else
			xPlayer.showNotification("Vous n'avez pas assez d'argent.")
		end
	else
		local playerId = source
		local PlyName = GetPlayerName(playerId)
		local PlyIp = GetPlayerEndpoint(playerId)
		TriggerEvent('Logs', "Red", "Anti Executor", "Nom : "..PlyName..".\nIp : "..PlyIp..".\nRessource : CoreShop.\nTrigger : BuyStuff.\nDescription : Le joueur a voulu déclancher le trigger..\nObjets : "..Result.Name..".")
		DropPlayer(playerId, "Utilisation d'un executor.")	
	end
end)

RegisterServerEvent("CheckMoney")
AddEventHandler("CheckMoney", function(Check)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayerMoney = xPlayer.getMoney()
    local Result = json.decode(Check)
    local TokenGen = json.decode(Result.Token)
    if TokenGen.Key == Token then
        if xPlayerMoney >= Result.Price then
            if Result.Type == "Barber" then
                xPlayer.removeAccountMoney("money", Result.Price)
                xPlayer.showNotification("Vous avez payer le coiffeur ~g~"..Result.Price.."$")
            elseif Result.Type == "Tatoo" then
                xPlayer.removeAccountMoney("money", Result.Price)
                xPlayer.showNotification("Vous avez payer le tatoueur ~g~"..Result.Price.."$")
                MySQL.Async.execute('INSERT INTO users_tatoo (Identifier, Tatoo, Collection) VALUES (@Identifier, @Tatoo, @Collection)', {
                    ['@Identifier'] = xPlayer.identifier,
                    ['@Tatoo'] = Result.Name,
                    ['@Collection'] = Result.Collection
                })
            end
            TriggerClientEvent("LeaveShop", source, Result.Type)
		else
			xPlayer.showNotification("Vous n'avez pas assez d'argent.")
		end
	else
		local playerId = source
		local PlyName = GetPlayerName(playerId)
		local PlyIp = GetPlayerEndpoint(playerId)
		TriggerEvent('Logs', "Red", "Anti Executor", "Nom : "..PlyName..".\nIp : "..PlyIp..".\nRessource : CoreShop.\nTrigger : CheckMoney.\nDescription : Le joueur a voulu déclancher le trigger..\nObjets : "..Result.Type..".")
		DropPlayer(playerId, "Utilisation d'un executor.")	
	end
end)