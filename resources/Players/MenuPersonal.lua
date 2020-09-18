PlyGroup = ""
PlyWeight = ""
MdpPersonal = "Ntm"
invItems = {}
invWeapon = {}

RMenu.Add('Personnal', 'Principal', RageUI.CreateMenu("", "", nil, nil, "root_cause", "banner"), true)
RMenu:Get('Personnal', 'Principal'):SetSubtitle("~y~Menu personnel")
RMenu:Get('Personnal', 'Principal'):DisplayGlare(false);

RMenu.Add('Personnal', 'Inventory', RageUI.CreateSubMenu(RMenu:Get('Personnal', 'Principal'), "", ""))
RMenu:Get('Personnal', 'Inventory'):SetSubtitle("~y~Inventaire")
RMenu:Get('Personnal', 'Inventory'):DisplayGlare(false);

RMenu.Add('Personnal', 'Weaponry', RageUI.CreateSubMenu(RMenu:Get('Personnal', 'Principal'), "", ""))
RMenu:Get('Personnal', 'Weaponry'):SetSubtitle("~y~Gestion des armes")
RMenu:Get('Personnal', 'Weaponry'):DisplayGlare(false);

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
			RageUI.Visible(RMenu:Get('Personnal', 'Weaponry'))
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
        RageUI.Item.Button("Update Skin", "", {}, true, {
        	onSelected = function()
				ESX.TriggerServerCallback('GetPlySkin', function(Skin)
					Result = json.decode(Skin)
					Result.BarbeIndex = 8
					TriggerServerEvent('UpdatePlySkin', MdpPersonal, json.encode(Result))
			    end)
			end,
        })
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
							invItems = {}
						    ESX.TriggerServerCallback('getPlayerInventory', function(inventory)
								for i=1, #inventory.items, 1 do
								    local item = inventory.items[i]
								    if item.count > 0 then
								        table.insert(invItems, {label = item.label, count = item.count, type = 'item_standard', value = item.name, usable = item.usable, removable = item.canRemove})
								    end
								end
							end)
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
									invItems = {}
								    ESX.TriggerServerCallback('getPlayerInventory', function(inventory)
										for i=1, #inventory.items, 1 do
										    local item = inventory.items[i]
										    if item.count > 0 then
										        table.insert(invItems, {label = item.label, count = item.count, type = 'item_standard', value = item.name, usable = item.usable, removable = item.canRemove})
										    end
										end
									end)
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
									invItems = {}
								    ESX.TriggerServerCallback('getPlayerInventory', function(inventory)
										for i=1, #inventory.items, 1 do
										    local item = inventory.items[i]
										    if item.count > 0 then
										        table.insert(invItems, {label = item.label, count = item.count, type = 'item_standard', value = item.name, usable = item.usable, removable = item.canRemove})
										    end
										end
									end)
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
			RageUI.Item.List(v.label.." x"..v.amount, {"~b~Donner munitions~s~","~g~Donner~s~","~r~Jeter~s~"}, 1, nil, {}, true, {
				onSelected = function(Index, Items)
					weaponName = v.value
					if Index == 1 then
					elseif Index == 2 then
					else
					end
				end,
			})
	    end
    end)
end