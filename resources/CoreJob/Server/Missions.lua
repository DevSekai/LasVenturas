Mission = {
    RewardBase = 1000,
    ["ambulance"] = {
        RewardPly = math.random(150, 300),
    },
    ["police"] = {
        RewardPly = math.random(150, 300),
    },
    ["weazel"] = {
        RewardPly = math.random(150, 300),
    },
    ["unicorn"] = {
        RewardPly = math.random(150, 300),
    },
    ["tequilala"] = {
        RewardPly = math.random(150, 300),
    },
    ["dog"] = {
        RewardPly = math.random(150, 300),
    },
}

RegisterServerEvent('Mission:Reward')
AddEventHandler('Mission:Reward', function(Table)
    local xPlayer = ESX.GetPlayerFromId(source)
    if Table.jobName == xPlayer.job.name then
        RewardSct = (Mission.RewardBase - Mission[xPlayer.job.name].RewardPly)
        xPlayer.addAccountMoney("money", Mission[xPlayer.job.name].RewardPly)
        TriggerEvent('esx_addonaccount:getSharedAccount', "society_"..xPlayer.job.name, function(account)
            account.addMoney(RewardSct)
        end)
        TriggerClientEvent('esx:showNotification', source, "Vous avez reçut : ~g~"..Mission[xPlayer.job.name].RewardPly.." $~s~.")
        TriggerClientEvent('esx:showNotification', source, "Votre société à reçut : ~g~"..RewardSct.." $~s~.")
    end
end)