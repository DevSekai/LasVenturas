ESX = nil
InMenu, PlayerSpawn, MdpClien, HasDamaged, HasFaim, HasSoif, HudHiden = false, false, "Ntm", false, false, false, false
Accessoires = {}
PlayerData = {}

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(1)
    end
	if ESX then
		ESX.PlayerData = ESX.GetPlayerData()
		while ESX.GetPlayerData().job == nil do
			Citizen.Wait(1)
		end
		PlayerData = ESX.GetPlayerData()
    end
end)

AddEventHandler('esx:onPlayerSpawn', function()
	Citizen.Wait(150)
	exports.spawnmanager:setAutoSpawn(false)
	ESX.TriggerServerCallback('CheckFirstSpawn', function(NotFirstSpawn)
		if NotFirstSpawn then
			InitCoords()
		else
			SetEntityCoordsNoOffset(PlayerPedId(), -1042.571, -2746.193, 21.359, true, true, true)
			SetEntityHeading(PlayerPedId(), 327.772)
			if not InMenu then
				SetEntityVisible(PlayerPedId(), false)
				FreezeEntityPosition(PlayerPedId(), true)
				HighCam()
				RageUI.Visible(RMenu:Get('CrationPerso', 'Identity'), not RageUI.Visible(RMenu:Get('CrationPerso', 'Identity')))
				InMenu = true
			end
		end
	end)
end)

function InitCoords()
	ESX.TriggerServerCallback('GetPlyCoords', function(Coords)
		Result = json.decode(Coords)
		SetEntityCoordsNoOffset(PlayerPedId(), Result.x, Result.y, Result.z, true, true, true)
		SetEntityHeading(PlayerPedId(), Result.heading)
		InitSkin()
	end)
end

function InitSkin()
	ESX.TriggerServerCallback('GetPlySkin', function(Skin)
		ApplySkin(GetPlayerPed(-1), Skin)
		InitLoadout()
	end)
end

function InitLoadout()
	ESX.TriggerServerCallback('getUserLoadout', function(PlyWeapons)
		Result = json.decode(PlyWeapons)
		for k,v in pairs (Result) do
			WeaponHash = GetHashKey(k)
			GiveWeaponToPed(PlayerPedId(), WeaponHash, v.ammo, false, false)
		end
	end)
end

function CreateSkinPed()
	if SexeChoosen == 'Femme' then
		characterModel = "mp_f_freemode_01"
	else
		characterModel = "mp_m_freemode_01"
	end
	while not HasModelLoaded(characterModel) do
		RequestModel(characterModel)
		Citizen.Wait(0)
	end
	if IsModelInCdimage(characterModel) and IsModelValid(characterModel) then
		SetPlayerModel(PlayerId(), characterModel)
		SetPedDefaultComponentVariation(PlayerPedId())
	end
	SetModelAsNoLongerNeeded(characterModel)
	SetEntityVisible(PlayerPedId(), true)

	RageUI.CloseAll()
	RageUI.Visible(RMenu:Get('CrationPerso', 'Skin'), not RageUI.Visible(RMenu:Get('CrationPerso', 'Skin')))
end

function FaceCam()
	local SelectionCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
	SetCamCoord(SelectionCam, -1042.317, -2745.617, 21.359 + 0.68)
	PointCamAtCoord(SelectionCam, -1042.571, -2746.193, 21.359 + 0.68)
	SetCamActive(SelectionCam, true)
	RenderScriptCams(true, true, 200, true, false)
end

function HighCam()
	local SelectionCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
	SetCamCoord(SelectionCam, -1041.546, -2744.474, 21.359 + 0.48)
	PointCamAtCoord(SelectionCam, -1042.571, -2746.193, 21.359 + 0.48)
	SetCamActive(SelectionCam, true)
	RenderScriptCams(true, true, 200, true, false)
end

function LowCam()
	local SelectionCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
	SetCamCoord(SelectionCam, -1041.546, -2744.474, 21.359)
	PointCamAtCoord(SelectionCam, -1042.571, -2746.193, 21.359)
	SetCamActive(SelectionCam, true)
	RenderScriptCams(true, true, 200, true, false)
end

function DeleteCam()
	SetCamActive(SelectionCam, false)
	RenderScriptCams(false, true, 2000, true, true)
	RageUI.CloseAll()
    DestroyAllCams(true)
    Citizen.Wait(2000)
	FreezeEntityPosition(PlayerPedId(), false)
	DisplayRadar(true)
end

