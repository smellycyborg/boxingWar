local potionEvent = game.ReplicatedStorage.remoteEvents.potionEvent
local data = require(game.ServerScriptService.Server.data)

potionEvent.OnServerEvent:Connect(function(player)
    local hasPotion = data[player].hasFullHealthPotion == true
    if hasPotion then
        data[player].hasFullHealthPotion = false
        player.Character.Humanoid.Health = 100
        print(player.Name .. ' took a full health potion and now has 100 health :)')
    end
end)