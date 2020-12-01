ESX = nil
TokenGen = {}

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
	end
	TriggerServerEvent("CheckBanList")
    TriggerServerEvent("GetAdminToken")
    ESX.TriggerServerCallback('CheckGroup', function(Group)
        Storage.PlyGroup = Group
    end)
end)

RegisterNetEvent("SendAdminToken")
AddEventHandler("SendAdminToken", function(Token)
	TokenGen.Key = Token
end)

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
    
	AddTextEntry('FMMC_KEY_TIP1', TextEntry) --Sets the Text above the typing field in the black square
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght) --Actually calls the Keyboard Input
	blockinput = true --Blocks new input while typing if **blockinput** is used

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do --While typing is not aborted and not finished, this loop waits
		Citizen.Wait(0)
	end
		
	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult() --Gets the result of the typing
		Citizen.Wait(500) --Little Time Delay, so the Keyboard won't open again if you press enter to finish the typing
		blockinput = false --This unblocks new Input when typing is done
		return result --Returns the result
	else
		Citizen.Wait(500) --Little Time Delay, so the Keyboard won't open again if you press enter to finish the typing
		blockinput = false --This unblocks new Input when typing is done
		return nil --Returns nil if the typing got aborted
	end
end

RegisterNetEvent("JailPlayer")
AddEventHandler("JailPlayer", function()
	SetEntityCoords(PlayerPedId(), Storage.JailInCoords)
	FreezeEntityPosition(PlayerPedId(), true)
	Storage.InJail = true
	while Storage.InJail do
		Citizen.Wait(1000)
		if Storage.TimeInJail < Storage.JailTime then
			Storage.TimeInJail = Storage.TimeInJail + 1
			ESX.ShowNotification("Il vous reste "..Storage.JailTime - Storage.TimeInJail.." secondes de prison.")
		else
			SetEntityCoords(PlayerPedId(), Storage.JailOutCoords)
			FreezeEntityPosition(PlayerPedId(), false)
			Storage.TimeInJail = 0
			Storage.InJail = false
			break
		end
	end
end)