function KeyboardInput(TextEntry, MaxStringLength)
    AddTextEntry("FMMC_KEY_TIP1", TextEntry .. "")
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", "", "", "", "", MaxStringLength)
    blockinput = true

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        blockinput = false
        return result
    else
        Citizen.Wait(500)
        blockinput = false
        return nil
    end
end

function DateIsCorrect(date)
    if (string.match(date, "^%d+%p%d+%p%d%d%d%d$")) then
        local d, m, y = string.match(date, "(%d+)%p(%d+)%p(%d+)")
        d, m, y = tonumber(d), tonumber(m), tonumber(y)
        local dm2 = d*m*m
        if  d>31 or m>12 or dm2==0 or dm2==116 or dm2==120 or dm2==124 or dm2==496 or dm2==1116 or dm2==2511 or dm2==3751 then
            if dm2==116 and (y%400 == 0 or (y%100 ~= 0 and y%4 == 0)) then
                return true
            else
                return false
            end
        else
            return true
        end
    else
        return false
    end
end

RegisterNetEvent('ApplySkin')
AddEventHandler('ApplySkin', function(Ped, Skin)
	ApplySkin(Ped, Skin)
end)

function ApplySkin(Ped, Skin)
	SetEntityVisible(PlayerPedId(Ped), true)
	SetEntityCollision(PlayerPedId(Ped), true)
	Result = json.decode(Skin)
	GoodPed = GetEntityModel(PlayerId(Ped))

	if Result.PedIndex then
		if GoodPed ~= Result.PedIndex then
			RequestModel(Result.PedIndex)
			while not HasModelLoaded(Result.PedIndex) do
				RequestModel(Result.PedIndex)
				Citizen.Wait(0)
			end
			SetPlayerModel(PlayerId(Ped), Result.PedIndex) 
		end
	end
	if Result.DadIndex and Result.MotherIndex then SetPedHeadBlendData(PlayerPedId(Ped), Result.DadIndex, Result.MotherIndex, nil, Result.DadIndex, Result.MotherIndex, nil, 0.5, 0.5, nil, true) end
	if Result.CheuveuxIndex then SetPedComponentVariation(PlayerPedId(Ped), 2, Result.CheuveuxIndex, 1, 2) end
	if Result.OeilIndex then SetPedEyeColor(PlayerPedId(Ped), Result.OeilIndex, 0, 1) end
	if Result.BarbeIndex then SetPedHeadOverlay(PlayerPedId(Ped), 1, Result.BarbeIndex, 1 + 0.0) end
	if Result.CouleurIndex then SetPedHairColor(PlayerPedId(Ped), Result.CouleurIndex, Result.CouleurIndex) end
	if Result.CouleurIndex then SetPedHeadOverlayColor(PlayerPedId(Ped), 1, 1, Result.CouleurIndex, Result.CouleurIndex) end
	if Result.TshirtIndex and Result.TshirtIndex2 then SetPedComponentVariation(PlayerPedId(Ped), 8, Result.TshirtIndex, Result.TshirtIndex2, 2) end
	if Result.VesteIndex and Result.VesteIndex2 then SetPedComponentVariation(PlayerPedId(Ped), 11, Result.VesteIndex, Result.VesteIndex2, 2) end
	if Result.ArmsIndex then SetPedComponentVariation(PlayerPedId(Ped), 3, Result.ArmsIndex, 0, 2) end
	if Result.PantalonIndex and Result.PantalonIndex2 then SetPedComponentVariation(PlayerPedId(Ped), 4, Result.PantalonIndex, Result.PantalonIndex2, 2) end
	if Result.ChaussureIndex and Result.ChaussureIndex2 then SetPedComponentVariation(PlayerPedId(Ped), 6, Result.ChaussureIndex, Result.ChaussureIndex2, 2) end
	ESX.TriggerServerCallback('GetPlyTatoo', function(Tatoo)
		for _,v in pairs (Tatoo) do
			AddPedDecorationFromHashes(GetPlayerPed(-1), v.Collection, GetHashKey(v.Tatoo))
		end
	end)
	ESX.ShowNotification("Personnage chargé avec succés")
end

function StartDemarche(MoveSet)
	ESX.Streaming.RequestAnimSet(MoveSet, function()
		SetPedMotionBlur(GetPlayerPed(-1), false)
		SetPedMovementClipset(GetPlayerPed(-1), MoveSet, true)
		RemoveAnimSet(MoveSet)
	end)
end

