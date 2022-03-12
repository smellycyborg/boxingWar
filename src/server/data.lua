local data = {}

game.Players.PlayerAdded:Connect(function(player)
    data[player] = {}
    data[player].canHurt = true
end)

return data