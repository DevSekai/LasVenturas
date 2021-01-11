local Char = {}
local InJob = {
	Count = 0,
	Multiplicator1 = 1,
	Multiplicator2 = 2,
	Multiplicator3 = 3,
	Multiplicator4 = 4,
	Multiplicator5 = 5,
	PriceReward = 500,
	Construct = false,
	Fisherman = false,
	Farmer = false,
}
local Handcuffed = {}
Token = nil
ESX = nil
InService = {
	["ambulance"] = {},
	["police"] = {},
	["mecano"] = {},
	["weazel"] = {},
	["unicorn"] = {},
	["tequilala"] = {},
	["gouv"] = {},
	["dog"] = {},
}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread( function()
	for _,v in pairs (Job.Wl.JobList) do
		TriggerEvent('esx_society:registerSociety', v.JobName, v.JobLabel, "society_"..v.JobName, "society_"..v.JobName, "society_"..v.JobName, {type = 'public'})
		TriggerEvent('esx_phone:registerNumber', v.JobName, v.JobName, true, true)
	end
end)

IsDead = {} -- Je créer une table vide pour contenir les mort coté server "inviolable"

ESX.RegisterServerCallback('Players:getDeathStatus', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	if IsDead[xPlayer.identifier] then -- Si L'identifier est présent dans la table et qu'il est sur TRUE
		cb(IsDead[xPlayer.identifier]) -- Return TRUE
	end
end)

RegisterServerEvent("Players:setDeathStatus")
AddEventHandler("Players:setDeathStatus", function(State)
	local xPlayer = ESX.GetPlayerFromId(source)
	IsDead[xPlayer.identifier] = State -- J'insert l'identifier sur true dans la bdd
end)

for i = 48,  57 do table.insert(Char, string.char(i)) end
for i = 65,  90 do table.insert(Char, string.char(i)) end
for i = 97, 122 do table.insert(Char, string.char(i)) end

Citizen.CreateThread(function ()
	while Token == nil do
		Token = GenerateToken(12)
		Citizen.Wait(0)
	end
end)

RegisterServerEvent("GetJobToken")
AddEventHandler("GetJobToken", function()
	TriggerClientEvent("SendJobToken", source, Token)
end)