function LoadAnim(dict)
	while not HasAnimDictLoaded(dict) do
	  	RequestAnimDict(dict)
	  	Wait(10)
	end
end
  
function LoadPropDict(model)
	while not HasModelLoaded(GetHashKey(model)) do
	  	RequestModel(GetHashKey(model))
	  	Wait(10)
	end
end

function AccessoiresOn(Type, Index, Index2)
	if Type == "Masque" then
		local dict = 'missfbi4'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'takeoff_mask'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		SetPedComponentVariation(playerPed, 1, Index, Index2, 2)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Lunettes" then
		local dict = 'clothingspecs'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'try_glasses_positive_a'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		SetPedPropIndex(playerPed, 1, Index, Index2, 2)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Chapeaux" then
		local dict = 'missheistdockssetup1hardhat@'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'put_on_hat'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		SetPedPropIndex(playerPed, 0, Index, Index2, 2)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Boucles" then
		local dict = 'mp_masks@standard_car@rps@'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'put_on_mask'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		SetPedPropIndex(playerPed, 2, Index, Index2, 2)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Vestes" then
		local dict = 'mp_masks@standard_car@rps@'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'put_on_mask'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		SetPedComponentVariation(myPed, 11, Index, Index2, 2)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Pantalons" then
		local dict = 'mp_masks@standard_car@rps@'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'put_on_mask'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		SetPedComponentVariation(myPed, 4, Index, Index2, 2)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Chaussures" then
		local dict = 'mp_masks@standard_car@rps@'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'put_on_mask'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		SetPedComponentVariation(myPed, 6, Index, Index2, 2)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Tshirt" then
		local dict = 'mp_masks@standard_car@rps@'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'put_on_mask'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		SetPedComponentVariation(myPed, 8, Index, Index2, 2)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Chaines" then
		local dict = 'mp_masks@standard_car@rps@'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'put_on_mask'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		SetPedComponentVariation(playerPed, 7, Index, Index2, 2)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	end
end

function AccessoiresOff(Type)
	if Type == "Masque" then
		local dict = 'missfbi4'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'takeoff_mask'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		SetPedComponentVariation(playerPed, 1, 0, 0, 2)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Lunettes" then
		local dict = 'clothingspecs'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'try_glasses_positive_a'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		SetPedPropIndex(playerPed, 1, 0, 0, 2)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Chapeaux" then
		local dict = 'missheistdockssetup1hardhat@'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'put_on_hat'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		SetPedPropIndex(playerPed, 0, 0, 0, 2)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Boucles" then
		local dict = 'mp_masks@standard_car@rps@'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'put_on_mask'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		SetPedPropIndex(playerPed, 2, 0, 0, 2)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Vestes" then
		local dict = 'mp_masks@standard_car@rps@'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'put_on_mask'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		SetPedComponentVariation(myPed, 11, 0, 0, 2)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Pantalons" then
		local dict = 'mp_masks@standard_car@rps@'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'put_on_mask'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		SetPedComponentVariation(myPed, 4, 0, 0, 2)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Chaussures" then
		local dict = 'mp_masks@standard_car@rps@'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'put_on_mask'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		SetPedComponentVariation(myPed, 6, 0, 0, 2)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Tshirt" then
		local dict = 'mp_masks@standard_car@rps@'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'put_on_mask'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		SetPedComponentVariation(myPed, 8, 0, 0, 2)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	elseif Type == "Chaines" then
		local dict = 'mp_masks@standard_car@rps@'
		local myPed = PlayerPedId()
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		local animation = ''
		local flags = 0 -- only play the animation on the upper body
		animation = 'put_on_mask'
		TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1000)
		SetEntityCollision(GetPlayerPed(-1), true, true)
		playerPed = GetPlayerPed(-1)
		SetPedComponentVariation(playerPed, 7, 0, 0, 2)
		Citizen.Wait(200)
		ClearPedTasks(playerPed)
	end
end

