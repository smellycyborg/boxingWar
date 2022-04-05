local inSmokeZone = require(game.ServerScriptService.Server.inSmokeZone)
local data = require(game.ServerScriptService.Server.data)

local KLDealer = {}

function takeHealth(player, amount)
    player.Character.Humanoid.Health -= amount
end

function addHealth(player, amount)
    player.Character.Humanoid.Health += amount
end

function KLDealer.smoke(player)
    local DAMAGE = 25

    local inventory = data[player]
    if not inventory then return end

    local characterCanHurt = inventory.canHurt
    local playerInZone = table.find(inSmokeZone, player)

    if playerInZone and characterCanHurt == true then 
        data[player].canHurt = false
        takeHealth(player, DAMAGE)
        warn('MESSAGE: smoke zone took 25 health from '.. player.Name .. '.' .. '  2 seconds until next hurt!')
        wait(2)
        data[player].canHurt = true
    end
end

return KLDealer