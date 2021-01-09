function GetLicense(Source)
	local playerId = Source
	for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			return identifier
		end
	end
end

RegisterServerEvent("Fd_Logs:SendLogs")
AddEventHandler("Fd_Logs:SendLogs", function(Type, Color, Title, Description)
    Logs(Type, Color, Title, Description)
end)

function Logs(Type, Color, Title, Description)
	local Content = {
	        {
	            ["color"] = Webhook.Color[Color],
	            ["title"] = Title,
	            ["description"] = Description,
		        ["footer"] = {
	                ["text"] = Webhook.Name,
	                ["icon_url"] = Webhook.Logo,
	            },
	        }
	    }
	PerformHttpRequest(Webhook.Chan[Type], function(err, text, headers) end, 'POST', json.encode({username = Name, embeds = Content}), { ['Content-Type'] = 'application/json' })
end

AddEventHandler("playerConnecting", function()
	local playerId = source
	local PcName = GetPlayerName(playerId)
    local License = GetLicense(playerId)
    if Webhook.ShowIp then
        local PcIp = GetPlayerEndpoint(playerId)
	    Logs("Connnection", "Green", "Connexion au serveur", "Nom : "..PcName..".\nIp : "..PcIp..".\nLicense : "..identifier..".")
    else
	    Logs("Connnection", "Green", "Connexion au serveur", "Nom : "..PcName..".\nLicense : "..identifier..".")
    end
end)

AddEventHandler("playerDropped", function()
	local playerId = source
	local PcName = GetPlayerName(playerId)
    local License = GetLicense(playerId)
    if Webhook.ShowIp then
        local PcIp = GetPlayerEndpoint(playerId)
	    Logs("Connnection", "Red", "Deconnexion du serveur", "Nom : "..PcName..".\nIp : "..PcIp..".\nLicense : "..identifier..".")
    else
	    Logs("Connnection", "Red", "Deconnexion du serveur", "Nom : "..PcName..".\nLicense : "..identifier..".")
    end
end)