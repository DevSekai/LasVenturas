PlyGroup = ""
PlyWeight = ""
MdpPersonal = "Ntm"
invItems = {}
invWeapon = {}
invMoney = {}
invSale = {}
invBank = {}

RMenu.Add('Personnal', 'Principal', RageUI.CreateMenu("", "", nil, nil, "root_cause", "banner"), true)
RMenu:Get('Personnal', 'Principal'):SetSubtitle("~y~Menu personnel")
RMenu:Get('Personnal', 'Principal'):DisplayGlare(false);

RMenu.Add('Personnal', 'Inventory', RageUI.CreateSubMenu(RMenu:Get('Personnal', 'Principal'), "", ""))
RMenu:Get('Personnal', 'Inventory'):SetSubtitle("~y~Inventaire")
RMenu:Get('Personnal', 'Inventory'):DisplayGlare(false);

RMenu.Add('Personnal', 'Weaponry', RageUI.CreateSubMenu(RMenu:Get('Personnal', 'Principal'), "", ""))
RMenu:Get('Personnal', 'Weaponry'):SetSubtitle("~y~Gestion des armes")
RMenu:Get('Personnal', 'Weaponry'):DisplayGlare(false);

RMenu.Add('Personnal', 'Wallet', RageUI.CreateSubMenu(RMenu:Get('Personnal', 'Principal'), "", ""))
RMenu:Get('Personnal', 'Wallet'):SetSubtitle("~y~Porte-feuille")
RMenu:Get('Personnal', 'Wallet'):DisplayGlare(false);

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		if IsControlJustReleased(1, 166) then
			ESX.TriggerServerCallback('getUsergroup', function(Group)
				PlyGroup = Group
				RageUI.Visible(RMenu:Get('Personnal', 'Principal'), not RageUI.Visible(RMenu:Get('Personnal', 'Principal')))
			end)
		end
		if 	RageUI.Visible(RMenu:Get('Personnal', 'Principal')) or 
			RageUI.Visible(RMenu:Get('Personnal', 'Inventory')) or
			RageUI.Visible(RMenu:Get('Personnal', 'Weaponry')) or
			RageUI.Visible(RMenu:Get('Personnal', 'Wallet'))
		then
			OpenPersonalMenu()
		end 
	end
end)

