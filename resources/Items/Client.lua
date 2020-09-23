ESX = nil

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

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