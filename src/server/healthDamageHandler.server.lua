local dealDamage = require(game.ServerScriptService.Server.dealDamage)

game.Players.PlayerAdded:Connect(function(player)
    while true do
        task.wait()
        dealDamage.smoke(player)
    end
end)