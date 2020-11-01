local Char = {}
Token = nil

for i = 48,  57 do table.insert(Char, string.char(i)) end
for i = 65,  90 do table.insert(Char, string.char(i)) end
for i = 97, 122 do table.insert(Char, string.char(i)) end

Citizen.CreateThread(function ()
	while Token == nil do
		Token = GenerateToken(12)
		Citizen.Wait(0)
	end
end)

RegisterServerEvent("GetToken")
AddEventHandler("GetToken", function()
	TriggerClientEvent("SendToken", source, Token)
end)

function GenerateToken(Length)
	math.randomseed(os.time())

	if Length > 0 then
		return GenerateToken(Length - 1) .. Char[math.random(1, #Char)]
	else
		return ""
	end
end

WebHook = "Your webhook here"
Name = "Your webhook's name here"
Logo = "Your webhook's logo here"
LogsRed = 15158332

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