local data = {}

game.Players.PlayerAdded:Connect(function(player)
    data[player] = {}

    --/ potions
    data[player].Potions = {}
    local potions = data[player].Potions
    potions['halfHealth'] = true
    potions['fullHealth'] = true

    --/ canHurt
    data[player].canHurt = true

    print('data has been created for '..player.Name)
end)

return data