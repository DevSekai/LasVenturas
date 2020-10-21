RMenu.Add('Ltd', 'Principal', RageUI.CreateMenu("", "Article disponible", nil, nil, "ShopDict", "LtdBanner"), true)
RMenu:Get('Ltd', 'Principal'):DisplayGlare(false);
RMenu:Get('Ltd', 'Principal').Closable = false;
RMenu.Add('Weapon', 'Principal', RageUI.CreateMenu("", "Article disponible", nil, nil, "ShopDict", "AmmuBanner"), true)
RMenu:Get('Weapon', 'Principal'):DisplayGlare(false);
RMenu:Get('Weapon', 'Principal').Closable = false;
RMenu.Add('Mask', 'Principal', RageUI.CreateMenu("", "Article disponible", nil, nil, "ShopDict", "MaskBanner"), true)
RMenu:Get('Mask', 'Principal'):DisplayGlare(false);
RMenu:Get('Mask', 'Principal').Closable = false;
RMenu.Add('Barber', 'Principal', RageUI.CreateMenu("", "Coupe possible", nil, nil, "ShopDict", "HairBanner"), true)
RMenu:Get('Barber', 'Principal'):DisplayGlare(false);
RMenu:Get('Barber', 'Principal').Closable = false;
RMenu.Add('Tatoo', 'Principal', RageUI.CreateMenu("", "Tatouage disponible", nil, nil, "ShopDict", "TatooBanner"), true)
RMenu:Get('Tatoo', 'Principal'):DisplayGlare(false);
RMenu:Get('Tatoo', 'Principal').Closable = false;

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
						ItemChoose = {Label = v.Name, Name = v.Value, Price = v.Price, Count = Index}
						TriggerServerEvent('BuyItems', Shops.Mdp, v.Type, json.encode(ItemChoose))
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
					MeleeWeapons = {Label = Items.Name, Name = Items.Value, Price = Items.Price}
					TriggerServerEvent('BuyItems', Shops.Mdp, Items.Type, json.encode(MeleeWeapons))
				end,
			})
			RageUI.Item.List("Armes de poing", Shops.Weapon.ItemsHand, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					FinalPrice = Items.Price
				end,
				onSelected = function(Index, Items)
					HandWeapons = {Label = Items.Name, Name = string.upper(Items.Value), Price = Items.Price}
					TriggerServerEvent('BuyItems', Shops.Mdp, Items.Type, json.encode(HandWeapons))
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
					Check = {Type = "Barber", Price = Shops.Barber.Price}
                    TriggerServerEvent('CheckMoney', Shops.Mdp, json.encode(Check))
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
					Check = {Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', Shops.Mdp, json.encode(Check))
				end
			})
			RageUI.Item.List("Cou", TatooList.NeckTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', Shops.Mdp, json.encode(Check))
				end
			})
			RageUI.Item.List("Torse", TatooList.ChestTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', Shops.Mdp, json.encode(Check))
				end
			})
			RageUI.Item.List("Dos", TatooList.BackTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', Shops.Mdp, json.encode(Check))
				end
			})
			RageUI.Item.List("Bras droit", TatooList.RArmsTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', Shops.Mdp, json.encode(Check))
				end
			})
			RageUI.Item.List("Bras gauche", TatooList.LArmsTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', Shops.Mdp, json.encode(Check))
				end
			})
			RageUI.Item.List("Epaule", TatooList.ShouldTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', Shops.Mdp, json.encode(Check))
				end
			})
			RageUI.Item.List("Ventre", TatooList.StomachTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', Shops.Mdp, json.encode(Check))
				end
			})
			RageUI.Item.List("Jambe droite", TatooList.RLegTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', Shops.Mdp, json.encode(Check))
				end
			})
			RageUI.Item.List("Jambe gauche", TatooList.LLegTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', Shops.Mdp, json.encode(Check))
				end
			})
			RageUI.Item.List("Hipster", TatooList.HipsterTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', Shops.Mdp, json.encode(Check))
				end
			})
			RageUI.Item.List("Multiplayer", TatooList.MpTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', Shops.Mdp, json.encode(Check))
				end
			})
			RageUI.Item.List("Noël~", TatooList.NoelTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', Shops.Mdp, json.encode(Check))
				end
			})
			RageUI.Item.List("Luxe", TatooList.LuxeTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', Shops.Mdp, json.encode(Check))
				end
			})
			RageUI.Item.List("Low rider", TatooList.LowRiderTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', Shops.Mdp, json.encode(Check))
				end
			})
			RageUI.Item.List("Stunt", TatooList.StuntTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', Shops.Mdp, json.encode(Check))
				end
			})
			RageUI.Item.List("Biker", TatooList.BikerTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', Shops.Mdp, json.encode(Check))
				end
			})
			RageUI.Item.List("Import/Export", TatooList.ExportTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', Shops.Mdp, json.encode(Check))
				end
			})
			RageUI.Item.List("Gun running", TatooList.GunTatooList, 1, nil, {}, true, {
				onListChange = function(Index, Items)
					ClearPedDecorations(PlayerPedId())
					AddPedDecorationFromHashes(PlayerPedId(), Items.Value, GetHashKey(Items.Hash))
				end,
				onSelected = function (Index, Items)
					Check = {Type = "Tatoo", Name = Items.Hash, Collection = Items.Value, Price = Shops.Tatoo.Price}
					TriggerServerEvent('CheckMoney', Shops.Mdp, json.encode(Check))
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
			Index = {}
			for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 1) - 1, 1 do
				Index[i] = i
			end
			RageUI.Item.List("Masque", Index, Shops.Mask.Index, nil, {}, true, {
				onListChange = function(Index, Items)
					Shops.Mask.Index = Index
					ESX.ShowNotification(Shops.Mask.Color)
					Shops.Mask.Color = 0
					SetPedComponentVariation(PlayerPedId(), 1, Shops.Mask.Index, Shops.Mask.Color, 2)
				end,
			})
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
					Stuff = {Name = "Masque", Index = Shops.Mask.Index, Color = Shops.Mask.Color, Price = Shops.Mask.Price}
                	TriggerServerEvent("BuyStuff", Shops.Mdp, json.encode(Stuff))
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