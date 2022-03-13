local takeHealth = {}

function takeHealth.smoke(player)
    player.Character.Humanoid.Health -= 25
end

return takeHealth