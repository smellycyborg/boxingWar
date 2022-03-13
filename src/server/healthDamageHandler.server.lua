local dealSmokeDamage = require(game.ServerScriptService.Server.dealSmokeDamage)

game.Players.PlayerAdded:Connect(function(player)
    while true do
        task.wait()
        dealSmokeDamage(player)
    end
end)