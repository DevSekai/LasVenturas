ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('playerDropped', function()
    local src = source
    local identifier = nil
    for _,v in ipairs(GetPlayerIdentifiers(src)) do
        if string.match(v, 'license:') then
            identifier = string.sub(v, 9)
            break
        end
    end
    local xCoords = GetEntityCoords(GetPlayerPed(src))
    local xHead = GetEntityHeading(GetPlayerPed(src))
    Data = {x = xCoords.x, y = xCoords.y, z = xCoords.z, h = xHead}
    MySQL.Async.execute(
        'UPDATE users SET position = @position WHERE identifier=@identifier',
    {
      ['@identifier'] = identifier,
      ['@position'] = json.encode(Data)
    })
end)

RegisterServerEvent("xPlayer:Init:Spawn")
AddEventHandler("xPlayer:Init:Spawn", function()
    local src = source
    local identifier = nil
    for _,v in ipairs(GetPlayerIdentifiers(src)) do
        if string.match(v, 'license:') then
            identifier = string.sub(v, 9)
            break
        end
    end
    MySQL.Async.fetchScalar('SELECT Skin FROM users WHERE identifier = @identifier', {
		['@identifier'] = identifier
    }, function(result)
        if result then
            MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
                ['@identifier'] = identifier
            }, function(result2)
                Data = {}
                for _,v in pairs (result2) do
                    if v.position then
                        Data.coords = json.decode(v.position)
                    end
                    if v.Skin then
                        Data.skin = json.decode(v.Skin)
                    end
                end
                TriggerClientEvent("xPlayer:Spawn:Player", src, Data)
            end)
        else
            TriggerClientEvent("xPlayer:Create:Player", src)
        end
    end)
end)

ESX.RegisterServerCallback("xPlayer:Get:Card:Id", function(source, cb, target)
    local xPlayer = ESX.GetPlayerFromId(target)
    Return = {
        job = xPlayer.job.label.." - "..xPlayer.job.grade_label,
        name = nil,
        birthday = nil,
    }
    MySQL.Async.fetchAll('SELECT * FROM users WHERE Identifier = @Identifier', {
		['@Identifier'] = xPlayer.identifier
	}, function(result)
        for _,v in pairs (result) do
            Return.name = v.FirstName.." "..v.LastName
            Return.birthday = v.Birthday
            cb(Return)
        end
    end)
end)

RegisterServerEvent("xPlayer:Card:Id:Show")
AddEventHandler("xPlayer:Card:Id:Show", function(target)
    local xPlayer = ESX.GetPlayerFromId(target)
    Return = {
        job = xPlayer.job.label.." - "..xPlayer.job.grade_label,
        ped = GetPlayerPed(target),
        name = nil,
        birthday = nil,
    }
    MySQL.Async.fetchAll('SELECT * FROM users WHERE Identifier = @Identifier', {
		['@Identifier'] = xPlayer.identifier
	}, function(result)
        for _,v in pairs (result) do
            Return.name = v.FirstName.." "..v.LastName
            Return.birthday = v.Birthday
        end
        TriggerClientEvent("xPlayer:Card:Id:Show", target, Return)
    end)
end)

ESX.RegisterServerCallback("xPlayer:Get:Tatoo", function(source, cb)
    local src = source
    local identifier = nil
    for _,v in ipairs(GetPlayerIdentifiers(src)) do
        if string.match(v, 'license:') then
            identifier = string.sub(v, 9)
            break
        end
    end
	MySQL.Async.fetchAll('SELECT * FROM users_tatoo WHERE Identifier = @Identifier', {
		['@Identifier'] = identifier
	}, function(result)
		if result then
			cb(result)
		end
	end)
end)

RegisterServerEvent("xPlayer:Create:Player")
AddEventHandler("xPlayer:Create:Player", function(Identity, Skin)
    local src = source
    local identifier = nil
    for _,v in ipairs(GetPlayerIdentifiers(src)) do
        if string.match(v, 'license:') then
            identifier = string.sub(v, 9)
            break
        end
    end
    MySQL.Async.execute(
	    'UPDATE users SET Skin = @Skin, FirstName = @FirstName, LastName = @LastName, Birthday = @Birthday, Taille = @Taille WHERE identifier=@identifier',
	{
	  ['@identifier'] = identifier,
	  ['@FirstName'] = Identity.firstName,
	  ['@LastName'] = Identity.lastName,
	  ['@Birthday'] = Identity.birthday,
	  ['@Taille'] = Identity.height,
      ['@Skin'] = json.encode(Skin)
    })
    TriggerClientEvent("xPlayer:Create:Leave", src)
end)

ESX.RegisterServerCallback('xPlayer:getUserBanque', function(source, cb)
    local src = source
    local identifier = nil
    for _,v in ipairs(GetPlayerIdentifiers(src)) do
        if string.match(v, 'license:') then
            identifier = string.sub(v, 9)
            break
        end
    end
	MySQL.Async.fetchScalar('SELECT accounts FROM users WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(Accounts)
		MySQL.Async.fetchScalar('SELECT FirstName FROM users WHERE identifier = @identifier', {
			['@identifier'] = identifier
		}, function(FirstName)
			MySQL.Async.fetchScalar('SELECT LastName FROM users WHERE identifier = @identifier', {
				['@identifier'] = identifier
			}, function(LastName)
				if Accounts then
					Name = {Accounts = json.decode(Accounts), FirstName = FirstName, LastName = LastName}
				else
					Name = {Accounts = {money = 3500, bank = 3500}, FirstName = FirstName, LastName = LastName}
				end
				cb(json.encode(Name))
			end)
		end)
	end)
end)

RegisterNetEvent('xPlayer:DepositBank')
AddEventHandler('xPlayer:DepositBank', function(Amount)
	local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayerMoney = xPlayer.getMoney()
	if xPlayerMoney >= Amount then
	    xPlayer.addAccountMoney('bank', Amount)
		xPlayer.removeAccountMoney('money', Amount)
		xPlayer.showNotification("Vous avez déposer ~g~"..Amount.." $~s~ sur votre compte bancaire.")
	else
		xPlayer.showNotification("Montant invalide.")
	end
end)

RegisterNetEvent('xPlayer:TransfereBank')
AddEventHandler('xPlayer:TransfereBank', function(Target, Amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Target)
    local xPlayerMoney = xPlayer.getMoney()
	if xPlayerMoney >= Amount then
	    xTarget.addAccountMoney('money', Amount)
		xPlayer.removeAccountMoney('bank', Amount)
		xPlayer.showNotification("Vous avez transférer ~g~"..Amount.." $~s~ sur le compte bancaire de "..xTarget.name..".")
		xTarget.showNotification("Vous avez recu ~g~"..Amount.." $~s~ sur votre compte bancaire de la part de "..xPlayer.name..".")
		TriggerClientEvent('RefreshPlyBank', Target, Amount)
	else
		xPlayer.showNotification("Montant invalide.")
	end
end)

RegisterNetEvent('xPlayer:WithdrawBank')
AddEventHandler('xPlayer:WithdrawBank', function(Amount)
	local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayerMoney = xPlayer.getMoney()
	if xPlayerMoney >= Amount then
	    xPlayer.addAccountMoney('money', Amount)
		xPlayer.removeAccountMoney('bank', Amount)
		xPlayer.showNotification("Vous avez retirer ~g~"..Amount.." $~s~ sur votre compte bancaire.")
	else
		xPlayer.showNotification("Montant invalide.")
	end
end)