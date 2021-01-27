Skin = {
    menu = nil,
    crtBtn = nil,
    pedIndex = "mp_m_freemode_01",
    sexeIndex = 1,
    motherIndex = 1,
    motherList = {"Adelyn", "Emily", "Abigail", "Beverly", "Kristen", "Hailey", "June", "Daisy", "Elizabeth", "Addison", "Ava", "Cameron", "Samantha", "Madison", "Amber", "Heather", "Hillary", "Courtney", "Ashley", "Alyssa", "Mia", "Brittany"},
    dadIndex = 1,
    dadList = {"Benjamin", "Daniel", "Joshua", "Noah", "Andrew", "Juan", "Alex", "Isaac", "Evan", "Ethan", "Vincent", "Angel", "Diego", "Adrian", "Gabriel", "Michael", "Santiago", "Kevin", "Louis", "Samuel", "Anthony", "Pierre", "Niko"},
    eyesIndex = 1,
    hairIndex = 1,
    barberIndex = 1,
    hairCoulour = 1,
    tshirtIndex = 1,
    tshirtColour = 1,
    vesteIndex = 1,
    vesteColour = 1,
    armsIndex = 1,
    pantsIndex = 1,
    pantsColour = 1,
    shoesIndex = 1,
    shoesColour = 1,
}

