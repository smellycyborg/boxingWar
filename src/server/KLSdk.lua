local KLDealer = require(game.ServerScriptService.Server.KLDealer)

local Sdk = {
    data = {}
}

local function onPlayerAdded(player)
    local data = Sdk.data
    data[player] = {}

    --/ potions
    data[player].Potions = {}
    local potions = data[player].Potions
    potions['halfHealth'] = {bool = true, value = 50}
    potions['fullHealth'] = {bool = true, value = 100}

    --/ canHurt
    data[player].canHurt = true

    warn('data has been added for '..player.Name)

    while true do
        task.wait()
        local playerData = data[player]
        KLDealer.smoke(player, playerData)
    end
end

local function onPlayerRemoving(player)
    local data = Sdk.data
    data[player] = nil 

    warn('data has been removed for ' ..player.Name)
end

function Sdk.initialize()
    game.Players.PlayerAdded:Connect(onPlayerAdded)
    game.Players.PlayerRemoving:Connect(onPlayerRemoving)
end

return Sdk