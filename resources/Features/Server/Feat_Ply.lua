RegisterServerEvent('Feat:SyncAnim')
AddEventHandler('Feat:SyncAnim', function(netID)
    TriggerClientEvent('Feat:SyncAnim', netID)
end)

RegisterServerEvent('Feat:SyncSv')
AddEventHandler('Feat:SyncSv', function()
    TriggerClientEvent('Feat:SyncCl', -1, source)
end)
