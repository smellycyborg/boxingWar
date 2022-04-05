local inSmokeZone = require(game.ServerScriptService.Server.inSmokeZone)

local KLDealer = {}

function takeHealth(player, amount)
    player.Character.Humanoid.Health -= amount
end

function addHealth(player, amount)
    player.Character.Humanoid.Health += amount
end

function KLDealer.smoke(player, playerData)
    local DAMAGE = 25

    local playerInZone = table.find(inSmokeZone, player)

    local canHurt = playerData.canHurt
    if playerInZone and canHurt == true then 
        playerData.canHurt = false
        takeHealth(player, DAMAGE)
        warn('MESSAGE: smoke zone took 25 health from '.. player.Name .. '.' .. '  2 seconds until next hurt!')
        wait(2)
        playerData.canHurt = true
    end
end

return KLDealer