local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
	while not QBCore.Functions.GetPlayerData().job do
		Citizen.Wait(10)
	end
	QBCore.Functions.GetPlayerData = QBCore.Functions.GetPlayerData()
end)

Citizen.CreateThread(function()
	while QBCore and QBCore.Functions.GetPlayerData do
		local playerPed = PlayerPedId()
		if playerPed ~= 0 then
			local vehicle = GetVehiclePedIsIn(playerPed, false)
			if vehicle ~= 0 then
				local seat = GetPedInVehicleSeat(vehicle, -1)
				if seat == playerPed then
					local isEmergencyJob = getEmergencyJob()
					if not isEmergencyJob then
						local isVehicleBlacklisted = getVehicleBlacklist(GetEntityModel(vehicle))
						if isVehicleBlacklisted then
							TaskLeaveVehicle(playerPed, vehicle, 1)
							QBCore.Functions.Notify(Config.NotifyMessage, 'error')
						end
					end
				end
			end
		end
		Citizen.Wait(Config.CheckTime)
	end
end)

function getEmergencyJob()
	for k,v in ipairs(Config.emergencyJobs) do
		if QBCore.Functions.GetPlayerData.job.name == v then
			return true
		end
	end 
	return false
end

function getVehicleBlacklist(model)
	for k,v in ipairs(Config.emergencyVehicles) do
		if model == GetHashKey(v) then
			return true
		end
	end
	return false
end