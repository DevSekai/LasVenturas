SexeChoosen, FirstName, LastName, Birthday, Height = "Homme", "Non renseigner", "Non renseigner", "JJ/MM/AAAA", "Non renseigner"
SexeChoose = {"Homme", "Femme"}
SexeIndex = 1

RMenu.Add('CrationPerso', 'Identity', RageUI.CreateMenu("", "", 600, nil, "root_cause", "banner"), true)
RMenu:Get('CrationPerso', 'Identity'):SetSubtitle("~r~Création de l'identité")
RMenu:Get('CrationPerso', 'Identity'):SetSizeWidth(200)
RMenu:Get('CrationPerso', 'Identity'):DisplayInstructionalButton(false)
RMenu:Get('CrationPerso', 'Identity'):DisplayGlare(false);
RMenu:Get('CrationPerso', 'Identity').Closable = false;

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		RageUI.IsVisible(RMenu:Get('CrationPerso', 'Identity'), function()
	       	RageUI.Item.Separator("[~r~Sexe~s~] : "..SexeChoosen.."")
	       	if not InRecap then
		        RageUI.Item.List("Sexe", SexeChoose, SexeIndex, nil, {}, true, {
		            onListChange = function(Index, Items)
		               	SexeIndex = Index
		               	if SexeIndex == 1 then --Homme
		               		SexeChoosen = "Homme"
		               	else -- Femme
		               		SexeChoosen = "Femme"
		               	end
		            end,
		        })
		    end
	       	RageUI.Item.Separator("[~r~Nom~s~] : "..LastName.."	[~r~Prénom~s~] : "..FirstName.."")
	       	if not InRecap then
		        RageUI.Item.Button("Nom", "", {}, true, {
		            onSelected = function()
		            	Input = KeyboardInput("Quel est votre nom ?", 20)
		            	if Input ~= nil then
		            		LastName = Input
		            		ESX.ShowNotification("Votre nom est le suivant : ~g~"..Input..".")
		            	else
		            		ESX.ShowNotification("Veuillez entrer un nom valide.")
		            	end
		            end,
		        })
		        RageUI.Item.Button("Prénom", "", {}, true, {
		            onSelected = function()
		            	Input = KeyboardInput("Quel est votre prénom ?", 20)
		            	if Input ~= nil then
		            		FirstName = Input
		            		ESX.ShowNotification("Votre prénom est le suivant : ~g~"..Input..".")
		            	else
		            		ESX.ShowNotification("Veuillez entrer un prénom valide.")
		            	end
		            end,
		        })
		    end
	       	RageUI.Item.Separator("[~r~Date de naissance~s~] : "..Birthday.."")
	       	if not InRecap then
		        RageUI.Item.Button("Date de naissance", "", {}, true, {
		            onSelected = function()
		            	Input = KeyboardInput("Quel est votre date de naissance ?", 20)
		            	if DateIsCorrect(Input) then
		            		Birthday = Input
		            		ESX.ShowNotification("Votre date de naissance est la suivante : ~g~"..Input..".")
		            	else
		            		ESX.ShowNotification("Veuillez entrer une date de naissance valide.")
		            	end
		            end,
		        })
	       	end
	       	RageUI.Item.Separator("[~r~Taille~s~] : "..Height.."")
	       	if not InRecap then
		        RageUI.Item.Button("Taille", "", {}, true, {
		            onSelected = function()
		            	Input = KeyboardInput("Combien mesurez vous (en cm) ?", 20)
		            	if tonumber(Input) < 200 then
		            		Height = Input
		            		ESX.ShowNotification("Vous mesurez : ~g~"..Input.." cm.")
		            	else
		            		ESX.ShowNotification("Veuillez entrer une taille valide.")
		            	end
		            end,
		        })
			    if FirstName ~= "Non renseigner" then
		    		if LastName ~= "Non renseigner" then
		    			if Brithday ~= "JJ/MM/AAAA" then
	        				if Height ~= "Non renseigner" then
							    RageUI.Item.Button("Valider", "", {}, true, {
							        onSelected = function()
							        	InRecap = true
						            end,
						        })
						    end
						end
					end
				end
	       	end
	        if InRecap then
	       		RageUI.Item.Separator("Es-ce que les informations ci dessus sont correct ?")
		        RageUI.Item.Button("Créer son identité", "", {Color = {BackgroundColor = {0, 150, 0}}}, true, {
		            onSelected = function()
		            	Identity = {
		            		Sexe = SexeChoosen,
		            		FirstName = FirstName,
		            		LastName = LastName, 
		            		Birthday = Birthday, 
		            		Height = Height
		            	}
		            	TriggerServerEvent('CreateIdentity', json.encode(Identity))
		            	CreateSkinPed()
		            end,
		        })
		        RageUI.Item.Button("Modifier son identité", "", {Color = {BackgroundColor = {150, 0, 0}}}, true, {
		            onSelected = function()
		            	InRecap = false
		            end,
		        })
	        end
	    end)
	end
end)