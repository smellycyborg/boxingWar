local KLDealer = require(game.ServerScriptService.Server.KLDealer)

local Sdk = {
    data = {}
}

local function takesPotion(player, potion)
    local data = Sdk.data
    local potions = data[player].Potions
    local potionBool = potions[potion].bool
    local potionValue = potions[potion].value

    local hasPotion = potionBool == true
    if hasPotion then
        potions[potion].bool = false
        player.Character.Humanoid.Health = potionValue

        warn(player.Name .. ' took a '.. potion .. ' potion and has been given more health :)')
    end
end

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

    local potionEvent = Instance.new('RemoteEvent', game.ReplicatedStorage)
    potionEvent.Name = 'potionEvent'

    --/ Event Bindings
    potionEvent.OnServerEvent:Connect(takesPotion)

    game.Players.PlayerAdded:Connect(onPlayerAdded)
    game.Players.PlayerRemoving:Connect(onPlayerRemoving)

end

return Sdk