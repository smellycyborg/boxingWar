local data = {}

game.Players.PlayerAdded:Connect(function(player)
    data[player] = {}
    data[player].canHurt = true

    --// potions
    data[player].hasHalfHealthPotion = false
    data[player].hasFullHealthPotion = true
    data[player].hasSpeedPotion = false

    print('data has been created for '..player.Name)
end)

return data