function OnEmotePlay(Dict, Anim, AnimOptions)
	LoadAnim(Dict)

  	if AnimOptions then
    	if AnimOptions.EmoteLoop then
      		MovementType = 1
    		if AnimOptions.EmoteMoving then
     			MovementType = 51
  			end
 	 	elseif AnimOptions.EmoteMoving then
    		MovementType = 51
  		elseif AnimOptions.EmoteMoving == false then
    		MovementType = 0
  		elseif AnimOptions.EmoteStuck then
    		MovementType = 50
  		end
  	else
    	MovementType = 0
  	end
	if InVehicle == 1 then
		MovementType = 51
	end

	if AnimOptions then
		if AnimOptions.EmoteDuration == nil then 
			AnimOptions.EmoteDuration = -1
			AttachWait = 0
		else
			AnimationDuration = AnimOptions.EmoteDuration
			AttachWait = AnimOptions.EmoteDuration
		end
	end

	TaskPlayAnim(GetPlayerPed(-1), Dict, Anim, 2.0, 2.0, AnimationDuration, MovementType, 0, false, false, false)
	RemoveAnimDict(Dict)

  	if AnimOptions then
    	if AnimOptions.Prop then
        	PropName = AnimOptions.Prop
        	PropBone = AnimOptions.PropBone
        	PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 = table.unpack(AnimOptions.PropPlacement)
        	if AnimOptions.SecondProp then
          		SecondPropName = AnimOptions.SecondProp
          		SecondPropBone = AnimOptions.SecondPropBone
          		SecondPropPl1, SecondPropPl2, SecondPropPl3, SecondPropPl4, SecondPropPl5, SecondPropPl6 = table.unpack(AnimOptions.SecondPropPlacement)
          		SecondPropEmote = true
        	else
          		SecondPropEmote = false
        	end
        	Wait(AttachWait)
        	AddPropToPlayer(PropName, PropBone, PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6)
        	if SecondPropEmote then
          		AddPropToPlayer(SecondPropName, SecondPropBone, SecondPropPl1, SecondPropPl2, SecondPropPl3, SecondPropPl4, SecondPropPl5, SecondPropPl6)
        	end
    	end
  	end
end

PlayerProps = {}
PlayerHasProp = false

function AddPropToPlayer(prop1, bone, off1, off2, off3, rot1, rot2, rot3)
	if PlayerHasProp then
		PlayerHasProp = false
		for _,v in pairs (PlayerProps) do
			DeleteObject(v)
		end
	end
	local Player = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(Player))
  
	if not HasModelLoaded(prop1) then
	  	LoadPropDict(prop1)
	end
  
	prop = CreateObject(GetHashKey(prop1), x, y, z+0.2,  true,  true, true)
	AttachEntityToEntity(prop, Player, GetPedBoneIndex(Player, bone), off1, off2, off3, rot1, rot2, rot3, true, true, false, true, 1, true)
	table.insert(PlayerProps, prop)
	PlayerHasProp = true
	SetModelAsNoLongerNeeded(prop1)
end

RegisterNetEvent("RageUI:Refresh:Theme")
AddEventHandler("RageUI:Refresh:Theme", function(Theme)
    MenuColour = Theme
end)

RegisterNetEvent("RageUI:Save:Setting")
AddEventHandler("RageUI:Save:Setting", function()
    MenuSetting = {
        Colour = MenuColour,
        Style = MenuFont,
    }
	SetResourceKvp("Setting_Menu", json.encode(MenuSetting))
	TriggerEvent("RageUI:Set:Setting", json.encode(MenuSetting))
end)

RegisterNetEvent("RageUI:Reset:Setting")
AddEventHandler("RageUI:Reset:Setting", function()
	MenuColour = {
		Banner = {
			R = 13,
			G = 24,
			B = 33,
			A = 255,
		},
		Background = {
			R = 13,
			G = 24,
			B = 33,
			A = 200,
		},
		Selection = {
			R = 123,
			G = 137,
			B = 138,
			A = 127.5,
		},
		Desc = {
			R = 13,
			G = 24,
			B = 33,
			A = 150,
		},
		Txt = {
			R = 191,
			G = 204,
			B = 148,
			A = 255,
		},
	}
	MenuFont = {
		Txt = 6,
		Title = 6,
		SubTitle = 6,
		Desc = 6,
	}
    MenuSetting = {
        Colour = MenuColour,
        Style = MenuFont,
    }
	SetResourceKvp("Setting_Menu", json.encode(MenuSetting))
	TriggerEvent("RageUI:Set:Setting", json.encode(MenuSetting))
end)

Kvp = GetResourceKvpString("Setting_Menu")
AddEventHandler('esx:onPlayerSpawn', function()
	if Kvp then
		TriggerEvent("RageUI:Set:Setting", Kvp)
	else
		MenuSetting = {
			Colour = MenuColour,
			Style = MenuFont,
		}
		SetResourceKvp("Setting_Menu", json.encode(MenuSetting))
		TriggerEvent("RageUI:Set:Setting", json.encode(MenuSetting))
	end
end)