function GenerateToken(Length)
	math.randomseed(os.time())

	if Length > 0 then
		return GenerateToken(Length - 1) .. Char[math.random(1, #Char)]
	else
		return ""
	end
end

ESX.RegisterServerCallback('MissionState', function(source, cb, Type)
	PlySource = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local Group = xPlayer.getGroup()
	if not InJob[PlySource] then
		InJob[PlySource] = InJob
	end
	if Type == "Ouvrier" then
		cb(InJob[PlySource].Construct)
	elseif Type == "Pêcheur" then
		cb(InJob[PlySource].Fisherman)
	elseif Type == "Fermier" then
		cb(InJob[PlySource].Farmer)
	end
end)

RegisterServerEvent("StartJob")
AddEventHandler("StartJob", function(Type)
	PlySource = source
	xPlayer = ESX.GetPlayerFromId(PlySource)
	if Type == "Ouvrier" then
		InJob[PlySource].Construct = true
		Txt = "Vous êtes temporairement : ~y~"..Type.."~s~."
	elseif Type == "Pêcheur" then
		InJob[PlySource].Fisherman = true
		Txt = "Vous êtes temporairement : ~y~"..Type.."~s~."
	elseif Type == "Fermier" then
		InJob[PlySource].Farmer = true
		Txt = "Vous êtes temporairement : ~y~"..Type.."~s~."
	end
	xPlayer.showNotification(Txt)
	xPlayer.showNotification("Une tâche vous a été attitré.")
	TriggerClientEvent('StartJob', PlySource, Type)
end)

RegisterServerEvent("StopJob")
AddEventHandler("StopJob", function(Type, Count)
	PlySource = source
	xPlayer = ESX.GetPlayerFromId(PlySource)
	if Type == "Ouvrier" then
		InJob[PlySource].Construct = false
		Txt = "Vous avez fini votre mission de  : ~y~"..Type.."~s~."
	elseif Type == "Pêcheur" then
		InJob[PlySource].Fisherman = false
		Txt = "Vous avez fini votre mission de  : ~y~"..Type.."~s~."
	elseif Type == "Fermier" then
		InJob[PlySource].Farmer = false
		Txt = "Vous avez fini votre mission de  : ~y~"..Type.."~s~."
	end
	xPlayer.showNotification(Txt)
	if InJob[PlySource].Count <= 10 then
		InJob[PlySource].Count = 0
		xPlayer.showNotification("Vous n'avez pas assez travailler pour recevoir une prime.")
	elseif InJob[PlySource].Count <= 20 then
		InJob[PlySource].Count = 0
		xPlayer.addMoney(Multiplicator2 * InJob.PriceReward)
		xPlayer.showNotification("Vous avez reçut une prime de : ~g~"..(InJob.PriceReward * Multiplicator2).." $~s~.")
	elseif InJob[PlySource].Count <= 30 then
		InJob[PlySource].Count = 0
		xPlayer.addMoney(Multiplicator3 * InJob.PriceReward)
		xPlayer.showNotification("Vous avez reçut une prime de : ~g~"..(InJob.PriceReward * Multiplicator3).." $~s~.")
	elseif InJob[PlySource].Count <= 40 then
		InJob[PlySource].Count = 0
		xPlayer.addMoney(Multiplicator4 * InJob.PriceReward)
		xPlayer.showNotification("Vous avez reçut une prime de : ~g~"..(InJob.PriceReward * Multiplicator4).." $~s~.")
	else
		InJob[PlySource].Count = 0
		xPlayer.addMoney(Multiplicator5 * InJob.PriceReward)
		xPlayer.showNotification("Vous avez reçut une prime de : ~g~"..(InJob.PriceReward * Multiplicator5).." $~s~.")
	end
	TriggerClientEvent('StopJob', PlySource, Type)
end)

RegisterServerEvent("CountJob")
AddEventHandler("CountJob", function()
	PlySource = source
	xPlayer = ESX.GetPlayerFromId(PlySource)
	InJob[PlySource].Count = InJob[PlySource].Count + 1
	xPlayer.showNotification("Vous avez accomplie votre tâche, une autre vous a été attitré.")
end)

RegisterServerEvent('EmbaucherEmployer')
AddEventHandler('EmbaucherEmployer', function(target, job, grade)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)
	
	targetXPlayer.setJob(job, grade)

	TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez ~g~recruté ' .. targetXPlayer.name .. '~w~.')
	TriggerClientEvent('esx:showNotification', target, 'Vous avez été ~g~embauché par ' .. sourceXPlayer.name .. '~w~.')
end)

RegisterServerEvent('PromouvoirEmployer')
AddEventHandler('PromouvoirEmployer', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if (targetXPlayer.job.grade == tonumber(getMaximumGrade(sourceXPlayer.job.name)) - 1) then
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous devez demander une autorisation du ~r~Gouvernement~w~.')
	else
		if (sourceXPlayer.job.name == targetXPlayer.job.name) then
			targetXPlayer.setJob(targetXPlayer.job.name, tonumber(targetXPlayer.job.grade) + 1)

			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez ~g~promu ' .. targetXPlayer.name .. '~w~.')
			TriggerClientEvent('esx:showNotification', target, 'Vous avez été ~g~promu par ' .. sourceXPlayer.name .. '~w~.')
		else
			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~r~l\'autorisation~w~.')
		end
	end
end)

RegisterServerEvent('VirerEmployer')
AddEventHandler('VirerEmployer', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if (sourceXPlayer.job.name == targetXPlayer.job.name) then
		targetXPlayer.setJob('unemployed', 0)

		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez ~r~viré ' .. targetXPlayer.name .. '~w~.')
		TriggerClientEvent('esx:showNotification', target, 'Vous avez été ~g~viré par ' .. sourceXPlayer.name .. '~w~.')
	else
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~r~l\'autorisation~w~.')
	end
end)

RegisterServerEvent('RetrograderEmployer')
AddEventHandler('RetrograderEmployer', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if (targetXPlayer.job.grade == 0) then
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous ne pouvez pas plus ~r~rétrograder~w~ davantage.')
	else
		if (sourceXPlayer.job.name == targetXPlayer.job.name) then
			targetXPlayer.setJob(targetXPlayer.job.name, tonumber(targetXPlayer.job.grade) - 1)

			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez ~r~rétrogradé ' .. targetXPlayer.name .. '~w~.')
			TriggerClientEvent('esx:showNotification', target, 'Vous avez été ~r~rétrogradé par ' .. sourceXPlayer.name .. '~w~.')
		else
			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~r~l\'autorisation~w~.')
		end
	end
