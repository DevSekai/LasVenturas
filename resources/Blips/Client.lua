Blips = {}

AddEventHandler('playerSpawned', function()
	CreateBankBlip()
	CreateTatooBlip()
	CreateMaskBlip()
	CreateClotheBlip()
	CreateWeaponBlip()
	CreateMarketBlip()
end)

RegisterNetEvent('ShowAllBlip')
AddEventHandler('ShowAllBlip', function()
	CreateBankBlip()
	CreateTatooBlip()
	CreateMaskBlip()
	CreateClotheBlip()
	CreateWeaponBlip()
	CreateMarketBlip()
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
	end
end