local taken = false

RegisterCommand(Config.CommandName, function(source)
    if not taken then
        taken = true
        spawnCar(Config.ModelToSpawn)
    else
        TriggerEvent("chatMessage", "[Server]:  " .. Config.Translations.alreadytaken)
    end
end)

function spawnCar(model)
    local ped = PlayerPedId()
    local car = GetHashKey(model)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local x, y, z = table.unpack(GetEntityCoords(ped, false))
    local vehicle = CreateVehicle(car, x + 2, y + 2, z + 1, 0.0, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
    SetPedIntoVehicle(ped, car, -1)
    TriggerEvent("chatMessage", "[Server]: " .. Config.Translations.yougotyourvehicle)
end