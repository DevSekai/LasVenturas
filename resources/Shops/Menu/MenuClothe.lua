MdpClothe = "Ntm"
TshirtIndex, TshirtIndex2, ArmsIndex, VesteIndex, VesteIndex2, PantalonIndex, PantalonIndex2, ChaussureIndex, ChaussureIndex2 = 1, 1, 1, 1, 1, 1, 1, 1, 1
LunetteIndex, LunetteIndex2, ChainesIndex, ChainesIndex2, ChapeauxIndex, ChapeauxIndex2, BouclesIndex, BouclesIndex2 = 1, 1, 1, 1, 1, 1, 1, 1
LastSkin = {}


RMenu.Add('Clothe', 'Principal', RageUI.CreateMenu("", "", nil, nil, "root_cause", "banner"), true)
RMenu:Get('Clothe', 'Principal'):SetSubtitle("~y~Magasin de vêtements")
RMenu:Get('Clothe', 'Principal'):DisplayGlare(false);
RMenu:Get('Clothe', 'Principal').Closable = false;

RMenu.Add('Clothe', 'Secondaire', RageUI.CreateSubMenu(RMenu:Get('Clothe', 'Principal'), "", ""))
RMenu:Get('Clothe', 'Secondaire'):SetSubtitle("~y~Magasin de vêtements")
RMenu:Get('Clothe', 'Secondaire'):DisplayGlare(false);
RMenu:Get('Clothe', 'Secondaire').Closable = false;

RMenu.Add('Clothe', 'Tersiere', RageUI.CreateSubMenu(RMenu:Get('Clothe', 'Principal'), "", ""))
RMenu:Get('Clothe', 'Tersiere'):SetSubtitle("~y~Magasin de vêtements")
RMenu:Get('Clothe', 'Tersiere'):DisplayGlare(false);
RMenu:Get('Clothe', 'Tersiere').Closable = false;

RMenu.Add('Clothe', 'PlyTenue', RageUI.CreateSubMenu(RMenu:Get('Clothe', 'Principal'), "", ""))
RMenu:Get('Clothe', 'PlyTenue'):SetSubtitle("~y~Mes tenues")
RMenu:Get('Clothe', 'PlyTenue'):DisplayGlare(false);
RMenu:Get('Clothe', 'PlyTenue').Closable = false;

RMenu.Add('Clothe', 'Tshirt', RageUI.CreateSubMenu(RMenu:Get('Clothe', 'Secondaire'), "", ""))
RMenu:Get('Clothe', 'Tshirt'):SetSubtitle("~y~Thsirt")
RMenu:Get('Clothe', 'Tshirt'):DisplayGlare(false);
RMenu:Get('Clothe', 'Tshirt').Closable = false;

RMenu.Add('Clothe', 'Vestes', RageUI.CreateSubMenu(RMenu:Get('Clothe', 'Secondaire'), "", ""))
RMenu:Get('Clothe', 'Vestes'):SetSubtitle("~y~Vestes")
RMenu:Get('Clothe', 'Vestes'):DisplayGlare(false);
RMenu:Get('Clothe', 'Vestes').Closable = false;

RMenu.Add('Clothe', 'Pantalons', RageUI.CreateSubMenu(RMenu:Get('Clothe', 'Secondaire'), "", ""))
RMenu:Get('Clothe', 'Pantalons'):SetSubtitle("~y~Pantalons")
RMenu:Get('Clothe', 'Pantalons'):DisplayGlare(false);
RMenu:Get('Clothe', 'Pantalons').Closable = false;

RMenu.Add('Clothe', 'Chaussures', RageUI.CreateSubMenu(RMenu:Get('Clothe', 'Secondaire'), "", ""))
RMenu:Get('Clothe', 'Chaussures'):SetSubtitle("~y~Chaussures")
RMenu:Get('Clothe', 'Chaussures'):DisplayGlare(false);
RMenu:Get('Clothe', 'Chaussures').Closable = false;

RMenu.Add('Clothe', 'Lunettes', RageUI.CreateSubMenu(RMenu:Get('Clothe', 'Tersiere'), "", ""))
RMenu:Get('Clothe', 'Lunettes'):SetSubtitle("~y~Lunettes")
RMenu:Get('Clothe', 'Lunettes'):DisplayGlare(false);
RMenu:Get('Clothe', 'Lunettes').Closable = false;

