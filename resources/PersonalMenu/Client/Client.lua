ESX = nil
PlayerData = {}

Citizen.CreateThread( function()
	exports.spawnmanager:setAutoSpawn(false)
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
	end
	PlayerData = ESX.GetPlayerData()
end)

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

function RefreshInv()
	invItems = {}
	ESX.TriggerServerCallback('xPlayer:getUserInventory', function(data)
		for i=1, #data, 1 do
			local item = data[i]
			if item.count > 0 then
				table.insert(invItems, {label = item.label, count = item.count, type = 'item_standard', value = item.name, usable = item.usable, removable = item.canRemove})
			end
		end
	end)
	PlySim = {}
	ESX.TriggerServerCallback("esx_cartesim:GetList", function(Data)
		for _,v in pairs(Data) do
			table.insert(PlySim, {label = tostring(v.number), value = v})
		end
	end)
	ESX.TriggerServerCallback("xPlayer:getAccessoire", function(Acces)
		Accessoires = Acces
	end)
end

function RefreshWeap()
	invWeapon = {}
	ESX.TriggerServerCallback('xPlayer:getUserLoadout', function(data)
		for i=1, #data, 1 do
			local weapon = data[i]
			table.insert(invWeapon, {label = ESX.GetWeaponLabel(weapon.name), value = weapon.name, itemType = 'item_weapon', amount = weapon.ammo})
		end
	end)
end

function RefreshWallet()
	ESX.TriggerServerCallback('xPlayer:getUserAccounts', function(data)
		invWallet = data
	end)
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
	Skin = {}
	ESX.TriggerServerCallback("xPlayer:getSkin", function(Data)
		Skin = Data
	end)
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
		SetPedComponentVariation(myPed, 11, Skin.vesteIndex, Skin.vesteColour, 2)
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
		SetPedComponentVariation(myPed, 4, Skin.pantsIndex, Skin.pantsColour, 2)
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
		SetPedComponentVariation(myPed, 6, Skin.shoesIndex, Skin.shoesColour, 2)
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
		SetPedComponentVariation(myPed, 8, Skin.tshirtIndex, Skin.tshirtColour, 2)
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

	TaskPlayAnim(PlayerPedId(), Dict, Anim, 2.0, 2.0, AnimationDuration, MovementType, 0, false, false, false)
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

function DestroyAllProps()
	for _,v in pairs(PlayerProps) do
	  	DeleteEntity(v)
	end
	PlayerHasProp = false
end