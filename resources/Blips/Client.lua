Blips = {}

Citizen.CreateThread(function ()
	CreateBankBlip()
	CreateCarBlip()
	CreateBikeBlip()
	CreateCasinoBlip()
end)

RegisterNetEvent('ShowAllBlip')
AddEventHandler('ShowAllBlip', function()
	CreateBankBlip()
	CreateCarBlip()
	CreateBikeBlip()
	CreateCasinoBlip()
end)

RegisterNetEvent('DeleteAllBlip')
AddEventHandler('DeleteAllBlip', function()
	for _,v in pairs (Blips) do
		RemoveBlip(v)
	end
end)

function CreateBankBlip()
	for _,v in ipairs(Config.Blip.Banque) do
		local BankBlip = AddBlipForCoord(v.x, v.y, v.z)
		SetBlipSprite (BankBlip, Config.Blip.Banque.Sprite)
		SetBlipDisplay(BankBlip, Config.Blip.Banque.Display)
		SetBlipScale  (BankBlip, Config.Blip.Banque.Scale)
		SetBlipColour (BankBlip, Config.Blip.Banque.Color)
		SetBlipAsShortRange(BankBlip, Config.Blip.Banque.ShortRange)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(Config.Blip.Banque.Label)
		EndTextCommandSetBlipName(BankBlip)
		table.insert(Blips, BankBlip)
	end
end

function CreateCarBlip()
	for _,v in ipairs(Config.Blip.Car) do
		local CarBlip = AddBlipForCoord(v.x, v.y, v.z)
		SetBlipSprite (CarBlip, Config.Blip.Car.Sprite)
		SetBlipDisplay(CarBlip, Config.Blip.Car.Display)
		SetBlipScale  (CarBlip, Config.Blip.Car.Scale)
		SetBlipColour (CarBlip, Config.Blip.Car.Color)
		SetBlipAsShortRange(CarBlip, Config.Blip.Car.ShortRange)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(Config.Blip.Car.Label)
		EndTextCommandSetBlipName(CarBlip)
		table.insert(Blips, CarBlip)
	end
end

function CreateBikeBlip()
	for _,v in ipairs(Config.Blip.Bike) do
		local BikeBlip = AddBlipForCoord(v.x, v.y, v.z)
		SetBlipSprite (BikeBlip, Config.Blip.Bike.Sprite)
		SetBlipDisplay(BikeBlip, Config.Blip.Bike.Display)
		SetBlipScale  (BikeBlip, Config.Blip.Bike.Scale)
		SetBlipColour (BikeBlip, Config.Blip.Bike.Color)
		SetBlipAsShortRange(BikeBlip, Config.Blip.Bike.ShortRange)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(Config.Blip.Bike.Label)
		EndTextCommandSetBlipName(BikeBlip)
		table.insert(Blips, BikeBlip)
	end
end

function CreateCasinoBlip()
    for _,v in ipairs(Config.Blip.Casino) do
        local CasinoBlip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite (CasinoBlip, Config.Blip.Casino.Sprite)
        SetBlipDisplay(CasinoBlip, Config.Blip.Casino.Display)
        SetBlipScale  (CasinoBlip, Config.Blip.Casino.Scale)
        SetBlipColour (CasinoBlip, Config.Blip.Casino.Color)
        SetBlipAsShortRange(CasinoBlip, Config.Blip.Casino.ShortRange)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.Blip.Casino.Label)
        EndTextCommandSetBlipName(CasinoBlip)
        table.insert(Blips, CasinoBlip)
    end
end