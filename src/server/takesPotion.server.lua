local potionEvent = game.ReplicatedStorage.remoteEvents.potionEvent
local data = game.ServerScriptService.Server.data

potionEvent.OnServerEvent:Connect(function(player)
    data[player].hasFullHealthPotion = false
    player.Character.Humanoid.Health = 100
    print(player.Name .. ' took a full health potion and now has 100 health :)')
end)