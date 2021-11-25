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