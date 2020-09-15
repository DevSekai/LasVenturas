PedIndex, DadIndex, MotherIndex, ArmsIndex, CheuveuxIndex, CouleurIndex, OeilIndex, BarbeIndex, TshirtIndex, TshirtIndex2, VesteIndex, VesteIndex2, PantalonIndex, PantalonIndex2, ChaussureIndex, ChaussureIndex2 = "", 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
DadNumber = {"Benjamin", "Daniel", "Joshua", "Noah", "Andrew", "Juan", "Alex", "Isaac", "Evan", "Ethan", "Vincent", "Angel", "Diego", "Adrian", "Gabriel", "Michael", "Santiago", "Kevin", "Louis", "Samuel", "Anthony", "Pierre", "Niko"}
MotherNumber = {"Adelyn", "Emily", "Abigail", "Beverly", "Kristen", "Hailey", "June", "Daisy", "Elizabeth", "Addison", "Ava", "Cameron", "Samantha", "Madison", "Amber", "Heather", "Hillary", "Courtney", "Ashley", "Alyssa", "Mia", "Brittany"}

RMenu.Add('CrationPerso', 'Skin', RageUI.CreateMenu("", "", nil, nil, "root_cause", "banner"), true)
RMenu:Get('CrationPerso', 'Skin'):SetSubtitle("~r~Création de l'apparence")
RMenu:Get('CrationPerso', 'Skin'):DisplayInstructionalButton(false)
RMenu:Get('CrationPerso', 'Skin'):DisplayGlare(false);
RMenu:Get('CrationPerso', 'Skin').Closable = false;

RMenu.Add('CrationPerso', 'MumDad', RageUI.CreateSubMenu(RMenu:Get('CrationPerso', 'Skin'), "", ""))
RMenu:Get('CrationPerso', 'MumDad'):DisplayInstructionalButton(false)
RMenu:Get('CrationPerso', 'MumDad'):SetSubtitle("Hérédité")
RMenu:Get('CrationPerso', 'MumDad'):DisplayGlare(false);
RMenu:Get('CrationPerso', 'MumDad').Closable = false;

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		RageUI.IsVisible(RMenu:Get('CrationPerso', 'Skin'), function()
		    RageUI.Item.List("Sexe", SexeChoose, SexeIndex, nil, {}, true, {
		        onListChange = function(Index, Items)
	               	SexeIndex = Index
	               	if SexeIndex == 1 then --Homme
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
	               	else -- Femme
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
	               	end
	            end,
	        })
		    RageUI.Item.Button("Hérédité", "", {}, true, {
		        onSelected = function()
		        	FaceCam()
		        end,
		    },RMenu:Get('CrationPerso', 'MumDad'))
		    RageUI.Item.Button("Fermer le menu", "", {Color = {BackgroundColor = {150, 0, 0}}}, true, {
		        onSelected = function()
		        	FreezeEntityPosition(PlayerPedId(), false)
		        	RageUI.CloseAll()
		        end,
		    })
	    end)
		RageUI.IsVisible(RMenu:Get('CrationPerso', 'MumDad'), function()
			RageUI.Window.Heritage(MotherIndex, DadIndex)
		    RageUI.Item.List("Mère", MotherNumber, MotherIndex, nil, {}, true, {
		        onListChange = function(Index, Items)
	                MotherIndex = Index
	                SetPedHeadBlendData(PlayerPedId(), DadIndex, MotherIndex, nil, DadIndex, MotherIndex, nil, 0.5, 0.5, nil, true)
	            end,
	        })
		    RageUI.Item.List("Père", DadNumber, DadIndex, nil, {}, true, {
		        onListChange = function(Index, Items)
					DadIndex = Index
					SetPedHeadBlendData(PlayerPedId(), DadIndex, MotherIndex, nil, DadIndex, MotherIndex, nil, 0.5, 0.5, nil, true)
	            end,
	        })
		    RageUI.Item.Button("Valider", "", {Color = {BackgroundColor = {0, 150, 0}}}, true, {
		        onSelected = function()
		        	RageUI.GoBack()
		        end,
		    })
	    end)
	end
end)