RMenu.Add('Clothe', 'Chaines', RageUI.CreateSubMenu(RMenu:Get('Clothe', 'Tersiere'), "", ""))
RMenu:Get('Clothe', 'Chaines'):SetSubtitle("~y~Chaines")
RMenu:Get('Clothe', 'Chaines'):DisplayGlare(false);
RMenu:Get('Clothe', 'Chaines').Closable = false;

RMenu.Add('Clothe', 'Chapeaux', RageUI.CreateSubMenu(RMenu:Get('Clothe', 'Tersiere'), "", ""))
RMenu:Get('Clothe', 'Chapeaux'):SetSubtitle("~y~Chapeaux")
RMenu:Get('Clothe', 'Chapeaux'):DisplayGlare(false);
RMenu:Get('Clothe', 'Chapeaux').Closable = false;

RMenu.Add('Clothe', 'Boucles', RageUI.CreateSubMenu(RMenu:Get('Clothe', 'Tersiere'), "", ""))
RMenu:Get('Clothe', 'Boucles'):SetSubtitle("~y~Boucles d'oreille")
RMenu:Get('Clothe', 'Boucles'):DisplayGlare(false);
RMenu:Get('Clothe', 'Boucles').Closable = false;

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)

		if not InMenu then
			local playerCoords = GetEntityCoords(PlayerPedId())
			for _,v in pairs (Config.Clothe) do
				local distanceClothe = GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, false)
				if distanceClothe < 2.5 then
					ESX.ShowHelpNotification('Appuyer sur ~INPUT_CONTEXT~ pour acceder au magasin.')
					if IsControlJustReleased(1, 51) then
						ESX.TriggerServerCallback('GetPlySkin', function(Skin)
							LastSkin = json.decode(Skin)
							FreezeEntityPosition(PlayerPedId(), true)
							RageUI.Visible(RMenu:Get('Clothe', 'Principal'), not RageUI.Visible(RMenu:Get('Clothe', 'Principal')))
							InMenu = true
					    end)
					end
				end
			end
		end

		RageUI.IsVisible(RMenu:Get('Clothe', 'Principal'), function()
            RageUI.Item.Button("Mes tenues", "", {}, true, {
                onSelected = function()
					ESX.TriggerServerCallback('getTenue', function(Tenue)
						PlyTenue = Tenue
						RageUI.Visible(RMenu:Get('Clothe', 'PlyTenue'), not RageUI.Visible(RMenu:Get('Clothe', 'PlyTenue')))
					end)
                end,
            })
            RageUI.Item.Button("Acheter une nouvelle tenue", "", {}, true, {
            },RMenu:Get('Clothe', 'Secondaire'))
            RageUI.Item.Button("Acheter des accessoires", "", {}, true, {
            },RMenu:Get('Clothe', 'Tersiere'))
            RageUI.Item.Button("Retour", "", {}, true, {
                onSelected = function()
					FreezeEntityPosition(PlayerPedId(), false)
					InMenu = false
					RageUI.CloseAll()
                end,
            })
	    end)

		RageUI.IsVisible(RMenu:Get('Clothe', 'Secondaire'), function()
            RageUI.Item.Button("Tshirt", "", {}, true, {
            },RMenu:Get('Clothe', 'Tshirt'))
            RageUI.Item.Button("Vestes", "", {}, true, {
            },RMenu:Get('Clothe', 'Vestes'))
            RageUI.Item.Button("Pantalons", "", {}, true, {
            },RMenu:Get('Clothe', 'Pantalons'))
            RageUI.Item.Button("Chaussures", "", {}, true, {
            },RMenu:Get('Clothe', 'Chaussures'))
            RageUI.Item.Button("Enregistrer la tenue ~g~"..Config.Price.Tenue.." $", "", {}, true, {
                onSelected = function()
	            	Label = KeyboardInput("Nom de la tenue", 20)
	            	if Label ~= nil then
	            		NewPlyTenue = {
							TshirtIndex = TshirtIndex,
							TshirtIndex2 = TshirtIndex2,
							ArmsIndex = ArmsIndex,
							VesteIndex = VesteIndex,
							VesteIndex2 = VesteIndex2,
							PantalonIndex = PantalonIndex,
							PantalonIndex2 = PantalonIndex2,
							ChaussureIndex = ChaussureIndex,
							ChaussureIndex2 = ChaussureIndex2
						}
	            		TriggerServerEvent('AddPlyTenue', MdpClothe, Label, json.encode(NewPlyTenue), Config.Price.Tenue)
						RageUI.GoBack()
	            	else
	            		ESX.ShowNotification("Mauvaise usage.")
	            	end
                end,
            })
            RageUI.Item.Button("Retour", "", {}, true, {
                onSelected = function()
					RageUI.GoBack()
                end,
            })
	    end)

		RageUI.IsVisible(RMenu:Get('Clothe', 'Tersiere'), function()
            RageUI.Item.Button("Lunettes", "", {}, true, {
            },RMenu:Get('Clothe', 'Lunettes'))
            RageUI.Item.Button("Chaines", "", {}, true, {
            },RMenu:Get('Clothe', 'Chaines'))
            RageUI.Item.Button("Chapeaux", "", {}, true, {
            },RMenu:Get('Clothe', 'Chapeaux'))
            RageUI.Item.Button("Boucles d'oreille", "", {}, true, {
            },RMenu:Get('Clothe', 'Boucles'))
            RageUI.Item.Button("Retour", "", {}, true, {
                onSelected = function()
					RageUI.GoBack()
                end,
            })
	    end)

		RageUI.IsVisible(RMenu:Get('Clothe', 'Lunettes'), function()
			LunetteFound = {}
			for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 1) ,1 do
				LunetteFound[i] = i
			end
			RageUI.Item.List("Lunettes", LunetteFound, LunetteIndex, nil, {}, true, {
				onListChange = function(Index, Items)
					LunetteIndex = Index
					SetPedPropIndex(PlayerPedId(), 1, LunetteIndex, LunetteIndex2, 2)
				end,
			})
			LunetteColorFound = {}
			for i = 0 , GetNumberOfPedPropTextureVariations(PlayerPedId(), 1, LunetteIndex), 1 do
				LunetteColorFound[i] = i
			end
			RageUI.Item.List("Couleur des lunettes", LunetteColorFound, LunetteIndex2, nil, {}, true, {
				onListChange = function(Index, Items)
					LunetteIndex2 = Index
					SetPedPropIndex(PlayerPedId(), 1, LunetteIndex, LunetteIndex2, 2)
				end,
			})
            RageUI.Item.Button("Acheter ~g~"..Config.Price.Clothe.." $", "", {}, true, {
                onSelected = function()
	                TriggerServerEvent("SetNewAccesoire", MdpClothe, Config.Price.Clothe, LunetteIndex, LunetteIndex2, "Lunettes", 1)
					RageUI.GoBack()
                end,
            })
            RageUI.Item.Button("Retour", "", {}, true, {
                onSelected = function()
					SetPedPropIndex(PlayerPedId(), 1, 0, 0, 2)
					RageUI.GoBack()
                end,
            })
	    end)

		RageUI.IsVisible(RMenu:Get('Clothe', 'Chaines'), function()
			ChainesFound = {}
			for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 7) ,1 do
				ChainesFound[i] = i
			end
			RageUI.Item.List("Chaines", ChainesFound, ChainesIndex, nil, {}, true, {
				onListChange = function(Index, Items)
					ChainesIndex = Index
					SetPedComponentVariation(PlayerPedId(), 7, ChainesIndex, ChainesIndex2, 2)
				end,
			})
			ChainesColorFound = {}
			for i = 0 , GetNumberOfPedPropTextureVariations(PlayerPedId(), 7, ChainesIndex), 1 do
				ChainesColorFound[i] = i
			end
			RageUI.Item.List("Couleur de la chaine", ChainesColorFound, ChainesIndex2, nil, {}, true, {
				onListChange = function(Index, Items)
					ChainesIndex2 = Index
					SetPedComponentVariation(PlayerPedId(), 7, ChainesIndex, ChainesIndex2, 2)
				end,
			})
            RageUI.Item.Button("Acheter ~g~"..Config.Price.Clothe.." $", "", {}, true, {
                onSelected = function()
	                TriggerServerEvent("SetNewAccesoire", MdpClothe, Config.Price.Clothe, ChainesIndex, ChainesIndex2, "Chaines", 1)
					RageUI.GoBack()
                end,
            })
            RageUI.Item.Button("Retour", "", {}, true, {
                onSelected = function()
					SetPedComponentVariation(PlayerPedId(), 7, 0, 0, 2)
					RageUI.GoBack()
                end,
            })
	    end)

		RageUI.IsVisible(RMenu:Get('Clothe', 'Chapeaux'), function()
			ChapeauxFound = {}
			for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 0) ,1 do
				ChapeauxFound[i] = i
			end
			RageUI.Item.List("Chapeaux", ChapeauxFound, ChapeauxIndex, nil, {}, true, {
				onListChange = function(Index, Items)
					ChapeauxIndex = Index
					SetPedComponentVariation(PlayerPedId(), 0, ChapeauxIndex, ChapeauxIndex2, 2)
				end,
			})
			ChapeauxColorFound = {}
			for i = 0 , GetNumberOfPedPropTextureVariations(PlayerPedId(), 0, ChapeauxIndex), 1 do
				ChapeauxColorFound[i] = i
			end
			RageUI.Item.List("Couleur du chapeau", ChapeauxColorFound, ChapeauxIndex2, nil, {}, true, {
				onListChange = function(Index, Items)
					ChapeauxIndex2 = Index
					SetPedComponentVariation(PlayerPedId(), 0, ChapeauxIndex, ChapeauxIndex2, 2)
				end,
			})
            RageUI.Item.Button("Acheter ~g~"..Config.Price.Clothe.." $", "", {}, true, {
                onSelected = function()
	                TriggerServerEvent("SetNewAccesoire", MdpClothe, Config.Price.Clothe, ChapeauxIndex, ChapeauxIndex2, "Chapeaux", 1)
					RageUI.GoBack()
                end,
            })
            RageUI.Item.Button("Retour", "", {}, true, {
                onSelected = function()
					SetPedComponentVariation(PlayerPedId(), 0, 0, 0, 2)
					RageUI.GoBack()
                end,
            })
	    end)

		RageUI.IsVisible(RMenu:Get('Clothe', 'Boucles'), function()
			BouclesFound = {}
			for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 2) ,1 do
				BouclesFound[i] = i
			end
			RageUI.Item.List("Chapeaux", BouclesFound, BouclesIndex, nil, {}, true, {
				onListChange = function(Index, Items)
					BouclesIndex = Index
					SetPedPropIndex(PlayerPedId(), 2, BouclesIndex, BouclesIndex2, 2)
				end,
			})
			BouclesColorFound = {}
			for i = 0 , GetNumberOfPedPropTextureVariations(PlayerPedId(), 2, BouclesIndex), 1 do
				BouclesColorFound[i] = i
			end
			RageUI.Item.List("Couleur du chapeau", BouclesColorFound, BouclesIndex2, nil, {}, true, {
				onListChange = function(Index, Items)
					BouclesIndex2 = Index
					SetPedPropIndex(PlayerPedId(), 2, BouclesIndex, BouclesIndex2, 2)
				end,
			})
            RageUI.Item.Button("Acheter ~g~"..Config.Price.Clothe.." $", "", {}, true, {
                onSelected = function()
	                TriggerServerEvent("SetNewAccesoire", MdpClothe, Config.Price.Clothe, BouclesIndex, BouclesIndex2, "Boucles d'oreille", 1)
					RageUI.GoBack()
                end,
            })
            RageUI.Item.Button("Retour", "", {}, true, {
                onSelected = function()
					SetPedPropIndex(PlayerPedId(), 2, 0, 0, 2)
					RageUI.GoBack()
                end,
            })
	    end)

		RageUI.IsVisible(RMenu:Get('Clothe', 'Tshirt'), function()
			TshirtFound = {}
			for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 8), 1 do
				TshirtFound[i] = i
			end
			RageUI.Item.List("Tshirt", TshirtFound, TshirtIndex, nil, {}, true, {
				onListChange = function(Index, Items)
					TshirtIndex = Index
					SetPedComponentVariation(PlayerPedId(), 8, TshirtIndex, TshirtIndex2, 2)
				end,
			})
			TshirtColorFound = {}
			for i = 0 , GetNumberOfPedTextureVariations(PlayerPedId(), 8, TshirtIndex), 1 do
				TshirtColorFound[i] = i
			end
			RageUI.Item.List("Couleur du tshirt", TshirtColorFound, TshirtIndex2, nil, {}, true, {
				onListChange = function(Index, Items)
					TshirtIndex2 = Index
					SetPedComponentVariation(PlayerPedId(), 8, TshirtIndex, TshirtIndex2, 2)
				end,
			})
            RageUI.Item.Button("Acheter ~g~"..Config.Price.Clothe.." $", "", {}, true, {
                onSelected = function()
					ESX.TriggerServerCallback('GetPlySkin', function(Skin)
						Result = json.decode(Skin)
						Result.TshirtIndex = TshirtIndex
						Result.TshirtIndex2 = TshirtIndex2
				     	TriggerServerEvent('CreateSkin', MdpClothe, json.encode(Result))
	                	TriggerServerEvent("SetNewAccesoire", MdpClothe, Config.Price.Clothe, TshirtIndex, TshirtIndex2, "Tshirt", 1)
						RageUI.GoBack()
					end)
                end,
            })
            RageUI.Item.Button("Retour", "", {}, true, {
                onSelected = function()
					SetPedComponentVariation(PlayerPedId(), 8, LastSkin.TshirtIndex, LastSkin.TshirtIndex2, 2)
					RageUI.GoBack()
                end,
            })
	    end)

		RageUI.IsVisible(RMenu:Get('Clothe', 'Vestes'), function()
			VesteFound = {}
			for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 11), 1 do
				VesteFound[i] = i
			end
			RageUI.Item.List("Veste", VesteFound, VesteIndex, nil, {}, true, {
				onListChange = function(Index, Items)
					VesteIndex = Index
					SetPedComponentVariation(PlayerPedId(), 11, VesteIndex, VesteIndex2, 2)
				end,
			})
			VesteColorFound = {}
			for i = 0 , GetNumberOfPedTextureVariations(PlayerPedId(), 11, VesteIndex), 1 do
				VesteColorFound[i] = i
			end
			RageUI.Item.List("Couleur de la veste", VesteColorFound, VesteIndex2, nil, {}, true, {
				onListChange = function(Index, Items)
					VesteIndex2 = Index
					SetPedComponentVariation(PlayerPedId(), 11, VesteIndex, VesteIndex2, 2)
				end,
			})
			ArmsFound = {}
			for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 3)-1, 1 do
				ArmsFound[i] = i
			end
			RageUI.Item.List("Bras", ArmsFound, ArmsIndex, nil, {}, true, {
				onListChange = function(Index, Items)
					ArmsIndex = Index
					SetPedComponentVariation(PlayerPedId(), 3, ArmsIndex, 0, 2)
				end,
			})
            RageUI.Item.Button("Acheter ~g~"..Config.Price.Clothe.." $", "", {}, true, {
                onSelected = function()
					ESX.TriggerServerCallback('GetPlySkin', function(Skin)
						Result = json.decode(Skin)
						Result.ArmsIndex = ArmsIndex
						Result.VesteIndex = VesteIndex
						Result.VesteIndex2 = VesteIndex2
				     	TriggerServerEvent('CreateSkin', MdpClothe, json.encode(Result))
	                	TriggerServerEvent("SetNewAccesoire", MdpClothe, Config.Price.Clothe, VesteIndex, VesteIndex2, "Veste", 1)
						RageUI.GoBack()
					end)
                end,
            })
            RageUI.Item.Button("Retour", "", {}, true, {
                onSelected = function()
					SetPedComponentVariation(PlayerPedId(), 3, LastSkin.ArmsIndex, 0, 2)
					SetPedComponentVariation(PlayerPedId(), 11, LastSkin.VesteIndex, LastSkin.VesteIndex2, 2)
					RageUI.GoBack()
                end,
            })
	    end)

		RageUI.IsVisible(RMenu:Get('Clothe', 'Pantalons'), function()
			PantalonFound = {}
			for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 4), 1 do
				PantalonFound[i] = i
			end
			RageUI.Item.List("Pantalon", PantalonFound, PantalonIndex, nil, {}, true, {
				onListChange = function(Index, Items)
					PantalonIndex = Index
					SetPedComponentVariation(PlayerPedId(), 4, PantalonIndex, PantalonIndex2, 2)
				end,
			})
			PantalonColorFound = {}
			for i = 0 , GetNumberOfPedTextureVariations(PlayerPedId(), 4, PantalonIndex), 1 do
				PantalonColorFound[i] = i
			end
			RageUI.Item.List("Couleur du pantalon", PantalonColorFound, PantalonIndex2, nil, {}, true, {
				onListChange = function(Index, Items)
					PantalonIndex2 = Index
					SetPedComponentVariation(PlayerPedId(), 4, PantalonIndex, PantalonIndex2, 2)
				end,
			})
            RageUI.Item.Button("Acheter ~g~"..Config.Price.Clothe.." $", "", {}, true, {
                onSelected = function()
					ESX.TriggerServerCallback('GetPlySkin', function(Skin)
						Result = json.decode(Skin)
						Result.PantalonIndex = PantalonIndex
						Result.PantalonIndex2 = PantalonIndex2
				     	TriggerServerEvent('CreateSkin', MdpClothe, json.encode(Result))
	                	TriggerServerEvent("SetNewAccesoire", MdpClothe, Config.Price.Clothe, PantalonIndex, PantalonIndex2, "Pantalon", 1)
						RageUI.GoBack()
					end)
                end,
            })
            RageUI.Item.Button("Retour", "", {}, true, {
                onSelected = function()
					SetPedComponentVariation(PlayerPedId(), 4, LastSkin.PantalonIndex, LastSkin.PantalonIndex2, 2)
					RageUI.GoBack()
                end,
            })
	    end)

		RageUI.IsVisible(RMenu:Get('Clothe', 'Chaussures'), function()
			ChaussureFound = {}
			for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 6), 1 do
				ChaussureFound[i] = i
			end
			RageUI.Item.List("Chaussure", ChaussureFound, ChaussureIndex, nil, {}, true, {
				onListChange = function(Index, Items)
					ChaussureIndex = Index
					SetPedComponentVariation(PlayerPedId(), 6, ChaussureIndex, ChaussureIndex2, 2)
				end,
			})
			ChaussureColorFound = {}
			for i = 0 , GetNumberOfPedTextureVariations(PlayerPedId(), 6, ChaussureIndex), 1 do
				ChaussureColorFound[i] = i
			end
			RageUI.Item.List("Couleur des chaussures", ChaussureColorFound, ChaussureIndex2, nil, {}, true, {
				onListChange = function(Index, Items)
                    ChaussureIndex2 = Index
		            SetPedComponentVariation(PlayerPedId(), 6, ChaussureIndex, ChaussureIndex2, 2)
				end,
			})
            RageUI.Item.Button("Acheter ~g~"..Config.Price.Clothe.." $", "", {}, true, {
                onSelected = function()
					ESX.TriggerServerCallback('GetPlySkin', function(Skin)
						Result = json.decode(Skin)
						Result.ChaussureIndex = ChaussureIndex
						Result.ChaussureIndex2 = ChaussureIndex2
				     	TriggerServerEvent('CreateSkin', MdpClothe, json.encode(Result))
	                	TriggerServerEvent("SetNewAccesoire", MdpClothe, Config.Price.Clothe, ChaussureIndex, ChaussureIndex2, "Chaussure", 1)
						RageUI.GoBack()
					end)
                end,
            })
            RageUI.Item.Button("Retour", "", {}, true, {
                onSelected = function()
		            SetPedComponentVariation(PlayerPedId(), 6, LastSkin.ChaussureIndex, LastSkin.ChaussureIndex2, 2)
					RageUI.GoBack()
                end,
            })
	    end)

		RageUI.IsVisible(RMenu:Get('Clothe', 'PlyTenue'), function()
			Result = PlyTenue
       		for i = 1, #Result, 1 do
		        RageUI.Item.List("~s~[~y~"..Result[i].Label.."~s~]", {"~g~Equiper~s~","~r~Renommer~s~"}, 1, nil, {}, true, {
					onSelected = function(Index, Items)
						Tenue = json.decode(Result[i].Tenue)
						PlyPed = GetPlayerPed(-1)
						if Index == 1 then
							ESX.TriggerServerCallback('GetPlySkin', function(Skin)
								Result = json.decode(Skin)
								Result.TshirtIndex = Tenue.TshirtIndex
								Result.TshirtIndex2 = Tenue.TshirtIndex2
								Result.ArmsIndex = Tenue.ArmsIndex
								Result.VesteIndex = Tenue.VesteIndex
								Result.VesteIndex2 = Tenue.VesteIndex2
								Result.PantalonIndex = Tenue.PantalonIndex
								Result.PantalonIndex2 = Tenue.PantalonIndex2
								Result.ChaussureIndex = Tenue.ChaussureIndex
								Result.ChaussureIndex2 = Tenue.ChaussureIndex2
				     			TriggerServerEvent('CreateSkin', MdpClothe, json.encode(Result))
				     			TriggerEvent('ApplySkin', GetPlayerPed(-1), json.encode(Result))
						    end)
						else
							NewLabel = KeyboardInput("Nouveau nom", 20)
							if NewLabel ~= nil then
								TriggerServerEvent('RenameTenue', MdpClothe, tonumber(Result[i].Id), NewLabel)
								RageUI.GoBack()
							else
								ESX.ShowNotification("Usage invalide.")
							end
						end
					end,
				})
       		end
            RageUI.Item.Button("Retour", "", {}, true, {
                onSelected = function()
					RageUI.GoBack()
                end,
            })
	    end)
	end
end)