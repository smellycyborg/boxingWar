local data = {}

game.Players.PlayerAdded:Connect(function(player)
    data[player] = {}

    --/ potions
    data[player].Potions = {}
    local potions = data[player].Potions
    potions['halfHealth'] = {bool = true, value = 50}
    potions['fullHealth'] = {bool = true, value = 100}

    --/ canHurt
    data[player].canHurt = true

    warn('data has been added for '..player.Name)
end)

game.Players.PlayerRemoving:Connect(function(player)
    data[player] = nil 

    warn('data has been removed for ' ..player.Name)
end)

return data