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
Token = nil
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
TriggerEvent('esx_society:registerSociety', 'ambulance', 'EMS', 'society_ambulance', 'society_ambulance', 'society_ambulance', {type = 'public'})
TriggerEvent('esx_society:registerSociety', 'police', 'LSPD', 'society_police', 'society_police', 'society_police', {type = 'public'})

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
	local ItemQuantity = xPlayer.getInventoryItem(item.Value).count
	if item.Type == "Items" then
		local Price2 = item.Price * count
		if Price2 >= playerMoney then
			if ItemQuantity <= item.Limite - 1 then
				xPlayer.addInventoryItem(item.Value, count)
				TriggerClientEvent('esx:showNotification', source, 'Vous avez acheter : ~o~x'..count..' ' .. item.Label.."~s~.")
			else
				TriggerClientEvent('esx:showNotification', source, 'Vous ~r~n\'avez pas assez de place dans votre inventaire~s~ pour porter plus de ~p~' .. item.Label)
			end
		else
			TriggerClientEvent('esx:showNotification', source, 'Vous ~r~n\'avez pas assez d\'argent.')
		end
	else
		local Price2 = item.Price
		if Price2 >= playerMoney then
			xPlayer.addWeapon(item.Value, 250)
			TriggerClientEvent('esx:showNotification', source, 'Vous avez acheter : '..ESX.GetWeaponLabel(item.Value)..' ~p~')
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
	local xPlayer = ESX.GetPlayerFromId(source)
	if not Admin then
		local ItemQuantity = xPlayer.getInventoryItem("bandage").count
		if ItemQuantity >= 1 then
			xPlayer.removeInventoryItem("bandage", 1)
			TriggerClientEvent("RevivePly", Trg)
			TriggerClientEvent('esx:showNotification', Trg, "Vous avez était : ~o~Réanimer~s~.")
			TriggerClientEvent('esx:showNotification', source, "Vous avez : ~o~Réanimer~s~ la personne.")
		else
			TriggerClientEvent('esx:showNotification', source, "Vous ~r~n'avez pas~s~ de ~o~Défibrillateur~s~ sur vous.")
		end
	else
		if PlayerData.group ~= "users" then
			TriggerClientEvent("RevivePly", Trg, GetPlayerPed(Trg))
		end
	end
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