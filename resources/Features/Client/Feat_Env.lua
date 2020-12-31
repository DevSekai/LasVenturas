DensityTiming = 2000
DensityMultiplier = 0.5


Citizen.CreateThread(function()
	while true do
        Citizen.Wait(DensityTiming)
	    SetVehicleDensityMultiplierThisFrame(DensityMultiplier)
	    SetPedDensityMultiplierThisFrame(DensityMultiplier)
	    SetRandomVehicleDensityMultiplierThisFrame(DensityMultiplier)
	    SetParkedVehicleDensityMultiplierThisFrame(DensityMultiplier)
	    SetScenarioPedDensityMultiplierThisFrame(DensityMultiplier, DensityMultiplier)
    end
    while true do
        Citizen.Wait(10)
        RemoveAllPickupsOfType(0xDF711959)
        RemoveAllPickupsOfType(0xF9AFB48F)
        RemoveAllPickupsOfType(0xA9355DCD)
        DisablePlayerVehicleRewards(PlayerId())
        SetPedSuffersCriticalHits(PlayerPedId(), false)
        SetVehicleModelIsSuppressed(GetHashKey("feltzer2"), true) 
		SetVehicleModelIsSuppressed(GetHashKey("feltzer3"), true) 
		SetVehicleModelIsSuppressed(GetHashKey("jester"), true) 
		SetVehicleModelIsSuppressed(GetHashKey("jester2"), true) 
		SetVehicleModelIsSuppressed(GetHashKey("jester3"), true) 
		SetVehicleModelIsSuppressed(GetHashKey("massacro"), true) 
		SetVehicleModelIsSuppressed(GetHashKey("massacro2"), true) 
		SetVehicleModelIsSuppressed(GetHashKey("adder"), true) 
		SetVehicleModelIsSuppressed(GetHashKey("infernus"), true) 
		SetVehicleModelIsSuppressed(GetHashKey("infernus2"), true) 
		SetVehicleModelIsSuppressed(GetHashKey("zentorno"), true) 
		SetVehicleModelIsSuppressed(GetHashKey("comet2"), true) 
		SetVehicleModelIsSuppressed(GetHashKey("comet3"), true) 
		SetVehicleModelIsSuppressed(GetHashKey("comet4"), true) 
		SetVehicleModelIsSuppressed(GetHashKey("comet5"), true) 
    end
end)