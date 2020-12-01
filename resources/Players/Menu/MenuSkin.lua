PedIndex, DadIndex, MotherIndex, ArmsIndex, CheuveuxIndex, CouleurIndex, OeilIndex, BarbeIndex, TshirtIndex, TshirtIndex2, VesteIndex, VesteIndex2, PantalonIndex, PantalonIndex2, ChaussureIndex, ChaussureIndex2 = '', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
DadNumber = {"Benjamin", "Daniel", "Joshua", "Noah", "Andrew", "Juan", "Alex", "Isaac", "Evan", "Ethan", "Vincent", "Angel", "Diego", "Adrian", "Gabriel", "Michael", "Santiago", "Kevin", "Louis", "Samuel", "Anthony", "Pierre", "Niko"}
MotherNumber = {"Adelyn", "Emily", "Abigail", "Beverly", "Kristen", "Hailey", "June", "Daisy", "Elizabeth", "Addison", "Ava", "Cameron", "Samantha", "Madison", "Amber", "Heather", "Hillary", "Courtney", "Ashley", "Alyssa", "Mia", "Brittany"}
MdpSkin = "Ntm"

RMenu.Add('CrationPerso', 'Skin', RageUI.CreateMenu("", "", nil, nil, "root_cause", "Banner"), true)
RMenu:Get('CrationPerso', 'Skin'):SetSubtitle("~y~Création de l'apparence")
RMenu:Get('CrationPerso', 'Skin'):DisplayInstructionalButton(false)
RMenu:Get('CrationPerso', 'Skin'):DisplayGlare(false);
RMenu:Get('CrationPerso', 'Skin').Closable = false;

RMenu.Add('CrationPerso', 'Sexe', RageUI.CreateSubMenu(RMenu:Get('CrationPerso', 'Skin'), "", ""))
RMenu:Get('CrationPerso', 'Sexe'):SetSubtitle("~y~Sexe")
RMenu:Get('CrationPerso', 'Sexe'):DisplayGlare(false);
RMenu:Get('CrationPerso', 'Sexe').Closable = false;

RMenu.Add('CrationPerso', 'MumDad', RageUI.CreateSubMenu(RMenu:Get('CrationPerso', 'Skin'), "", ""))
RMenu:Get('CrationPerso', 'MumDad'):SetSubtitle("~y~Hérédité")
RMenu:Get('CrationPerso', 'MumDad'):DisplayGlare(false);
RMenu:Get('CrationPerso', 'MumDad').Closable = false;

RMenu.Add('CrationPerso', 'Head', RageUI.CreateSubMenu(RMenu:Get('CrationPerso', 'Skin'), "", ""))
RMenu:Get('CrationPerso', 'Head'):SetSubtitle("~y~Tête")
RMenu:Get('CrationPerso', 'Head'):DisplayGlare(false);
RMenu:Get('CrationPerso', 'Head').Closable = false;

RMenu.Add('CrationPerso', 'HighClothe', RageUI.CreateSubMenu(RMenu:Get('CrationPerso', 'Skin'), "", ""))
RMenu:Get('CrationPerso', 'HighClothe'):SetSubtitle("~y~Hauts")
RMenu:Get('CrationPerso', 'HighClothe'):DisplayGlare(false);
RMenu:Get('CrationPerso', 'HighClothe').Closable = false;

