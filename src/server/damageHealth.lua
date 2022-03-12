local inZone = require(game.ServerScriptService.Server.inZone)
local data = require(game.ServerScriptService.Server.data)

function takeHealth(player)
    player.Character.Humanoid.Health -= 25
end

function damageHealth(player)
    local characterCanHurt = data[player].canHurt == true
    local playerInZone = table.find(inZone, player)

    if playerInZone and characterCanHurt then 
        data[player].canHurt = false
        takeHealth(player)
        print('MESSAGE: took 25 health from '.. player.Name .. '.' .. '  2 seconds until next hurt!')
        print()
        wait(2)
        data[player].canHurt = true
    else
        return
    end
end

return damageHealth