end)

ESX.RegisterServerCallback('getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory
	cb({
	  items = items
	})
end)

ESX.RegisterServerCallback('getStockItems', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_'..xPlayer.job.name, function(inventory)
		cb(inventory.items)
	end)
end)

RegisterServerEvent('getStockItem')
AddEventHandler('getStockItem', function(itemName, count)
  local xPlayer = ESX.GetPlayerFromId(source)
  	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_'..xPlayer.job.name, function(inventory)
    	local item = inventory.getItem(itemName)
    	if item.count >= count then
      		inventory.removeItem(itemName, count)
      		xPlayer.addInventoryItem(itemName, count)
    	else
    	  	TriggerClientEvent('esx:showNotification', xPlayer.source, 'quantity_invalid')
    	end
    	TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez retirer ~o~'..count..' ~y~'..item.label.."~s~.")
  	end)
end)

RegisterServerEvent('putStockItems')
AddEventHandler('putStockItems', function(itemName, count)
  	local xPlayer = ESX.GetPlayerFromId(source)
  	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_'..xPlayer.job.name, function(inventory)
    	local item = inventory.getItem(itemName)
    	if item.count >= 0 then
      		xPlayer.removeInventoryItem(itemName, count)
      		inventory.addItem(itemName, count)
    	elseif count < item.count then
     	 	TriggerClientEvent('esx:showNotification', xPlayer.source, 'quantity_invalid')
    	end
    	TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez déposer ~o~'..count..' ~y~'..item.label.."~s~.")
  	end)
end)

RegisterServerEvent('Job:BuyItems')
AddEventHandler('Job:BuyItems', function(item, count)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerMoney = xPlayer.getMoney()
	if item.Type == "Items" then
		local ItemQuantity = xPlayer.getInventoryItem(item.Value).count
		local Price2 = item.Price * count
		if Price2 <= playerMoney then
			if ItemQuantity <= item.Limite - 1 then
				xPlayer.addInventoryItem(item.Value, count)
                xPlayer.removeAccountMoney("money", Price2)
				TriggerClientEvent('esx:showNotification', source, 'Vous avez acheter : ~o~x'..count..' ' .. item.Label.."~s~.")
			else
				TriggerClientEvent('esx:showNotification', source, 'Vous ~r~n\'avez pas assez de place dans votre inventaire~s~ pour porter plus de ~p~' .. item.Label)
			end
		else
			TriggerClientEvent('esx:showNotification', source, 'Vous ~r~n\'avez pas assez d\'argent.')
		end
	else
		local Price2 = item.Price
		if Price2 <= playerMoney then
			xPlayer.addWeapon("weapon_"..item.Value, 250)
			xPlayer.removeAccountMoney("money", Price2)
			TriggerClientEvent('esx:showNotification', source, 'Vous avez acheter : '..ESX.GetWeaponLabel("weapon_"..item.Value)..' ~p~')
		else
			TriggerClientEvent('esx:showNotification', source, 'Vous ~r~n\'avez pas assez d\'argent.')
		end
	end
end)

RegisterServerEvent('HealPly')
AddEventHandler('HealPly', function(Trg, Admin)
	local xPlayer = ESX.GetPlayerFromId(source)
	if not Admin then
		local ItemQuantity = xPlayer.getInventoryItem("bandage").count
		if ItemQuantity >= 1 then
			xPlayer.removeInventoryItem("bandage", 1)
			TriggerClientEvent("HealPly", Trg)
			TriggerClientEvent('esx:showNotification', Trg, "Vous avez était : ~o~Soigner~s~.")
			TriggerClientEvent('esx:showNotification', source, "Vous avez : ~o~Soigner~s~ la personne.")
		else
			TriggerClientEvent('esx:showNotification', source, "Vous ~r~n'avez pas~s~ de ~o~Bandage~s~ sur vous.")
		end
	else
		if PlayerData.group ~= "users" then
			TriggerClientEvent("HealPly", Trg, GetPlayerPed(Trg))
		end
	end
end)

