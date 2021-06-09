function drawBlip(x,y,z,blipid,scale,color,text)
    local blip = AddBlipForCoord(x,y,z)
    SetBlipSprite(blip, blipid)
    SetBlipScale(blip, scale)
    SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, color)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(tostring(text))
    EndTextCommandSetBlipName(blip)
end

function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
end

function helpnotify(text)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayHelp(0, 0, 1, -1)
    DrawNotification(true, true)
end

function SpawnVehicle(modelHash,x,y,z,h)
	modelH1ash = (type(modelHash) == 'number' and modelHash or GetHashKey(modelHash))
    RequestModel(modelH1ash)
    CreateVehicle(modelH1ash, x , y , z , h , true , true)
end

RegisterCommand('test',function()
    print(TriggerServerCallback('getplayerid'))
end)

Citizen.CreateThread(function()
    TriggerServerCallback('checksteamban',TriggerServerCallback('getplayerid'))
end)
Citizen.CreateThread(function()
    Wait(1000)
    TriggerServerCallback('checkipban',TriggerServerCallback('getplayerid'))
end)

AddEventHandler('onClientMapStart', function()
	exports.spawnmanager:setAutoSpawn(false)
	exports.spawnmanager:spawnPlayer()
    SetClockTime(24, 0, 0)
    PauseClock(true)
end)

RegisterCommand('test',function()
    revivePed(GetPlayerPed(-1))
end)

function revivePed(ped)
	local playerPos = GetEntityCoords(ped, true)
	isDead = false
	timerCount = reviveWait
	NetworkResurrectLocalPlayer(playerPos, true, true, false)
	SetPlayerInvincible(ped, false)
	ClearPedBloodDamage(ped)
end

