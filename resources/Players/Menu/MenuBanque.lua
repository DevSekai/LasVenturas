MdpBanque = "Ntm"
PlyInfo = {}
RMenu.Add('Banque', 'Principal', RageUI.CreateMenu("", "", 600, nil, "root_cause", "Banner"), true)
RMenu:Get('Banque', 'Principal'):SetSubtitle("~y~Compte bancaire")
RMenu:Get('Banque', 'Principal'):SetSizeWidth(200)
RMenu:Get('Banque', 'Principal'):DisplayGlare(false);
RMenu:Get('Banque', 'Principal').Closable = false;

RegisterNetEvent('RefreshPlyBank')
AddEventHandler('RefreshPlyBank', function(Amount)
	PlyInfo.Accounts.bank = PlyInfo.Accounts.bank + Amount
end)

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)

		local playerCoords = GetEntityCoords(PlayerPedId())
		for _,v in pairs (Config.Bank.Pos) do
		local distanceBanque = GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, true)
			if distanceBanque < 2.5 then
				ESX.ShowHelpNotification('Appuyer sur ~INPUT_CONTEXT~ pour acceder au votre compte bancaire.')
				if IsControlJustReleased(1, 51) then
					ESX.TriggerServerCallback('getUserBanque', function(Info)
						PlyInfo = json.decode(Info)
						RageUI.Visible(RMenu:Get('Banque', 'Principal'), not RageUI.Visible(RMenu:Get('Banque', 'Principal')))
			   			FreezeEntityPosition(PlayerPedId(), true)
					end)
				end
			end
		end

		RageUI.IsVisible(RMenu:Get('Banque', 'Principal'), function()
			RageUI.Item.Separator("[~y~Nom~w~] : "..PlyInfo.LastName.." 	[~y~Prénom~w~] : "..PlyInfo.FirstName)
			RageUI.Item.Separator("[~y~Compte bancaire~w~] : "..PlyInfo.Accounts.bank)
			RageUI.Item.Separator("[~y~Cash~w~] : "..PlyInfo.Accounts.money)
			RageUI.Item.List("Actions", {"~y~Déposer~s~","~y~Transférer~s~","~y~Retirer~s~"}, 1, nil, {}, true, {
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
		    RageUI.Item.Button("Retour", "", {}, true, {
		    	onSelected = function ()
		    		FreezeEntityPosition(PlayerPedId(), false)
		    		RageUI.CloseAll()
		    	end,
		    })
	    end)
	end
end)