RegisterNetEvent("xPlayer:Create:Skin")
AddEventHandler("xPlayer:Create:Skin", function()
    Identity.menu = nil
	Skin.menu = RageUI.CreateMenu("", "Choix de l'apparance")
    Skin.menu.Closable = false;
	SetEntityVisible(PlayerPedId(), false)
    SetEntityCoordsNoOffset(PlayerPedId(), -1042.571, -2746.193, 21.359, true, true, true)
    SetEntityHeading(PlayerPedId(), 327.772)
    Skin.highCam()
    while not HasModelLoaded(Skin.pedIndex) do
        RequestModel(Skin.pedIndex)
        Citizen.Wait(0)
    end
    if IsModelInCdimage(Skin.pedIndex) and IsModelValid(Skin.pedIndex) then
        SetPlayerModel(PlayerId(), Skin.pedIndex)
        SetPedDefaultComponentVariation(PlayerPedId())
    end
    SetModelAsNoLongerNeeded(Skin.pedIndex)
    SetEntityVisible(PlayerPedId(), true)
	RageUI.Visible(Skin.menu, true)
    while Skin.menu do
        Wait(0)

        DisableControlAction(2, 30, true)
        DisableControlAction(2, 31, true)
        DisableControlAction(2, 32, true)
        DisableControlAction(2, 33, true)
        DisableControlAction(2, 34, true)
        DisableControlAction(2, 35, true)
        DisableControlAction(0, 25, true) -- Input Aim
        DisableControlAction(0, 24, true) -- Input Attack
        DisableControlAction(0, 140, true) -- Input Attack
        DisableControlAction(0, 172,true) --DESACTIVE CONTROLL HAUT

        RageUI.IsVisible(Skin.menu, function()
            RageUI.Item.Button("~r~>~s~ Sexe", "Etes vous un homme, ou bien une femme ?A vous de choisir votre destinée.", {}, true, {
                onSelected = function()
                    if Skin.crtBtn ~= "Sexe" then
                        Wait(10)
                        Skin.crtBtn = "Sexe"
                    else
                        Skin.crtBtn = nil
                    end
                end
            })
            if Skin.crtBtn == "Sexe" then
                RageUI.Item.Button("   ~b~>~s~ Homme", "Vous êtes un homme.", {}, true, {
                    onSelected = function()
                        Skin.pedIndex = "mp_m_freemode_01"
                        while not HasModelLoaded(Skin.pedIndex) do
                            RequestModel(Skin.pedIndex)
                            Citizen.Wait(0)
                        end
                        if IsModelInCdimage(Skin.pedIndex) and IsModelValid(Skin.pedIndex) then
                            SetPlayerModel(PlayerId(), Skin.pedIndex)
                            SetPedDefaultComponentVariation(PlayerPedId())
                        end
                        SetModelAsNoLongerNeeded(Skin.pedIndex)
                    end
                })
                RageUI.Item.Button("   ~p~>~s~ Femme", "Vous êtes une femme.", {}, true, {
                    onSelected = function()
                        Skin.pedIndex = "mp_f_freemode_01"
                        while not HasModelLoaded(Skin.pedIndex) do
                            RequestModel(Skin.pedIndex)
                            Citizen.Wait(0)
                        end
                        if IsModelInCdimage(Skin.pedIndex) and IsModelValid(Skin.pedIndex) then
                            SetPlayerModel(PlayerId(), Skin.pedIndex)
                            SetPedDefaultComponentVariation(PlayerPedId())
                        end
                        SetModelAsNoLongerNeeded(Skin.pedIndex)
                    end
                })
            end
		    RageUI.Item.Button("~r~>~s~  Hérédité", nil, {}, true, {
		        onSelected = function()
		        	Skin.faceCam()
                    if Skin.crtBtn ~= "Heritage" then
                        Wait(10)
                        Skin.crtBtn = "Heritage"
                    else
                        Skin.crtBtn = nil
                    end
		        end,
		    })
            if Skin.crtBtn == "Heritage" then
                RageUI.Window.Heritage(Skin.motherIndex, Skin.dadIndex)
                RageUI.Item.List("   ~p~>~s~ Mère", Skin.motherList, Skin.motherIndex or 1, nil, {}, true, {
                    onListChange = function(Index, Items)
                        Skin.motherIndex = Index
                        SetPedDefaultComponentVariation(PlayerPedId())
                        SetPedHeadBlendData(PlayerPedId(), Skin.dadIndex, Skin.motherIndex, nil, Skin.dadIndex, Skin.motherIndex, nil, 0.5, 0.5, nil, true)
                    end,
                })
                RageUI.Item.List("   ~b~>~s~ Père", Skin.dadList, Skin.dadIndex or 1, nil, {}, true, {
                    onListChange = function(Index, Items)
                        Skin.dadIndex = Index
                        SetPedDefaultComponentVariation(PlayerPedId())
                        SetPedHeadBlendData(PlayerPedId(), Skin.dadIndex, Skin.motherIndex, nil, Skin.dadIndex, Skin.motherIndex, nil, 0.5, 0.5, nil, true)
                    end,
                })
                eyes = {}
                for i = 0 , GetNumHeadOverlayValues(2)-1, 1 do
                    eyes[i] = i
                end
                RageUI.Item.List("   ~y~>~s~ Couleur des yeux", eyes, Skin.eyesIndex, nil, {}, true, {
                    onListChange = function(Index, Items)
                        Skin.eyesIndex = Index
                        SetPedEyeColor(PlayerPedId(), Skin.eyesIndex, 0, 1)
                    end,
                })
            end
		    RageUI.Item.Button("~r~>~s~  Tête", nil, {}, true, {
		        onSelected = function()
		        	Skin.faceCam()
                    if Skin.crtBtn ~= "Head" then
                        Wait(10)
                        Skin.crtBtn = "Head"
                    else
                        Skin.crtBtn = nil
                    end
		        end,
            })
            if Skin.crtBtn == "Head" then
                hair = {}
                for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 2) - 1, 1 do
                    hair[i] = i
                end
                RageUI.Item.List("   ~o~>~s~ Cheveux", hair, Skin.hairIndex, nil, {}, true, {
                    onListChange = function(Index, Items)
                        Skin.hairIndex = Index
                        SetPedComponentVariation(PlayerPedId(), 2, Skin.hairIndex, 1, 2)
                    end,
                })
                barber = {}
                for i = 0 , GetNumHeadOverlayValues(1), 1 do
                    barber[i] = i
                end
                RageUI.Item.List("   ~o~>~s~ Barbe", barber, Skin.barberIndex, nil, {}, true, {
                    onListChange = function(Index, Items)
                        Skin.barberIndex = Index
                        SetPedHeadOverlay(PlayerPedId(), 1, Skin.barberIndex, 1 + 0.0)
                        SetPedHeadOverlayColor(PlayerPedId(), 1, 1, 1, 1)
                    end,
                })
                hairColour = {}
                for i = 0 , GetNumHairColors()-1 do
                    hairColour[i] = i
                end
                RageUI.Item.List("   ~y~>~s~ Couleur des poils", hairColour, Skin.hairCoulour, nil, {}, true, {
                    onListChange = function(Index, Items)
                        Skin.hairCoulour = Index
                        SetPedHairColor(PlayerPedId(), Skin.hairCoulour, Skin.hairCoulour)
                        SetPedHeadOverlayColor(PlayerPedId(), 1, 1, Skin.hairCoulour, Skin.hairCoulour)
                    end,
                })
            end
		    RageUI.Item.Button("~r~>~s~  Haut", nil, {}, true, {
		        onSelected = function()
		        	Skin.highCam()
                    if Skin.crtBtn ~= "High" then
                        Wait(10)
                        Skin.crtBtn = "High"
                    else
                        Skin.crtBtn = nil
                    end
		        end,
            })
            if Skin.crtBtn == "High" then
                tshirt = {}
                for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 8), 1 do
                    tshirt[i] = i
                end
                RageUI.Item.List("   ~o~>~s~ Tshirt", tshirt, Skin.tshirtIndex, nil, {}, true, {
                    onListChange = function(Index, Items)
                        Skin.tshirtIndex = Index
                        SetPedComponentVariation(PlayerPedId(), 8, Skin.tshirtIndex, Skin.tshirtColour, 2)
                    end,
                })
                tshirtColour = {}
                for i = 0 , GetNumberOfPedTextureVariations(PlayerPedId(), 8, Skin.tshirtIndex), 1 do
                    tshirtColour[i] = i
                end
                RageUI.Item.List("       ~y~>~s~ Couleur du tshirt", tshirtColour, Skin.tshirtColour, nil, {}, true, {
                    onListChange = function(Index, Items)
                        Skin.tshirtColour = Index
                        SetPedComponentVariation(PlayerPedId(), 8, Skin.tshirtIndex, Skin.tshirtColour, 2)
                    end,
                })
                veste = {}
                for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 11), 1 do
                    veste[i] = i
                end
                RageUI.Item.List("   ~o~>~s~ Veste", veste, Skin.vesteIndex, nil, {}, true, {
                    onListChange = function(Index, Items)
                        Skin.vesteIndex = Index
                        SetPedComponentVariation(PlayerPedId(), 11, Skin.vesteIndex, Skin.vesteColour, 2)
                    end,
                })
                vesteColour = {}
                for i = 0 , GetNumberOfPedTextureVariations(PlayerPedId(), 11, Skin.vesteIndex), 1 do
                    vesteColour[i] = i
                end
                RageUI.Item.List("       ~y~>~s~ Couleur de la veste", vesteColour, Skin.vesteColour, nil, {}, true, {
                    onListChange = function(Index, Items)
                        Skin.vesteColour = Index
                        SetPedComponentVariation(PlayerPedId(), 11, Skin.vesteIndex, Skin.vesteColour, 2)
                    end,
                })
                arms = {}
                for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 3)-1, 1 do
                    arms[i] = i
                end
                RageUI.Item.List("   ~o~>~s~ Gants", arms, Skin.armsIndex, nil, {}, true, {
                    onListChange = function(Index, Items)
                        Skin.armsIndex = Index
                        SetPedComponentVariation(PlayerPedId(), 3, Skin.armsIndex, 0, 2)
                    end,
                })
            end
		    RageUI.Item.Button("~r~>~s~  Bas", nil, {}, true, {
		        onSelected = function()
		        	Skin.lowCam()
                    if Skin.crtBtn ~= "Low" then
                        Wait(10)
                        Skin.crtBtn = "Low"
                    else
                        Skin.crtBtn = nil
                    end
		        end,
		    })
            if Skin.crtBtn == "Low" then
                pants = {}
                for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 4), 1 do
                    pants[i] = i
                end
                RageUI.Item.List("   ~o~>~s~ Pantalon", pants, Skin.pantsIndex, nil, {}, true, {
                    onListChange = function(Index, Items)
                        Skin.pantsIndex = Index
                        SetPedComponentVariation(PlayerPedId(), 4, Skin.pantsIndex, Skin.pantsColour, 2)
                    end,
                })
                pantsColour = {}
                for i = 0 , GetNumberOfPedTextureVariations(PlayerPedId(), 4, Skin.pantsIndex), 1 do
                    pantsColour[i] = i
                end
                RageUI.Item.List("       ~y~>~s~ Couleur du pantalon", pantsColour, Skin.pantsColour, nil, {}, true, {
                    onListChange = function(Index, Items)
                        Skin.pantsColour = Index
                        SetPedComponentVariation(PlayerPedId(), 4, Skin.pantsIndex, Skin.pantsColour, 2)
                    end,
                })
                shoes = {}
                for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 6), 1 do
                    shoes[i] = i
                end
                RageUI.Item.List("   ~o~>~s~ Chaussure", shoes, Skin.shoesIndex, nil, {}, true, {
                    onListChange = function(Index, Items)
                        Skin.shoesIndex = Index
                        SetPedComponentVariation(PlayerPedId(), 6, Skin.shoesIndex, Skin.shoesColour, 2)
                    end,
                })
                shoesColour = {}
                for i = 0 , GetNumberOfPedTextureVariations(PlayerPedId(), 6, Skin.shoesIndex), 1 do
                    shoesColour[i] = i
                end
                RageUI.Item.List("       ~y~>~s~ Couleur des chaussures", shoesColour, Skin.shoesColour, nil, {}, true, {
                    onListChange = function(Index, Items)
                        Skin.shoesColour = Index
                        SetPedComponentVariation(PlayerPedId(), 6, Skin.shoesIndex, Skin.shoesColour, 2)
                    end,
                })
            end
			RageUI.Item.Button("~g~Valider", nil, {RightLabel = "~g~→→→"}, true, {
                onSelected = function()
                    Compopents = {
                        pedIndex = Skin.pedIndex,
                        motherIndex = Skin.motherIndex,
                        dadIndex = Skin.dadIndex,
                        eyesIndex = Skin.eyesIndex,
                        hairIndex = Skin.hairIndex,
                        barberIndex = Skin.barberIndex,
                        hairCoulour = Skin.hairCoulour,
                        tshirtIndex = Skin.tshirtIndex,
                        tshirtColour = Skin.tshirtColour,
                        vesteIndex = Skin.vesteIndex,
                        vesteColour = Skin.vesteColour,
                        armsIndex = Skin.armsIndex,
                        pantsIndex = Skin.pantsIndex,
                        pantsColour = Skin.pantsColour,
                        shoesIndex = Skin.shoesIndex,
                        shoesColour = Skin.shoesColour,
                    }
                    Infos = {
                        lastName = Identity.lastName,
                        firstName = Identity.firstName,
                        birthday = Identity.birthday,
                        height = Identity.height,
                    }
                    TriggerServerEvent("xPlayer:Create:Player", Infos, Compopents)
			    end,
			})
        end)
    end
