local Char = {}
local Handcuffed = {}
Token = nil
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
Citizen.CreateThread( function()
	for _,v in pairs (Org.Wl.JobList) do
		TriggerEvent('esx_society:registerSociety', v.JobName, v.JobLabel, "society_"..v.JobName, "society_"..v.JobName, "society_"..v.JobName, {type = 'public'})
	end
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

RegisterServerEvent("GetOrgToken")
AddEventHandler("GetOrgToken", function()
	TriggerClientEvent("SendOrgToken", source, Token)
end)

function GenerateToken(Length)
	math.randomseed(os.time())

	if Length > 0 then
		return GenerateToken(Length - 1) .. Char[math.random(1, #Char)]
	else
		return ""
	end
end

RegisterServerEvent('Org:EmbaucherEmployer')
AddEventHandler('Org:EmbaucherEmployer', function(target, job, grade)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)
	
	targetXPlayer.setJob2(job, grade)

	TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez ~g~recruté ' .. targetXPlayer.name .. '~w~.')
	TriggerClientEvent('esx:showNotification', target, 'Vous avez été ~g~embauché par ' .. sourceXPlayer.name .. '~w~.')
end)

RegisterServerEvent('Org:PromouvoirEmployer')
AddEventHandler('Org:PromouvoirEmployer', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if (targetXPlayer.job2.grade == tonumber(getMaximumGrade(sourceXPlayer.job2.name)) - 1) then
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous devez demander une autorisation du ~r~Gouvernement~w~.')
	else
		if (sourceXPlayer.job2.name == targetXPlayer.job2.name) then
			targetXPlayer.setJob(targetXPlayer.job2.name, tonumber(targetXPlayer.job2.grade) + 1)

			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez ~g~promu ' .. targetXPlayer.name .. '~w~.')
			TriggerClientEvent('esx:showNotification', target, 'Vous avez été ~g~promu par ' .. sourceXPlayer.name .. '~w~.')
		else
			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~r~l\'autorisation~w~.')
		end
	end
end)

RegisterServerEvent('Org:VirerEmployer')
AddEventHandler('Org:VirerEmployer', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if (sourceXPlayer.job2.name == targetXPlayer.job2.name) then
		targetXPlayer.setJob2('unemployed2', 0)

		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez ~r~viré ' .. targetXPlayer.name .. '~w~.')
		TriggerClientEvent('esx:showNotification', target, 'Vous avez été ~g~viré par ' .. sourceXPlayer.name .. '~w~.')
	else
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~r~l\'autorisation~w~.')
	end
end)

RegisterServerEvent('Org:RetrograderEmployer')
AddEventHandler('Org:RetrograderEmployer', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if (targetXPlayer.job2.grade == 0) then
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous ne pouvez pas plus ~r~rétrograder~w~ davantage.')
	else
		if (sourceXPlayer.job2.name == targetXPlayer.job2.name) then
			targetXPlayer.setJob2(targetXPlayer.job2.name, tonumber(targetXPlayer.job2.grade) - 1)

			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez ~r~rétrogradé ' .. targetXPlayer.name .. '~w~.')
			TriggerClientEvent('esx:showNotification', target, 'Vous avez été ~r~rétrogradé par ' .. sourceXPlayer.name .. '~w~.')
		else
			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~r~l\'autorisation~w~.')
		end
	end
end)

ESX.RegisterServerCallback('Org:getStockItems', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_'..xPlayer.job2.name, function(inventory)
		cb(inventory.items)
	end)
end)

RegisterServerEvent('Org:getStockItem')
AddEventHandler('Org:getStockItem', function(itemName, count)
  local xPlayer = ESX.GetPlayerFromId(source)
  	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_'..xPlayer.job2.name, function(inventory)
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

RegisterServerEvent('Org:putStockItems')
AddEventHandler('Org:putStockItems', function(itemName, count)
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

ESX.RegisterServerCallback('getStockItems2', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_'..xPlayer.job2.name, function(inventory)
		cb(inventory.items)
	end)
end)

RegisterServerEvent('getStockItem2')
AddEventHandler('getStockItem2', function(itemName, count)
  local xPlayer = ESX.GetPlayerFromId(source)
  	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_'..xPlayer.job2.name, function(inventory)
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

RegisterServerEvent('putStockItems2')
AddEventHandler('putStockItems2', function(itemName, count)
  	local xPlayer = ESX.GetPlayerFromId(source)
  	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_'..xPlayer.job2.name, function(inventory)
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