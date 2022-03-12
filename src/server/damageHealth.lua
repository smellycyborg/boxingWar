local inZone = require(game.ServerScriptService.Server.inZone)
local Characters = require(game.ServerScriptService.Server.characters)

function takeHealth(player)
    player.Character.Humanoid.Health -= 25
end

function damageHealth(player)
    local characterCanHurt = Characters[player].canHurt == true
    local playerInZone = table.find(inZone, player)

    if playerInZone and characterCanHurt then 
        Characters[player].canHurt = false
        takeHealth(player)
        print('MESSAGE: took 25 health from '.. player.Name .. '.' .. '  2 seconds until next hurt!')
        print()
        wait(2)
        Characters[player].canHurt = true
    else
        return
    end
end

return damageHealth