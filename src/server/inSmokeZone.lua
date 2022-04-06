local zonePlus = require(game.ReplicatedStorage.Zone)

-- TODO: rename to inZone so that there can be other types of damage zones or healing zones etc.

local inSmokeZone = {}

local container = workspace.zones.smokeZone
local zone = zonePlus.new(container)

local function onPlayerEntered(player)
    table.insert(inSmokeZone, player)
    game.TestService:Message(("%s entered the zone!"):format(player.Name))
end

local function onPlayerExited(player)
    local playerIndex = table.find(inSmokeZone, player)
    table.remove(inSmokeZone, playerIndex)
    game.TestService:Message(("%s exited the zone!"):format(player.Name))
end

zone.playerEntered:Connect(onPlayerEntered)
zone.playerExited:Connect(onPlayerExited)

return inSmokeZone