RegisterServerEvent('RevivePly')
AddEventHandler('RevivePly', function(Trg, Admin)
	_source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xTaget = ESX.GetPlayerFromId(Trg)	
	local xTrgPed = GetPlayerPed(Trg)

	if not Admin then
		local ItemQuantity = xPlayer.getInventoryItem("medikit").count
		if ItemQuantity >= 1 then
			xPlayer.removeInventoryItem("medikit", 1)
			IsDead[xTaget.identifier] = false
			TriggerClientEvent("Ply:RevivePly", _source, GetPlayerPed(Trg))
			Citizen.Wait(13500)	
			TriggerClientEvent("Trg:RevivePly", Trg, GetPlayerPed(Trg))
			TriggerClientEvent('esx:showNotification', _source, "Vous avez : ~o~RÃ©animer~s~ la personne.")
		else
			TriggerClientEvent('esx:showNotification', _source, "Vous ~r~n'avez pas~s~ de ~o~DÃ©fibrillateur~s~ sur vous.")
		end
	else
		if PlayerData.group ~= "users" then
			TriggerClientEvent("RevivePly", Trg, GetPlayerPed(Trg))
		end
	end
end)

RegisterServerEvent('Commands:Revive')
AddEventHandler('Commands:Revive', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	isDead[xPlayer.identifier] = false
end)

ESX.RegisterServerCallback('GetJobReport', function(source, cb, Trg)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Trg)
	if xPlayer.job.name == "ambulance" or xPlayer.job.name == "police" then
		MySQL.Async.fetchAll(
			'SELECT * FROM '..xPlayer.job.name..'_report WHERE Identifier = @Identifier', {
				['@Identifier'] = xTarget.identifier
			},
		function(Data)
			cb(Data)
		end)
	end
end)

RegisterServerEvent('NewJobReport')
AddEventHandler('NewJobReport', function(Trg, Date, Report)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Trg)
	if xPlayer.job.name == "ambulance" or xPlayer.job.name == "police" then
		MySQL.Async.execute('INSERT INTO '..xPlayer.job.name..'_report (Identifier, Date, Report) VALUES (@Identifier, @Date, @Report)', {
			['@Identifier']   = xTarget.identifier,
			['@Date']   = Date,
			['@Report'] = Report
		}, function()
			xPlayer.showNotification("Vous avez écrit dans le dossier de : ~o~"..xTarget.name.."~s~.")
		end)
	end
end)

ESX.RegisterServerCallback('getOtherPlayerData', function(source, cb, Trg)
	local xPlayer = ESX.GetPlayerFromId(Trg)
	local data = {
		name       = GetPlayerName(Trg),
		job        = xPlayer.job,
		inventory  = xPlayer.inventory,
		accounts   = xPlayer.accounts,
		weapons    = xPlayer.loadout
	}
	cb(data)
end)

RegisterServerEvent('Handcuffed')
AddEventHandler('Handcuffed', function(Trg)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Trg)
	local xPlayerCoords = GetEntityCoords(GetPlayerPed(source))
	local xTargetCoords = GetEntityCoords(GetPlayerPed(Trg))
	local xCoordsX = xPlayerCoords.x - xTargetCoords.x
	local xCoordsY = xPlayerCoords.y - xTargetCoords.y
	if (xCoordsX - xCoordsY) < 1.5 then
		if xPlayer.job.name == "police" or xPlayer.job2.name ~= "unemployed2" then
			TriggerClientEvent('Handcuffed', Trg)
		end
	end
end)

RegisterServerEvent('InCarOut')
AddEventHandler('InCarOut', function(Trg)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Trg)
	local xPlayerCoords = GetEntityCoords(GetPlayerPed(source))
	local xTargetCoords = GetEntityCoords(GetPlayerPed(Trg))
	local xCoordsX = xPlayerCoords.x - xTargetCoords.x
	local xCoordsY = xPlayerCoords.y - xTargetCoords.y
	if (xCoordsX - xCoordsY) < 1.5 then
		if xPlayer.job.name == "police" or xPlayer.job.name == "ambulance" or xPlayer.job2.name ~= "unemployed2" then
			TriggerClientEvent('InCarOut', Trg)
		end
	end
end)

