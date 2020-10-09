Blips = {}
BankBlips = {}
TatooBlips = {}
ClotheBlips = {}
MaskBlips = {}
WeaponBlips = {}
MarketBlips = {}
CarBlips = {}
BikeBlips = {}
BarberBlips = {}
CasinoBlips = {}

AddEventHandler('playerSpawned', function()
	CreateBankBlip()
	CreateTatooBlip()
	CreateMaskBlip()
	CreateClotheBlip()
	CreateWeaponBlip()
	CreateMarketBlip()
	CreateCarBlip()
	CreateBikeBlip()
	CreateBarberBlip()
	CreateCasinoBlip()
end)

RegisterNetEvent('ShowAllBlip')
AddEventHandler('ShowAllBlip', function()
	CreateBankBlip()
	CreateTatooBlip()
	CreateMaskBlip()
	CreateClotheBlip()
	CreateWeaponBlip()
	CreateMarketBlip()
	CreateCarBlip()
	CreateBikeBlip()
	CreateBarberBlip()
	CreateCasinoBlip()
end)

RegisterNetEvent('DeleteAllBlip')
AddEventHandler('DeleteAllBlip', function()
	for _,v in pairs (Blips) do
		RemoveBlip(v)
	end
end)

RegisterNetEvent('DeleteBlip')
AddEventHandler('DeleteBlip', function(Type)
	if Type == "Bank" then
		for _,v in pairs (BankBlips) do
			RemoveBlip(v)
		end
	elseif Type == "Tatoo" then
		for _,v in pairs (TatooBlips) do
			RemoveBlip(v)
		end
	elseif Type == "Clothe" then
		for _,v in pairs (ClotheBlips) do
			RemoveBlip(v)
		end
	elseif Type == "Mask" then
		for _,v in pairs (MaskBlips) do
			RemoveBlip(v)
		end
	elseif Type == "Weapon" then
		for _,v in pairs (WeaponBlips) do
			RemoveBlip(v)
		end
	elseif Type == "Market" then
		for _,v in pairs (MarketBlips) do
			RemoveBlip(v)
		end
	elseif Type == "Car" then
		for _,v in pairs (CarBlips) do
			RemoveBlip(v)
		end
	elseif Type == "Bike" then
		for _,v in pairs (BikeBlips) do
			RemoveBlip(v)
		end
	elseif Type == "Barber" then
		for _,v in pairs (BarberBlips) do
			RemoveBlip(v)
		end
	elseif Type == "Casino" then
		for _,v in pairs (CasinoBlips) do
			RemoveBlip(v)
		end
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
		table.insert(BankBlips, BankBlip)
	end
end

function CreateTatooBlip()
	for _,v in ipairs(Config.Blip.Tatoo) do
		local TatooBlip = AddBlipForCoord(v.x, v.y, v.z)
		SetBlipSprite (TatooBlip, Config.Blip.Tatoo.Sprite)
		SetBlipDisplay(TatooBlip, Config.Blip.Tatoo.Display)
		SetBlipScale  (TatooBlip, Config.Blip.Tatoo.Scale)
		SetBlipColour (TatooBlip, Config.Blip.Tatoo.Color)
		SetBlipAsShortRange(TatooBlip, Config.Blip.Tatoo.ShortRange)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(Config.Blip.Tatoo.Label)
		EndTextCommandSetBlipName(TatooBlip)
		table.insert(Blips, TatooBlip)
		table.insert(TatooBlips, TatooBlip)
	end
end

function CreateClotheBlip()
	for _,v in ipairs(Config.Blip.Clothe) do
		local ClotheBlip = AddBlipForCoord(v.x, v.y, v.z)
		SetBlipSprite (ClotheBlip, Config.Blip.Clothe.Sprite)
		SetBlipDisplay(ClotheBlip, Config.Blip.Clothe.Display)
		SetBlipScale  (ClotheBlip, Config.Blip.Clothe.Scale)
		SetBlipColour (ClotheBlip, Config.Blip.Clothe.Color)
		SetBlipAsShortRange(ClotheBlip, Config.Blip.Clothe.ShortRange)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(Config.Blip.Clothe.Label)
		EndTextCommandSetBlipName(ClotheBlip)
		table.insert(Blips, ClotheBlip)
		table.insert(ClotheBlips, ClotheBlip)
	end
end

function CreateMaskBlip()
	for _,v in ipairs(Config.Blip.Mask) do
		local MaskBlip = AddBlipForCoord(v.x, v.y, v.z)
		SetBlipSprite (MaskBlip, Config.Blip.Mask.Sprite)
		SetBlipDisplay(MaskBlip, Config.Blip.Mask.Display)
		SetBlipScale  (MaskBlip, Config.Blip.Mask.Scale)
		SetBlipColour (MaskBlip, Config.Blip.Mask.Color)
		SetBlipAsShortRange(MaskBlip, Config.Blip.Mask.ShortRange)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(Config.Blip.Mask.Label)
		EndTextCommandSetBlipName(MaskBlip)
		table.insert(Blips, MaskBlip)
		table.insert(MaskBlips, MaskBlip)
	end
end

function CreateWeaponBlip()
	for _,v in ipairs(Config.Blip.Weapon) do
		local WeaponBlip = AddBlipForCoord(v.x, v.y, v.z)
		SetBlipSprite (WeaponBlip, Config.Blip.Weapon.Sprite)
		SetBlipDisplay(WeaponBlip, Config.Blip.Weapon.Display)
		SetBlipScale  (WeaponBlip, Config.Blip.Weapon.Scale)
		SetBlipColour (WeaponBlip, Config.Blip.Weapon.Color)
		SetBlipAsShortRange(WeaponBlip, Config.Blip.Weapon.ShortRange)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(Config.Blip.Weapon.Label)
		EndTextCommandSetBlipName(WeaponBlip)
		table.insert(Blips, WeaponBlip)
		table.insert(WeaponBlips, WeaponBlip)
	end
end

function CreateMarketBlip()
	for _,v in ipairs(Config.Blip.Market) do
		local MarketBlip = AddBlipForCoord(v.x, v.y, v.z)
		SetBlipSprite (MarketBlip, Config.Blip.Market.Sprite)
		SetBlipDisplay(MarketBlip, Config.Blip.Market.Display)
		SetBlipScale  (MarketBlip, Config.Blip.Market.Scale)
		SetBlipColour (MarketBlip, Config.Blip.Market.Color)
		SetBlipAsShortRange(MarketBlip, Config.Blip.Market.ShortRange)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(Config.Blip.Market.Label)
		EndTextCommandSetBlipName(MarketBlip)
		table.insert(Blips, MarketBlip)
		table.insert(MarketBlips, MarketBlip)
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
		table.insert(CarBlips, CarBlip)
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
		table.insert(BikeBlips, BikeBlip)
	end
end

function CreateBarberBlip()
    for _,v in ipairs(Config.Blip.Barber) do
        local BarberBlip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite (BarberBlip, Config.Blip.Barber.Sprite)
        SetBlipDisplay(BarberBlip, Config.Blip.Barber.Display)
        SetBlipScale  (BarberBlip, Config.Blip.Barber.Scale)
        SetBlipColour (BarberBlip, Config.Blip.Barber.Color)
        SetBlipAsShortRange(BarberBlip, Config.Blip.Barber.ShortRange)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.Blip.Barber.Label)
        EndTextCommandSetBlipName(BarberBlip)
        table.insert(Blips, BarberBlip)
		table.insert(BarberBlips, BarberBlip)
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
		table.insert(CasinoBlips, CasinoBlip)
    end
end