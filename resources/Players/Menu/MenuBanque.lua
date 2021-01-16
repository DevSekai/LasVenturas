MdpBanque = "Ntm"
PlyInfo = {}
InZone = {}
BankTiming = 2000
RMenu.Add('Banque', 'Principal', RageUI.CreateMenu("", "Compte bancaire", nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Banque', 'Principal'):DisplayGlare(false);
RMenu:Get('Banque', 'Principal').Closable = false;

RegisterNetEvent('RefreshPlyBank')
AddEventHandler('RefreshPlyBank', function(Amount)
	PlyInfo.Accounts.bank = PlyInfo.Accounts.bank + Amount
end)

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(BankTiming)

		local playerCoords = GetEntityCoords(PlayerPedId())
		for _,v in pairs (Config.Bank.Pos) do
		local distanceBanque = GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, true)
			if distanceBanque < 25 then
				BankTiming = 0
				InZone[v] = true
				if distanceBanque < 2.5 then
					ESX.ShowHelpNotification('Appuyer sur ~INPUT_CONTEXT~ pour acceder au votre compte bancaire.')
					if IsControlJustReleased(1, 51) then
						ESX.TriggerServerCallback('getUserBanque', function(Info)
							PlyInfo = json.decode(Info)
							RageUI.Visible(RMenu:Get('Banque', 'Principal'), true)
							FreezeEntityPosition(PlayerPedId(), true)
						end)
					end
				end
			else
				if InZone[v] then
					BankTiming = 2000
					InZone[v] = false
				end
			end
		end

		RageUI.IsVisible(RMenu:Get('Banque', 'Principal'), function()
			RageUI.Item.Separator("[Nom] : "..PlyInfo.LastName.." 	[Prénom] : "..PlyInfo.FirstName)
			RageUI.Item.Separator("[Compte bancaire] : ~g~"..PlyInfo.Accounts.bank.." $")
			RageUI.Item.Separator("[Cash] : ~g~"..PlyInfo.Accounts.money.." $")
			RageUI.Item.List("Actions", {"Déposer","Transférer","Retirer"}, 1, nil, {}, true, {
				onSelected = function(Index, Items)
					Amount = KeyboardInput("Montant", 20)
					if tonumber(Amount) ~= nil then
							if Index == 1 then
								if tonumber(Amount) <= PlyInfo.Accounts.money then
									PlyInfo.Accounts.bank = math.round(PlyInfo.Accounts.bank + Amount)
									PlyInfo.Accounts.money = math.round(PlyInfo.Accounts.money - Amount)
									TriggerServerEvent('DepositBank', MdpBanque, tonumber(Amount))
								else
									ESX.ShowNotification("Montant invalide.")
								end
							elseif Index == 2 then
								if tonumber(Amount) <= PlyInfo.Accounts.bank then
									PlyId = KeyboardInput("Id du joueur", 20)
									if tonumber(PlyId) ~= nil then
										PlyInfo.Accounts.bank = math.round(PlyInfo.Accounts.bank - Amount)
										TriggerServerEvent('TransfereBank', MdpBanque, tonumber(PlyId), tonumber(Amount))
									else
										ESX.ShowNotification("Usage invalide.")
									end
								else
									ESX.ShowNotification("Montant invalide.")
								end
							else
								if tonumber(Amount) <= PlyInfo.Accounts.bank then
									PlyInfo.Accounts.money = math.round(PlyInfo.Accounts.money + Amount)
									PlyInfo.Accounts.bank = math.round(PlyInfo.Accounts.bank - Amount)
									TriggerServerEvent('WithdrawBank', MdpBanque, tonumber(Amount))
								else
									ESX.ShowNotification("Montant invalide.")
								end
							end
					else
						ESX.ShowNotification("Usage invalide.")
					end
				end,
			})
		    RageUI.Item.Button("Retour", nil, {RightLabel = "←←←"}, true, {
		    	onSelected = function ()
		    		FreezeEntityPosition(PlayerPedId(), false)
		    		RageUI.CloseAll()
		    	end,
		    })
	    end)
	end
end)