ESX.RegisterServerCallback('getOtherPlayerData', function(source, cb, Trg)
	local xPlayer = ESX.GetPlayerFromId(Trg)
	local data = {
		name       = GetPlayerName(Trg),
		job        = xPlayer.job,
		inventory  = xPlayer.inventory,
		accounts   = xPlayer.accounts,
		weapons    = xPlayer.loadout
	}
	cb(data)
end)

ESX.RegisterServerCallback('getIdentity', function(source, cb, Trg)
	local xTarget = ESX.GetPlayerFromId(Trg)
	MySQL.Async.fetchAll('SELECT Sexe, FirstName, LastName, Birthday FROM users WHERE Identifier = @Identifier',  {
		['@Identifier'] = xTarget.identifier
	}, function(Result)
		for _,v in pairs (Result) do
			Data = {
				Sexe = v.Sexe,
				FirstName = v.FirstName,
				LastName = v.LastName,
				Birthday = v.Birthday,
				Job = xTarget.job.label
			}
		end
		cb(Data)
	end)
end)

ESX.RegisterServerCallback('getCarOwner', function(source, cb, Plate)
	Identifier = nil
	Ensure = nil
	MySQL.Async.fetchAll('SELECT Identifier, Ensure FROM users_vehicles WHERE Plate = @Plate', {
		['@Plate'] = Plate
	}, function(Result)
		if Result then
			for _,v in pairs (Result) do
				Identifier = v.Identifier
				Ensure = v.Ensure
			end
			MySQL.Async.fetchAll('SELECT FirstName, LastName FROM users WHERE Identifier = @Identifier',  {
				['@Identifier'] = Identifier
			}, function(Result2)
				if Result2 then
					for _,v in pairs (Result2) do
						Data = {
							FirstName = v.FirstName,
							LastName = v.LastName,
							Plate = Plate,
							Ensured = Ensure,
						}
					end
					cb(Data)
				end
			end)
		else
			cb(Result)
		end
	end)
end)

RegisterServerEvent('JobRenfort')
AddEventHandler('JobRenfort', function(Coords, Level)
	local _source = source
	local _raison = raison
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()

	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'police' then
			TriggerClientEvent('JobRenfort', xPlayers[i], Coords, Level)
		end
	end
end)

RegisterServerEvent('RefreshPrice')
AddEventHandler('RefreshPrice', function(Price)
    local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('RefreshPrice', source, Price)
end)

ESX.RegisterServerCallback('BuyMods', function(source, cb, Price, Plate, Props)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()
	if playerMoney >= Price then
		MySQL.Async.fetchScalar('SELECT Identifier FROM users_vehicles WHERE Plate = @Plate', {
			['@Plate'] = Plate
		}, function(Result)
			if Result then
				MySQL.Async.execute(
					'UPDATE users_vehicles SET Props = @Props WHERE Plate=@Plate',
				{
					['@Plate'] = Plate,
					['@Props'] = Props
				})
			end
			xPlayer.removeMoney(Price)
			cb(true)
		end)
	else
		TriggerClientEvent('esx:showNotification', source, 'Vous n\'avais pas assez d\'argent.')
		cb(false)
	end
end)

RegisterServerEvent('Job:Annonce')
AddEventHandler('Job:Annonce', function(Desc)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == "weazel" then
		TriggerClientEvent("Weazel:Annonce", -1, Desc)
	elseif xPlayer.job.name == "gouv" then
		TriggerClientEvent("Gouv:Annonce", -1, Desc)
	end
end)

