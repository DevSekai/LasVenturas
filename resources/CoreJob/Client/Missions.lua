Mission = {
    State = nil,
    Notif = false,
    MinInterval = --[[15 * 60 *]] 15000, -- 15 Minutes
    MaxInterval = --[[45 * 60 *]] 45000, -- 45 Minutes
    Timing = math.random(15000, 45000), -- Entre 15 et 45 minutes
    MarkerScale = 1.0,
    MarkerType = 32,
    CrtPed = {},
    In = {
        Timing = 2000,
    },
    ["ambulance"] = {
        HelpNotif = "Appuyer sur ~INPUT_CONTEXT~ pour prendre en charge la personne",
        FinishHelpNotif = "Appuyer sur ~INPUT_CONTEXT~ pour déposer la personne",
        Notif = "Une personne a besoin de soins, de toute urgence.\nAllez la chercher.",
        RestrictNotif = "Vous devez être a bord d'une Ambulance pour faire cela",
        MissionDist = 4,
        Restrict = function()
            CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
            CrtModel = GetEntityModel(CrtVhc)
            if CrtModel == GetHashKey("ambulance") then
                return true
            end
        end,
        FinishCoords = vector3(362.4659, -591.4022, 28.77441),
        DeletePedCoords = vector3(348.1187, -582.0923, 28.79126),
        Coords = {
            vector3(406.5363, -965.8417, 29.41467),
            vector3(169.622, -1004.308, 29.33044),
            vector3(14.22857, -948.6857, 28.67322),
            vector3(-159.5868, -881.3275, 29.4989),
            vector3(-338.5187, -865.8725, 31.68933),
            vector3(-693.389, -821.1824, 24.02271),
            vector3(-1011.745, -790.9451, 16.97949),
            vector3(-1248.119, -593.1956, 27.32532),
            vector3(-1467.626, -264.9626, 49.09521),
            vector3(-1676.176, -45.01978, 61.21021),
            vector3(-1630.246, 135.0725, 61.63147),
            vector3(-1564.009, 184.5758, 57.92456),
            vector3(-1272.752, 237.9956, 61.10913),
            vector3(-1099.965, 249.5341, 63.85571),
            vector3(-869.0242, 242.2549, 73.56116),
            vector3(-693.5077, 229.8198, 80.84033),
            vector3(-547.4374, 271.7934, 83.01392),
            vector3(-477.033, 268.4967, 83.26672),
            vector3(-326.189, 236.1758, 86.73779),
            vector3(-166.8264, 269.5253, 93.41028),
            vector3(-58.35164, 247.0154, 103.9246),
            vector3(140.9802, 234.3429, 107.2271),
            vector3(325.833, 133.0549, 103.4696),
            vector3(502.4703, 107.1692, 96.40955),
            vector3(669.9429, 5.142858, 84.15967),
            vector3(897.7978, -103.5824, 78.56555),
            vector3(1129.688, -259.6483, 69.18018),
            vector3(1294.299, -448.7473, 69.16333),
            vector3(1192.549, -525.8637, 65.052),
            vector3(937.8989, -571.2659, 58.1604),
            vector3(1129.78, -767.8945, 57.80664),
            vector3(1303.24, -727.0681, 64.84985),
            vector3(1145.248, -972.145, 46.77002),
            vector3(1227.969, -1314.791, 35.12671),
            vector3(1287.442, -1565.974, 50.25793),
            vector3(1175.328, -1695.31, 35.43005),
            vector3(791.6835, -1761.046, 29.36414),
            vector3(598.0747, -1707.811, 29.3136),
            vector3(484.1275, -1791.165, 28.60583),
            vector3(341.6571, -1960.365, 24.56189),
            vector3(242.7429, -2052.501, 18.20947),
            vector3(5.591209, -2027.895, 18.29382),
            vector3(-222.8176, -2109.244, 23.11279),
            vector3(-388.5231, -1783.042, 21.4447),
            vector3(-548.1099, -1742.202, 22.00073),
            vector3(-640.589, -1486.062, 10.69446),
            vector3(-671.7231, -1302.672, 10.72815),
            vector3(-745.8989, -1123.081, 10.7113),
            vector3(-962.4264, -859.4637, 15.12598),
            vector3(-1391.354, -1200.132, 4.27478),
            vector3(-1348.075, -1420.813, 4.409546),
            vector3(-1259.829, -1516.76, 4.3927),
            vector3(-1185.6, -1568.281, 4.409546),
            vector3(-1117.134, -1573.661, 4.426392),
            vector3(-1062.541, -1489.582, 5.150879),
            vector3(-806.1758, -1151.407, 8.756836),
            vector3(-582.1583, -965.7363, 22.91064),
            vector3(-508.7736, -965.7099, 23.65198),
            vector3(-393.3231, -1139.393, 29.73474),
            vector3(-293.3407, -1258.022, 29.3136),
            vector3(-258, -1405.793, 31.36926),
            vector3(-124.6154, -1547.235, 34.09888),
            vector3(-69.71867, -1741.147, 29.41467),
            vector3(25.58242, -1862.044, 23.43298),
            vector3(320.9011, -1771.094, 28.85864),
            vector3(496.3253, -1641.086, 29.33044),
            vector3(181.1077, -1430.862, 29.36414),
            vector3(125.8286, -1319.525, 29.3136),
            vector3(25.17363, -1305.02, 29.12817),
            vector3(-87.67912, -1175.209, 26.22998),
            vector3(-86.63736, -1019.855, 28.06665),
            vector3(116.0308, -817.7802, 31.38611),
            vector3(339.0857, -837.0725, 29.38098),
            vector3(456.3297, -736.5758, 27.42639),
        },
        SpawnMissionPed = function(Coords)
            Ped = GetRandomModelNPC()
            RequestModel(Ped)
            while not HasModelLoaded(Ped) do
                RequestModel(Ped)
                Citizen.Wait(10)
            end
            Peds = CreatePed(1, Ped, Coords.x, Coords.y, Coords.z - 0.98, 0.0, false, true)
            table.insert(Mission.CrtPed, Peds)
            SetEntityHeading(Peds, math.random(0, 380))
			FreezeEntityPosition(Peds, true)
			SetBlockingOfNonTemporaryEvents(Peds, true)
            SetEntityInvincible(Peds, true)
        end,
        StartMission = function()
            Mission.In.Timing = 2000
            RemoveBlip(Blip)
            CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
            FreezeEntityPosition(Peds, false)
            TaskEnterVehicle(Peds, CrtVhc, 2500, 0, 2.0, 1, 0)
            Coords = Mission[PlayerData.job.name].FinishCoords
            Blip = AddBlipForCoord(Coords.x, Coords.y, Coords.z)
            SetBlipSprite(Blip, 1)
            SetBlipDisplay(Blip, 8)
            SetBlipScale(Blip, 0.6)
            SetBlipColour(Blip, 5)
            SetBlipRoute(Blip, true)
            Mission.State = "FinishLine"
            while Mission.State == "FinishLine" do
                Citizen.Wait(Mission.In.Timing)
                local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Coords.x, Coords.y, Coords.z, true)
                if distance < 8 then
                    Mission.In.Timing = 0
                    DrawMarker(Mission.MarkerType, Coords.x, Coords.y, Coords.z + 0.98, 0, 0, 0, 0, 0, 0, Mission.MarkerScale, Mission.MarkerScale, Mission.MarkerScale, 255, 255, 255, 255, false, true, 2, true, nil, false)
                    if distance < 4 then
                        ESX.ShowHelpNotification(Mission[PlayerData.job.name].FinishHelpNotif)
                        if IsControlJustReleased(1, 51) then
                            Mission[PlayerData.job.name].FinishMission()
                            Mission.Timing = math.random(Mission.MinInterval, Mission.MaxInterval)
                        end
                    end
                else
                    Mission.In.Timing = 2000
                end
            end
        end,
        FinishMission = function()
            Coords = Mission[PlayerData.job.name].DeletePedCoords
            CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
            TaskLeaveVehicle(Peds, CrtVhc, 1)
            TaskGoToCoordAnyMeans(Peds, Coords.x, Coords.y, Coords.z, 1.5, 0, 0, 786603, 0xbf800000)
            Table = {jobName = PlayerData.job.name}
            TriggerServerEvent("Mission:Reward", Table)
            Mission.State = nil
            RemoveBlip(Blip)
            Citizen.Wait(25000)
            Mission.In.Timing = 2000
            DeleteEntity(Peds)
        end,
    },
    ["police"] = {
        HelpNotif = "Appuyer sur ~INPUT_CONTEXT~ pour récuperer les indices",
        FinishHelpNotif = "Appuyer sur ~INPUT_CONTEXT~ pour ranger les indices",
        Notif = "Un inspecteur vous demande de l'aide.\nAllez recupérer les indices.",
        RestrictNotif = "Vous devez être a bord d'un véhicule de fonction pour faire cela.",
        Ped = "ig_fbisuit_01",
        MissionDist = 2,
        Restrict = function()
            CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
            CrtModel = GetEntityModel(CrtVhc)
            if CrtModel == GetHashKey("police") or
            CrtModel == GetHashKey("police2") or
            CrtModel == GetHashKey("police3") or
            CrtModel == GetHashKey("police4") or
            CrtModel == GetHashKey("fbi") or
            CrtModel == GetHashKey("fbi2") then
                return true
            end
        end,
        FinishCoords = vector3(468.4484, -987.3494, 25.72449),
        Coords = {
            vector3(-1272.752, 237.9956, 61.10913),
            vector3(-1099.965, 249.5341, 63.85571),
            vector3(-869.0242, 242.2549, 73.56116),
            vector3(-693.5077, 229.8198, 80.84033),
            vector3(-326.189, 236.1758, 86.73779),
            vector3(-166.8264, 269.5253, 93.41028),
            vector3(-58.35164, 247.0154, 103.9246),
            vector3(140.9802, 234.3429, 107.2271),
            vector3(325.833, 133.0549, 103.4696),
            vector3(502.4703, 107.1692, 96.40955),
            vector3(669.9429, 5.142858, 84.15967),
            vector3(897.7978, -103.5824, 78.56555),
            vector3(1129.688, -259.6483, 69.18018),
            vector3(1294.299, -448.7473, 69.16333),
            vector3(791.6835, -1761.046, 29.36414),
            vector3(598.0747, -1707.811, 29.3136),
            vector3(484.1275, -1791.165, 28.60583),
            vector3(341.6571, -1960.365, 24.56189),
            vector3(242.7429, -2052.501, 18.20947),
            vector3(5.591209, -2027.895, 18.29382),
            vector3(-222.8176, -2109.244, 23.11279),
            vector3(-388.5231, -1783.042, 21.4447),
            vector3(-806.1758, -1151.407, 8.756836),
            vector3(-582.1583, -965.7363, 22.91064),
            vector3(125.8286, -1319.525, 29.3136),
            vector3(25.17363, -1305.02, 29.12817),
            vector3(-87.67912, -1175.209, 26.22998),
            vector3(-86.63736, -1019.855, 28.06665),
            vector3(116.0308, -817.7802, 31.38611),
            vector3(339.0857, -837.0725, 29.38098),
            vector3(456.3297, -736.5758, 27.42639),
        },
        SpawnMissionPed = function(Coords)
            RequestModel(Mission[PlayerData.job.name].Ped)
            while not HasModelLoaded(Mission[PlayerData.job.name].Ped) do
                RequestModel(Mission[PlayerData.job.name].Ped)
                Citizen.Wait(10)
            end
            Peds = CreatePed(1, Mission[PlayerData.job.name].Ped, Coords.x, Coords.y, Coords.z - 0.98, 0.0, false, true)
            SetEntityHeading(Peds, math.random(0, 380))
			FreezeEntityPosition(Peds, true)
			SetBlockingOfNonTemporaryEvents(Peds, true)
            SetEntityInvincible(Peds, true)
        end,
        StartMission = function()
            ESX.ShowNotification("Vous avez récuperer les indices.\nAllez les déposer au commissairiat.")
            Mission.In.Timing = 2000
            RemoveBlip(Blip)
            FreezeEntityPosition(Peds, false)
            Coords = Mission[PlayerData.job.name].FinishCoords
            Blip = AddBlipForCoord(Coords.x, Coords.y, Coords.z)
            SetBlipSprite(Blip, 1)
            SetBlipDisplay(Blip, 8)
            SetBlipScale(Blip, 0.6)
            SetBlipColour(Blip, 5)
            SetBlipRoute(Blip, true)
            Mission.State = "FinishLine"
            while Mission.State == "FinishLine" do
                Citizen.Wait(Mission.In.Timing)
                local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Coords.x, Coords.y, Coords.z, true)
                if distance < 8 then
                    Mission.In.Timing = 0
                    DrawMarker(Mission.MarkerType, Coords.x, Coords.y, Coords.z + 0.98, 0, 0, 0, 0, 0, 0, Mission.MarkerScale, Mission.MarkerScale, Mission.MarkerScale, 255, 255, 255, 255, false, true, 2, true, nil, false)
                    if distance < 2 then
                        ESX.ShowHelpNotification(Mission[PlayerData.job.name].FinishHelpNotif)
                        if IsControlJustReleased(1, 51) then
                            Mission[PlayerData.job.name].FinishMission()
                            Mission.Timing = math.random(Mission.MinInterval, Mission.MaxInterval)
                        end
                    end
                else
                    Mission.In.Timing = 2000
                end
            end
        end,
        FinishMission = function()
            ESX.ShowNotification("Vous avez déposer les indices.")
            Table = {jobName = PlayerData.job.name}
            TriggerServerEvent("Mission:Reward", Table)
            Mission.State = nil
            RemoveBlip(Blip)
            Mission.In.Timing = 2000
            DeleteEntity(Peds)
        end,
    },
    ["weazel"] = {
        HelpNotif = "Appuyer sur ~INPUT_CONTEXT~ pour interviewer la personne",
        FinishHelpNotif = "Appuyer sur ~INPUT_CONTEXT~ pour rediger l'article",
        Notif = "Un citoyen vous à contacter.\nAllez à sa rencontre.",
        RestrictNotif = "",
        MissionDist = 2,
        Restrict = function()
            return true
        end,
        FinishCoords = vector3(-595.3582, -922.8659, 28.15088),
        Coords = {
            vector3(-1272.752, 237.9956, 61.10913),
            vector3(-1099.965, 249.5341, 63.85571),
            vector3(-869.0242, 242.2549, 73.56116),
            vector3(-693.5077, 229.8198, 80.84033),
            vector3(-326.189, 236.1758, 86.73779),
            vector3(-166.8264, 269.5253, 93.41028),
            vector3(-58.35164, 247.0154, 103.9246),
            vector3(140.9802, 234.3429, 107.2271),
            vector3(325.833, 133.0549, 103.4696),
            vector3(502.4703, 107.1692, 96.40955),
            vector3(669.9429, 5.142858, 84.15967),
            vector3(897.7978, -103.5824, 78.56555),
            vector3(1129.688, -259.6483, 69.18018),
            vector3(1294.299, -448.7473, 69.16333),
            vector3(791.6835, -1761.046, 29.36414),
            vector3(598.0747, -1707.811, 29.3136),
            vector3(484.1275, -1791.165, 28.60583),
            vector3(341.6571, -1960.365, 24.56189),
            vector3(242.7429, -2052.501, 18.20947),
            vector3(5.591209, -2027.895, 18.29382),
            vector3(-222.8176, -2109.244, 23.11279),
            vector3(-388.5231, -1783.042, 21.4447),
            vector3(-806.1758, -1151.407, 8.756836),
            vector3(-582.1583, -965.7363, 22.91064),
            vector3(125.8286, -1319.525, 29.3136),
            vector3(25.17363, -1305.02, 29.12817),
            vector3(-87.67912, -1175.209, 26.22998),
            vector3(-86.63736, -1019.855, 28.06665),
            vector3(116.0308, -817.7802, 31.38611),
            vector3(339.0857, -837.0725, 29.38098),
            vector3(456.3297, -736.5758, 27.42639),
        },
        SpawnMissionPed = function(Coords)
            Ped = GetRandomModelNPC()
            RequestModel(Ped)
            while not HasModelLoaded(Ped) do
                RequestModel(Ped)
                Citizen.Wait(10)
            end
            Peds = CreatePed(1, Ped, Coords.x, Coords.y, Coords.z - 0.98, 0.0, false, true)
            table.insert(Mission.CrtPed, Peds)
            SetEntityHeading(Peds, math.random(0, 380))
			FreezeEntityPosition(Peds, true)
			SetBlockingOfNonTemporaryEvents(Peds, true)
            SetEntityInvincible(Peds, true)
        end,
        StartMission = function()
            ESX.ShowNotification("Vous avez interviewer la personne.\nAllez les rédiger l'article.")
            Mission.In.Timing = 2000
            RemoveBlip(Blip)
            FreezeEntityPosition(Peds, false)
            Coords = Mission[PlayerData.job.name].FinishCoords
            Blip = AddBlipForCoord(Coords.x, Coords.y, Coords.z)
            SetBlipSprite(Blip, 1)
            SetBlipDisplay(Blip, 8)
            SetBlipScale(Blip, 0.6)
            SetBlipColour(Blip, 5)
            SetBlipRoute(Blip, true)
            Mission.State = "FinishLine"
            while Mission.State == "FinishLine" do
                Citizen.Wait(Mission.In.Timing)
                local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Coords.x, Coords.y, Coords.z, true)
                if distance < 8 then
                    Mission.In.Timing = 0
                    DrawMarker(Mission.MarkerType, Coords.x, Coords.y, Coords.z + 0.98, 0, 0, 0, 0, 0, 0, Mission.MarkerScale, Mission.MarkerScale, Mission.MarkerScale, 255, 255, 255, 255, false, true, 2, true, nil, false)
                    if distance < 2 then
                        ESX.ShowHelpNotification(Mission[PlayerData.job.name].FinishHelpNotif)
                        if IsControlJustReleased(1, 51) then
                            Mission[PlayerData.job.name].FinishMission()
                            Mission.Timing = math.random(Mission.MinInterval, Mission.MaxInterval)
                        end
                    end
                else
                    Mission.In.Timing = 2000
                end
            end
        end,
        FinishMission = function()
            ESX.ShowNotification("Vous avez régirer l'article.")
            Table = {jobName = PlayerData.job.name}
            TriggerServerEvent("Mission:Reward", Table)
            Mission.State = nil
            RemoveBlip(Blip)
            Mission.In.Timing = 2000
            DeleteEntity(Peds)
        end,
    },
    ["dog"] = {
        HelpNotif = "Appuyer sur ~INPUT_CONTEXT~ pour livrer la personne",
        FinishHelpNotif = "Appuyer sur ~INPUT_CONTEXT~ pour déposer la recette",
        Notif = "Un client à passer commande.\nAllez le livrer.",
        RestrictNotif = "",
        MissionDist = 2,
        Restrict = function()
            return true
        end,
        FinishCoords = vector3(43.01539, -1005.389, 29.27991),
        Coords = {
            vector3(-1272.752, 237.9956, 61.10913),
            vector3(-1099.965, 249.5341, 63.85571),
            vector3(-869.0242, 242.2549, 73.56116),
            vector3(-693.5077, 229.8198, 80.84033),
            vector3(-326.189, 236.1758, 86.73779),
            vector3(-166.8264, 269.5253, 93.41028),
            vector3(-58.35164, 247.0154, 103.9246),
            vector3(140.9802, 234.3429, 107.2271),
            vector3(325.833, 133.0549, 103.4696),
            vector3(502.4703, 107.1692, 96.40955),
            vector3(669.9429, 5.142858, 84.15967),
            vector3(897.7978, -103.5824, 78.56555),
            vector3(1129.688, -259.6483, 69.18018),
            vector3(1294.299, -448.7473, 69.16333),
            vector3(791.6835, -1761.046, 29.36414),
            vector3(598.0747, -1707.811, 29.3136),
            vector3(484.1275, -1791.165, 28.60583),
            vector3(341.6571, -1960.365, 24.56189),
            vector3(242.7429, -2052.501, 18.20947),
            vector3(5.591209, -2027.895, 18.29382),
            vector3(-222.8176, -2109.244, 23.11279),
            vector3(-388.5231, -1783.042, 21.4447),
            vector3(-806.1758, -1151.407, 8.756836),
            vector3(-582.1583, -965.7363, 22.91064),
            vector3(125.8286, -1319.525, 29.3136),
            vector3(25.17363, -1305.02, 29.12817),
            vector3(-87.67912, -1175.209, 26.22998),
            vector3(-86.63736, -1019.855, 28.06665),
            vector3(116.0308, -817.7802, 31.38611),
            vector3(339.0857, -837.0725, 29.38098),
            vector3(456.3297, -736.5758, 27.42639),
        },
        SpawnMissionPed = function(Coords)
            Ped = GetRandomModelNPC()
            RequestModel(Ped)
            while not HasModelLoaded(Ped) do
                RequestModel(Ped)
                Citizen.Wait(10)
            end
            Peds = CreatePed(1, Ped, Coords.x, Coords.y, Coords.z - 0.98, 0.0, false, true)
            table.insert(Mission.CrtPed, Peds)
            SetEntityHeading(Peds, math.random(0, 380))
			FreezeEntityPosition(Peds, true)
			SetBlockingOfNonTemporaryEvents(Peds, true)
            SetEntityInvincible(Peds, true)
        end,
        StartMission = function()
            ESX.ShowNotification("Vous avez livrer.\nAllez les déposer la recette.")
            Mission.In.Timing = 2000
            RemoveBlip(Blip)
            FreezeEntityPosition(Peds, false)
            Coords = Mission[PlayerData.job.name].FinishCoords
            Blip = AddBlipForCoord(Coords.x, Coords.y, Coords.z)
            SetBlipSprite(Blip, 1)
            SetBlipDisplay(Blip, 8)
            SetBlipScale(Blip, 0.6)
            SetBlipColour(Blip, 5)
            SetBlipRoute(Blip, true)
            Mission.State = "FinishLine"
            while Mission.State == "FinishLine" do
                Citizen.Wait(Mission.In.Timing)
                local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Coords.x, Coords.y, Coords.z, true)
                if distance < 8 then
                    Mission.In.Timing = 0
                    DrawMarker(Mission.MarkerType, Coords.x, Coords.y, Coords.z + 0.98, 0, 0, 0, 0, 0, 0, Mission.MarkerScale, Mission.MarkerScale, Mission.MarkerScale, 255, 255, 255, 255, false, true, 2, true, nil, false)
                    if distance < 2 then
                        ESX.ShowHelpNotification(Mission[PlayerData.job.name].FinishHelpNotif)
                        if IsControlJustReleased(1, 51) then
                            Mission[PlayerData.job.name].FinishMission()
                            Mission.Timing = math.random(Mission.MinInterval, Mission.MaxInterval)
                        end
                    end
                else
                    Mission.In.Timing = 2000
                end
            end
        end,
        FinishMission = function()
            ESX.ShowNotification("Vous avez déposer la recette.")
            Table = {jobName = PlayerData.job.name}
            TriggerServerEvent("Mission:Reward", Table)
            Mission.State = nil
            RemoveBlip(Blip)
            Mission.In.Timing = 2000
            DeleteEntity(Peds)
        end,
    },
    ["unicorn"] = {
        HelpNotif = "Appuyer sur ~INPUT_CONTEXT~ pour prendre en charge la personne",
        FinishHelpNotif = "Appuyer sur ~INPUT_CONTEXT~ pour déposer la personne",
        Notif = "Un client VIP souhaite qu'on aille le chercher.\nAllez le chercher.",
        RestrictNotif = "",
        MissionDist = 4,
        Restrict = function()
            return true
        end,
        FinishCoords = vector3(133.622, -1308.884, 28.28577),
        DeletePedCoords = vector3(128.0571, -1296.475, 29.26306),
        Coords = {
            vector3(406.5363, -965.8417, 29.41467),
            vector3(169.622, -1004.308, 29.33044),
            vector3(14.22857, -948.6857, 28.67322),
            vector3(-159.5868, -881.3275, 29.4989),
            vector3(-338.5187, -865.8725, 31.68933),
            vector3(-693.389, -821.1824, 24.02271),
            vector3(-1011.745, -790.9451, 16.97949),
            vector3(-1248.119, -593.1956, 27.32532),
            vector3(-1467.626, -264.9626, 49.09521),
            vector3(-1676.176, -45.01978, 61.21021),
            vector3(-1630.246, 135.0725, 61.63147),
            vector3(-1564.009, 184.5758, 57.92456),
            vector3(-1272.752, 237.9956, 61.10913),
            vector3(-1099.965, 249.5341, 63.85571),
            vector3(-869.0242, 242.2549, 73.56116),
            vector3(-693.5077, 229.8198, 80.84033),
            vector3(-547.4374, 271.7934, 83.01392),
            vector3(-477.033, 268.4967, 83.26672),
            vector3(-326.189, 236.1758, 86.73779),
            vector3(-166.8264, 269.5253, 93.41028),
            vector3(-58.35164, 247.0154, 103.9246),
            vector3(140.9802, 234.3429, 107.2271),
            vector3(325.833, 133.0549, 103.4696),
            vector3(502.4703, 107.1692, 96.40955),
            vector3(669.9429, 5.142858, 84.15967),
            vector3(897.7978, -103.5824, 78.56555),
            vector3(1129.688, -259.6483, 69.18018),
            vector3(1294.299, -448.7473, 69.16333),
            vector3(1192.549, -525.8637, 65.052),
            vector3(937.8989, -571.2659, 58.1604),
            vector3(1129.78, -767.8945, 57.80664),
            vector3(1303.24, -727.0681, 64.84985),
            vector3(1145.248, -972.145, 46.77002),
            vector3(1227.969, -1314.791, 35.12671),
            vector3(1287.442, -1565.974, 50.25793),
            vector3(1175.328, -1695.31, 35.43005),
            vector3(791.6835, -1761.046, 29.36414),
            vector3(598.0747, -1707.811, 29.3136),
            vector3(484.1275, -1791.165, 28.60583),
            vector3(341.6571, -1960.365, 24.56189),
            vector3(242.7429, -2052.501, 18.20947),
            vector3(5.591209, -2027.895, 18.29382),
            vector3(-222.8176, -2109.244, 23.11279),
            vector3(-388.5231, -1783.042, 21.4447),
            vector3(-548.1099, -1742.202, 22.00073),
            vector3(-640.589, -1486.062, 10.69446),
            vector3(-671.7231, -1302.672, 10.72815),
            vector3(-745.8989, -1123.081, 10.7113),
            vector3(-962.4264, -859.4637, 15.12598),
            vector3(-1391.354, -1200.132, 4.27478),
            vector3(-1348.075, -1420.813, 4.409546),
            vector3(-1259.829, -1516.76, 4.3927),
            vector3(-1185.6, -1568.281, 4.409546),
            vector3(-1117.134, -1573.661, 4.426392),
            vector3(-1062.541, -1489.582, 5.150879),
            vector3(-806.1758, -1151.407, 8.756836),
            vector3(-582.1583, -965.7363, 22.91064),
            vector3(-508.7736, -965.7099, 23.65198),
            vector3(-393.3231, -1139.393, 29.73474),
            vector3(-293.3407, -1258.022, 29.3136),
            vector3(-258, -1405.793, 31.36926),
            vector3(-124.6154, -1547.235, 34.09888),
            vector3(-69.71867, -1741.147, 29.41467),
            vector3(25.58242, -1862.044, 23.43298),
            vector3(320.9011, -1771.094, 28.85864),
            vector3(496.3253, -1641.086, 29.33044),
            vector3(181.1077, -1430.862, 29.36414),
            vector3(125.8286, -1319.525, 29.3136),
            vector3(25.17363, -1305.02, 29.12817),
            vector3(-87.67912, -1175.209, 26.22998),
            vector3(-86.63736, -1019.855, 28.06665),
            vector3(116.0308, -817.7802, 31.38611),
            vector3(339.0857, -837.0725, 29.38098),
            vector3(456.3297, -736.5758, 27.42639),
        },
        SpawnMissionPed = function(Coords)
            Ped = GetRandomModelNPC()
            RequestModel(Ped)
            while not HasModelLoaded(Ped) do
                RequestModel(Ped)
                Citizen.Wait(10)
            end
            Peds = CreatePed(1, Ped, Coords.x, Coords.y, Coords.z - 0.98, 0.0, false, true)
            table.insert(Mission.CrtPed, Peds)
            SetEntityHeading(Peds, math.random(0, 380))
			FreezeEntityPosition(Peds, true)
			SetBlockingOfNonTemporaryEvents(Peds, true)
            SetEntityInvincible(Peds, true)
        end,
        StartMission = function()
            Mission.In.Timing = 2000
            RemoveBlip(Blip)
            CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
            FreezeEntityPosition(Peds, false)
            TaskEnterVehicle(Peds, CrtVhc, 2500, 0, 2.0, 1, 0)
            Coords = Mission[PlayerData.job.name].FinishCoords
            Blip = AddBlipForCoord(Coords.x, Coords.y, Coords.z)
            SetBlipSprite(Blip, 1)
            SetBlipDisplay(Blip, 8)
            SetBlipScale(Blip, 0.6)
            SetBlipColour(Blip, 5)
            SetBlipRoute(Blip, true)
            Mission.State = "FinishLine"
            while Mission.State == "FinishLine" do
                Citizen.Wait(Mission.In.Timing)
                local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Coords.x, Coords.y, Coords.z, true)
                if distance < 8 then
                    Mission.In.Timing = 0
                    DrawMarker(Mission.MarkerType, Coords.x, Coords.y, Coords.z + 0.98, 0, 0, 0, 0, 0, 0, Mission.MarkerScale, Mission.MarkerScale, Mission.MarkerScale, 255, 255, 255, 255, false, true, 2, true, nil, false)
                    if distance < 4 then
                        ESX.ShowHelpNotification(Mission[PlayerData.job.name].FinishHelpNotif)
                        if IsControlJustReleased(1, 51) then
                            Mission[PlayerData.job.name].FinishMission()
                            Mission.Timing = math.random(Mission.MinInterval, Mission.MaxInterval)
                        end
                    end
                else
                    Mission.In.Timing = 2000
                end
            end
        end,
        FinishMission = function()
            Coords = Mission[PlayerData.job.name].DeletePedCoords
            CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
            TaskLeaveVehicle(Peds, CrtVhc, 1)
            TaskGoToCoordAnyMeans(Peds, Coords.x, Coords.y, Coords.z, 1.5, 0, 0, 786603, 0xbf800000)
            Table = {jobName = PlayerData.job.name}
            TriggerServerEvent("Mission:Reward", Table)
            Mission.State = nil
            RemoveBlip(Blip)
            Citizen.Wait(25000)
            Mission.In.Timing = 2000
            DeleteEntity(Peds)
        end,
    },
    ["tequilala"] = {
        HelpNotif = "Appuyer sur ~INPUT_CONTEXT~ pour prendre en charge la personne",
        FinishHelpNotif = "Appuyer sur ~INPUT_CONTEXT~ pour déposer la personne",
        Notif = "Un client VIP souhaite qu'on aille le chercher.\nAllez le chercher.",
        RestrictNotif = "",
        MissionDist = 4,
        Restrict = function()
            return true
        end,
        FinishCoords = vector3(-565.4242, 268.8264, 82.18823),
        DeletePedCoords = vector3(-562.7077, 278.189, 83.13184),
        Coords = {
            vector3(406.5363, -965.8417, 29.41467),
            vector3(169.622, -1004.308, 29.33044),
            vector3(14.22857, -948.6857, 28.67322),
            vector3(-159.5868, -881.3275, 29.4989),
            vector3(-338.5187, -865.8725, 31.68933),
            vector3(-693.389, -821.1824, 24.02271),
            vector3(-1011.745, -790.9451, 16.97949),
            vector3(-1248.119, -593.1956, 27.32532),
            vector3(-1467.626, -264.9626, 49.09521),
            vector3(-1676.176, -45.01978, 61.21021),
            vector3(-1630.246, 135.0725, 61.63147),
            vector3(-1564.009, 184.5758, 57.92456),
            vector3(-1272.752, 237.9956, 61.10913),
            vector3(-1099.965, 249.5341, 63.85571),
            vector3(-869.0242, 242.2549, 73.56116),
            vector3(-693.5077, 229.8198, 80.84033),
            vector3(-547.4374, 271.7934, 83.01392),
            vector3(-477.033, 268.4967, 83.26672),
            vector3(-326.189, 236.1758, 86.73779),
            vector3(-166.8264, 269.5253, 93.41028),
            vector3(-58.35164, 247.0154, 103.9246),
            vector3(140.9802, 234.3429, 107.2271),
            vector3(325.833, 133.0549, 103.4696),
            vector3(502.4703, 107.1692, 96.40955),
            vector3(669.9429, 5.142858, 84.15967),
            vector3(897.7978, -103.5824, 78.56555),
            vector3(1129.688, -259.6483, 69.18018),
            vector3(1294.299, -448.7473, 69.16333),
            vector3(1192.549, -525.8637, 65.052),
            vector3(937.8989, -571.2659, 58.1604),
            vector3(1129.78, -767.8945, 57.80664),
            vector3(1303.24, -727.0681, 64.84985),
            vector3(1145.248, -972.145, 46.77002),
            vector3(1227.969, -1314.791, 35.12671),
            vector3(1287.442, -1565.974, 50.25793),
            vector3(1175.328, -1695.31, 35.43005),
            vector3(791.6835, -1761.046, 29.36414),
            vector3(598.0747, -1707.811, 29.3136),
            vector3(484.1275, -1791.165, 28.60583),
            vector3(341.6571, -1960.365, 24.56189),
            vector3(242.7429, -2052.501, 18.20947),
            vector3(5.591209, -2027.895, 18.29382),
            vector3(-222.8176, -2109.244, 23.11279),
            vector3(-388.5231, -1783.042, 21.4447),
            vector3(-548.1099, -1742.202, 22.00073),
            vector3(-640.589, -1486.062, 10.69446),
            vector3(-671.7231, -1302.672, 10.72815),
            vector3(-745.8989, -1123.081, 10.7113),
            vector3(-962.4264, -859.4637, 15.12598),
            vector3(-1391.354, -1200.132, 4.27478),
            vector3(-1348.075, -1420.813, 4.409546),
            vector3(-1259.829, -1516.76, 4.3927),
            vector3(-1185.6, -1568.281, 4.409546),
            vector3(-1117.134, -1573.661, 4.426392),
            vector3(-1062.541, -1489.582, 5.150879),
            vector3(-806.1758, -1151.407, 8.756836),
            vector3(-582.1583, -965.7363, 22.91064),
            vector3(-508.7736, -965.7099, 23.65198),
            vector3(-393.3231, -1139.393, 29.73474),
            vector3(-293.3407, -1258.022, 29.3136),
            vector3(-258, -1405.793, 31.36926),
            vector3(-124.6154, -1547.235, 34.09888),
            vector3(-69.71867, -1741.147, 29.41467),
            vector3(25.58242, -1862.044, 23.43298),
            vector3(320.9011, -1771.094, 28.85864),
            vector3(496.3253, -1641.086, 29.33044),
            vector3(181.1077, -1430.862, 29.36414),
            vector3(125.8286, -1319.525, 29.3136),
            vector3(25.17363, -1305.02, 29.12817),
            vector3(-87.67912, -1175.209, 26.22998),
            vector3(-86.63736, -1019.855, 28.06665),
            vector3(116.0308, -817.7802, 31.38611),
            vector3(339.0857, -837.0725, 29.38098),
            vector3(456.3297, -736.5758, 27.42639),
        },
        SpawnMissionPed = function(Coords)
            Ped = GetRandomModelNPC()
            RequestModel(Ped)
            while not HasModelLoaded(Ped) do
                RequestModel(Ped)
                Citizen.Wait(10)
            end
            Peds = CreatePed(1, Ped, Coords.x, Coords.y, Coords.z - 0.98, 0.0, false, true)
            table.insert(Mission.CrtPed, Peds)
            SetEntityHeading(Peds, math.random(0, 380))
			FreezeEntityPosition(Peds, true)
			SetBlockingOfNonTemporaryEvents(Peds, true)
            SetEntityInvincible(Peds, true)
        end,
        StartMission = function()
            Mission.In.Timing = 2000
            RemoveBlip(Blip)
            CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
            FreezeEntityPosition(Peds, false)
            TaskEnterVehicle(Peds, CrtVhc, 2500, 0, 2.0, 1, 0)
            Coords = Mission[PlayerData.job.name].FinishCoords
            Blip = AddBlipForCoord(Coords.x, Coords.y, Coords.z)
            SetBlipSprite(Blip, 1)
            SetBlipDisplay(Blip, 8)
            SetBlipScale(Blip, 0.6)
            SetBlipColour(Blip, 5)
            SetBlipRoute(Blip, true)
            Mission.State = "FinishLine"
            while Mission.State == "FinishLine" do
                Citizen.Wait(Mission.In.Timing)
                local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Coords.x, Coords.y, Coords.z, true)
                if distance < 8 then
                    Mission.In.Timing = 0
                    DrawMarker(Mission.MarkerType, Coords.x, Coords.y, Coords.z + 0.98, 0, 0, 0, 0, 0, 0, Mission.MarkerScale, Mission.MarkerScale, Mission.MarkerScale, 255, 255, 255, 255, false, true, 2, true, nil, false)
                    if distance < 4 then
                        ESX.ShowHelpNotification(Mission[PlayerData.job.name].FinishHelpNotif)
                        if IsControlJustReleased(1, 51) then
                            Mission[PlayerData.job.name].FinishMission()
                            Mission.Timing = math.random(Mission.MinInterval, Mission.MaxInterval)
                        end
                    end
                else
                    Mission.In.Timing = 2000
                end
            end
        end,
        FinishMission = function()
            Coords = Mission[PlayerData.job.name].DeletePedCoords
            CrtVhc = GetVehiclePedIsIn(PlayerPedId(), false)
            TaskLeaveVehicle(Peds, CrtVhc, 1)
            TaskGoToCoordAnyMeans(Peds, Coords.x, Coords.y, Coords.z, 1.5, 0, 0, 786603, 0xbf800000)
            Table = {jobName = PlayerData.job.name}
            TriggerServerEvent("Mission:Reward", Table)
            Mission.State = nil
            RemoveBlip(Blip)
            Citizen.Wait(25000)
            Mission.In.Timing = 2000
            DeleteEntity(Peds)
        end,
    },
}

