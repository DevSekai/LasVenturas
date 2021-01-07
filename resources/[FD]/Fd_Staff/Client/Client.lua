ESX = nil

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
    ESX.TriggerServerCallback('Ld_Staff:GetItemList', function(Items)
        Staff.ItemsList = Items
    end)
    Citizen.Wait(3000)
    ESX.TriggerServerCallback('Ld_Staff:IsInJail', function(InJail)
        if InJail then
            TriggerEvent("Fd_Staff:Jail")
        end
    end)
    TriggerServerEvent("IsBan")
end)

function GetJobsLists()
    ESX.TriggerServerCallback('Ld_Staff:GetJobList', function(Jobs)
        for _,v in pairs (Jobs) do
            if not Staff.JobsList[v.label] then
                Staff.JobsList[v.label] = {}
            end
            GetJobGrades(v.name, v.label)
        end 
    end)
    ESX.TriggerServerCallback('Ld_Staff:GetJob2List', function(Jobs2)
        for _,v in pairs (Jobs2) do
            if not Staff.Jobs2List[v.label] then
                Staff.Jobs2List[v.label] = {}
            end
            GetJob2Grades(v.name, v.label)
        end 
    end)
    Staff.JobsListsReady = true
end

function GetJobGrades(JobName, JobLabel)
    ESX.TriggerServerCallback('Ld_Staff:GetGradeList', function(Grades)
        Staff.JobsList[JobLabel].Grades = {}
        for _,v in pairs (Grades) do
            table.insert(Staff.JobsList[JobLabel].Grades, {Name = v.label, Job = v.job_name, Value = v.grade})
        end
    end, JobName)
end

function GetJob2Grades(JobName, JobLabel)
    ESX.TriggerServerCallback('Ld_Staff:GetGrade2List', function(Grades2)
        Staff.Jobs2List[JobLabel].Grades = {}
        for _,v in pairs (Grades2) do
            table.insert(Staff.Jobs2List[JobLabel].Grades, {Name = v.label, Job = v.job2_name, Value = v.grade})
        end
    end, JobName)
end

function KeyboardInput(TextEntry, ExampleText, MaxStringLength)
    AddTextEntry("FMMC_KEY_TIP1", TextEntry .. "")
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLength)
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

RegisterNetEvent('Fd_Staff:Revive')
AddEventHandler('Fd_Staff:Revive', function()
    local coords = GetEntityCoords(PlayerPedId())
    local heading = GetEntityHeading(PlayerPedId())
    if Staff.Use_esxAmbulancejob then
        TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
    end
	DoScreenFadeOut(800)
	while not IsScreenFadedOut() do
		Citizen.Wait(50)
	end
	RespawnPed(PlayerPedId(), coords, heading)

	StopScreenEffect('DeathFailOut')
	DoScreenFadeIn(800)
end)

function RespawnPed(ped, coords, heading)
	SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
	NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
	SetPlayerInvincible(ped, false)
	ClearPedBloodDamage(ped)

	TriggerServerEvent('esx:onPlayerSpawn')
	TriggerEvent('esx:onPlayerSpawn')
	TriggerEvent('playerSpawned') -- compatibility with old scripts, will be removed soon
end

RegisterNetEvent('Fd_Staff:Goto')
AddEventHandler('Fd_Staff:Goto', function(Coords)
    SetEntityCoords(PlayerPedId(), Coords)
end)

RegisterNetEvent('Fd_Staff:Bring')
AddEventHandler('Fd_Staff:Bring', function(Coords)
    SetEntityCoords(PlayerPedId(), Coords)
end)

RegisterNetEvent('Fd_Staff:Jail')
AddEventHandler('Fd_Staff:Jail', function(Coords)
    SetEntityCoords(PlayerPedId(), Staff.Jail_Coords)
    FreezeEntityPosition(PlayerPedId(), true)
    Citizen.Wait(Staff.Jail_Timing)
    FreezeEntityPosition(PlayerPedId(), false)
    SetEntityCoords(PlayerPedId(), Staff.JailOut_Coords)
    TriggerServerEvent("Jail_Out")
end)

function SpawnCar(Hash)
    Coords = GetEntityCoords(PlayerPedId())
    Heading = GetEntityHeading(PlayerPedId())
    Car = RequestModel(GetHashKey(Hash))
    while not HasModelLoaded(Car) do
        Citizen.Wait(0)
    end
    Vehicle = CreateVehicle(GetHashKey(Hash), Coords.x, Coords.y, Coords.z, Heading, true, true)
    TaskWarpPedIntoVehicle(PlayerPedId(), Vehicle, -1)
end

RegisterNetEvent('Fd_Staff:SetWeather')
AddEventHandler('Fd_Staff:SetWeather', function(Type)
    SetWeatherTypeNowPersist(Type)
end)

RegisterNetEvent('Fd_Staff:SetTime')
AddEventHandler('Fd_Staff:SetTime', function(Hour)
    NetworkOverrideClockTime(Hour, 0, 0)
end)

function getCamDirection()
    local plyPed = GetPlayerPed(-1)
	local heading = GetGameplayCamRelativeHeading() + GetEntityPhysicsHeading(plyPed)
	local pitch = GetGameplayCamRelativePitch()
	local coords = vector3(-math.sin(heading * math.pi / 180.0), math.cos(heading * math.pi / 180.0), math.sin(pitch * math.pi / 180.0))
	local len = math.sqrt((coords.x * coords.x) + (coords.y * coords.y) + (coords.z * coords.z))

	if len ~= 0 then
		coords = coords / len
	end

	return coords
end

function CreatePlyBlips()
    for i = 0, 256 do
        if NetworkIsPlayerActive(i) then
            local PlyBlips = AddBlipForEntity(GetPlayerPed(i))
            SetBlipNameToPlayerName(PlyBlips, PlayerId(i))
            table.insert(Staff.PlyBlips, PlyBlips)
        end
    end
end

function DeletePlyBlips()
    for _,v in pairs (Staff.PlyBlips) do
        RemoveBlip(v)
    end
end