local zonePlus = require(game.ReplicatedStorage.Zone)

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
