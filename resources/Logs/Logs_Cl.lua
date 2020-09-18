
RegisterNetEvent('Logs')
AddEventHandler('Logs', function(Color, Title, Description)
	if Color == "Red" then
		LogsColor = 15158332
	elseif Color == "Blue" then
		LogsColor = 3447003
	else
		LogsColor = 3066993
	end
	TriggerServerEvent('Logs', LogsColor, Title, Description)
end)