RegisterServerEvent('OnDutty')
AddEventHandler('OnDutty', function(State)
	Ped = GetPlayerPed(source)
	Name = GetPlayerName(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()

	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == xPlayer.job.name then
			if State then
				if json.encode(InService[xPlayer.job.name]) == "[]" then
					TriggerClientEvent("Dutty:DeleteShop", -1, xPlayer.job.name)
				end
				table.insert(InService[xPlayer.job.name], {Player = source})
			else
				for _,v in pairs(InService[xPlayer.job.name]) do
					if v.Player == source then
						table.remove(InService[xPlayer.job.name], _)
					end
				end
				if json.encode(InService[xPlayer.job.name]) == "[]" then
					TriggerClientEvent('esx:showNotification', -1, "Il n'y a plus d'employÃ© : ~o~"..xPlayer.job.label.."~s~ en service")
					TriggerClientEvent("Dutty:CreateShop", -1, xPlayer.job.name)
				end
			end
			TriggerClientEvent("OnDutty", -1, Ped, State, xPlayer.job.label, Name)
		end
	end
end)

RegisterServerEvent('Dutty:GetState')
AddEventHandler('Dutty:GetState', function(JobName)
	if json.encode(InService[JobName]) == "[]" then
		TriggerClientEvent("Dutty:CreateShop", source, JobName)
	end
end)

RegisterServerEvent('Job:Craft')
AddEventHandler('Job:Craft', function(Items)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == "dog" then
		if Items.Value == "frite" then
			local ItemQuantity = xPlayer.getInventoryItem("patate").count
			if ItemQuantity >= 1 then
				TriggerClientEvent("Job:Craft", source, Items)
				Citizen.Wait(Items.Time)
				xPlayer.removeInventoryItem("patate", 1)
				xPlayer.addInventoryItem(Items.Value, 1)
			else
				xPlayer.showNotification("Vous n'avez pas assez de pommes de terre.")
			end
		elseif Items.Value == "hotdog" then
			local ItemQuantity = xPlayer.getInventoryItem("saucisse").count
			if ItemQuantity >= 1 then
				local ItemQuantity2 = xPlayer.getInventoryItem("hotdogbread").count
				if ItemQuantity2 >= 1 then
					TriggerClientEvent("Job:Craft", source, Items)
					Citizen.Wait(Items.Time)
					xPlayer.removeInventoryItem("saucisse", 1)
					xPlayer.removeInventoryItem("hotdogbread", 1)
					xPlayer.addInventoryItem(Items.Value, 1)
				else
					xPlayer.showNotification("Vous n'avez pas assez de pain à hot-dog.")
				end
			else
				xPlayer.showNotification("Vous n'avez pas assez de saucisse.")
			end
		else
			TriggerClientEvent("Job:Craft", source, Items)
			Citizen.Wait(Items.Time)
			xPlayer.addInventoryItem(Items.Value, 1)
		end
	elseif xPlayer.job.name == "tequilala" then
		if Items.Value == "jeargerbomb" then
			local ItemQuantity = xPlayer.getInventoryItem("redbull").count
			if ItemQuantity >= 1 then
				TriggerClientEvent("Job:Craft", source, Items)
				Citizen.Wait(Items.Time)
				xPlayer.removeInventoryItem("redbull", 1)
				xPlayer.addInventoryItem(Items.Value, 1)
			else
				xPlayer.showNotification("Vous n'avez pas assez de redbull.")
			end
		elseif Items.Value == "gintonic" then
			local ItemQuantity = xPlayer.getInventoryItem("tonic").count
			if ItemQuantity >= 1 then
				TriggerClientEvent("Job:Craft", source, Items)
				Citizen.Wait(Items.Time)
				xPlayer.removeInventoryItem("tonic", 1)
				xPlayer.addInventoryItem(Items.Value, 1)
			else
				xPlayer.showNotification("Vous n'avez pas assez de tonic.")
			end
		else
			TriggerClientEvent("Job:Craft", source, Items)
			Citizen.Wait(Items.Time)
			xPlayer.addInventoryItem(Items.Value, 1)
		end
	elseif xPlayer.job.name == "unicorn" then
		if Items.Value == "kirr" then
			local ItemQuantity = xPlayer.getInventoryItem("liqueur").count
			if ItemQuantity >= 1 then
				TriggerClientEvent("Job:Craft", source, Items)
				Citizen.Wait(Items.Time)
				xPlayer.removeInventoryItem("liqueur", 1)
				xPlayer.addInventoryItem(Items.Value, 1)
			else
				xPlayer.showNotification("Vous n'avez pas assez de liqueur.")
			end
		elseif Items.Value == "sexonthebeatch" then
			local ItemQuantity = xPlayer.getInventoryItem("sirop").count
			if ItemQuantity >= 1 then
				TriggerClientEvent("Job:Craft", source, Items)
				Citizen.Wait(Items.Time)
				xPlayer.removeInventoryItem("sirop", 1)
				xPlayer.addInventoryItem(Items.Value, 1)
			else
				xPlayer.showNotification("Vous n'avez pas assez de sirop.")
			end
		else
			TriggerClientEvent("Job:Craft", source, Items)
			Citizen.Wait(Items.Time)
			xPlayer.addInventoryItem(Items.Value, 1)
		end
	end
end)