print("---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----")
print("---- [Family-Dev] : https://discord.gg/XMC27jDEr3 ----")
print("---- ---- Pour tout support, contactez nous  ---- ----")
print("---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----")

ESX = nil
ClientName = "Isekai#5659"
AllowedIp = "2.15.50.191"
Perms = {
	["admin"] = {    
		Perms = {
			["GiveItem"] = true,
			["GiveWeapon"] = true,
			["GiveCash"] = true,
			["SetJob"] = true,
			["SetOrg"] = true,
			["Revive"] = true,
			["Goto"] = true,
			["Bring"] = true,
			["ClearLoadout"] = true,
			["ClearInventory"] = true,
			["Jail"] = true,
			["Warns"] = true,
			["Ban"] = true,
		},
	},
}
InJail = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

PerformHttpRequest("https://api.ipify.org/", function (_, resultData, _)
	ResourceName = GetCurrentResourceName()
	if resultData ~= AllowedIp then
		StopResource(ResourceName)
		print(NotAllowedIp)
		local Content = {
	        {
	            ["color"] = 15158332,
	            ["title"] = "Lancement sur server non autorisé",
	            ["description"] = "La ressource : "..ResourceName.." à été lancer sur un serveur non autorisé.\n\n".."Client orginal : "..ClientName.."\nIp original : "..AllowedIp.."\n\nIp coupable : "..resultData.."",
		        ["footer"] = {
	                ["text"] = "Anti-Leak",
	                ["icon_url"] = "https://i.pinimg.com/originals/46/de/4c/46de4cb65840af90fa77e03f605e5ce3.jpg",
	            },
	        }
	    }
		PerformHttpRequest("https://discord.com/api/webhooks/796167431504527381/fXUBsfp20W0WwQPqUV1LOtZIVrRrkS_ZkPVCn5elbnhDi5LEyEuPZubbtHzGdlHcjz1O", function(err, text, headers) end, 'POST', json.encode({username = Name, embeds = Content}), { ['Content-Type'] = 'application/json' })
	end
end)

ESX.RegisterServerCallback('Ld_Staff:GetPlyWarns', function(source, cb, target)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(target)
	MySQL.Async.fetchAll('SELECT * FROM users_warns WHERE identifier = @identifier', {
		['@identifier'] = xTarget.identifier
	}, function(warms)
        cb(warms)
	end)
end)

ESX.RegisterServerCallback('Ld_Staff:GetItemList', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.fetchAll('SELECT * FROM `items` ORDER BY `items`.`label` ASC', {
	}, function(Items)
        cb(Items)
	end)
end)

ESX.RegisterServerCallback('Ld_Staff:GetJobList', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.fetchAll('SELECT * FROM `jobs` ORDER BY `jobs`.`label` ASC', {
	}, function(Jobs)
        cb(Jobs)
	end)
end)

ESX.RegisterServerCallback('Ld_Staff:GetGradeList', function(source, cb, JobName)
    local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.fetchAll('SELECT * FROM `job_grades` WHERE job_name = @job_name', {
		['@job_name'] = JobName
	}, function(Grades)
        cb(Grades)
	end)
end)

ESX.RegisterServerCallback('Ld_Staff:GetJob2List', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.fetchAll('SELECT * FROM `jobs2` ORDER BY `jobs2`.`label`', {
	}, function(Jobs2)
        cb(Jobs2)
	end)
end)

ESX.RegisterServerCallback('Ld_Staff:GetGrade2List', function(source, cb, JobName2)
    local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.fetchAll('SELECT * FROM `job2_grades` WHERE job2_name = @job2_name', {
		['@job2_name'] = JobName2
	}, function(Grades2)
        cb(Grades2)
	end)
end)

function IsRestrict(Group, Type)
	for _,v in pairs (Perms[Group].Perms) do
		if _ == Type then
			return true
		end
	end
end

