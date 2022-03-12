local zonePlus = require(game.ReplicatedStorage.Zone)

local inZone = {}

local container = workspace.Part
local zone = zonePlus.new(container)

zone.playerEntered:Connect(function(player)
    table.insert(inZone, player)
    print(("%s entered the zone!"):format(player.Name))
end)

zone.playerExited:Connect(function(player)
    local playerIndex = table.find(inZone, player)
    table.remove(inZone, playerIndex)
    print(("%s exited the zone!"):format(player.Name))
end)

return inZone
