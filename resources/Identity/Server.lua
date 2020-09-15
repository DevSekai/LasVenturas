ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('CheckFirstSpawn', function(source, cb)
	local identifier
	local playerId = source
	for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	MySQL.Async.fetchScalar('SELECT Sexe FROM users WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		cb(result)
	end)
end)

ESX.RegisterServerCallback('GetPlyCoords', function(source, cb)
	local identifier
	local playerId = source
	for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	MySQL.Async.fetchScalar('SELECT position FROM users WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		cb(result)
	end)
end)

RegisterNetEvent('CreateIdentity')
AddEventHandler('CreateIdentity', function(Identity)
	local identifier
	local playerId = source
	local PlyIp = GetPlayerEndpoint(playerId)
	for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	Result = json.decode(Identity)
	MySQL.Async.execute(
    	'UPDATE users SET Sexe = @Sexe, FirstName = @FirstName, LastName = @LastName, Birthday = @Birthday, Taille = @Taille WHERE identifier=@identifier',
    {
      ['@identifier'] = identifier,
      ['@Sexe'] = Result.Sexe,
      ['@FirstName'] = Result.FirstName,
      ['@LastName'] = Result.LastName,
      ['@Birthday'] = Result.Birthday,
      ['@Taille'] = Result.Height
    })
end)