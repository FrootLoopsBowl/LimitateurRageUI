function vitesse(vit)
	local pPed = PlayerPedId()
	local pVeh = GetVehiclePedIsIn(pPed, false)
	local newSpeed = vit / 3.6
	local vehMaxSpeed = GetVehicleEstimatedMaxSpeed(pVeh)
   
	if vit == 0 then
		SetEntityMaxSpeed(pVeh, vehMaxSpeed)
        Notifications("Limitateur désactivé")
	else
		SetEntityMaxSpeed(pVeh, newSpeed)
        Notifications("Limitateur activé à "..vit)
	end
end

function Notifications(notifmsg)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(notifmsg)
    DrawNotification(0,1)    
end

function KeyBoardInput(TextEntry, ExampleText, MaxStringLenght, isValueInt)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry)
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    blockinput = true

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Wait(500)
        blockinput = false
        if isValueInt then
            local isNumber = tonumber(result)
            if isNumber then
                return result
            else
                return nil
            end
        end

        return result
    else
        Wait(500)
        blockinput = false
        return nil
    end
end