end)

Skin.faceCam = function()
	Cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
	SetCamCoord(Cam, -1042.317, -2745.617, 21.359 + 0.68)
	PointCamAtCoord(Cam, -1042.571, -2746.193, 21.359 + 0.68)
	SetCamActive(Cam, true)
	RenderScriptCams(true, true, 200, true, false)
end

Skin.highCam = function()
	Cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
	SetCamCoord(Cam, -1041.546, -2744.474, 21.359 + 0.48)
	PointCamAtCoord(Cam, -1042.571, -2746.193, 21.359 + 0.48)
	SetCamActive(Cam, true)
	RenderScriptCams(true, true, 200, true, false)
end

Skin.lowCam = function()
	Cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
	SetCamCoord(Cam, -1041.546, -2744.474, 21.359)
	PointCamAtCoord(Cam, -1042.571, -2746.193, 21.359)
	SetCamActive(Cam, true)
	RenderScriptCams(true, true, 200, true, false)
end

Skin.deleteCam = function()
    Identity.menu = nil
    Skin.menu = nil
	SetCamActive(Cam, false)
	RenderScriptCams(false, true, 2000, true, true)
	RageUI.CloseAll()
    DestroyAllCams(true)
    Citizen.Wait(2000)
	FreezeEntityPosition(PlayerPedId(), false)
	DisplayRadar(true)
end

RegisterNetEvent("xPlayer:Create:Leave")
AddEventHandler("xPlayer:Create:Leave", function()
    Skin.deleteCam()
	PlayerData = ESX.GetPlayerData()
	ESX.ShowNotification("Personnage créer avec succés")
end)