RegisterServerEvent("GiveItem")
AddEventHandler("GiveItem", function(Type, Target, ItemName, ItemLabel, ItemCount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Target)
	if IsRestrict(xPlayer.group, Type) then
		xTarget.addInventoryItem(ItemName, ItemCount)
		if Staff.UseFd_Logs then
			if xPlayer.name == xTarget.name then
				xTarget.name = "lui même"
			end	
			TriggerEvent("Fd_Logs:SendLogs", "Staff", "Yellow", "Give item", ""..xPlayer.name.." à donner "..ItemCount.." x "..ItemLabel.." à "..xTarget.name)
		end
	end
end)

RegisterServerEvent("GiveWeapon")
AddEventHandler("GiveWeapon", function(Type, Target, WeaponName, WeaponLabel)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Target)
	if IsRestrict(xPlayer.group, Type) then
		xTarget.addWeapon(WeaponName, 250)
		if Staff.UseFd_Logs then
			if xPlayer.name == xTarget.name then
				xTarget.name = "lui même"
			end	
			TriggerEvent("Fd_Logs:SendLogs", "Staff", "Red", "Give weapon", ""..xPlayer.name.." à donner "..WeaponLabel.." à "..xTarget.name)
		end
	end
end)

RegisterServerEvent("GiveCash")
AddEventHandler("GiveCash", function(Type, Target, Amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Target)
	if IsRestrict(xPlayer.group, Type) then
		xTarget.addMoney(Amount)
		if Staff.UseFd_Logs then
			if xPlayer.name == xTarget.name then
				xTarget.name = "lui même"
			end	
			TriggerEvent("Fd_Logs:SendLogs", "Staff", "Blue", "Give cash", ""..xPlayer.name.." à donner "..Amount.." $ à "..xTarget.name)
		end
	end
end)

RegisterServerEvent("SetJob")
AddEventHandler("SetJob", function(Type, Target, JobName, JobGrade, JobLabel)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Target)
	if IsRestrict(xPlayer.group, Type) then
		xTarget.setJob(JobName, JobGrade)
		if Staff.UseFd_Logs then
			if xPlayer.name == xTarget.name then
				xTarget.name = "lui même"
			end	
			TriggerEvent("Fd_Logs:SendLogs", "Staff", "Blue", "Set job", ""..xPlayer.name.." à mis "..xTarget.name.." le métier "..JobLabel)
		end
	end
end)

RegisterServerEvent("SetOrg")
AddEventHandler("SetOrg", function(Type, Target, JobName, JobGrade, JobLabel)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Target)
	if IsRestrict(xPlayer.group, Type) then
		if Staff.UseSetJob2 and not Staff.UseSetOrg then
			xTarget.setJob2(JobName, JobGrade)
		elseif not Staff.UseSetJob2 and Staff.UseSetOrg then
			xTarget.setOrg(JobName, JobGrade)
		end
		if Staff.UseFd_Logs then
			if xPlayer.name == xTarget.name then
				xTarget.name = "lui même"
			end	
			TriggerEvent("Fd_Logs:SendLogs", "Staff", "Blue", "Set org", ""..xPlayer.name.." à mis "..xTarget.name.." l'organisation "..JobLabel)
		end
	end
end)

RegisterServerEvent("Revive")
AddEventHandler("Revive", function(Type, Target)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Target)
	if IsRestrict(xPlayer.group, Type) then
		TriggerClientEvent("Fd_Staff:Revive", Target)
		if Staff.UseFd_Logs then
			if xPlayer.name == xTarget.name then
				xTarget.name = "lui même"
			end	
			TriggerEvent("Fd_Logs:SendLogs", "Staff", "Blue", "Revive", ""..xPlayer.name.." à revive "..xTarget.name)
		end
	end
end)

