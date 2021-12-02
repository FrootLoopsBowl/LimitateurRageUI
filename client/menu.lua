local limitMenu = RageUI.CreateMenu("Limitateur", "Limitateur de vitesse")
limitMenu.Closed = function()
    open = false
    RageUI.Visible(limitMenu, false)
end

local kmValue = {
    "30",
    "60",
    "100",
    "130",
}

function OpenLimitateurMenu()
    if open then
        open = false
        RageUI.Visible(limitMenu, false)
    else
        open = true
        RageUI.Visible(limitMenu, true)
        Citizen.CreateThread(function()
            while open do
                Wait(1)
                RageUI.IsVisible(limitMenu, function()
                    RageUI.Button("Vitesse Personnalisée", description, {}, true, {
                        onSelected = function()
                            local vitesseVroumVroum = KeyBoardInput('Vitesse', '', 3, false)
                                if vitesseVroumVroum == nil then
                                    print('Value is NULL')
                                else
                                vitesse(vitesseVroumVroum)
                                end
                        end
                    })
                    for k, value in pairs(kmValue) do
                        RageUI.Button(value.." KM", description, {}, true, {
                            onSelected = function()
                                vitesse(value)
                            end
                        })
                    end
                end)
            end
        end)
    end
end





Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		
		if IsPedInAnyVehicle(PlayerPedId()) then
			if IsControlJustPressed(0, 56) then
                OpenLimitateurMenu()
			end
		end
	end
end)
