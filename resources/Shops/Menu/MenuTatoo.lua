MdpTatoo = "Ntm"

RMenu.Add('Tatoo', 'Principal', RageUI.CreateMenu("", "", nil, nil, "root_cause", "banner"), true)
RMenu:Get('Tatoo', 'Principal'):SetSubtitle("~y~Salon de tatouage")
RMenu:Get('Tatoo', 'Principal'):DisplayGlare(false);
RMenu:Get('Tatoo', 'Principal').Closable = false;

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)

		if not InMenu then
			local playerCoords = GetEntityCoords(PlayerPedId())
			for _,v in pairs (Config.Tatoo) do
			local distanceTatoo = GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, true)
				if distanceTatoo < 2.5 then
					ESX.ShowHelpNotification('Appuyer sur ~INPUT_CONTEXT~ pour acceder au salon de tatouage.')
					if IsControlJustReleased(1, 51) then
						ESX.TriggerServerCallback('GetPlySkin', function(Skin)
							Result = json.decode(Skin)
							Result.TshirtIndex2 = 0
							Result.ArmsIndex = 15
							Result.VesteIndex = 91
							Result.TshirtIndex = 15
							Result.VesteIndex2 = 0
							Result.PantalonIndex = 14
							Result.PantalonIndex2 = 0
							Result.ChaussureIndex = 34
							Result.ChaussureIndex2 = 0
							TriggerEvent('ApplySkin', GetPlayerPed(-1), json.encode(Result))
					    end)
					    FreezeEntityPosition(PlayerPedId(), true)
						RageUI.Visible(RMenu:Get('Tatoo', 'Principal'), not RageUI.Visible(RMenu:Get('Tatoo', 'Principal')))
						InMenu = true
					end
				end
			end
		end

		RageUI.IsVisible(RMenu:Get('Tatoo', 'Principal'), function()
			RageUI.Item.List("Tête ~g~"..Config.Price.Head.."$~s~", Config.HeadTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					TriggerServerEvent('AddPlyTatoo', MdpTatoo, Items.Hash, Items.Value, Config.Price.Head)
				end
			})
			RageUI.Item.List("Cou ~g~"..Config.Price.Neck.."$~s~", Config.NeckTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					TriggerServerEvent('AddPlyTatoo', MdpTatoo, Items.Hash, Items.Value, Config.Price.Neck)
				end
			})
			RageUI.Item.List("Torse ~g~"..Config.Price.Chest.."$~s~", Config.ChestTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					TriggerServerEvent('AddPlyTatoo', MdpTatoo, Items.Hash, Items.Value, Config.Price.Chest)
				end
			})
			RageUI.Item.List("Dos ~g~"..Config.Price.Back.."$~s~", Config.BackTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					TriggerServerEvent('AddPlyTatoo', MdpTatoo, Items.Hash, Items.Value, Config.Price.Back)
				end
			})
			RageUI.Item.List("Bras droit ~g~"..Config.Price.ArmsLegs.."$~s~", Config.RArmsTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					TriggerServerEvent('AddPlyTatoo', MdpTatoo, Items.Hash, Items.Value, Config.Price.ArmsLegs)
				end
			})
			RageUI.Item.List("Bras gauche ~g~"..Config.Price.ArmsLegs.."$~s~", Config.LArmsTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					TriggerServerEvent('AddPlyTatoo', MdpTatoo, Items.Hash, Items.Value, Config.Price.ArmsLegs)
				end
			})
			RageUI.Item.List("Epaule ~g~"..Config.Price.Shoulder.."$~s~", Config.ShouldTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					TriggerServerEvent('AddPlyTatoo', MdpTatoo, Items.Hash, Items.Value, Config.Price.Shoulder)
				end
			})
			RageUI.Item.List("Ventre ~g~"..Config.Price.Stomach.."$~s~", Config.StomachTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					TriggerServerEvent('AddPlyTatoo', MdpTatoo, Items.Hash, Items.Value, Config.Price.Stomach)
				end
			})
			RageUI.Item.List("Jambe droite ~g~"..Config.Price.ArmsLegs.."$~s~", Config.RLegTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					TriggerServerEvent('AddPlyTatoo', MdpTatoo, Items.Hash, Items.Value, Config.Price.ArmsLegs)
				end
			})
			RageUI.Item.List("Jambe gauche ~g~"..Config.Price.ArmsLegs.."$~s~", Config.LLegTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					TriggerServerEvent('AddPlyTatoo', MdpTatoo, Items.Hash, Items.Value, Config.Price.ArmsLegs)
				end
			})
			RageUI.Item.List("Hipster ~g~"..Config.Price.Hipster.."$~s~", Config.HipsterTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					TriggerServerEvent('AddPlyTatoo', MdpTatoo, Items.Hash, Items.Value, Config.Price.Hipster)
				end
			})
			RageUI.Item.List("Multiplayer ~g~"..Config.Price.Mp.."$~s~", Config.MpTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					TriggerServerEvent('AddPlyTatoo', MdpTatoo, Items.Hash, Items.Value, Config.Price.Mp)
				end
			})
			RageUI.Item.List("Noël ~g~"..Config.Price.Noel.."$~s~", Config.NoelTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					TriggerServerEvent('AddPlyTatoo', MdpTatoo, Items.Hash, Items.Value, Config.Price.Noel)
				end
			})
			RageUI.Item.List("Luxe ~g~"..Config.Price.Luxe.."$~s~", Config.LuxeTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					TriggerServerEvent('AddPlyTatoo', MdpTatoo, Items.Hash, Items.Value, Config.Price.Luxe)
				end
			})
			RageUI.Item.List("Low rider ~g~"..Config.Price.LowRider.."$~s~", Config.LowRiderTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					TriggerServerEvent('AddPlyTatoo', MdpTatoo, Items.Hash, Items.Value, Config.Price.LowRider)
				end
			})
			RageUI.Item.List("Stunt ~g~"..Config.Price.Stunt.."$~s~", Config.StuntTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					TriggerServerEvent('AddPlyTatoo', MdpTatoo, Items.Hash, Items.Value, Config.Price.Stunt)
				end
			})
			RageUI.Item.List("Biker ~g~"..Config.Price.Biker.."$~s~", Config.BikerTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					TriggerServerEvent('AddPlyTatoo', MdpTatoo, Items.Hash, Items.Value, Config.Price.Biker)
				end
			})
			RageUI.Item.List("Import/Export ~g~"..Config.Price.Export.."$~s~", Config.ExportTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					TriggerServerEvent('AddPlyTatoo', MdpTatoo, Items.Hash, Items.Value, Config.Price.Export)
				end
			})
			RageUI.Item.List("Gun running ~g~"..Config.Price.Gun.."$~s~", Config.GunTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					TriggerServerEvent('AddPlyTatoo', MdpTatoo, Items.Hash, Items.Value, Config.Price.Gun)
				end
			})
		    RageUI.Item.Button("Retour", "", {}, true, {
		    	onSelected = function ()
		    		FreezeEntityPosition(PlayerPedId(), false)
					ESX.TriggerServerCallback('GetPlySkin', function(Skin)
						TriggerEvent('ApplySkin', GetPlayerPed(-1), Skin)
				    end)
					ESX.TriggerServerCallback('GetPlyTatoo', function(Tatoo)
						for _,v in pairs (Tatoo) do
							AddPedDecorationFromHashes(GetPlayerPed(-1), v.Collection, GetHashKey(v.Tatoo))
						end
					end)
					InMenu = false
		    		RageUI.CloseAll()
		    	end,
		    })
	    end)
	end
end)