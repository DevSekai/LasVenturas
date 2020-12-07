RMenu.Add('Ltd', 'Principal', RageUI.CreateMenu("", "Article disponible", nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Ltd', 'Principal'):DisplayGlare(false);
RMenu:Get('Ltd', 'Principal').Closable = false;

RMenu.Add('Weapon', 'Principal', RageUI.CreateMenu("", "Article disponible", nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Weapon', 'Principal'):DisplayGlare(false);
RMenu:Get('Weapon', 'Principal').Closable = false;

RMenu.Add('Mask', 'Principal', RageUI.CreateMenu("", "Article disponible", nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Mask', 'Principal'):DisplayGlare(false);
RMenu:Get('Mask', 'Principal').Closable = false;

RMenu.Add('Barber', 'Principal', RageUI.CreateMenu("", "Coupe possible", nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Barber', 'Principal'):DisplayGlare(false);
RMenu:Get('Barber', 'Principal').Closable = false;

RMenu.Add('Tatoo', 'Principal', RageUI.CreateMenu("", "Tatouage disponible", nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Tatoo', 'Principal'):DisplayGlare(false);
RMenu:Get('Tatoo', 'Principal').Closable = false;

RMenu.Add('Clothe', 'Principal', RageUI.CreateMenu("", "Magasin de vêtements", nil, nil, "root_cause", "Banner"), true)
RMenu:Get('Clothe', 'Principal'):DisplayGlare(false);
RMenu:Get('Clothe', 'Principal').Closable = false;

RMenu.Add('Clothe', 'Vetements', RageUI.CreateSubMenu(RMenu:Get('Clothe', 'Principal'), "", ""))
RMenu:Get('Clothe', 'Vetements'):SetSubtitle("Vêtements disponible")
RMenu:Get('Clothe', 'Vetements'):DisplayGlare(false);

	RMenu.Add('Clothe', 'Tshirt', RageUI.CreateSubMenu(RMenu:Get('Clothe', 'Vetements'), "", ""))
	RMenu:Get('Clothe', 'Tshirt'):SetSubtitle("T-hsirts disponibles")
	RMenu:Get('Clothe', 'Tshirt'):DisplayGlare(false);

	RMenu.Add('Clothe', 'Vestes', RageUI.CreateSubMenu(RMenu:Get('Clothe', 'Vetements'), "", ""))
	RMenu:Get('Clothe', 'Vestes'):SetSubtitle("Vestes disponibles")
	RMenu:Get('Clothe', 'Vestes'):DisplayGlare(false);

	RMenu.Add('Clothe', 'Pantalons', RageUI.CreateSubMenu(RMenu:Get('Clothe', 'Vetements'), "", ""))
	RMenu:Get('Clothe', 'Pantalons'):SetSubtitle("Pantalons disponibles")
	RMenu:Get('Clothe', 'Pantalons'):DisplayGlare(false);

	RMenu.Add('Clothe', 'Chaussures', RageUI.CreateSubMenu(RMenu:Get('Clothe', 'Vetements'), "", ""))
	RMenu:Get('Clothe', 'Chaussures'):SetSubtitle("Chaussures disponibles")
	RMenu:Get('Clothe', 'Chaussures'):DisplayGlare(false);

RMenu.Add('Clothe', 'Accessorie', RageUI.CreateSubMenu(RMenu:Get('Clothe', 'Principal'), "", ""))
RMenu:Get('Clothe', 'Accessorie'):SetSubtitle("Accessoires disponibles")
RMenu:Get('Clothe', 'Accessorie'):DisplayGlare(false);

	RMenu.Add('Clothe', 'Lunettes', RageUI.CreateSubMenu(RMenu:Get('Clothe', 'Accessorie'), "", ""))
	RMenu:Get('Clothe', 'Lunettes'):SetSubtitle("Lunettes disponibles")
	RMenu:Get('Clothe', 'Lunettes'):DisplayGlare(false);

	RMenu.Add('Clothe', 'Chaines', RageUI.CreateSubMenu(RMenu:Get('Clothe', 'Accessorie'), "", ""))
	RMenu:Get('Clothe', 'Chaines'):SetSubtitle("Chaines disponibles")
	RMenu:Get('Clothe', 'Chaines'):DisplayGlare(false);

	RMenu.Add('Clothe', 'Chapeaux', RageUI.CreateSubMenu(RMenu:Get('Clothe', 'Accessorie'), "", ""))
	RMenu:Get('Clothe', 'Chapeaux'):SetSubtitle("Chapeaux disponibles")
	RMenu:Get('Clothe', 'Chapeaux'):DisplayGlare(false);

	RMenu.Add('Clothe', 'Boucles', RageUI.CreateSubMenu(RMenu:Get('Clothe', 'Accessorie'), "", ""))
	RMenu:Get('Clothe', 'Boucles'):SetSubtitle("Boucles d'oreilles disponibles")
	RMenu:Get('Clothe', 'Boucles'):DisplayGlare(false);

RMenu.Add('BlackMarket', 'Principal', RageUI.CreateMenu("", "Magasin illégale", nil, nil, "ShopDict", "BlackBanner"), true)
RMenu:Get('BlackMarket', 'Principal'):DisplayGlare(false);
RMenu:Get('BlackMarket', 'Principal').Closable = false;

function ShowMenu(Type)
	RageUI.Visible(RMenu:Get(Type, 'Principal'), not RageUI.Visible(RMenu:Get(Type, 'Principal')))
	FreezeEntityPosition(PlayerPedId(), true)
	InMenu = true

	while InMenu do
		Citizen.Wait(0)

		RageUI.IsVisible(RMenu:Get('Ltd', 'Principal'), function()
			RageUI.Item.Separator("[~y~Prix~s~] : ~g~"..FinalPrice.." $")
			for _,v in pairs (Shops.Ltd.Items) do
				MxQte = {}
				for i = 0 , v.MaxNbr, 1 do
					MxQte[i] = i
				end
				RageUI.Item.List(v.Name, MxQte, 1, nil, {}, true, {
					onListChange = function(Index, Items)
						FinalPrice = v.Price * Index
					end,
					onSelected = function (Index, Items)
						ItemChoose = {Token = json.encode(TokenGen), Label = v.Name, Name = v.Value, Price = v.Price, Count = Index}
						TriggerServerEvent('BuyItems', v.Type, json.encode(ItemChoose))
					end,
				})
			end
			RageUI.Item.Button("Retour", "", {}, true, {
				onSelected = function()
					Timing = 2000
					FreezeEntityPosition(PlayerPedId(), false)
					RageUI.CloseAll()
					Citizen.Wait(Timing)
					InMenu = false
				end,
			})
		end)

		RageUI.IsVisible(RMenu:Get('Weapon', 'Principal'), function()
			RageUI.Item.Separator("[~y~Prix~s~] : ~g~"..FinalPrice.." $")
			RageUI.Item.List("Armes contendante", Shops.Weapon.ItemsMelee, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					FinalPrice = Items.Price
				end,
				onSelected = function(Index, Items)
					MeleeWeapons = {Token = json.encode(TokenGen), Label = Items.Name, Name = Items.Value, Price = Items.Price}
					TriggerServerEvent('BuyItems', Items.Type, json.encode(MeleeWeapons))
				end,
			})
			RageUI.Item.List("Armes de poing", Shops.Weapon.ItemsHand, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					FinalPrice = Items.Price
				end,
				onSelected = function(Index, Items)
					HandWeapons = {Token = json.encode(TokenGen), Label = Items.Name, Name = string.upper(Items.Value), Price = Items.Price}
					TriggerServerEvent('BuyItems', Items.Type, json.encode(HandWeapons))
					ESX.ShowNotification(json.encode(TokenGen))
				end,
			})
			RageUI.Item.Button("Retour", "", {}, true, {
				onSelected = function()
					Timing = 2000
					FreezeEntityPosition(PlayerPedId(), false)
					RageUI.CloseAll()
					Citizen.Wait(Timing)
					InMenu = false
				end,
			})
		end)

		RageUI.IsVisible(RMenu:Get('BlackMarket', 'Principal'), function()
			RageUI.Item.Separator("[~y~Prix~s~] : ~g~"..FinalPrice.." $")
            for _,v in pairs (Config.BlackMarket.Items) do
                 MxQte = {}
                for i = 0 , v.MaxNbr, 1 do
                    MxQte[i] = i
                end
                RageUI.Item.List(v.Label, MxQte, 1, nil, {}, true, {
                    onListChange = function(Index, Items)
                        FinalPrice = v.Price * Index
                    end,
					onSelected = function (Index, Items)
						ItemChoose = {Token = json.encode(TokenGen), Label = v.Name, Name = v.Value, Price = v.Price, Count = Index}
                        TriggerServerEvent('BuyItem', ItemChoose)
                    end
                })
            end
            RageUI.Item.Button("Retour", "", {}, true, {
                onSelected = function()
					InMenu = false
					FreezeEntityPosition(PlayerPedId(), false)
					RageUI.CloseAll()
                end,
            })
	    end)

		RageUI.IsVisible(RMenu:Get('Clothe', 'Principal'), function()
            RageUI.Item.Button("Acheter des vêtements", "", {}, true, {
            },RMenu:Get('Clothe', 'Vetements'))
            RageUI.Item.Button("Acheter des accessoires", "", {}, true, {
            },RMenu:Get('Clothe', 'Accessorie'))
			RageUI.Item.Button("Retour", "", {}, true, {
				onSelected = function()
					Timing = 2000
                    ESX.TriggerServerCallback('GetPlySkin', function(Skin)
						TriggerEvent('ApplySkin', GetPlayerPed(-1), Skin)
                    end)
					FreezeEntityPosition(PlayerPedId(), false)
					RageUI.CloseAll()
					Citizen.Wait(Timing)
					InMenu = false
				end,
			})
		end)
		
		RageUI.IsVisible(RMenu:Get('Clothe', 'Vetements'), function()
			RageUI.Item.Separator("[~y~Prix~s~] : ~g~"..Shops.Clothe.Price.Vet.." $")
            RageUI.Item.Button("Tshirt", "", {}, true, {
            },RMenu:Get('Clothe', 'Tshirt'))
            RageUI.Item.Button("Vestes", "", {}, true, {
            },RMenu:Get('Clothe', 'Vestes'))
            RageUI.Item.Button("Pantalons", "", {}, true, {
            },RMenu:Get('Clothe', 'Pantalons'))
            RageUI.Item.Button("Chaussures", "", {}, true, {
            },RMenu:Get('Clothe', 'Chaussures'))
	    end)

		RageUI.IsVisible(RMenu:Get('Clothe', 'Tshirt'), function()
			TshirtFound = {}
			for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 8), 1 do
				TshirtFound[i] = i
			end
			RageUI.Item.List("Tshirt", TshirtFound, Shops.Clothe.TshirtIndex, nil, {}, true, {
				onListChange = function(Index, Items)
					Shops.Clothe.TshirtIndex = Index
					SetPedComponentVariation(PlayerPedId(), 8, Shops.Clothe.TshirtIndex, Shops.Clothe.TshirtIndex2, 2)
				end,
			})
			TshirtColorFound = {}
			for i = 0 , GetNumberOfPedTextureVariations(PlayerPedId(), 8, Shops.Clothe.TshirtIndex), 1 do
				TshirtColorFound[i] = i
			end
			RageUI.Item.List("Couleur du tshirt", TshirtColorFound, Shops.Clothe.TshirtIndex2, nil, {}, true, {
				onListChange = function(Index, Items)
					Shops.Clothe.TshirtIndex2 = Index
					SetPedComponentVariation(PlayerPedId(), 8, Shops.Clothe.TshirtIndex, Shops.Clothe.TshirtIndex2, 2)
				end,
			})
            RageUI.Item.Button("Acheter", "", {}, true, {
                onSelected = function()
					Stuff = {Token = json.encode(TokenGen), Name = "Tshirt", Index = Shops.Clothe.TshirtIndex, Color = Shops.Clothe.TshirtIndex2, Price = Shops.Clothe.Price.Vet}
					TriggerServerEvent("BuyStuff", json.encode(Stuff))
                end,
            })
	    end)

		RageUI.IsVisible(RMenu:Get('Clothe', 'Vestes'), function()
			VesteFound = {}
			for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 11), 1 do
				VesteFound[i] = i
			end
			RageUI.Item.List("Veste", VesteFound, Shops.Clothe.VesteIndex, nil, {}, true, {
				onListChange = function(Index, Items)
					Shops.Clothe.VesteIndex = Index
					SetPedComponentVariation(PlayerPedId(), 11, Shops.Clothe.VesteIndex, Shops.Clothe.VesteIndex2, 2)
				end,
			})
			VesteColorFound = {}
			for i = 0 , GetNumberOfPedTextureVariations(PlayerPedId(), 11, Shops.Clothe.VesteIndex), 1 do
				VesteColorFound[i] = i
			end
			RageUI.Item.List("Couleur de la veste", VesteColorFound, Shops.Clothe.VesteIndex2, nil, {}, true, {
				onListChange = function(Index, Items)
					Shops.Clothe.VesteIndex2 = Index
					SetPedComponentVariation(PlayerPedId(), 11, Shops.Clothe.VesteIndex, Shops.Clothe.VesteIndex2, 2)
				end,
			})
            RageUI.Item.Button("Acheter", "", {}, true, {
                onSelected = function()
					Stuff = {Token = json.encode(TokenGen), Name = "Vestes", Index = Shops.Clothe.VesteIndex, Color = Shops.Clothe.VesteIndex2, Price = Shops.Clothe.Price.Vet}
					TriggerServerEvent("BuyStuff", json.encode(Stuff))
                end,
            })
	    end)

		RageUI.IsVisible(RMenu:Get('Clothe', 'Pantalons'), function()
			PantalonFound = {}
			for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 4), 1 do
				PantalonFound[i] = i
			end
			RageUI.Item.List("Pantalon", PantalonFound, Shops.Clothe.PantalonIndex, nil, {}, true, {
				onListChange = function(Index, Items)
					Shops.Clothe.PantalonIndex = Index
					SetPedComponentVariation(PlayerPedId(), 4, Shops.Clothe.PantalonIndex, Shops.Clothe.PantalonIndex2, 2)
				end,
			})
			PantalonColorFound = {}
			for i = 0 , GetNumberOfPedTextureVariations(PlayerPedId(), 4, Shops.Clothe.PantalonIndex), 1 do
				PantalonColorFound[i] = i
			end
			RageUI.Item.List("Couleur du pantalon", PantalonColorFound, Shops.Clothe.PantalonIndex2, nil, {}, true, {
				onListChange = function(Index, Items)
					Shops.Clothe.PantalonIndex2 = Index
					SetPedComponentVariation(PlayerPedId(), 4, Shops.Clothe.PantalonIndex, Shops.Clothe.PantalonIndex2, 2)
				end,
			})
            RageUI.Item.Button("Acheter", "", {}, true, {
                onSelected = function()
					Stuff = {Token = json.encode(TokenGen), Name = "Pantalons", Index = Shops.Clothe.PantalonIndex, Color = Shops.Clothe.PantalonIndex, Price = Shops.Clothe.Price.Vet}
					TriggerServerEvent("BuyStuff", json.encode(Stuff))
                end,
            })
	    end)

		RageUI.IsVisible(RMenu:Get('Clothe', 'Chaussures'), function()
			ChaussureFound = {}
			for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 6), 1 do
				ChaussureFound[i] = i
			end
			RageUI.Item.List("Chaussure", ChaussureFound, Shops.Clothe.ChaussureIndex, nil, {}, true, {
				onListChange = function(Index, Items)
					Shops.Clothe.ChaussureIndex = Index
					SetPedComponentVariation(PlayerPedId(), 6, Shops.Clothe.ChaussureIndex, Shops.Clothe.ChaussureIndex2, 2)
				end,
			})
			ChaussureColorFound = {}
			for i = 0 , GetNumberOfPedTextureVariations(PlayerPedId(), 6, Shops.Clothe.ChaussureIndex), 1 do
				ChaussureColorFound[i] = i
			end
			RageUI.Item.List("Couleur des chaussures", ChaussureColorFound, Shops.Clothe.ChaussureIndex2, nil, {}, true, {
				onListChange = function(Index, Items)
                    Shops.Clothe.ChaussureIndex2 = Index
		            SetPedComponentVariation(PlayerPedId(), 6, Shops.Clothe.ChaussureIndex, Shops.Clothe.ChaussureIndex2, 2)
				end,
			})
            RageUI.Item.Button("Acheter", "", {}, true, {
                onSelected = function()
					Stuff = {Token = json.encode(TokenGen), Name = "Chaussures", Index = Shops.Clothe.ChaussureIndex, Color = Shops.Clothe.ChaussureIndex2, Price = Shops.Clothe.Price.Vet}
					TriggerServerEvent("BuyStuff", json.encode(Stuff))
                end,
            })
	    end)

		RageUI.IsVisible(RMenu:Get('Clothe', 'Accessorie'), function()
			RageUI.Item.Separator("[~y~Prix~s~] : ~g~"..Shops.Clothe.Price.Acc.." $")
            RageUI.Item.Button("Lunettes", "", {}, true, {
            },RMenu:Get('Clothe', 'Lunettes'))
            RageUI.Item.Button("Chaines", "", {}, true, {
            },RMenu:Get('Clothe', 'Chaines'))
            RageUI.Item.Button("Chapeaux", "", {}, true, {
            },RMenu:Get('Clothe', 'Chapeaux'))
            RageUI.Item.Button("Boucles d'oreille", "", {}, true, {
            },RMenu:Get('Clothe', 'Boucles'))
			RageUI.Item.Button("Retour", "", {}, true, {
			},RMenu:Get('Clothe', 'Principal'))
		end)
		
		RageUI.IsVisible(RMenu:Get('Clothe', 'Lunettes'), function()
			LunetteFound = {}
			for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 1) ,1 do
				LunetteFound[i] = i
			end
			RageUI.Item.List("Lunettes", LunetteFound, Shops.Clothe.LunetteIndex, nil, {}, true, {
				onListChange = function(Index, Items)
					Shops.Clothe.LunetteIndex = Index
					SetPedPropIndex(PlayerPedId(), 1, Shops.Clothe.LunetteIndex, Shops.Clothe.LunetteIndex2, 2)
				end,
			})
			LunetteColorFound = {}
			for i = 0 , GetNumberOfPedPropTextureVariations(PlayerPedId(), 1, Shops.Clothe.LunetteIndex), 1 do
				LunetteColorFound[i] = i
			end
			RageUI.Item.List("Couleur des lunettes", LunetteColorFound, Shops.Clothe.LunetteIndex2, nil, {}, true, {
				onListChange = function(Index, Items)
					Shops.Clothe.LunetteIndex2 = Index
					SetPedPropIndex(PlayerPedId(), 1, Shops.Clothe.LunetteIndex, Shops.Clothe.LunetteIndex2, 2)
				end,
			})
            RageUI.Item.Button("Acheter", "", {}, true, {
                onSelected = function()
					Stuff = {Token = json.encode(TokenGen), Name = "Lunettes", Index = Shops.Clothe.LunetteIndex, Color = Shops.Clothe.LunetteIndex2, Price = Shops.Clothe.Price.Acc}
					TriggerServerEvent("BuyStuff", json.encode(Stuff))
                end,
            })
	    end)

		RageUI.IsVisible(RMenu:Get('Clothe', 'Chaines'), function()
			ChainesFound = {}
			for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 7) ,1 do
				ChainesFound[i] = i
			end
			RageUI.Item.List("Chaines", ChainesFound, Shops.Clothe.ChainesIndex, nil, {}, true, {
				onListChange = function(Index, Items)
					Shops.Clothe.ChainesIndex = Index
					SetPedComponentVariation(PlayerPedId(), 7, Shops.Clothe.ChainesIndex, Shops.Clothe.ChainesIndex2, 2)
				end,
			})
			ChainesColorFound = {}
			for i = 0 , GetNumberOfPedPropTextureVariations(PlayerPedId(), 7, Shops.Clothe.ChainesIndex), 1 do
				ChainesColorFound[i] = i
			end
			RageUI.Item.List("Couleur de la chaine", ChainesColorFound, Shops.Clothe.ChainesIndex2, nil, {}, true, {
				onListChange = function(Index, Items)
					Shops.Clothe.ChainesIndex2 = Index
					SetPedComponentVariation(PlayerPedId(), 7, Shops.Clothe.ChainesIndex, Shops.Clothe.ChainesIndex2, 2)
				end,
			})
            RageUI.Item.Button("Acheter", "", {}, true, {
                onSelected = function()
					Stuff = {Token = json.encode(TokenGen), Name = "Chaines", Index = Shops.Clothe.ChainesIndex, Color = Shops.Clothe.ChainesIndex2, Price = Shops.Clothe.Price.Acc}
					TriggerServerEvent("BuyStuff", json.encode(Stuff))
                end,
            })
	    end)

		RageUI.IsVisible(RMenu:Get('Clothe', 'Chapeaux'), function()
			ChapeauxFound = {}
			for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 0) ,1 do
				ChapeauxFound[i] = i
			end
			RageUI.Item.List("Chapeaux", ChapeauxFound, Shops.Clothe.ChapeauxIndex, nil, {}, true, {
				onListChange = function(Index, Items)
					Shops.Clothe.ChapeauxIndex = Index
					SetPedPropIndex(PlayerPedId(), 0, Shops.Clothe.ChapeauxIndex, Shops.Clothe.ChapeauxIndex2, 2)
				end,
			})
			ChapeauxColorFound = {}
			for i = 0 , GetNumberOfPedPropTextureVariations(PlayerPedId(), 0, Shops.Clothe.ChapeauxIndex), 1 do
				ChapeauxColorFound[i] = i
			end
			RageUI.Item.List("Couleur du chapeau", ChapeauxColorFound, Shops.Clothe.ChapeauxIndex2, nil, {}, true, {
				onListChange = function(Index, Items)
					Shops.Clothe.ChapeauxIndex2 = Index
					SetPedPropIndex(PlayerPedId(), 0, Shops.Clothe.ChapeauxIndex, Shops.Clothe.ChapeauxIndex2, 2)
				end,
			})
            RageUI.Item.Button("Acheter", "", {}, true, {
                onSelected = function()
					Stuff = {Token = json.encode(TokenGen), Name = "Chapeaux", Index = Shops.Clothe.ChapeauxIndex, Color = Shops.Clothe.ChapeauxIndex2, Price = Shops.Clothe.Price.Acc}
					TriggerServerEvent("BuyStuff", json.encode(Stuff))
                end,
            })
	    end)

		RageUI.IsVisible(RMenu:Get('Clothe', 'Boucles'), function()
			BouclesFound = {}
			for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 2) ,1 do
				BouclesFound[i] = i
			end
			RageUI.Item.List("Boucles d'oreilles", BouclesFound, Shops.Clothe.BouclesIndex, nil, {}, true, {
				onListChange = function(Index, Items)
					Shops.Clothe.BouclesIndex = Index
					SetPedPropIndex(PlayerPedId(), 2, Shops.Clothe.BouclesIndex, Shops.Clothe.BouclesIndex2, 2)
				end,
			})
			BouclesColorFound = {}
			for i = 0 , GetNumberOfPedPropTextureVariations(PlayerPedId(), 2, Shops.Clothe.BouclesIndex), 1 do
				BouclesColorFound[i] = i
			end
			RageUI.Item.List("Couleur des boucles d'oreilles", BouclesColorFound, Shops.Clothe.BouclesIndex2, nil, {}, true, {
				onListChange = function(Index, Items)
					Shops.Clothe.BouclesIndex2 = Index
					SetPedPropIndex(PlayerPedId(), 2, Shops.Clothe.BouclesIndex, Shops.Clothe.BouclesIndex2, 2)
				end,
			})
            RageUI.Item.Button("Acheter", "", {}, true, {
                onSelected = function()
					Stuff = {Token = json.encode(TokenGen), Name = "Boucles", Index = Shops.Clothe.BouclesIndex, Color = Shops.Clothe.BouclesIndex2, Price = Shops.Clothe.Price.Acc}
					TriggerServerEvent("BuyStuff", json.encode(Stuff))
                end,
            })
	    end)

		RageUI.IsVisible(RMenu:Get('Barber', 'Principal'), function()
			RageUI.Item.Separator("[~y~Prix~s~] : ~g~"..Shops.Barber.Price.." $")
	        Coiffure = {}
	        for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 2)-1, 1 do
	            Coiffure[i] = i
	        end
		    RageUI.Item.List("Cheveux", Coiffure, Shops.Barber.Index, nil, {}, true, {
		        onListChange = function(Index, Items)
			        Shops.Barber.Index = Index
			        SetPedComponentVariation(PlayerPedId(), 2, Shops.Barber.Index, 1, 2)
		        end,
		    })
	        Barbes = {}
	        for i = 0 , GetNumHeadOverlayValues(1)-1, 1 do
	            Barbes[i] = i
	        end
		    RageUI.Item.List("Barbes", Barbes, Shops.Barber.Index2, nil, {}, true, {
		        onListChange = function(Index, Items)
			        Shops.Barber.Index2 = Index
			        SetPedHeadOverlay(PlayerPedId(), 1, Shops.Barber.Index2, 1 + 0.0)
			        SetPedHeadOverlayColor(PlayerPedId(), 1, 1, 1, 1)
		        end,
		    })
            Couleur = {}
            for i = 0 , GetNumHairColors()-1 do
                Couleur[i] = i
            end
		    RageUI.Item.List("Couleur cheveux/barbes", Couleur, Shops.Barber.Color, nil, {}, true, {
		        onListChange = function(Index, Items)
		            Shops.Barber.Color = Index
		            SetPedHairColor(PlayerPedId(), Shops.Barber.Color, Shops.Barber.Color)
		            SetPedHeadOverlayColor(PlayerPedId(), 1, 1, Shops.Barber.Color, Shops.Barber.Color)
		        end,
		    })
            RageUI.Item.Button("Acheter", "", {}, true, {
				onSelected = function()
					Check = {Token = json.encode(TokenGen), Type = "Barber", Price = Shops.Barber.Price}
                    TriggerServerEvent('CheckMoney', json.encode(Check))
                end,
            })
            RageUI.Item.Button("Retour", "", {}, true, {
                onSelected = function()
					DoScreenFadeOut(1500)
					Citizen.Wait(750)
                    ESX.TriggerServerCallback('GetPlySkin', function(Skin)
						TriggerEvent('ApplySkin', GetPlayerPed(-1), Skin)
                    end)
					SetEntityCoords(PlayerPedId(), Shops.Barber.Out.X, Shops.Barber.Out.Y, Shops.Barber.Out.Z - 0.98)
					SetEntityHeading(PlayerPedId(), Shops.Barber.Out.H)
					FreezeEntityPosition(PlayerPedId(), false)
					RageUI.CloseAll()
					Citizen.Wait(750)
					Timing = 2000
					DoScreenFadeIn(1500)
					Citizen.Wait(Timing)
					InMenu = false
                end,
            })
		end)
		
		RageUI.IsVisible(RMenu:Get('Tatoo', 'Principal'), function()
			RageUI.Item.Separator("[~y~Prix~s~] : ~g~"..Shops.Tatoo.Price.." $")
			RageUI.Item.List("Tête", TatooList.HeadTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Token = json.encode(TokenGen), Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', json.encode(Check))
				end
			})
			RageUI.Item.List("Cou", TatooList.NeckTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Token = json.encode(TokenGen), Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', json.encode(Check))
				end
			})
			RageUI.Item.List("Torse", TatooList.ChestTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Token = json.encode(TokenGen), Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', json.encode(Check))
				end
			})
			RageUI.Item.List("Dos", TatooList.BackTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Token = json.encode(TokenGen), Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', json.encode(Check))
				end
			})
			RageUI.Item.List("Bras droit", TatooList.RArmsTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Token = json.encode(TokenGen), Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', json.encode(Check))
				end
			})
			RageUI.Item.List("Bras gauche", TatooList.LArmsTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Token = json.encode(TokenGen), Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', json.encode(Check))
				end
			})
			RageUI.Item.List("Epaule", TatooList.ShouldTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Token = json.encode(TokenGen), Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', json.encode(Check))
				end
			})
			RageUI.Item.List("Ventre", TatooList.StomachTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Token = json.encode(TokenGen), Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', json.encode(Check))
				end
			})
			RageUI.Item.List("Jambe droite", TatooList.RLegTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Token = json.encode(TokenGen), Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', json.encode(Check))
				end
			})
			RageUI.Item.List("Jambe gauche", TatooList.LLegTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Token = json.encode(TokenGen), Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', json.encode(Check))
				end
			})
			RageUI.Item.List("Hipster", TatooList.HipsterTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Token = json.encode(TokenGen), Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', json.encode(Check))
				end
			})
			RageUI.Item.List("Multiplayer", TatooList.MpTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Token = json.encode(TokenGen), Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', json.encode(Check))
				end
			})
			RageUI.Item.List("Noël~", TatooList.NoelTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Token = json.encode(TokenGen), Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', json.encode(Check))
				end
			})
			RageUI.Item.List("Luxe", TatooList.LuxeTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Token = json.encode(TokenGen), Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', json.encode(Check))
				end
			})
			RageUI.Item.List("Low rider", TatooList.LowRiderTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Token = json.encode(TokenGen), Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', json.encode(Check))
				end
			})
			RageUI.Item.List("Stunt", TatooList.StuntTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Token = json.encode(TokenGen), Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', json.encode(Check))
				end
			})
			RageUI.Item.List("Biker", TatooList.BikerTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Token = json.encode(TokenGen), Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', json.encode(Check))
				end
			})
			RageUI.Item.List("Import/Export", TatooList.ExportTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Token = json.encode(TokenGen), Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', json.encode(Check))
				end
			})
			RageUI.Item.List("Gun running", TatooList.GunTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Token = json.encode(TokenGen), Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', json.encode(Check))
				end
			})
		    RageUI.Item.Button("Retour", "", {}, true, {
		    	onSelected = function ()
					DoScreenFadeOut(1500)
					Citizen.Wait(750)
					ESX.TriggerServerCallback('GetPlySkin', function(Skin)
						TriggerEvent('ApplySkin', GetPlayerPed(-1), Skin)
				    end)
					ESX.TriggerServerCallback('GetPlyTatoo', function(Tatoo)
						for _,v in pairs (Tatoo) do
							AddPedDecorationFromHashes(GetPlayerPed(-1), v.Collection, GetHashKey(v.Tatoo))
						end
					end)
					SetEntityCoords(PlayerPedId(), Shops.Tatoo.Out.X, Shops.Tatoo.Out.Y, Shops.Tatoo.Out.Z - 0.98)
					SetEntityHeading(PlayerPedId(), Shops.Tatoo.Out.H)
					FreezeEntityPosition(PlayerPedId(), false)
					RageUI.CloseAll()
					Citizen.Wait(750)
					Timing = 2000
					DoScreenFadeIn(1500)
					Citizen.Wait(Timing)
					InMenu = false
		    	end,
		    })
        end)

		RageUI.IsVisible(RMenu:Get('Mask', 'Principal'), function()
			RageUI.Item.Separator("[~y~Prix~s~] : ~g~"..Shops.Mask.Price.." $")
			MaskFound = {}
			for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 1) - 1, 1 do
				MaskFound[i] = i
			end
			for _,v in pairs (MaskFound) do
				RageUI.Item.List("Masque", Index, Shops.Mask.Index, nil, {}, true, {
					onListChange = function(Index, Items)
						Shops.Mask.Index = Index
						ESX.ShowNotification(Shops.Mask.Color)
						Shops.Mask.Color = 0
						SetPedComponentVariation(PlayerPedId(), 1, Shops.Mask.Index, Shops.Mask.Color, 2)
					end,
				})
			end
			Color = {}
			for i = 0 , GetNumberOfPedTextureVariations(PlayerPedId(), 1, Shops.Mask.Index) - 1, 1 do
				Color[i] = i
			end
			RageUI.Item.List("Variation", Color, Shops.Mask.Color, nil, {}, true, {
				onListChange = function(Index, Items)
					Shops.Mask.Color = Index
					SetPedComponentVariation(PlayerPedId(), 1, Shops.Mask.Index, Shops.Mask.Color, 2)
				end,
			})
            RageUI.Item.Button("Acheter", "", {}, true, {
				onSelected = function()
					Stuff = {Token = json.encode(TokenGen), Name = "Masque", Index = Shops.Mask.Index, Color = Shops.Mask.Color, Price = Shops.Mask.Price}
                	TriggerServerEvent("BuyStuff", json.encode(Stuff))
                end,
            })
			RageUI.Item.Button("Retour", "", {}, true, {
				onSelected = function()
					Timing = 2000
					SetPedComponentVariation(PlayerPedId(), 1, 0, 0, 2)
					FreezeEntityPosition(PlayerPedId(), false)
					DeleteCams()
					RageUI.CloseAll()
					Citizen.Wait(Timing)
					InMenu = false
				end,
			})
		end)
	end
end