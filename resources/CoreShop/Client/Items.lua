local used = 0
local isHandcuffed2, drag, wasDragged, draggedBy = false, false, false, -1

RegisterNetEvent('UseChargeur')
AddEventHandler('UseChargeur', function()
  	PlyPed = GetPlayerPed(-1)
    if IsPedArmed(PlyPed, 4) then
        WeaponHash = GetSelectedPedWeapon(PlyPed)
        if WeaponHash ~= nil then
            TriggerServerEvent('RemoveChargeur')
            AddAmmoToPed(GetPlayerPed(-1), WeaponHash, 25)
            ESX.ShowNotification("Tu as utilisé un chargeur")
        else
            ESX.ShowNotification("Tu n'as pas d'arme en main")
         end
    else
      ESX.ShowNotification("Ce type de munition ne convient pas")
    end
end)

RegisterNetEvent('UseSilencieux')
AddEventHandler('UseSilencieux', function(duration)
	local inventory = ESX.GetPlayerData().inventory
	local silencieux = 0

		for i=1, #inventory, 1 do
		  if inventory[i].name == 'silencieux' then
			silencieux = inventory[i].count
		  end
		end

local ped = PlayerPedId()
local currentWeaponHash = GetSelectedPedWeapon(ped)

		if used < tonumber(silencieux) then
			if currentWeaponHash == GetHashKey("WEAPON_PISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("component_at_pi_supp_02"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
		  		 	used = used + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL50") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
		  			used = used + 1


		  	elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
					used = used + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_APPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
		  		 	used = used + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
		  			used = used + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_VINTAGEPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_VINTAGEPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville."))
		  		  	used = used + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_SMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
		  		 	used = used + 1


		  	elseif currentWeaponHash == GetHashKey("WEAPON_MICROSMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
	used = used + 1
				

		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
	used = used + 1
		  		

		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
	used = used + 1
		  		 
		  	elseif currentWeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN"), GetHashKey("COMPONENT_AT_SR_SUPP"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
	used = used + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
	used = used + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_SNIPERRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNIPERRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville.")) 
	used = used + 1

		  	else 
		  		  ESX.ShowNotification(("Vous n'avez pas d'arme en main ou votre arme ne peux pas supporter de silencieux."))	
			end
			else
				ESX.ShowNotification(("Vous avez utiliser tout vos silencieux.")) 
		end
end)

RegisterNetEvent('UseGPB')
AddEventHandler('UseGPB', function()

	local Ply = PlayerPedId()
	
	SetPedComponentVariation(Ply, 9, 27, 9, 2)
	SetPedArmour(Ply, 100)

    if Anim == true then 
        Citizen.CreateThread(function()
            RequestAnimDict('clothingtie')

            while not HasAnimDictLoaded('clothingtie') do
                Citizen.Wait(1)
            end

            TaskPlayAnim(Ply, 'clothingtie', 'try_tie_neutral_a', 1.0, -1.0, 2667, 0, 1, true, true, true)
        end)
	end
end)

RegisterNetEvent('UseSerflex')
AddEventHandler('UseSerflex', function()
	isHandcuffed2 = not isHandcuffed2
    local playerPed = PlayerPedId()
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	if closestPlayer ~= -1 and closestDistance <= 3.0 then
        if isHandcuffed2 then
            RequestAnimDict('mp_arresting')
            while not HasAnimDictLoaded('mp_arresting') do
                Citizen.Wait(100)
            end

            TaskPlayAnim(PlayerPedId(closestPlayer), 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)

            SetEnableHandcuffs(PlayerPedId(closestPlayer), true)
            DisablePlayerFiring(PlayerPedId(closestPlayer), true)
            SetCurrentPedWeapon(PlayerPedId(closestPlayer), GetHashKey('WEAPON_UNARMED'), true)
            SetPedCanPlayGestureAnims(PlayerPedId(closestPlayer), false)
            FreezeEntityPosition(PlayerPedId(closestPlayer), true)
            DisplayRadar(false)
        else
            ClearPedSecondaryTask(PlayerPedId(closestPlayer))
            SetEnableHandcuffs(PlayerPedId(closestPlayer), false)
            DisablePlayerFiring(PlayerPedId(closestPlayer), false)
            SetPedCanPlayGestureAnims(PlayerPedId(closestPlayer), true)
            FreezeEntityPosition(PlayerPedId(closestPlayer), false)
            DisplayRadar(true)
        end
    else
        ESX.ShowNotification("Il n'y a personne aux alentours.")
    end
end)

RegisterNetEvent('UseCorde')
AddEventHandler('UseCorde', function()
	local x1, y1, z1 = nil 
	local x2, y2, z2 = nil 
	local distance = nil 
	local playerPed = PlayerPedId()
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    if closestPlayer ~= -1 and closestDistance <= 3.0 then
        x1, y1, z1 = table.unpack( GetEntityCoords( GetPlayerPed( closestPlayer ), true ) )
        x2, y2, z2 = table.unpack( GetEntityCoords( playerPed, true ) )
        distance = math.floor(GetDistanceBetweenCoords(x1,  y1,  z1,  x2,  y2,  z2,  true))
        if distance <= 10 then 
            draggedBy = playerId
            drag = not drag
        else 
            ESX.ShowNotification(("Le joueur t'as échapper sale merde! ")) 
        end
    else
        ESX.ShowNotification("Il n'y a personne aux alentours.")
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if isHandcuffed2 and drag then
            wasDragged = true
            AttachEntityToEntity(PlayerPedId(), GetPlayerPed(GetPlayerFromServerId(draggedBy)), 4103, 11816, 0.48, 0.00, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
        else
            if not IsPedInParachuteFreeFall(PlayerPedId()) and wasDragged then
                wasDragged = false
                DetachEntity(PlayerPedId(), true, false)    
            end
        end
    end
end)