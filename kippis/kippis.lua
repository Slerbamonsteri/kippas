RegisterCommand('kippas', function(s, a)
    local v = 'bmx' -- Ajoneuvo joka annetaan kaatuessa
		
    RequestModel(v)
    while not HasModelLoaded(v) do
        Wait(500)
    end
		
    local p = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
    local veh = CreateVehicle(v, pos.x, pos.y, pos.z, GetEntityHeading(p), true, false)
		
    SetPedIntoVehicle(p, veh, -1)
    SetEntityAsNoLongerNeeded(veh)
    SetModelAsNoLongerNeeded(v)
		
    TriggerEvent('chat:addMessage', {
	args = { '^2Kipskops' }
    })
end, false)
