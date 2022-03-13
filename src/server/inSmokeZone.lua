local zonePlus = require(game.ReplicatedStorage.Zone)

local inSmokeZone = {}

local container = workspace.Part
local zone = zonePlus.new(container)

zone.playerEntered:Connect(function(player)
    table.insert(inSmokeZone, player)
    game.TestService:Message(("%s entered the zone!"):format(player.Name))
end)

zone.playerExited:Connect(function(player)
    local playerIndex = table.find(inSmokeZone, player)
    table.remove(inSmokeZone, playerIndex)
    game.TestService:Message(("%s exited the zone!"):format(player.Name))
end)

return inSmokeZone
