ESX = nil
Perms = {
	["admin"] = {    
		Perms = {
			["GiveItem"] = true,
			["GiveWeapon"] = true,
			["GiveMoney"] = true,
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
	["mod"] = {    
		Perms = {
			["GiveItem"] = false,
			["GiveWeapon"] = false,
			["GiveMoney"] = false,
			["SetJob"] = false,
			["SetOrg"] = false,
			["Revive"] = true,
			["Goto"] = true,
			["Bring"] = true,
			["ClearLoadout"] = false,
			["ClearInventory"] = false,
			["Jail"] = true,
			["Warns"] = true,
			["Ban"] = false,
		},
	},
	["user"] = {    
		Perms = {
			["GiveItem"] = false,
			["GiveWeapon"] = false,
			["GiveMoney"] = false,
			["SetJob"] = false,
			["SetOrg"] = false,
			["Revive"] = false,
			["Goto"] = false,
			["Bring"] = false,
			["ClearLoadout"] = false,
			["ClearInventory"] = false,
			["Jail"] = false,
			["Warns"] = false,
			["Ban"] = false,
		},
	},
}
InJail = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('Fd_Staff:IsStaff', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	cb(xPlayer.group)
end)

ESX.RegisterServerCallback('Ld_Staff:GetPlyInfos', function(source, cb, target)
    local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(target)
	local Id = nil
	MySQL.Async.fetchAll('SELECT FirstName, LastName, Birthday FROM users WHERE identifier = @identifier', {
		['@identifier'] = xTarget.identifier
	}, function(ResultId)
		Id = ResultId
	end)
	Infos = {
		Identity = Id,
		Job = xTarget.job.label,
		Grade = xTarget.job.grade_label,
		Job2 = xTarget.job2.label,
		Grade2 = xTarget.job2.grade_label,
		Money = xTarget.getAccount("money").money,
		Bank = xTarget.getAccount("bank").money,
		Dirty = xTarget.getAccount("black_money").money,
		Inventory = xTarget.inventory,
		Weapons = xTarget.loadout,
	}
	cb(Infos)
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

RegisterServerEvent("Fd_Staff:GiveItem")
AddEventHandler("Fd_Staff:GiveItem", function(Type, Target, ItemName, ItemLabel, ItemCount)
	print("test")
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Target)
	if IsRestrict(xPlayer.group, Type) then
		xTarget.addInventoryItem(ItemName, ItemCount)
		if xPlayer.name == xTarget.name then
			xTarget.name = "lui même"
		end	
		TriggerEvent("Fd_Logs:SendLogs", "Item", "Yellow", "Staff : Give item", ""..xPlayer.name.." à donner "..ItemCount.." x "..ItemLabel.." à "..xTarget.name)
	end
end)

RegisterServerEvent("Fd_Staff:GiveWeapon")
AddEventHandler("Fd_Staff:GiveWeapon", function(Type, Target, WeaponName, WeaponLabel)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Target)
	if IsRestrict(xPlayer.group, Type) then
		xTarget.addWeapon(WeaponName, 250)
		if xPlayer.name == xTarget.name then
			xTarget.name = "lui même"
		end	
		TriggerEvent("Fd_Logs:SendLogs", "Weapon", "Red", "Staff : Give weapon", ""..xPlayer.name.." à donner "..WeaponLabel.." à "..xTarget.name)
	end
end)

RegisterServerEvent("Fd_Staff:GiveMoney")
AddEventHandler("Fd_Staff:GiveMoney", function(Type, Target, Account, Amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Target)
	if IsRestrict(xPlayer.group, Type) then
		xTarget.addAccountMoney(Account, Amount)
		if xPlayer.name == xTarget.name then
			xTarget.name = "lui même"
		end	
		TriggerEvent("Fd_Logs:SendLogs", "Cash", "Blue", "Staff : Give money", ""..xPlayer.name.." à donner "..Amount.." $ ("..Account..") à "..xTarget.name)
	end
end)

RegisterServerEvent("Fd_Staff:SetJob")
AddEventHandler("Fd_Staff:SetJob", function(Type, Target, JobName, JobGrade, JobLabel)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Target)
	if IsRestrict(xPlayer.group, Type) then
		xTarget.setJob(JobName, JobGrade)
		if xPlayer.name == xTarget.name then
			xTarget.name = "lui même"
		end	
		TriggerEvent("Fd_Logs:SendLogs", "Staff", "Blue", "Set job", ""..xPlayer.name.." à mis "..xTarget.name.." le métier "..JobLabel)
	end
end)

RegisterServerEvent("Fd_Staff:SetOrg")
AddEventHandler("Fd_Staff:SetOrg", function(Type, Target, JobName, JobGrade, JobLabel)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Target)
	if IsRestrict(xPlayer.group, Type) then
		if Staff.UseSetJob2 and not Staff.UseSetOrg then
			xTarget.setJob2(JobName, JobGrade)
		elseif not Staff.UseSetJob2 and Staff.UseSetOrg then
			xTarget.setOrg(JobName, JobGrade)
		end
		if xPlayer.name == xTarget.name then
			xTarget.name = "lui même"
		end	
		TriggerEvent("Fd_Logs:SendLogs", "Staff", "Blue", "Set org", ""..xPlayer.name.." à mis "..xTarget.name.." l'organisation "..JobLabel)
	end
end)

