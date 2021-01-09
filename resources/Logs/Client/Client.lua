local Melee = { -1569615261, 1737195953, 1317494643, -1786099057, 1141786504, -2067956739, -868994466 }
local Bullet = { 453432689, 1593441988, 584646201, -1716589765, 324215364, 736523883, -270015777, -1074790547, -2084633992, -1357824103, -1660422300, 2144741730, 487013001, 2017895192, -494615257, -1654528753, 100416529, 205991906, 1119849093 }
local Knife = { -1716189206, 1223143800, -1955384325, -1833087301, 910830060, }
local Car = { 133987706, -1553120962 }
local Animal = { -100946242, 148160082 }
local FallDamage = { -842959696 }
local Explosion = { -1568386805, 1305664598, -1312131151, 375527679, 324506233, 1752584910, -1813897027, 741814745, -37975472, 539292904, 341774354, -1090665087 }
local Gas = { -1600701090 }
local Burn = { 615608432, 883325847, -544306709 }
local Drown = { -10959621, 1936677264 }
local BlacklistedCar = { 1171614426, 1127131465, -1647941228, 1938952078, -2007026063, 2046537925, -1627000575, 1912215274, -1973172295, -1536924937, -1779120616, 456714581, -34623805, 353883353, 741586030, -488123221, -1205689942, -1683328900, 1922257928 }
local alreadyDead = false
local alreadyInCar = false

function checkDeathCause(array, val)
    for name, value in ipairs(array) do
        if value == val then
            return true
        end
    end
    return false
end

function isBlackListedCar(Hash)
    for _,v in pairs(BlacklistedCar) do
        if v == Hash then
            return true
        end
    end
end

Citizen.CreateThread(function()

    while true do
        Citizen.Wait(50)
        local playerPed = GetPlayerPed(-1)
        if IsEntityDead(playerPed) and not alreadyDead then
            local playerName = GetPlayerName(PlayerId())
            killer = GetPedKiller(playerPed)
            killername = false

            for id = 0, 256 do
                if killer == GetPlayerPed(id) then
                    killername = GetPlayerName(id)
                end
            end

            local death = GetPedCauseOfDeath(playerPed)

            if checkDeathCause (Melee, death) then
                TriggerServerEvent("Fd_Logs:SendLogs", "Kill", "Red", "Mort d'un joueur", ""..playerName.." a était tabasser par "..killername)
            elseif checkDeathCause (Bullet, death) then
                TriggerServerEvent("Fd_Logs:SendLogs", "Kill", "Red", "Mort d'un joueur", ""..playerName.." a était shooter par "..killername)
            elseif checkDeathCause (Knife, death) then
                TriggerServerEvent("Fd_Logs:SendLogs", "Kill", "Red", "Mort d'un joueur", ""..playerName.." a était assassiner par "..killername)
            elseif checkDeathCause (Car, death) then
                TriggerServerEvent("Fd_Logs:SendLogs", "Kill", "Red", "Mort d'un joueur", ""..playerName.." a était percuter par "..killername)
            elseif checkDeathCause (Animal, death) then
                TriggerServerEvent("Fd_Logs:SendLogs", "Kill", "Red", "Mort d'un joueur", ""..playerName.." a était tuer par un animal.")
            elseif checkDeathCause (FallDamage, death) then
                TriggerServerEvent("Fd_Logs:SendLogs", "Kill", "Red", "Mort d'un joueur", ""..playerName.." est mort suite à une chute.")
            elseif checkDeathCause (Explosion, death) then
                TriggerServerEvent("Fd_Logs:SendLogs", "Kill", "Red", "Mort d'un joueur", ""..playerName.." est mort suite à une explosion.")
            elseif checkDeathCause (Gas, death) then
                TriggerServerEvent("Fd_Logs:SendLogs", "Kill", "Red", "Mort d'un joueur", ""..playerName.." est mort d'asphyxie.")
            elseif checkDeathCause (Burn, death) then
                TriggerServerEvent("Fd_Logs:SendLogs", "Kill", "Red", "Mort d'un joueur", ""..playerName.." est mort de brûlure.")
            elseif checkDeathCause (Drown, death) then
                TriggerServerEvent("Fd_Logs:SendLogs", "Kill", "Red", "Mort d'un joueur", ""..playerName.." est mort d'asphyxie.")
            else
                TriggerServerEvent("Fd_Logs:SendLogs", "Kill", "Red", "Mort d'un joueur", ""..playerName.." est mort de raison inconnue.")
            end

            alreadyDead = true
        end

        if IsPedSittingInAnyVehicle(playerPed) and not alreadyInCar then
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            local playerName = GetPlayerName(PlayerId())
            if isBlackListedCar(GetEntityModel(vehicle)) then
                TriggerServerEvent("Fd_Logs:SendLogs", "Car", "Blue", "Utilisation d'un véhicule", ""..playerName.." est monter dans un véhicule interdit.")
                alreadyInCar = true
            end
        end

        if not IsPedSittingInAnyVehicle(playerPed) and alreadyInCar then
            alreadyInCar = false
        end

        if not IsEntityDead(playerPed) and alreadyDead then
            alreadyDead = false
        end
    end
end)