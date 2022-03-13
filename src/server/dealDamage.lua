local inSmokeZone = require(game.ServerScriptService.Server.inSmokeZone)
local data = require(game.ServerScriptService.Server.data)
local takeHealth = require(game.ServerScriptService.Server.takeHealthHandler)

local dealDamage = {}

function dealDamage.smoke(player)
    local characterCanHurt = data[player].canHurt
    if not characterCanHurt then return end

    local playerInZone = table.find(inSmokeZone, player)

    if playerInZone and characterCanHurt == true then 
        data[player].canHurt = false
        takeHealth.smoke(player)
        warn('MESSAGE: smoke zone took 25 health from '.. player.Name .. '.' .. '  2 seconds until next hurt!')
        wait(2)
        data[player].canHurt = true
    end
end

return dealDamage