RegisterServerEvent("Fd_Staff:Revive")
AddEventHandler("Fd_Staff:Revive", function(Type, Target)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Target)
	if IsRestrict(xPlayer.group, Type) then
		TriggerClientEvent("Refresh:DeathState", Target)
		TriggerClientEvent("Fd_Staff:Revive", Target)
		if xPlayer.name == xTarget.name then
			xTarget.name = "lui même"
		end	
		TriggerEvent("Fd_Logs:SendLogs", "Staff", "Blue", "Revive", ""..xPlayer.name.." à revive "..xTarget.name)
	end
end)

RegisterServerEvent("Fd_Staff:Goto")
AddEventHandler("Fd_Staff:Goto", function(Type, Target)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Target)
	local xTargetCoords = GetEntityCoords(GetPlayerPed(Target))
	if IsRestrict(xPlayer.group, Type) then
		TriggerClientEvent("Fd_Staff:Goto", source, xTargetCoords)
		if xPlayer.name == xTarget.name then
			xTarget.name = "lui même"
		end	
		TriggerEvent("Fd_Logs:SendLogs", "Staff", "Blue", "Goto", ""..xPlayer.name.." c'est tp à "..xTarget.name)
	end
end)

RegisterServerEvent("Fd_Staff:Bring")
AddEventHandler("Fd_Staff:Bring", function(Type, Target)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayerCoords = GetEntityCoords(GetPlayerPed(source))
	local xTarget = ESX.GetPlayerFromId(Target)
	if IsRestrict(xPlayer.group, Type) then
		TriggerClientEvent("Fd_Staff:Bring", Target, xPlayerCoords)
		if xPlayer.name == xTarget.name then
			xTarget.name = "lui même"
		end	
		TriggerEvent("Fd_Logs:SendLogs", "Staff", "Blue", "Bring", ""..xPlayer.name.." à tp "..xTarget.name.." sur lui")
	end
end)

RegisterServerEvent("Fd_Staff:ClearLoadout")
AddEventHandler("Fd_Staff:ClearLoadout", function(Type, Target, JobName, JobGrade, JobLabel)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Target)
	if IsRestrict(xPlayer.group, Type) then
		for k,v in ipairs(xTarget.loadout) do
			xTarget.removeWeapon(v.name)
		end
		if xPlayer.name == xTarget.name then
			xTarget.name = "lui même"
		end	
		TriggerEvent("Fd_Logs:SendLogs", "Staff", "Red", "ClearLoadout", ""..xPlayer.name.." à supprimer les armes de "..xTarget.name)
	end
end)

RegisterServerEvent("Fd_Staff:ClearInventory")
AddEventHandler("Fd_Staff:ClearInventory", function(Type, Target)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Target)
	if IsRestrict(xPlayer.group, Type) then
		for k,v in ipairs(xTarget.inventory) do
			if v.count > 0 then
				xTarget.setInventoryItem(v.name, 0)
			end
		end
		if xPlayer.name == xTarget.name then
			xTarget.name = "lui même"
		end	
		TriggerEvent("Fd_Logs:SendLogs", "Staff", "Red", "ClearInventory", ""..xPlayer.name.." à vider l'inventaire de "..xTarget.name)
	end
end)

RegisterServerEvent("Fd_Staff:Jail")
AddEventHandler("Fd_Staff:Jail", function(Type, Target)
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
	TriggerEvent("Fd_Logs:SendLogs", "Staff", "Red", "JailOut", ""..xPlayer.name.." est sortie de prison.")
end)

ESX.RegisterServerCallback('Ld_Staff:IsInJail', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
	if InJail[xPlayer.identifier] then
		cb(true)
	else
		cb(false)
	end
end)

RegisterServerEvent("Fd_Staff:Warns")
AddEventHandler("Fd_Staff:Warns", function(Type, Target, Date, Reason)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Target)
	if IsRestrict(xPlayer.group, Type) then
		TriggerEvent("Fd_Logs:SendLogs", "Staff", "Red", "Warns", ""..xPlayer.name.." à mis un avertissement à "..xTarget.name.." pour la raison suivante : \n"..Reason)
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
				TriggerEvent("Fd_Logs:SendLogs", "Staff", "Red", "Warns", ""..xTarget.name.." à reçu trop d'avertissement, il à donc était banni.")
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

RegisterServerEvent("Fd_Staff:Ban")
AddEventHandler("Fd_Staff:Ban", function(Type, Target, Date, Reason)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(Target)
	if IsRestrict(xPlayer.group, Type) then
		TriggerEvent("Fd_Logs:SendLogs", "Staff", "Red", "Warns", ""..xPlayer.name.." à banni "..xTarget.name.." pour la raison suivante : \n"..Reason)
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
	TriggerEvent("Fd_Logs:SendLogs", "Staff", "Red", "SetWeather", ""..xPlayer.name.." à changer le climat en : "..Type)
end)

RegisterServerEvent("Fd_Staff:SetTime")
AddEventHandler("Fd_Staff:SetTime", function(Hour)
	_source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent("Fd_Staff:SetTime", -1, Hour)
	TriggerEvent("Fd_Logs:SendLogs", "Staff", "Red", "SetTime", ""..xPlayer.name.." à changer le l'heure.")
end)

RegisterServerEvent("Fd_Staff:SetBlackout")
AddEventHandler("Fd_Staff:SetBlackout", function(State)
	_source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent("Fd_Staff:SetBlackout", -1, State)
	if not State then
		TriggerEvent("Fd_Logs:SendLogs", "Staff", "Red", "SetBlackout", ""..xPlayer.name.." à couper le courant.")
	else
		TriggerEvent("Fd_Logs:SendLogs", "Staff", "Red", "SetBlackout", ""..xPlayer.name.." à mis le courant.")
	end
end)