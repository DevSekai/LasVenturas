ESX = nil
Token = nil
WarnLimitBeforeBan = 6
PlyGroup = {}
Char = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

for i = 48,  57 do table.insert(Char, string.char(i)) end
for i = 65,  90 do table.insert(Char, string.char(i)) end
for i = 97, 122 do table.insert(Char, string.char(i)) end

Citizen.CreateThread(function ()
	while Token == nil do
		Token = GenerateToken(12)
		Citizen.Wait(0)
	end
end)

RegisterServerEvent("GetAdminToken")
AddEventHandler("GetAdminToken", function()
	TriggerClientEvent("SendAdminToken", source, Token)
end)

function GenerateToken(Length)
	math.randomseed(os.time())

	if Length > 0 then
		return GenerateToken(Length - 1) .. Char[math.random(1, #Char)]
	else
		return ""
	end
end

RegisterServerEvent("CheckBanList")
AddEventHandler("CheckBanList", function()
	CheckBanList()
end)

function CheckBanList()
	local identifier
	local playerId = source
	local PlyName = GetPlayerName(playerId)
	for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	MySQL.Async.fetchScalar('SELECT Banned FROM users_bans WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(Banned)
		if Banned then
			MySQL.Async.fetchScalar('SELECT Date FROM users_bans WHERE identifier = @identifier', {
				['@identifier'] = identifier
			}, function(Date)
				MySQL.Async.fetchScalar('SELECT BannedBy FROM users_bans WHERE identifier = @identifier', {
					['@identifier'] = identifier
				}, function(BannedBy)
					MySQL.Async.fetchScalar('SELECT Reason FROM users_bans WHERE identifier = @identifier', {
						['@identifier'] = identifier
					}, function(Reason)
						TriggerEvent('LogsBans', "Red", "Connexion d'un joueur ban", "Nom : "..PlyName..".\nCe joueur a essayer de se connecter.\nIl a était banni le : "..Date..".\nPour la raison suivante : "..Reason..".\n Par : "..BannedBy..".")
						DropPlayer(playerId, "Vous êtes banni de ce serveur.")
					end)
				end)
			end)
		end
	end)
end

ESX.RegisterServerCallback('CheckGroup', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier
	local playerId = source
	for k,v in ipairs(GetPlayerIdentifiers(source)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	MySQL.Async.fetchAll('SELECT `group` FROM `users` WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		PlyGroup[source] = result
		cb(result)
	end)
end)

RegisterServerEvent('PunishPlayer')
AddEventHandler('PunishPlayer', function(Args)
    Result = json.decode(Args)
    Token = json.decode(Result.Token)
    xTarget = Result.Target
	local xPlayer = ESX.GetPlayerFromId(source)
	Date = os.date("%y/%m/%d %X")
	local identifier
	PlyName = GetPlayerName(xPlayer)
	BannedName = GetPlayerName(xTarget)
	for k,v in ipairs(GetPlayerIdentifiers(xTarget)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	if Token.Key == Token then
		if Result.Type == "Ban" then
			if PlyGroup[source] ~= "user" then
				DropPlayer(xTarget, "Vous avez était banni du serveur.")
				MySQL.Async.execute('INSERT INTO users_bans (Date, Identifier, Banned, Reason, BannedBy) VALUES (@Date, @Identifier, @Banned, @Reason, @BannedBy)', {
					['@Identifier']   = identifier,
					['@Date']   = Date,
					['@Banned'] = true,
					['@Reason']   = Result.Reason,
					['@BannedBy'] = PlyName
				}, function()
					xPlayer.showNotification("Vous avez banni ~y~"..BannedName)
				end)
				TriggerEvent('LogsBans', "Red", "Bannissement d'un joueur", "Nom : "..BannedName..".\nCe joueur a essayer de se connecter.\nIl a était banni le : "..Date..".\nPour la raison suivante : "..Result.Reason..".\n Par : "..PlyName..".")
			else
				DropPlayer(source, "Vous avez était banni du serveur.")
				MySQL.Async.execute('INSERT INTO users_bans (Date, Identifier, Banned, Reason, BannedBy) VALUES (@Date, @Identifier, @Banned, @Reason, @BannedBy)', {
					['@Identifier']   = identifier,
					['@Date']   = Date,
					['@Banned'] = true,
					['@Reason']   = Result.Reason,
					['@BannedBy'] = PlyName
				}, function()
					xPlayer.showNotification("Vous avez banni ~y~"..BannedName)
				end)
				TriggerEvent('LogsBans', "Red", "Bannissement d'un joueur", "Nom : "..BannedName..".\nCe joueur a essayer de se connecter.\nIl a était banni le : "..Date..".\nPour la raison suivante : "..Result.Reason..".\n Par : "..PlyName..".")
			end
		elseif Result.Type == "Warns" then
			MySQL.Async.fetchAll('SELECT * FROM users_warns WHERE identifier = @identifier', {
				['@identifier'] = identifier
			}, function(Warns)
				for Nbr, Warn in pairs(Warns) do
					if Nbr >= WarnLimitBeforeBan then
						TooManyWarn = true
					end
				end
				if not TooManyWarn then
					if PlyGroup[source] ~= "user" then
						DropPlayer(xTarget, "Vous avez était exclu du serveur et vous avez gagner une avertissement")
						MySQL.Async.execute('INSERT INTO users_warns (Date, Identifier, Reason, WarnedBy) VALUES (@Date, @Identifier, @Reason, @WarnedBy)', {
							['@Identifier']   = identifier,
							['@Date']   = Date,
							['@Reason']   = Result.Reason,
							['@WarnedBy'] = PlyName
						}, function()
							xPlayer.showNotification("Vous avez exclu ~y~"..BannedName)
						end)
						TriggerEvent('LogsWarns', "Red", "Exclusion d'un joueur", "Nom : "..BannedName..".\nIl a était exclu le : "..Date..".\nPour la raison suivante : "..Result.Reason..".\n Par : "..PlyName..".")
					else
						DropPlayer(source, "Vous avez était banni du serveur.")
						MySQL.Async.execute('INSERT INTO users_bans (Date, Identifier, Banned, Reason, BannedBy) VALUES (@Date, @Identifier, @Banned, @Reason, @BannedBy)', {
							['@Identifier']   = identifier,
							['@Date']   = Date,
							['@Banned'] = true,
							['@Reason']   = Result.Reason,
							['@BannedBy'] = PlyName
						}, function()
							xPlayer.showNotification("Vous avez banni ~y~"..BannedName)
						end)
						TriggerEvent('LogsBans', "Red", "Bannissement d'un joueur", "Nom : "..BannedName..".\nIl a était banni le : "..Date..".\nPour la raison suivante : Utilisation d'executor.\n Par : L'as Venturas.")
					end
				else
					DropPlayer(xTarget, "Vous avez était banni du serveur.")
					MySQL.Async.execute('INSERT INTO users_bans (Date, Identifier, Banned, Reason, BannedBy) VALUES (@Date, @Identifier, @Banned, @Reason, @BannedBy)', {
						['@Identifier']   = identifier,
						['@Date']   = Date,
						['@Banned'] = true,
						['@Reason']   = Result.Reason,
						['@BannedBy'] = PlyName
					}, function()
						xPlayer.showNotification("Vous avez banni ~y~"..BannedName)
					end)
					TriggerEvent('LogsBans', "Red", "Bannissement d'un joueur", "Nom : "..BannedName..".\nIl a était banni le : "..Date..".\nPour la raison suivante : Trop d'avertissement.\n Par : "..PlyName..".")
				end
			end)
		elseif Result.Type == "Jail" then
			MySQL.Async.fetchAll('SELECT * FROM users_warns WHERE identifier = @identifier', {
				['@identifier'] = identifier
			}, function(Warns)
				for Nbr, Warn in pairs(Warns) do
					if Nbr >= WarnLimitBeforeBan then
						TooManyWarn = true
					end
				end
				if not TooManyWarn then
					if PlyGroup[source] ~= "user" then
						MySQL.Async.execute('INSERT INTO users_warns (Date, Identifier, Reason, WarnedBy) VALUES (@Date, @Identifier, @Reason, @WarnedBy)', {
							['@Identifier']   = identifier,
							['@Date']   = Date,
							['@Reason']   = Result.Reason,
							['@WarnedBy'] = PlyName
						}, function()
							xPlayer.showNotification("Vous avez emprisonné ~y~"..BannedName)
						end)
						TriggerClientEvent('JailPlayer', xTarget)
						TriggerEvent('LogsWarns', "Red", "Warn d'un joueur", "Nom : "..BannedName..".\nIl a était averti le : "..Date..".\nPour la raison suivante : "..Result.Reason..".\n Par : "..PlyName..".")
					else
						DropPlayer(source, "Vous avez était banni du serveur.")
						MySQL.Async.execute('INSERT INTO users_bans (Date, Identifier, Banned, Reason, BannedBy) VALUES (@Date, @Identifier, @Banned, @Reason, @BannedBy)', {
							['@Identifier']   = identifier,
							['@Date']   = Date,
							['@Banned'] = true,
							['@Reason']   = Result.Reason,
							['@BannedBy'] = PlyName
						}, function()
							xPlayer.showNotification("Vous avez banni ~y~"..BannedName)
						end)
						TriggerEvent('LogsBans', "Red", "Bannissement d'un joueur", "Nom : "..BannedName..".\nIl a était banni le : "..Date..".\nPour la raison suivante : Utilisation d'executor.\n Par : L'as Venturas.")
					end
				else
					DropPlayer(xTarget, "Vous avez était banni du serveur.")
					MySQL.Async.execute('INSERT INTO users_bans (Date, Identifier, Banned, Reason, BannedBy) VALUES (@Date, @Identifier, @Banned, @Reason, @BannedBy)', {
						['@Identifier']   = identifier,
						['@Date']   = Date,
						['@Banned'] = true,
						['@Reason']   = Result.Reason,
						['@BannedBy'] = PlyName
					}, function()
						xPlayer.showNotification("Vous avez banni ~y~"..BannedName)
					end)
					TriggerEvent('LogsBans', "Red", "Bannissement d'un joueur", "Nom : "..BannedName..".\nIl a était banni le : "..Date..".\nPour la raison suivante : Trop d'avertissement.\n Par : "..PlyName..".")
				end
			end)
		elseif Result.Type == "ClearInventory" then
			for k,v in ipairs(xTarget.inventory) do
				if v.count > 0 then
					xTarget.setInventoryItem(v.name, 0)
				end
			end
		else
			for k,v in ipairs(xTarget.loadout) do
				xTarget.removeWeapon(v.name)
			end
		end
    else
        DropPlayer(source, "Vous avez était banni du serveur.")
		MySQL.Async.execute('INSERT INTO users_bans (Date, Identifier, Banned, Reason, BannedBy) VALUES (@Date, @Identifier, @Banned, @Reason, @BannedBy)', {
			['@Identifier']   = identifier,
			['@Date']   = Result.Date,
			['@Banned'] = true,
			['@Reason']   = Result.Reason,
			['@BannedBy'] = PlyName
		}, function()
			xPlayer.showNotification("Vous avez banni ~y~"..BannedName)
		end)
        TriggerEvent('LogsBans', "Red", "Bannissement d'un joueur", "Nom : "..BannedName..".\nCe joueur a essayer de se connecter.\nIl a était banni le : "..Date..".\nPour la raison suivante : "..Result.Reason..".\n Par : "..PlyName..".")
    end
end)

ESX.RegisterServerCallback('GetPlyWarns', function(source, cb, target)
	local identifier
	for k,v in ipairs(GetPlayerIdentifiers(target)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	MySQL.Async.fetchAll('SELECT * FROM users_warns WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(Warns)
		cb(Warns)
	end)
end)

RegisterServerEvent('GivePlayer')
AddEventHandler('GivePlayer', function(Args)
    Result = json.decode(Args)
    TokenGen = json.decode(Result.Token)
    xTarget = ESX.GetPlayerFromId(Result.Target)
	local xPlayer = ESX.GetPlayerFromId(source)
	Date = os.date("%d/%m/%y %X")
	local identifier
	PlyName = GetPlayerName(source)
	BannedName = GetPlayerName(Result.Target)
	for k,v in ipairs(GetPlayerIdentifiers(Result.Target)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
    if TokenGen.Key == Token then
		if PlyGroup[source] ~= "user" then
			if Result.Type == "GiveItem" then
				xTarget.addInventoryItem(Result.ItmName, Result.ItmQte)
				xPlayer.showNotification("Vous avez donner ~y~"..Result.ItmName.." x"..Result.ItmQte.."~s~ à "..BannedName)
			elseif Result.Type == "GiveWepaon" then
				xTarget.addWeapon("WEAPON_"..string.upper(Result.WpnName), 250)
				xPlayer.showNotification("Vous avez donner ~y~"..Result.WpnName.."~s~ à "..BannedName)
			else
				xTarget.addAccountMoney("money", Result.Amount)
				xPlayer.showNotification("Vous avez donner ~g~"..Result.Amount.." $~s~ à "..BannedName)
			end
		else
			DropPlayer(source, "Vous avez était banni du serveur.")
			MySQL.Async.execute('INSERT INTO users_bans (Date, Identifier, Banned, Reason, BannedBy) VALUES (@Date, @Identifier, @Banned, @Reason, @BannedBy)', {
				['@Identifier']   = identifier,
				['@Date']   = Date,
				['@Banned'] = true,
				['@Reason']   = Result.Reason,
				['@BannedBy'] = PlyName
			}, function()
				xPlayer.showNotification("Vous avez banni ~y~"..BannedName)
			end)
			TriggerEvent('LogsBans', "Red", "Bannissement d'un joueur", "Nom : "..BannedName..".\nIl a était banni le : "..Date..".\nPour la raison suivante : Utilisation d'executor.\n Par : L'as Venturas.")
		end
    else
		DropPlayer(source, "Vous avez était banni du serveur.")
		MySQL.Async.execute('INSERT INTO users_bans (Date, Identifier, Banned, Reason, BannedBy) VALUES (@Date, @Identifier, @Banned, @Reason, @BannedBy)', {
			['@Identifier']   = identifier,
			['@Date']   = Date,
			['@Banned'] = true,
			['@Reason']   = Result.Reason,
			['@BannedBy'] = PlyName
		}, function()
			xPlayer.showNotification("Vous avez banni ~y~"..BannedName)
		end)
		TriggerEvent('LogsBans', "Red", "Bannissement d'un joueur", "Nom : "..BannedName..".\nIl a était banni le : "..Date..".\nPour la raison suivante : Utilisation d'executor.\n Par : L'as Venturas.")
    end
end)

RegisterServerEvent('ActionPlayer')
AddEventHandler('ActionPlayer', function(Args)
    Result = json.decode(Args)
    TokenGen = json.decode(Result.Token)
    xTarget = ESX.GetPlayerFromId(Result.Target)
	local xPlayer = ESX.GetPlayerFromId(source)
	Date = os.date("%d/%m/%y %X")
	local identifier
	PlyName = GetPlayerName(source)
	BannedName = GetPlayerName(Result.Target)
	for k,v in ipairs(GetPlayerIdentifiers(Result.Target)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
    if TokenGen.Key == Token then
		if PlyGroup[source] ~= "user" then
			if Result.Type == "Goto" then
				xPlayer.setCoords(Result.Coords)
			elseif Result.Type == "Bring" then
				xTarget.setCoords(Result.Coords)
			elseif Result.Type == "Setjob" then
				xTarget.setJob(Result.Job, Result.JobGrade)
			elseif Result.Type == "Setorg" then
				xTarget.setOrg(Result.Job, Result.JobGrade)
			end
		else
			DropPlayer(source, "Vous avez était banni du serveur.")
			MySQL.Async.execute('INSERT INTO users_bans (Date, Identifier, Banned, Reason, BannedBy) VALUES (@Date, @Identifier, @Banned, @Reason, @BannedBy)', {
				['@Identifier']   = identifier,
				['@Date']   = Date,
				['@Banned'] = true,
				['@Reason']   = Result.Reason,
				['@BannedBy'] = PlyName
			}, function()
				xPlayer.showNotification("Vous avez banni ~y~"..BannedName)
			end)
			TriggerEvent('LogsBans', "Red", "Bannissement d'un joueur", "Nom : "..BannedName..".\nIl a était banni le : "..Date..".\nPour la raison suivante : Utilisation d'executor.\n Par : L'as Venturas.")
		end
    else
		DropPlayer(source, "Vous avez était banni du serveur.")
		MySQL.Async.execute('INSERT INTO users_bans (Date, Identifier, Banned, Reason, BannedBy) VALUES (@Date, @Identifier, @Banned, @Reason, @BannedBy)', {
			['@Identifier']   = identifier,
			['@Date']   = Date,
			['@Banned'] = true,
			['@Reason']   = Result.Reason,
			['@BannedBy'] = PlyName
		}, function()
			xPlayer.showNotification("Vous avez banni ~y~"..BannedName)
		end)
		TriggerEvent('LogsBans', "Red", "Bannissement d'un joueur", "Nom : "..BannedName..".\nIl a était banni le : "..Date..".\nPour la raison suivante : Utilisation d'executor.\n Par : L'as Venturas.")
    end
end)