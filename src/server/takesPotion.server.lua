local potionEvent = game.ReplicatedStorage.remoteEvents.potionEvent
local data = require(game.ServerScriptService.Server.data)

potionEvent.OnServerEvent:Connect(function(player)
    local potions = data[player].Potions

    local hasPotion = potions['halfHealth'] == true
    if hasPotion then
        potions['halfHealth'] = false
        player.Character.Humanoid.Health = 100
        print(player.Name .. ' took a full health potion and now has 100 health :)')
    end
end)