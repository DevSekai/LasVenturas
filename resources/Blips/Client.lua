Blips = {}

AddEventHandler('playerSpawned', function()
	CreateBankBlip()
end)

RegisterNetEvent('ShowAllBlip')
AddEventHandler('ShowAllBlip', function()
	CreateBankBlip()
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