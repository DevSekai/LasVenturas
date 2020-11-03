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
	while ClassiqueChoose ~= Shops.Cars.ClassiqueMax do
		Random = math.random(#VehicleList.Classique)
		ClassiqueChoose = ClassiqueChoose + 1
		table.insert(VehicleChoose.Classique, VehicleList.Classique[Random])
	end
	while SuperChoose ~= Shops.Cars.SuperMax do
		Random = math.random(#VehicleList.Super)
		SuperChoose = SuperChoose + 1
		table.insert(VehicleChoose.Super, VehicleList.Super[Random])
	end
	while MotoChoose ~= Shops.Cars.MotoMax do
		Random = math.random(#VehicleList.Moto)
		MotoChoose = MotoChoose + 1
		table.insert(VehicleChoose.Moto, VehicleList.Moto[Random])
	end
	while CompactChoose ~= Shops.Cars.CompactsMax do
		Random = math.random(#VehicleList.Compacts)
		CompactChoose = CompactChoose + 1
		table.insert(VehicleChoose.Compacts, VehicleList.Compacts[Random])
	end
	while CoupeChoose ~= Shops.Cars.CoupeMax do
		Random = math.random(#VehicleList.Coupe)
		CoupeChoose = CoupeChoose + 1
		table.insert(VehicleChoose.Coupe, VehicleList.Coupe[Random])
	end
	while OffRoadChoose ~= Shops.Cars.OffRoadMax do
		Random = math.random(#VehicleList.OffRoad)
		OffRoadChoose = OffRoadChoose + 1
		table.insert(VehicleChoose.OffRoad, VehicleList.OffRoad[Random])
	end
	while SuvChoose ~= Shops.Cars.SuvMax do
		Random = math.random(#VehicleList.Suv)
		SuvChoose = SuvChoose + 1
		table.insert(VehicleChoose.Suv, VehicleList.Suv[Random])
	end
	while VansChoose ~= Shops.Cars.VansMax do
		Random = math.random(#VehicleList.Vans)
		VansChoose = VansChoose + 1
		table.insert(VehicleChoose.Vans, VehicleList.Vans[Random])
	end
	while MuscleChoose ~= Shops.Cars.MuscleMax do
		Random = math.random(#VehicleList.Muscle)
		MuscleChoose = MuscleChoose + 1
		table.insert(VehicleChoose.Muscle, VehicleList.Muscle[Random])
	end
	while SedansChoose ~= Shops.Cars.SedansMax do
		Random = math.random(#VehicleList.Sedans)
		SedansChoose = SedansChoose + 1
		table.insert(VehicleChoose.Sedans, VehicleList.Sedans[Random])
	end
	while SportChoose ~= Shops.Cars.SportMax do
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
			BuyedVehicle = {Hash = Result.Hash, Plate = Result.Plate, Props = json.encode(Result.Props)}
            TriggerClientEvent("BuyVehicle", source, json.encode(BuyedVehicle))
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

ESX.RegisterServerCallback('IsPlateTaken', function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT 1 FROM users_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)
		cb(result[1] ~= nil)
	end)
end)