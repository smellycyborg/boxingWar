local inSmokeZone = require(game.ServerScriptService.Server.inSmokeZone)
local data = require(game.ServerScriptService.Server.data)

function takeHealth(player)
    player.Character.Humanoid.Health -= 25
end

function dealSmokeDamage(player)
    local characterCanHurt = data[player].canHurt == true
    local playerInZone = table.find(inSmokeZone, player)

    if playerInZone and characterCanHurt then 
        data[player].canHurt = false
        takeHealth(player)
        warn('MESSAGE: took 25 health from '.. player.Name .. '.' .. '  2 seconds until next hurt!')
        wait(2)
        data[player].canHurt = true
    else
        return
    end
end

return dealSmokeDamage