WebHookLoggin = "https://discord.com/api/webhooks/777603414971908096/YF9_MagYYgBNokEMzmLiDn8x4YiqEVjixK3AvtX84uQoPWsXjV60LbJYPnLSa6WRRrC7"
WebHookBans = "https://discord.com/api/webhooks/777603279571648522/QhUm-F5VQDYwAgYMS9myHh3OjPvBW1i732-5d9Q_a6u6QWTqf8PGGhUVYU_ALTQjfIXV"
WebHookWarms = "https://discord.com/api/webhooks/777602838062301234/cmNFRKriW6in559HxttiBV_HecYLOL8s7YCi4uo_OZBIOgI27VPgWd5AkQaBTbrfbEVS"
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
	PerformHttpRequest(WebHookLoggin, function(err, text, headers) end, 'POST', json.encode({username = Name, embeds = Content}), { ['Content-Type'] = 'application/json' })
end

RegisterNetEvent('LogsBans')
AddEventHandler('LogsBans', function(Color, Title, Description)
	if Color == "Red" then
		LogsColor = 15158332
	elseif Color == "Blue" then
		LogsColor = 3447003
	else
		LogsColor = 3066993
	end
	LogsBans(LogsColor, Title, Description)
end)

function LogsBans(Color, Title, Description)
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
	PerformHttpRequest(WebHookBans, function(err, text, headers) end, 'POST', json.encode({username = Name, embeds = Content}), { ['Content-Type'] = 'application/json' })
end

RegisterNetEvent('LogsWarms')
AddEventHandler('LogsWarms', function(Color, Title, Description)
	if Color == "Red" then
		LogsColor = 15158332
	elseif Color == "Blue" then
		LogsColor = 3447003
	else
		LogsColor = 3066993
	end
	LogsWarms(LogsColor, Title, Description)
end)

function LogsWarms(Color, Title, Description)
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
	PerformHttpRequest(WebHookWarms, function(err, text, headers) end, 'POST', json.encode({username = Name, embeds = Content}), { ['Content-Type'] = 'application/json' })
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
