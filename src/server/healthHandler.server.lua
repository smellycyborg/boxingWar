local damageHealth = require(game.ServerScriptService.Server.damageHealth)

game.Players.PlayerAdded:Connect(function(player)
    while true do
        task.wait()
        damageHealth(player)
    end
end)