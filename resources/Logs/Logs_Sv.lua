WebHook = "https://discordapp.com/api/webhooks/755900623832219758/oVtoKWcu6h4uuDaZRUeAWLE2VpNM6vzSbiOPwZwxkb2N-8UczVQmsBNcouFHwKoHOGnh"
Name = "Logs Venturas"
Logo = "https://media.discordapp.net/attachments/743953072266412056/744662695541735504/CoreoLogo.png"
LogsBlue = 3447003
LogsRed = 15158332
LogsYellow = 15844367
LogsOrange = 15105570
LogsGrey = 9807270
LogsPurple = 10181046
LogsGreen = 3066993
LogsLightBlue = 1752220

RegisterNetEvent('Logs')
AddEventHandler('Logs', function(Color, Title, Description)
	if Color == "Red" then
		LogsColor = 15158332
	elseif Color == "Blue" then
		LogsColor = 3447003
	else
		LogsColor = 3066993
	end
	Logs(LogsColor, Title, Description)
end)

function Logs(Color, Title, Description)
	local Content = {
	        {
	            ["color"] = Color,
	            ["title"] = Title,
	            ["description"] = Description,
		        ["footer"] = {
	                ["text"] = Name,
	                ["icon_url"] = Logo,
	            },
	        }
	    }
	PerformHttpRequest(WebHook, function(err, text, headers) end, 'POST', json.encode({username = Name, embeds = Content}), { ['Content-Type'] = 'application/json' })
end

AddEventHandler('playerDropped', function()
	local identifier
	local playerId = source
	local PcName = GetPlayerName(playerId)
	local PcIp = GetPlayerEndpoint(playerId)
	for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	Logs(LogsRed, "Deconnexion du serveur", "Nom : "..PcName..".\nIp : "..PcIp..".\nLicense : "..identifier..".")
end)

AddEventHandler("playerConnecting", function ()
	local identifier
	local playerId = source
	local PcName = GetPlayerName(playerId)
	local PcIp = GetPlayerEndpoint(playerId)
	for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	Logs(LogsGreen, "Connexion au serveur", "Nom : "..PcName..".\nIp : "..PcIp..".\nLicense : "..identifier..".")
end)
