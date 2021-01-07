Logs par Isekaï de Family-Dev

Logs :
    - Connexion
    - Deconnexion
    - Kill
    - Start serveur
    - Blacklist car
    - Give item
    - Give cash
    - Give weapon
    - Give ammo


Vous devrez changer un peu votre extended pour avoir des logs complet.


Coté server

Fichier main.lua

Remplacer les lignes 313 - 314

Ce que vous devriez avoir : 
`
    sourceXPlayer.showNotification(_U('gave_item', itemCount, sourceItem.label, targetXPlayer.name))
    targetXPlayer.showNotification(_U('received_item', itemCount, sourceItem.label, sourceXPlayer.name))
`

Remplacer le par ceci

`
    sourceXPlayer.showNotification(_U('gave_item', itemCount, sourceItem.label, targetXPlayer.name))
    targetXPlayer.showNotification(_U('received_item', itemCount, sourceItem.label, sourceXPlayer.name))
    TriggerEvent("Fd_Logs:SendLogs", "Item", Webhook.Color["Blue"], "Give item", ""..sourceXPlayer.name.." à donner "..sourceItem.label.." * "..itemCount.." à "..targetXPlayer.name..".")
`

Ligne 327 - 328

Ce que vous devriez avoir : 
`
    sourceXPlayer.showNotification(_U('gave_account_money', ESX.Math.GroupDigits(itemCount), Config.Accounts[itemName], targetXPlayer.name))
    targetXPlayer.showNotification(_U('received_account_money', ESX.Math.GroupDigits(itemCount), Config.Accounts[itemName], sourceXPlayer.name))
`

Remplacer le par ceci

`
    sourceXPlayer.showNotification(_U('gave_account_money', ESX.Math.GroupDigits(itemCount), Config.Accounts[itemName], targetXPlayer.name))
    targetXPlayer.showNotification(_U('received_account_money', ESX.Math.GroupDigits(itemCount), Config.Accounts[itemName], sourceXPlayer.name))
    TriggerEvent("Fd_Logs:SendLogs", "Cash", Webhook.Color["Yellow"], "Give cash", ""..sourceXPlayer.name.." à donner "..itemCount.." $ à "..targetXPlayer.name..".")
`

Ligne 345 - 352

Ce que vous devriez avoir : 
`
    if weaponObject.ammo and itemCount > 0 then
        local ammoLabel = weaponObject.ammo.label
        sourceXPlayer.showNotification(_U('gave_weapon_withammo', weaponLabel, itemCount, ammoLabel, targetXPlayer.name))
        targetXPlayer.showNotification(_U('received_weapon_withammo', weaponLabel, itemCount, ammoLabel, sourceXPlayer.name))
    else
        sourceXPlayer.showNotification(_U('gave_weapon', weaponLabel, targetXPlayer.name))
        targetXPlayer.showNotification(_U('received_weapon', weaponLabel, sourceXPlayer.name))
    end
`

Remplacer le par ceci

`
    if weaponObject.ammo and itemCount > 0 then
        local ammoLabel = weaponObject.ammo.label
        sourceXPlayer.showNotification(_U('gave_weapon_withammo', weaponLabel, itemCount, ammoLabel, targetXPlayer.name))
        targetXPlayer.showNotification(_U('received_weapon_withammo', weaponLabel, itemCount, ammoLabel, sourceXPlayer.name))
        TriggerEvent("Fd_Logs:SendLogs", "Cash", Webhook.Color["Yellow"], "Give ammo", ""..sourceXPlayer.name.." à donner "..itemCount.." munitions de "..weaponLabel.." à "..targetXPlayer.name..".")
    else
        sourceXPlayer.showNotification(_U('gave_weapon', weaponLabel, targetXPlayer.name))
        targetXPlayer.showNotification(_U('received_weapon', weaponLabel, sourceXPlayer.name))
        TriggerEvent("Fd_Logs:SendLogs", "Cash", Webhook.Color["Yellow"], "Give weapon", ""..sourceXPlayer.name.." à donner "..weaponLabel.." avec "..itemCount.." munitions à "..targetXPlayer.name..".")
    end
`

Ligne 374 - 375

Ce que vous devriez avoir : 
`
    sourceXPlayer.showNotification(_U('gave_weapon_ammo', itemCount, ammoLabel, weapon.label, targetXPlayer.name))
    targetXPlayer.showNotification(_U('received_weapon_ammo', itemCount, ammoLabel, weapon.label, sourceXPlayer.name))
`

Remplacer le par ceci

`
    sourceXPlayer.showNotification(_U('gave_weapon_ammo', itemCount, ammoLabel, weapon.label, targetXPlayer.name))
    targetXPlayer.showNotification(_U('received_weapon_ammo', itemCount, ammoLabel, weapon.label, sourceXPlayer.name))
    TriggerEvent("Fd_Logs:SendLogs", "Cash", Webhook.Color["Yellow"], "Give ammo", ""..sourceXPlayer.name.." à donner "..itemCount.." munitions de "..weapon.label.." à "..targetXPlayer.name..".")
`