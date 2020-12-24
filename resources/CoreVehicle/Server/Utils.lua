ESX = nil
Token = nil
SuperChoose, ClassiqueChoose, MotoChoose, CompactChoose, CoupeChoose, OffRoadChoose, SuvChoose, VansChoose, MuscleChoose, SedansChoose, SportChoose = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
local Char = {}
local VehicleChoose = {
	Super = {},
	Classique = {},
    Sedans = {}, 
    Sport = {},
    Muscle = {}, 
    Vans = {}, 
    Suv = {}, 
    OffRoad = {}, 
    Coupe = {}, 
    Compacts = {}, 
	Moto = {},
}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

for i = 48,  57 do table.insert(Char, string.char(i)) end
for i = 65,  90 do table.insert(Char, string.char(i)) end
for i = 97, 122 do table.insert(Char, string.char(i)) end

Citizen.CreateThread(function ()
	while Token == nil do
		Token = GenerateToken(12)
		Citizen.Wait(0)
	end
	GenerateRandomVehicle()
end)

RegisterServerEvent("GetToken")
AddEventHandler("GetToken", function()
	TriggerClientEvent("SendToken", source, Token)
end)

function GenerateToken(Length)
	math.randomseed(os.time())

	if Length > 0 then
		return GenerateToken(Length - 1) .. Char[math.random(1, #Char)]
	else
		return ""
	end
end

function GenerateRandomVehicle()
	while ClassiqueChoose ~= VehicleList.Cars.ClassiqueMax do
		Random = math.random(#VehicleList.Classique)
		ClassiqueChoose = ClassiqueChoose + 1
		table.insert(VehicleChoose.Classique, VehicleList.Classique[Random])
	end
	while SuperChoose ~= VehicleList.Cars.SuperMax do
		Random = math.random(#VehicleList.Super)
		SuperChoose = SuperChoose + 1
		table.insert(VehicleChoose.Super, VehicleList.Super[Random])
	end
	while MotoChoose ~= VehicleList.Cars.MotoMax do
		Random = math.random(#VehicleList.Moto)
		MotoChoose = MotoChoose + 1
		table.insert(VehicleChoose.Moto, VehicleList.Moto[Random])
	end
	while CompactChoose ~= VehicleList.Cars.CompactsMax do
		Random = math.random(#VehicleList.Compacts)
		CompactChoose = CompactChoose + 1
		table.insert(VehicleChoose.Compacts, VehicleList.Compacts[Random])
	end
	while CoupeChoose ~= VehicleList.Cars.CoupeMax do
		Random = math.random(#VehicleList.Coupe)
		CoupeChoose = CoupeChoose + 1
		table.insert(VehicleChoose.Coupe, VehicleList.Coupe[Random])
	end
	while OffRoadChoose ~= VehicleList.Cars.OffRoadMax do
		Random = math.random(#VehicleList.OffRoad)
		OffRoadChoose = OffRoadChoose + 1
		table.insert(VehicleChoose.OffRoad, VehicleList.OffRoad[Random])
	end
	while SuvChoose ~= VehicleList.Cars.SuvMax do
		Random = math.random(#VehicleList.Suv)
		SuvChoose = SuvChoose + 1
		table.insert(VehicleChoose.Suv, VehicleList.Suv[Random])
	end
	while VansChoose ~= VehicleList.Cars.VansMax do
		Random = math.random(#VehicleList.Vans)
		VansChoose = VansChoose + 1
		table.insert(VehicleChoose.Vans, VehicleList.Vans[Random])
	end
	while MuscleChoose ~= VehicleList.Cars.MuscleMax do
		Random = math.random(#VehicleList.Muscle)
		MuscleChoose = MuscleChoose + 1
		table.insert(VehicleChoose.Muscle, VehicleList.Muscle[Random])
	end
	while SedansChoose ~= VehicleList.Cars.SedansMax do
		Random = math.random(#VehicleList.Sedans)
		SedansChoose = SedansChoose + 1
		table.insert(VehicleChoose.Sedans, VehicleList.Sedans[Random])
	end
	while SportChoose ~= VehicleList.Cars.SportMax do
		Random = math.random(#VehicleList.Sport)
		SportChoose = SportChoose + 1
		table.insert(VehicleChoose.Sport, VehicleList.Sport[Random])
	end
end

ESX.RegisterServerCallback('GetVehicleChoose', function(source, cb)
	cb(VehicleChoose)
end)

RegisterServerEvent("BuyVehicle")
AddEventHandler("BuyVehicle", function(Vehicles)
	local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayerMoney = xPlayer.getMoney()
    local Result = json.decode(Vehicles)
	local TokenGen = json.decode(Result.Token)
    if TokenGen.Key == Token then
		if xPlayerMoney >= Result.Price then
			xPlayer.removeAccountMoney("money", Result.Price)
			MySQL.Async.execute('INSERT INTO users_vehicles (Identifier, Label, Hash, Plate, Props, Health, Stored) VALUES (@Identifier, @Label, @Hash, @Plate, @Props, @Health, @Stored)', {
				['@Identifier']   = xPlayer.identifier,
				['@Label']   = Result.Label,
				['@Hash'] = Result.Hash,
				['@Plate']   = Result.Plate,
				['@Props'] = json.encode(Result.Props),
				['@Health']   = Result.Health,
				['@Stored'] = false
			}, function()
				xPlayer.showNotification("Vous avez acheter ~o~"..Result.Label.."~s~ pour ~g~"..Result.Price.." $")
			end)
			if Result.Table == "Super" then
				table.remove(VehicleChoose.Super, tonumber(Result.TableNbr))
			elseif Result.Table == "Classique" then
				table.remove(VehicleChoose.Classique, tonumber(Result.TableNbr))
			elseif Result.Table == "Sport" then
				table.remove(VehicleChoose.Sport, tonumber(Result.TableNbr))
			elseif Result.Table == "Sedans" then
				table.remove(VehicleChoose.Sedans, tonumber(Result.TableNbr))
			elseif Result.Table == "Muscle" then
				table.remove(VehicleChoose.Muscle, tonumber(Result.TableNbr))
			elseif Result.Table == "Vans" then
				table.remove(VehicleChoose.Vans, tonumber(Result.TableNbr))
			elseif Result.Table == "OffRoad" then
				table.remove(VehicleChoose.OffRoad, tonumber(Result.TableNbr))
			elseif Result.Table == "Suv" then
				table.remove(VehicleChoose.Suv, tonumber(Result.TableNbr))
			elseif Result.Table == "Compacts" then
				table.remove(VehicleChoose.Compacts, tonumber(Result.TableNbr))
			elseif Result.Table == "Moto" then
				table.remove(VehicleChoose.Moto, tonumber(Result.TableNbr))
			end
			BuyedVehicle = {Hash = Result.Hash, Plate = Result.Plate, Props = json.encode(Result.Props), Table = Result.Table, TableNbr = tonumber(Result.TableNbr)}
			TriggerClientEvent("BuyVehicle", source, json.encode(BuyedVehicle))
			TriggerClientEvent("VehicleBuyed", -1, json.encode(BuyedVehicle))
		else
			xPlayer.showNotification("Vous n'avez pas assez d'argent.")
		end
	else
		local playerId = source
		local PlyName = GetPlayerName(playerId)
		local PlyIp = GetPlayerEndpoint(playerId)
		TriggerEvent('Logs', "Red", "Anti Executor", "Nom : "..PlyName..".\nIp : "..PlyIp..".\nRessource : VehicleCore.\nTrigger : BuyVehicle.\nDescription : Le joueur a voulu déclancher le trigger..\nObjets : "..Result.Type..".")
		DropPlayer(playerId, "Utilisation d'un executor.")	
	end
end)

RegisterServerEvent("OutVehicle")
AddEventHandler("OutVehicle", function(Vehicles)
	local playerId = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayerMoney = xPlayer.getMoney()
    local Result = json.decode(Vehicles)
    local TokenGen = json.decode(Result.Token)
    if TokenGen.Key == Token then
		MySQL.Async.execute('UPDATE users_vehicles SET Stored = @Stored WHERE Id=@Id', {
			['@Id']   = Result.Id,
			['@Stored'] = false
		}, function()
			MySQL.Async.fetchScalar('SELECT Ensure FROM users_vehicles WHERE Id=@Id', {
				['@Id']   = Result.Id
			}, function(Ensured)
				if Ensured then
					xPlayer.showNotification("Vous avez sortie un véhicule assurer, il est donc équiper d'un traceur GPS.")
					TriggerClientEvent('OutEnsuredVehicle', playerId)
				else
					xPlayer.showNotification("Vous avez sortie un véhicule qui n'est pas assurer, il n'est donc pas équiper d'un traceur GPS.")
				end
			end)
		end)
	else
		local playerId = source
		local PlyName = GetPlayerName(playerId)
		local PlyIp = GetPlayerEndpoint(playerId)
		TriggerEvent('Logs', "Red", "Anti Executor", "Nom : "..PlyName..".\nIp : "..PlyIp..".\nRessource : VehicleCore.\nTrigger : OutVehicle.\nDescription : Le joueur a voulu déclancher le trigger..\nObjets : "..Result.Type..".")
		DropPlayer(playerId, "Utilisation d'un executor.")	
	end
end)

RegisterServerEvent("OutFourriere")
AddEventHandler("OutFourriere", function(Vehicles)
	local playerId = source
    local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayerMoney = xPlayer.getMoney()
	local Result = json.decode(Vehicles)
	local PlyVhc = Result.Vhc
    local TokenGen = json.decode(Result.Token)
    if TokenGen.Key == Token then
		if xPlayerMoney >= 500 then
			xPlayer.removeAccountMoney("money", 500)
			xPlayer.showNotification("Vous avez sorti votre véhicule pour ~g~500 $")
            TriggerClientEvent("OutFourriere", source, PlyVhc)
			MySQL.Async.fetchScalar('SELECT Ensure FROM users_vehicles WHERE Id=@Id', {
				['@Id']   = PlyVhc.Id
			}, function(Ensured)
				if Ensured then
					TriggerClientEvent('OutEnsuredVehicle', playerId)
					xPlayer.showNotification("Vous avez sortie un véhicule assurer, il est donc équiper d'un traceur GPS.")
				else
					xPlayer.showNotification("Vous avez sortie un véhicule qui n'est pas assurer, il n'est donc pas équiper d'un traceur GPS.")
				end
			end)
		else
			xPlayer.showNotification("Vous n'avez pas assez d'argent.")
		end
	else
		local playerId = source
		local PlyName = GetPlayerName(playerId)
		local PlyIp = GetPlayerEndpoint(playerId)
		TriggerEvent('Logs', "Red", "Anti Executor", "Nom : "..PlyName..".\nIp : "..PlyIp..".\nRessource : VehicleCore.\nTrigger : OutFourriere.\nDescription : Le joueur a voulu déclancher le trigger..\nObjets : "..Result.Type..".")
		DropPlayer(playerId, "Utilisation d'un executor.")	
	end
end)

RegisterServerEvent("InVehicle")
AddEventHandler("InVehicle", function(Vehicles)
	local playerId = source
	local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayerMoney = xPlayer.getMoney()
    local Result = json.decode(Vehicles)
    local TokenGen = json.decode(Result.Token)
	if TokenGen.Key == Token then
		MySQL.Async.fetchAll('SELECT * FROM users_vehicles WHERE Plate = @Plate', {
			['@Plate'] = Result.Plate
		}, function(Cb)
			for k, v in pairs (Cb) do
				if v.Identifier == xPlayer.identifier then
					TriggerClientEvent("InVehicle", playerId)
					MySQL.Async.execute('UPDATE users_vehicles SET Stored = @Stored, Props = @Props WHERE Plate=@Plate', {
						['@Plate']   = Result.Plate,
						['@Props'] = json.encode(Result.Props),
						['@Stored'] = true
					}, function()
						xPlayer.showNotification("Vous avez rentrer votre véhicule.")
					end)
				else
					xPlayer.showNotification("Ce véhicule ne vous appartien pas.")
				end
			end
		end)
	else
		local playerId = source
		local PlyName = GetPlayerName(playerId)
		local PlyIp = GetPlayerEndpoint(playerId)
		TriggerEvent('Logs', "Red", "Anti Executor", "Nom : "..PlyName..".\nIp : "..PlyIp..".\nRessource : VehicleCore.\nTrigger : InVehicle.\nDescription : Le joueur a voulu déclancher le trigger..\nObjets : "..Result.Type..".")
		DropPlayer(playerId, "Utilisation d'un executor.")	
	end
end)

ESX.RegisterServerCallback('IsPlateTaken', function(source, cb, NewPlate)
	MySQL.Async.fetchAll('SELECT * FROM users_vehicles WHERE Plate = @Plate', {
		['@Plate'] = NewPlate
	}, function(result)
		cb(result[1] ~= nil)
	end)
end)

ESX.RegisterServerCallback('GetPlyVehicles', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.fetchAll('SELECT * FROM users_vehicles WHERE Identifier = @Identifier', {
		['@Identifier'] = xPlayer.identifier
	}, function(PlyCars)
		cb(PlyCars)
	end)
end)

RegisterServerEvent("RentCar")
AddEventHandler("RentCar", function(Vehicles)
	Result = json.decode(Vehicles)
	local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayerMoney = xPlayer.getMoney()
	TokenGen = json.decode(Result.Token)
	if TokenGen.Key == Token then
		if xPlayerMoney >= Result.Vhc.Price then
			xPlayer.removeAccountMoney("money", Result.Vhc.Price)
			xPlayer.showNotification("Vous avez louer un véhicule.")
            TriggerClientEvent("RentCar", source, Result.Vhc.Value)
		else
			xPlayer.showNotification("Vous n'avez pas assez d'argent.")
		end
	else
		local playerId = source
		local PlyName = GetPlayerName(playerId)
		local PlyIp = GetPlayerEndpoint(playerId)
		TriggerEvent('Logs', "Red", "Anti Executor", "Nom : "..PlyName..".\nIp : "..PlyIp..".\nRessource : VehicleCore.\nTrigger : RentCar.\nDescription : Le joueur a voulu déclancher le trigger..\nObjets : "..Result.Type..".")
		DropPlayer(playerId, "Utilisation d'un executor.")	
	end
end)