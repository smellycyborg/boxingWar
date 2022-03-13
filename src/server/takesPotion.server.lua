local potionEvent = game.ReplicatedStorage.remoteEvents.potionEvent
local data = require(game.ServerScriptService.Server.data)

potionEvent.OnServerEvent:Connect(function(player, potion)
    local potions = data[player].Potions
    local potionBool = potions[potion].bool
    local potionValue = potions[potion].value

    local hasPotion = potionBool == true
    if hasPotion then
        potions[potion].bool = false
        player.Character.Humanoid.Health = potionValue

        game.TestService:Message(player.Name .. ' took a '.. potion .. ' potion and has been given more health :)')
    end
end)