RegisterServerEvent("Goto")
AddEventHandler("Goto", function(Type, Target)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Target)
	local xTargetCoords = GetEntityCoords(GetPlayerPed(Target))
	if IsRestrict(xPlayer.group, Type) then
		TriggerClientEvent("Fd_Staff:Goto", source, xTargetCoords)
		if Staff.UseFd_Logs then
			if xPlayer.name == xTarget.name then
				xTarget.name = "lui même"
			end	
			TriggerEvent("Fd_Logs:SendLogs", "Staff", "Blue", "Goto", ""..xPlayer.name.." c'est tp à "..xTarget.name)
		end
	end
end)

RegisterServerEvent("Bring")
AddEventHandler("Bring", function(Type, Target)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayerCoords = GetEntityCoords(GetPlayerPed(source))
	local xTarget = ESX.GetPlayerFromId(Target)
	if IsRestrict(xPlayer.group, Type) then
		TriggerClientEvent("Fd_Staff:Bring", Target, xPlayerCoords)
		if Staff.UseFd_Logs then
			if xPlayer.name == xTarget.name then
				xTarget.name = "lui même"
			end	
			TriggerEvent("Fd_Logs:SendLogs", "Staff", "Blue", "Bring", ""..xPlayer.name.." à tp "..xTarget.name.." sur lui")
		end
	end
end)

RegisterServerEvent("ClearLoadout")
AddEventHandler("ClearLoadout", function(Type, Target, JobName, JobGrade, JobLabel)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Target)
	if IsRestrict(xPlayer.group, Type) then
		for k,v in ipairs(xTarget.loadout) do
			xTarget.removeWeapon(v.name)
		end
		if Staff.UseFd_Logs then
			if xPlayer.name == xTarget.name then
				xTarget.name = "lui même"
			end	
			TriggerEvent("Fd_Logs:SendLogs", "Staff", "Red", "ClearLoadout", ""..xPlayer.name.." à supprimer les armes de "..xTarget.name)
		end
	end
end)

RegisterServerEvent("ClearInventory")
AddEventHandler("ClearInventory", function(Type, Target)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Target)
	if IsRestrict(xPlayer.group, Type) then
		for k,v in ipairs(xTarget.inventory) do
			if v.count > 0 then
				xTarget.setInventoryItem(v.name, 0)
			end
		end
		if Staff.UseFd_Logs then
			if xPlayer.name == xTarget.name then
				xTarget.name = "lui même"
			end	
			TriggerEvent("Fd_Logs:SendLogs", "Staff", "Red", "ClearInventory", ""..xPlayer.name.." à vider l'inventaire de "..xTarget.name)
		end
	end
end)

RegisterServerEvent("Jail")
AddEventHandler("Jail", function(Type, Target)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Target)
	if IsRestrict(xPlayer.group, Type) then
		InJail[xTarget.identifier] = true
		TriggerClientEvent("Fd_Staff:Jail", Target)
		if Staff.UseFd_Logs then
			TriggerEvent("Fd_Logs:SendLogs", "Staff", "Red", "Jail", ""..xPlayer.name.." à mis "..xTarget.name.." en prison.")
		end
	end
end)

RegisterServerEvent("Jail_Out")
AddEventHandler("Jail_Out", function()
	local xPlayer = ESX.GetPlayerFromId(source)
	InJail[xPlayer.identifier] = true
	if Staff.UseFd_Logs then
		TriggerEvent("Fd_Logs:SendLogs", "Staff", "Red", "JailOut", ""..xPlayer.name.." est sortie de prison.")
	end
end)

ESX.RegisterServerCallback('Ld_Staff:IsInJail', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
	if InJail[xPlayer.identifier] then
		cb(true)
	else
		cb(false)
	end
end)

