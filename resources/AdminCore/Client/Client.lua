ESX = nil
InMenu = false
CrtId = nil
CrtTrigger = nil
LastMenu = nil
CrtPed = nil
LstCoords = nil

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

RegisterCommand('OpenStaff', function()
    IsStaff()
end, false)

RegisterKeyMapping('OpenStaff', 'Menu administration', 'keyboard', 'F11')

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

RegisterNetEvent('Fd_Staff:SetBlackout')
AddEventHandler('Fd_Staff:SetBlackout', function(State)
    SetArtificialLightsState(State)
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
            table.insert(Staff.PlyBlip, PlyBlips)
        end
    end
end

function DeletePlyBlips()
    for _,v in pairs (Staff.PlyBlip) do
        RemoveBlip(v)
    end
end

function IsStaff()
    ESX.TriggerServerCallback('Fd_Staff:IsStaff', function(Group)
        if Group ~= "users" then
            if not Staff.JobsListsReady then
                GetJobsLists()
            end
            OpenMenu()
        end
    end)
end

function Noclip()
    Staff.Noclip = true
    while Staff.Noclip do
        Citizen.Wait(0)

        local plyPed = GetPlayerPed(-1)
        local plyCoords = GetEntityCoords(plyPed, false)
		local camCoords = getCamDirection()
		SetEntityVelocity(plyPed, 0.01, 0.01, 0.01)
		if IsControlPressed(0, 32) then
			plyCoords = plyCoords + (1.1 * camCoords)
		end
		if IsControlPressed(0, 269) then
	    	plyCoords = plyCoords - (1.1 * camCoords)
		end
		SetEntityCoordsNoOffset(plyPed, plyCoords, true, true, true)
    end
end

function PlyName()
    Staff.PlyName = true
    while Staff.PlyName do
        Citizen.Wait(0)

        for i = 0, 256 do
            if NetworkIsPlayerActive(i) then
                local GamerTagId = 0
                local PlayerPed = GetPlayerPed(i)
                GamerTagId = CreateMpGamerTag(PlayerPed, GetPlayerName(i), false, false, "", 0)
                if Vdist2(GetEntityCoords(PlayerPed, true), GetEntityCoords(PlayerPedId(), true)) > 5 * 10  then
                    RemoveMpGamerTag(GamerTagId)
                end
            end
        end
    end
end

function Spectate()
    Staff.Spectate = true
    while Staff.Spectate do
        Citizen.Wait(0)

        Coords = GetEntityCoords(CrtPed)
        SetEntityCoordsNoOffset(PlayerPedId(), Coords, true, true, true)
    end
end

function RefreshInfos(Id)
    ESX.TriggerServerCallback('Ld_Staff:GetPlyInfos', function(Infos)
        Staff.PlyInfos = Infos
    end, Id)
end

function BoostVhc(Vhc)
    SetVehicleMod(Vhc,  11, 3)
    SetVehicleMod(Vhc,  12, 3)
    SetVehicleMod(Vhc,  13, 3)
    SetVehicleMod(Vhc,  15, 3)
    SetVehicleMod(Vhc,  16, 3)
    SetVehicleMod(Vhc,  18, 1)
    SetVehicleTyresCanBurst(Vhc, false)
end