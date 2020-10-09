
RegisterCommand('vector3', function(source, args, rawCommand)
	local coords = GetEntityCoords(PlayerPedId())
	local heading = GetEntityHeading(PlayerPedId())
	SendNUIMessage({
		coords = "vector3("..coords.x..","..coords.y..","..coords.z..") Heading : "..heading..""
	})
end)

RegisterCommand('table', function(source, args, rawCommand)
	local coords = GetEntityCoords(PlayerPedId())
	local heading = GetEntityHeading(PlayerPedId())
	SendNUIMessage({
		coords = "{x = "..coords.x..", y = "..coords.y..", z = "..coords.z.."},"
	})
end)

RegisterCommand('coords', function(source, args, rawCommand)
	local coords = GetEntityCoords(PlayerPedId())
	local heading = GetEntityHeading(PlayerPedId())
	SendNUIMessage({
		coords = coords.x.." "..coords.y.." "..coords.z
	})
end)

RegisterCommand('tpc', function(source, args, rawCommand)
	local coords = {}
	for coord in string.gmatch(args[1] or "0,0,0","[^,]+") do
		table.insert(coords,tonumber(coord))
	end

	local x,y,z = 0,0,0
	if coords[1] ~= nil then x = coords[1] end
	if coords[2] ~= nil then y = coords[2] end
	if coords[3] ~= nil then z = coords[3] end

	SetEntityCoords(GetPlayerPed(-1), x,y,z, false)
end)