function GetRandomModelNPC()
    Ped = GetRandomPedAtCoord(0.0, 0.0, 0.0, math.huge + 0.0, math.huge + 0.0, math.huge + 0.0, 26)
    return GetEntityModel(Ped)
end

Citizen.CreateThread( function()
    while true do
        Citizen.Wait(Mission.Timing)
        if Job.Wl.DuttyState then
            if PlayerData.job.name ~= "unemployed" then
                if not Mission.State then
                    Mission.Timing = 0
                    Mission.Notif = false
                    Mission.State = "Choose"
                end
                if Mission.State == "Choose" then
                    if not Mission.Notif then
                        Mission.Notif = true
                        ESX.ShowAdvancedNotification('Mission : '..PlayerData.job.label, '~b~Mission attribuer', 'Une mission vous a était attribuer.\n~y~Y~s~ pour accépter la mission.\n~r~N~s~ pour refuser la mission.', 'CHAR_CHAT_CALL', 8)
                    end
                    if IsControlJustReleased(1, 246--[[Y]]) then
                        if Mission[PlayerData.job.name].Restrict() then
                            GetRandomMission()
                        else
                            ESX.ShowNotification(Mission[PlayerData.job.name].RestrictNotif)
                        end
                    end
                    if IsControlJustReleased(1, 249--[[N]]) then
                        DeclineMission()
                    end
                end
            end
        end
    end
end)

