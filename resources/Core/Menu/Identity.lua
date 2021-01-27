Identity = {
    menu = nil,
	lastName = "Non renseigner",
	firstName = "Non renseigner",
	birthday = "Non renseigner",
    height = "Non renseigner",
}

RegisterNetEvent("xPlayer:Create:Player")
AddEventHandler("xPlayer:Create:Player", function()
	Identity.menu = RageUI.CreateMenu("", "Création de l'identité")
	Identity.menu.Closable = false;
    RageUI.Visible(Identity.menu, true)
	while Identity.menu do
        Wait(0)
        
        DisableControlAction(2, 30, true)
        DisableControlAction(2, 31, true)
        DisableControlAction(2, 32, true)
        DisableControlAction(2, 33, true)
        DisableControlAction(2, 34, true)
        DisableControlAction(2, 35, true)
        DisableControlAction(0, 25, true) -- Input Aim
        DisableControlAction(0, 24, true) -- Input Attack
        DisableControlAction(0, 140, true) -- Input Attack
        DisableControlAction(0, 172,true) --DESACTIVE CONTROLL HAUT

		RageUI.IsVisible(Identity.menu, function()
			if not InRecap then
				RageUI.Item.Button("Nom", nil, {RightLabel = Identity.lastName}, true, {
					onSelected = function()
						Input = KeyboardInput("Quel est votre nom ?", 20)
						if Input ~= nil then
							Identity.lastName = Input
							ESX.ShowNotification("Votre nom est le suivant : ~g~"..Input..".")
						else
							ESX.ShowNotification("Veuillez entrer un nom valide.")
						end
					end,
				})
				RageUI.Item.Button("Prénom", nil, {RightLabel = Identity.firstName}, true, {
					onSelected = function()
						Input = KeyboardInput("Quel est votre prénom ?", 20)
						if Input ~= nil then
							Identity.firstName = Input
							ESX.ShowNotification("Votre prénom est le suivant : ~g~"..Input..".")
						else
							ESX.ShowNotification("Veuillez entrer un prénom valide.")
						end
					end,
				})
			end
			if not InRecap then
				RageUI.Item.Button("Date de naissance", nil, {RightLabel = Identity.birthday}, true, {
					onSelected = function()
						Input = KeyboardInput("Quel est votre date de naissance ? (JJ/MM/AAAA)", 20)
						if Identity.goodDate(Input) then
							Identity.birthday = Input
							ESX.ShowNotification("Votre date de naissance est la suivante : ~g~"..Input..".")
						else
							ESX.ShowNotification("Veuillez entrer une date de naissance valide.")
						end
					end,
				})
				end
				if not InRecap then
				RageUI.Item.Button("Taille", nil, {RightLabel = Identity.height}, true, {
					onSelected = function()
						Input = KeyboardInput("Combien mesurez vous (en cm) ?", 20)
						if tonumber(Input) < 200 then
							Identity.height = Input.." cm"
							ESX.ShowNotification("Vous mesurez : ~g~"..Input.." cm.")
						else
							ESX.ShowNotification("Veuillez entrer une taille valide.")
						end
					end,
				})
                if Identity.firstName ~= "Non renseigner" and 
                   Identity.lastName ~= "Non renseigner" and
                   Identity.brithday ~= "Non renseigner" and
                   Identity.height ~= "Non renseigner" then
					RageUI.Item.Button("Valider", nil, {RightLabel = "→→→"}, true, {
						onSelected = function()
							InRecap = true
						end,
					})
				end
			end
			if InRecap then
				RageUI.Item.Separator("Es-ce que les informations ci dessus sont correct ?")
				RageUI.Item.Button("Choisir son apparence", nil, {RightLabel = "→→→"}, true, {
					onSelected = function()
						TriggerEvent("xPlayer:Create:Skin")
					end,
				})
				RageUI.Item.Button("Modifier son identité", nil, {RightLabel = "←←←"}, true, {
					onSelected = function()
						InRecap = false
					end,
				})
			end
		end)
	end
end)

Identity.goodDate = function(date)
    if (string.match(date, "^%d+%p%d+%p%d%d%d%d$")) then
        local d, m, y = string.match(date, "(%d+)%p(%d+)%p(%d+)")
        d, m, y = tonumber(d), tonumber(m), tonumber(y)
        local dm2 = d*m*m
        if  d>31 or m>12 or dm2==0 or dm2==116 or dm2==120 or dm2==124 or dm2==496 or dm2==1116 or dm2==2511 or dm2==3751 then
            if dm2==116 and (y%400 == 0 or (y%100 ~= 0 and y%4 == 0)) then
                return true
            else
                return false
            end
        else
            return true
        end
    else
        return false
    end
end