function OpenPersonalMenu()
	RageUI.IsVisible(RMenu:Get('Personnal', 'Principal'), function()
        RageUI.Item.Button("Inventaire", "", {}, true, {
        	onSelected = function()
				invItems = {}
			    ESX.TriggerServerCallback('getPlayerInventory', function(inventory)
					for i=1, #inventory.items, 1 do
					    local item = inventory.items[i]
					    PlyWeight = item.count * item.weight
					    if item.count > 0 then
					        table.insert(invItems, {label = item.label, count = item.count, type = 'item_standard', value = item.name, usable = item.usable, removable = item.canRemove})
					    end
					end
				end)
			end,
        },RMenu:Get('Personnal', 'Inventory'))
        RageUI.Item.Button("Gestion des armes", "", {}, true, {
        	onSelected = function()
				invWeapon = {}
			    ESX.TriggerServerCallback('getPlayerInventory', function(loadout)
					for i=1, #loadout.weapons, 1 do
					    local weapon = loadout.weapons[i]
						table.insert(invWeapon, {label = ESX.GetWeaponLabel(weapon.name), value = weapon.name, itemType = 'item_weapon', amount = weapon.ammo})
					end
				end)
			end,
        },RMenu:Get('Personnal', 'Weaponry'))
        RageUI.Item.Button("Porte-feuille", "", {}, true, {
        	onSelected = function()
				invMoney = {}
				invSale = {}
				invBank = {}
			    ESX.TriggerServerCallback('getPlayerInventory', function(money)
					for i=1, #money.accounts, 1 do
						if money.accounts[i].name == 'money' and money.accounts[i].money > 0 then
							table.insert(invMoney, {label = "Cash", value = 'money', itemType = 'item_account', amount = money.accounts[i].money})
						end
						if money.accounts[i].name == 'black_money' and money.accounts[i].money > 0 then
							table.insert(invSale, {label = "Sale", value = 'black_money', itemType = 'item_account', amount = money.accounts[i].money})
						end
						if money.accounts[i].name == 'bank' and money.accounts[i].money > 0 then
							table.insert(invBank, {label = "Compte bancaire", value = 'bank', itemType = 'item_account', amount = money.accounts[i].money})
						end
					end
				end)
			end,
        },RMenu:Get('Personnal', 'Wallet'))
        --Exemple ApplySkin --
        --[[RageUI.Item.Button("Update Skin", "", {}, true, {
        	onSelected = function()
				ESX.TriggerServerCallback('GetPlySkin', function(Skin)
					Result = json.decode(Skin)
					Result.BarbeIndex = 8
					TriggerServerEvent('UpdatePlySkin', MdpPersonal, json.encode(Result))
			    end)
			end,
        })]]
    end)

	RageUI.IsVisible(RMenu:Get('Personnal', 'Inventory'), function()
	    RageUI.Item.Separator("[~y~"..PlyWeight.."~s~ Kg / ~y~"..ESX.PlayerData.maxWeight .."~s~ Kg]")
	    for _,v in pairs (invItems) do
			RageUI.Item.List(v.label.." x"..v.count, {"~b~Utiliser~s~","~g~Donner~s~","~r~Jeter~s~"}, 1, nil, {}, true, {
				onSelected = function(Index, Items)
					itemName = v.value
					if Index == 1 then
						if v.removable then
							TriggerServerEvent('UseItem', MdpPersonal, itemName)
							RageUI.GoBack()
						else
							ESX.ShowNotification("Vous ne pouvez pas effectuez cette action")
						end
					elseif Index == 2 then
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestDistance ~= -1 and closestDistance <= 3 then
							local closestPed = GetPlayerPed(closestPlayer)
							local QuantiteToGive = KeyboardInput("Quantité", 20)
							if tonumber(QuantiteToGive) ~= nil then
								if tonumber(QuantiteToGive) <= v.count then
									TriggerServerEvent('GiveItem', GetPlayerServerId(closestPlayer), MdpPersonal, itemName, tonumber(QuantiteToGive))
									RageUI.GoBack()
								else
									ESX.ShowNotification("Quantité invalide.")
								end
							end
						else
							ESX.ShowNotification('Il n\'y a personne aux alentours.')
						end
					else
						if v.removable then
							local QuantiteToTrash = KeyboardInput("Quantité", 20)
							if tonumber(QuantiteToTrash) ~= nil then
								if tonumber(QuantiteToTrash) <= v.count then
									TriggerServerEvent('RemoveItem', MdpPersonal, itemName, tonumber(QuantiteToTrash))
									RageUI.GoBack()
								else
									ESX.ShowNotification("Quantité invalide.")
								end
							end
						else
							ESX.ShowNotification("Vous ne pouvez pas effectuez cette action")
						end
					end
				end,
			})
	    end
    end)

	RageUI.IsVisible(RMenu:Get('Personnal', 'Weaponry'), function()
	    for _,v in pairs (invWeapon) do
			RageUI.Item.List(v.label.." x"..v.amount, {"~g~Donner~s~","~r~Jeter~s~"}, 1, nil, {}, true, {
				onSelected = function(Index, Items)
					if Index == 1 then
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestDistance ~= -1 and closestDistance <= 3 then
							TriggerServerEvent('GiveWeapon', GetPlayerServerId(closestDistance), MdpPersonal, v.label, v.value, v.amount)
							RageUI.GoBack()
						else
							ESX.ShowNotification('Il n\'y a personne aux alentours.')
						end
					else
						TriggerServerEvent('RemoveWeapon', MdpPersonal, v.value, v.amount)
						RageUI.GoBack()
					end
				end,
			})
	    end
    end)

	RageUI.IsVisible(RMenu:Get('Personnal', 'Wallet'), function()
	    RageUI.Item.Separator("[~y~Métier~s~] : "..ESX.PlayerData.job.label.." [~y~Grade~s~] : "..ESX.PlayerData.job.grade_label)
	    for _,v in pairs (invBank) do
		    RageUI.Item.Separator("[~y~"..v.label.."~s~] : "..v.amount.." $")
		end
	    for _,v in pairs (invMoney) do
			RageUI.Item.List("	[~y~"..v.label.."~s~] : "..v.amount.." $", {"~g~Donner~s~","~r~Jeter~s~"}, 1, nil, {}, true, {
				onSelected = function(Index, Items)
					local Amount = KeyboardInput("Quantité", 20)
					if tonumber(Amount) ~= nil then
						if tonumber(Amount) <= v.amount then
							if Index == 1 then
								local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
								if closestDistance ~= -1 and closestDistance <= 3 then
									TriggerServerEvent('GiveMoney', GetPlayerServerId(closestDistance), MdpPersonal, v.value, tonumber(Amount))
									RageUI.GoBack()
								else
									ESX.ShowNotification('Il n\'y a personne aux alentours.')
								end
							else
								TriggerServerEvent('RemoveMoney', MdpPersonal, v.value, tonumber(Amount))
								RageUI.GoBack()
							end
						else
							ESX.ShowNotification("Quantité invalide.")
						end
					else
						ESX.ShowNotification("Mauvaise utilisation.")
					end
				end,
			})
	    end
	    for _,v in pairs (invSale) do
			RageUI.Item.List("	[~y~"..v.label.."~s~] : "..v.amount.." $", {"~g~Donner~s~","~r~Jeter~s~"}, 1, nil, {}, true, {
				onSelected = function(Index, Items)
					local Amount = KeyboardInput("Quantité", 20)
					if tonumber(Amount) ~= nil then
						if tonumber(Amount) <= v.amount then
							if Index == 1 then
								local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
								if closestDistance ~= -1 and closestDistance <= 3 then
									TriggerServerEvent('GiveMoney', GetPlayerServerId(closestDistance), MdpPersonal, v.value, tonumber(Amount))
									RageUI.GoBack()
								else
									ESX.ShowNotification('Il n\'y a personne aux alentours.')
								end
							else
								TriggerServerEvent('RemoveMoney', MdpPersonal, v.value, tonumber(Amount))
								RageUI.GoBack()
							end
						else
							ESX.ShowNotification("Quantité invalide.")
						end
					else
						ESX.ShowNotification("Mauvaise utilisation.")
					end
				end,
			})
	    end
    end)
end