RegisterServerEvent("Warns")
AddEventHandler("Warns", function(Type, Target, Date, Reason)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Target)
	if IsRestrict(xPlayer.group, Type) then
		if Staff.UseFd_Logs then
			TriggerEvent("Fd_Logs:SendLogs", "Staff", "Red", "Warns", ""..xPlayer.name.." à mis un avertissement à "..xTarget.name.." pour la raison suivante : \n"..Reason)
		end
		MySQL.Async.execute('INSERT INTO users_warns (Date, Identifier, Reason, WarnedBy) VALUES (@Date, @Identifier, @Reason, @WarnedBy)', {
			['@Date']   = Date,
			['@Identifier']   = xTarget.identifier,
			['@Reason'] = Reason,
			['@WarnedBy']   = xPlayer.name
		}, function()
			CheckPlyWarns(Date, Target)
		end)
	end
end)

function CheckPlyWarns(Date, Target)
	local xTarget = ESX.GetPlayerFromId(Target)
	MySQL.Async.fetchAll('SELECT * FROM users_warns WHERE Identifier = @Identifier', {
		['@Identifier'] = xTarget.identifier
	}, function(Warns)
		for _,v in pairs (Warns) do
			print(_)
			if _ == Staff.MaxWarns then
				if Staff.UseFd_Logs then
					TriggerEvent("Fd_Logs:SendLogs", "Staff", "Red", "Warns", ""..xTarget.name.." à reçu trop d'avertissement, il à donc était banni.")
				end
				MySQL.Async.execute('INSERT INTO users_bans (Date, Identifier, Reason, BannedBy) VALUES (@Date, @Identifier, @Reason, @BannedBy)', {
					['@Date']   = Date,
					['@Identifier']   = xTarget.identifier,
					['@Reason'] = "Vous avez reçu trop d'avertissement, venez vocal si vous souhaitez vous expliquer.",
					['@BannedBy']   = "Fd_Staff"
				}, function()
					DropPlayer(Target, "Vous avez reçu trop d'avertissement, venez vocal si vous souhaitez vous expliquer.")
				end)
			end
		end
	end)
end

RegisterServerEvent("Ban")
AddEventHandler("Ban", function(Type, Target, Date, Reason)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Target)
	if IsRestrict(xPlayer.group, Type) then
		if Staff.UseFd_Logs then
			TriggerEvent("Fd_Logs:SendLogs", "Staff", "Red", "Warns", ""..xPlayer.name.." à banni "..xTarget.name.." pour la raison suivante : \n"..Reason)
		end
		MySQL.Async.execute('INSERT INTO users_bans (Date, Identifier, Reason, BannedBy) VALUES (@Date, @Identifier, @Reason, @BannedBy)', {
			['@Date']   = Date,
			['@Identifier']   = xTarget.identifier,
			['@Reason'] = Reason,
			['@BannedBy']   = xPlayer.name
		}, function()
			DropPlayer(Target, "Vous avez était banni : "..Reason)
		end)
	end
end)

RegisterServerEvent("IsBan")
AddEventHandler("IsBan", function()
	_source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	MySQL.Async.fetchAll('SELECT * FROM users_bans WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(Ban)
		if json.encode(Ban) ~= "[]" then
			DropPlayer(_source, "Vous avez êtes banni du serveur.")
		end
	end)
end)

RegisterServerEvent("Fd_Staff:SetWeather")
AddEventHandler("Fd_Staff:SetWeather", function(Type)
	_source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent("Fd_Staff:SetWeather", -1, Type)
	if Staff.UseFd_Logs then
		TriggerEvent("Fd_Logs:SendLogs", "Staff", "Red", "SetWeather", ""..xPlayer.name.." à changer le climat en : "..Type)
	end
end)

RegisterServerEvent("Fd_Staff:SetTime")
AddEventHandler("Fd_Staff:SetTime", function(Hour)
	_source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent("Fd_Staff:SetTime", -1, Hour)
	if Staff.UseFd_Logs then
		TriggerEvent("Fd_Logs:SendLogs", "Staff", "Red", "SetTime", ""..xPlayer.name.." à changer le l'heure.")
	end
end)