function DeclineMission()
    ESX.ShowNotification("~r~Vous avez refuser la mission.")
    Mission.State = nil
    Mission.Timing = math.random(Mission.MinInterval, Mission.MaxInterval)
end

function GetRandomMission()
    ESX.ShowNotification("~g~Vous avez accepter la mission.")
    Index = GetRandomIntInRange(1,  #Mission[PlayerData.job.name].Coords)
    Coords = Mission[PlayerData.job.name].Coords[Index]
	Blip = AddBlipForCoord(Coords.x, Coords.y, Coords.z)
	SetBlipSprite (Blip, 1)
	SetBlipDisplay(Blip, 8)
	SetBlipScale  (Blip, 0.6)
	SetBlipColour (Blip, 5)
    SetBlipAsShortRange(Blip, true)
    SetBlipRoute(Blip, true)
    if Mission[PlayerData.job.name].SpawnMissionPed then
        Mission[PlayerData.job.name].SpawnMissionPed(Coords)
    end
    Mission.State = "InProgress"
    while Mission.State == "InProgress" do
        Citizen.Wait(Mission.In.Timing)

        local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Coords.x, Coords.y, Coords.z, true)
        if distance < 8 then
            Mission.In.Timing = 0
            DrawMarker(Mission.MarkerType, Coords.x, Coords.y, Coords.z + 0.98, 0, 0, 0, 0, 0, 0, (Mission.MarkerScale / 2), (Mission.MarkerScale / 2), (Mission.MarkerScale / 2), 255, 255, 255, 255, false, true, 2, true, nil, false)
            if distance < Mission[PlayerData.job.name].MissionDist then
                ESX.ShowHelpNotification(Mission[PlayerData.job.name].HelpNotif)
                if IsControlJustReleased(1, 51) then
                    Mission[PlayerData.job.name].StartMission()
                end
            end
        else
            Mission.In.Timing = 2000
        end
    end
end