RMenu.Add('CrationPerso', 'LowClothe', RageUI.CreateSubMenu(RMenu:Get('CrationPerso', 'Skin'), "", ""))
RMenu:Get('CrationPerso', 'LowClothe'):SetSubtitle("~y~Bas")
RMenu:Get('CrationPerso', 'LowClothe'):DisplayGlare(false);
RMenu:Get('CrationPerso', 'LowClothe').Closable = false;

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		RageUI.IsVisible(RMenu:Get('CrationPerso', 'Skin'), function()
		    RageUI.Item.Button("Sexe", "", {}, true, {
		        onSelected = function()
		        	HighCam()
		        end,
		    },RMenu:Get('CrationPerso', 'Sexe'))
		    RageUI.Item.Button("Hérédité", "", {}, true, {
		        onSelected = function()
		        	FaceCam()
		        end,
		    },RMenu:Get('CrationPerso', 'MumDad'))
		    RageUI.Item.Button("Tête", "", {}, true, {
		        onSelected = function()
		        	FaceCam()
		        end,
		    },RMenu:Get('CrationPerso', 'Head'))
		    RageUI.Item.Button("Haut", "", {}, true, {
		        onSelected = function()
		        	HighCam()
		        end,
		    },RMenu:Get('CrationPerso', 'HighClothe'))
		    RageUI.Item.Button("Bas", "", {}, true, {
		        onSelected = function()
		        	LowCam()
		        end,
		    },RMenu:Get('CrationPerso', 'LowClothe'))
		    if SkinReady then
			    RageUI.Item.Button("Valider", "", {}, true, {
			        onSelected = function()
				        PlySkin = {
				        	PedIndex = PedIndex, 
				        	DadIndex = DadIndex, 
				        	MotherIndex = MotherIndex, 
				        	ArmsIndex = ArmsIndex, 
				        	CheuveuxIndex = CheuveuxIndex, 
				        	CouleurIndex = CouleurIndex, 
				        	OeilIndex = OeilIndex, 
				        	BarbeIndex = BarbeIndex, 
				        	TshirtIndex = TshirtIndex, 
				        	TshirtIndex2 = TshirtIndex2, 
				        	VesteIndex = VesteIndex, 
				        	VesteIndex2 = VesteIndex2, 
				        	PantalonIndex = PantalonIndex, 
				        	PantalonIndex2 = PantalonIndex2, 
				        	ChaussureIndex = ChaussureIndex, 
				        	ChaussureIndex2 = ChaussureIndex2
				        }
				        TriggerServerEvent('CreateSkin', MdpSkin, json.encode(PlySkin))
				        DeleteCam()
			        end,
			    })
			end
	    end)

		RageUI.IsVisible(RMenu:Get('CrationPerso', 'Sexe'), function()
		    RageUI.Item.Button("Homme", "", {}, true, {
		        onSelected = function()
					while not HasModelLoaded("mp_m_freemode_01") do
						RequestModel("mp_m_freemode_01")
						Citizen.Wait(0)
					end
					if IsModelInCdimage("mp_m_freemode_01") and IsModelValid("mp_m_freemode_01") then
						SetPlayerModel(PlayerId(), "mp_m_freemode_01")
						SetPedDefaultComponentVariation(PlayerPedId())
					end
					SetModelAsNoLongerNeeded("mp_m_freemode_01")
	               	PedIndex = "mp_m_freemode_01"
		        end,
		    })
		    RageUI.Item.Button("Femme", "", {}, true, {
		        onSelected = function()
					while not HasModelLoaded("mp_f_freemode_01") do
						RequestModel("mp_f_freemode_01")
						Citizen.Wait(0)
					end
					if IsModelInCdimage("mp_f_freemode_01") and IsModelValid("mp_f_freemode_01") then
						SetPlayerModel(PlayerId(), "mp_f_freemode_01")
						SetPedDefaultComponentVariation(PlayerPedId())
					end
					SetModelAsNoLongerNeeded("mp_f_freemode_01")
	               	PedIndex = "mp_f_freemode_01"
		        end,
		    })
		    RageUI.Item.Button("Valider", "", {}, true, {
		        onSelected = function()
		        	RageUI.GoBack()
		        end,
		    })
	    end)

		RageUI.IsVisible(RMenu:Get('CrationPerso', 'MumDad'), function()
			RageUI.Window.Heritage(MotherIndex, DadIndex)
		    RageUI.Item.List("Mère", MotherNumber, MotherIndex, nil, {}, true, {
		        onListChange = function(Index, Items)
	                MotherIndex = Index
					SetPedDefaultComponentVariation(PlayerPedId())
	                SetPedHeadBlendData(PlayerPedId(), DadIndex, MotherIndex, nil, DadIndex, MotherIndex, nil, 0.5, 0.5, nil, true)
	            end,
	        })
		    RageUI.Item.List("Père", DadNumber, DadIndex, nil, {}, true, {
		        onListChange = function(Index, Items)
					DadIndex = Index
					SetPedDefaultComponentVariation(PlayerPedId())
					SetPedHeadBlendData(PlayerPedId(), DadIndex, MotherIndex, nil, DadIndex, MotherIndex, nil, 0.5, 0.5, nil, true)
	            end,
	        })
		    RageUI.Item.Button("Valider", "", {}, true, {
		        onSelected = function()
		        	RageUI.GoBack()
		        	SkinReady = true
		        end,
		    })
	    end)

		RageUI.IsVisible(RMenu:Get('CrationPerso', 'Head'), function()
	     	OeilFound = {}
	        for i = 0 , GetNumHeadOverlayValues(2)-1, 1 do
	            OeilFound[i] = i
	        end
		    RageUI.Item.List("Couleur des yeux", OeilFound, 1, nil, {}, true, {
		        onListChange = function(Index, Items)
			        OeilIndex = Index
			        SetPedEyeColor(PlayerPedId(), OeilIndex, 0, 1)
		        end,
		    })
	        CoiffureFound = {}
	        for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 2)-1, 1 do
	            CoiffureFound[i] = i
	        end
		    RageUI.Item.List("Cheveux", CoiffureFound, 1, nil, {}, true, {
		        onListChange = function(Index, Items)
			        CheuveuxIndex = Index
			        SetPedComponentVariation(PlayerPedId(), 2, CheuveuxIndex, 1, 2)
		        end,
		    })
	        BarbeFound = {}
	        for i = 0 , GetNumHeadOverlayValues(1)-1, 1 do
	            BarbeFound[i] = i
	        end
		    RageUI.Item.List("Barbe", BarbeFound, 1, nil, {}, true, {
		        onListChange = function(Index, Items)
			        BarbeIndex = Index
			        SetPedHeadOverlay(PlayerPedId(), 1, BarbeIndex, 1 + 0.0)
			        SetPedHeadOverlayColor(PlayerPedId(), 1, 1, 1, 1)
		        end,
            })
            CouleurFound = {}
            for i = 0 , GetNumHairColors()-1 do
                CouleurFound[i] = i
            end
	        RageUI.Item.List("Couleur", CouleurFound, 1, nil, {}, true, {
	            onListChange = function(Index, Items)
		            CouleurIndex = Index
		            SetPedHairColor(PlayerPedId(), CouleurIndex, CouleurIndex)
		            SetPedHeadOverlayColor(PlayerPedId(), 1, 1, CouleurIndex, CouleurIndex)
	            end,
		    })
		    RageUI.Item.Button("Valider", "", {}, true, {
		        onSelected = function()
		        	RageUI.GoBack()
		        	SkinReady = true
		        end,
		    })
	    end)

		RageUI.IsVisible(RMenu:Get('CrationPerso', 'HighClothe'), function()
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
		    RageUI.Item.Button("Valider", "", {}, true, {
		        onSelected = function()
		        	RageUI.GoBack()
		        	SkinReady = true
		        end,
		    })
	    end)

		RageUI.IsVisible(RMenu:Get('CrationPerso', 'LowClothe'), function()
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
		    RageUI.Item.Button("Valider", "", {}, true, {
		        onSelected = function()
		        	RageUI.GoBack()
		        	SkinReady = true
		        end,
		    })
	    end)

	end
end)