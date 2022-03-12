local Characters = {}

game.Players.PlayerAdded:Connect(function(player)
    Characters[player] = {}
    Characters[player].canHurt = true
end)

return Characters