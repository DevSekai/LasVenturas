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